 // Create a number of threads using pthread library

 #include <stdio.h>
 #include <stdlib.h>
 #include <pthread.h>

 #define NUM_THREADS 3 // Number of threads to create

 void *thread_function(void *arg) {
 int thread_id = *(int *)arg;
 printf("Thread %d started\n", thread_id);
 printf("Doing work for the thread: %d\n", thread_id);
 printf("Thread %d finished\n", thread_id);
 pthread_exit(NULL);
 }

 int main() {
 pthread_t threads[NUM_THREADS];
 int thread_ids[NUM_THREADS];
 int i, rc;

 // Create NUM_THREADS threads
 for (i = 0; i < NUM_THREADS; i++) {
 thread_ids[i] = i;
 rc = pthread_create(&threads[i], NULL, thread_function, (void
*)&thread_ids[i]);

 if (rc) {
 printf("Error creating thread %d\n", i);
 exit(1);
 }
 }

 // Wait for all threads to complete
 for (i = 0; i < NUM_THREADS; i++) {
 rc = pthread_join(threads[i], NULL);

 if (rc) {
 printf("Error joining thread %d\n", i);
 exit(1);
 }
 }

 printf("All threads completed\n");
 return 0;
 }
