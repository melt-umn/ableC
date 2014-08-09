#include <sys/sysinfo.h>
#include <stdlib.h>
#include "threadpool.h"

// Internal function, not in header file.
void *threadpool_internal_thread(void *thread_val);


int threadpool_create(threadpool_t *pool)
{
	// We always use the number of processors.
	int procs = get_nprocs();
	pool->nthreads = procs;
	pool->thread = calloc(procs, sizeof(pthread_t));
	// No initial function.
	pool->fn = NULL;
	
	// Create the sync barrier
	// Size is procs + 1 for the "control thread"
	pthread_barrier_init(&pool->barrier, NULL, procs + 1);
	
	// Create all threads
	for(int i = 0; i < procs; i++) {
		// Allocate threadid data structure, resposibility of thread to deallocate on pool destruction.
		threaddata_t *d = calloc(1, sizeof(threaddata_t));
		d->threadid = i;
		d->pool = pool;
		// Create thread. Will block on barrier immediately.
		pthread_create(&pool->thread[i], NULL, threadpool_internal_thread, d);
	}
	
	return 0;
}


int threadpool_destroy(threadpool_t *pool)
{
	if(pool->fn != NULL) {
		// the threadpool is ACTIVE! Figure out how to report errors better.
		return -1;
	}
	
	// Signalling with (fn == NULL) means termination of all threads.
	pthread_barrier_wait(&pool->barrier);
	
	// Tear down time. First, require all threads to terminate.
	for(int i = 0; i < pool->nthreads; i++) {
		pthread_join(pool->thread[i], NULL);
	}
	// Now, delete the barrier and the memory we allocated for the thread_t's.
	pthread_barrier_destroy(&pool->barrier);
	free(pool->thread);
	pool->thread = 0;
	
	return 0;
}


int threadpool_execute(threadpool_t *pool, threadpool_fun fn)
{
	if(pool->fn != NULL) {
		// WTF, threads are RUNNING.
		return -1;
	}
	if(pool->thread == NULL) {
		// Execute after destroy!
		return -2;
	}
	
	// Setup
	pool->fn = fn;
	
	// Go!
	pthread_barrier_wait(&pool->barrier);
	
	// Wait for completion
	pthread_barrier_wait(&pool->barrier);
	
	// Cleanup
	pool->fn = NULL;
	
	return 0;
}


void *threadpool_internal_thread(void *thread_val)
{
	threaddata_t *d = thread_val;
	threadpool_t *p = d->pool;
	
	for(;;) {
		// Wait for pool launch
		pthread_barrier_wait(&p->barrier);
		
		// Two types of message: a function to call, and pool termination
		// Handle the latter
		if(p->fn == NULL) {
			// This was out responsibility, given to use by create.
			free(d);
			return NULL;
		}
		
		// Execute the call.
		p->fn(d);
		
		// Re-synchronize, to notify control thread of completion.
		pthread_barrier_wait(&p->barrier);
	}
}


