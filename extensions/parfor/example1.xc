#include <stdio.h>
#include <threadpool.h>

int main() {
	
	threadpool_t pool;
	
	threadpool_create(&pool);

	parallelize(&pool)
	for(int i = 0; i < 10; i++) {
		printf("%d\n", i);
	}

	threadpool_destroy(&pool);

}
