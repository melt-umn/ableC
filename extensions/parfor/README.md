Parallel for loops
==================

This extension introduces a very simple piece of syntax:

```
parallelize(using_some_pool)
for(int i = 0; i < 100000; i++) {
	// task to perform in parallel
}
```

The extension doesn't do anything especially magical: the user is expected to ensure the task can be parallelized without issue.

The `user_some_pool` clause refers to a threadpool the user has already created. The `threadpool.h` header shows the interface for this. The `example1.xc` shows a simple example with all elements together. And `Makefile` shows how to build this example (as it requires linking with pthreads and the `-std=gnu1x` flags.)

