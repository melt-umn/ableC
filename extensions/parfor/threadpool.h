#ifndef THREADPOOL_H
#define THREADPOOL_H

// I have *no idea* why this is sometimes defined and sometimes just not?
#define __USE_XOPEN2K
#include <pthread.h>

struct threaddata;
struct threadpool;

typedef struct threaddata threaddata_t;
typedef struct threadpool threadpool_t;

// Type of function the user should provide
typedef void (*threadpool_fun)(threaddata_t *);


// Parameter given to each thread
struct threaddata {
  int threadid;
  threadpool_t *pool;
};

// This datatype should be considered opaque.
struct threadpool {
  int nthreads;
  pthread_t *thread;
  threadpool_fun fn;
  pthread_barrier_t barrier;
};

// Initialize a threadpool
int threadpool_create(threadpool_t *);
// Destroy a threadpool
int threadpool_destroy(threadpool_t *);

// Execute a function in parallel across the whole pool
int threadpool_execute(threadpool_t *, threadpool_fun);

#endif // THREADPOOL_H
