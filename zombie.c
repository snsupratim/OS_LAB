#include <stdio.h>
 #include <stdlib.h>
 #include <unistd.h>
 #include <sys/wait.h>

 int main() {
 pid_t pid, child_pid;
 int status;

 // Create a child process
 child_pid = fork();

 if (child_pid < 0) {
 // Fork failed
 printf("Fork Failed!!!");
 exit(1);
 } else if (child_pid == 0) {
 // Child process
 printf("Child process executing command: sleep 5\n");
 execl("/bin/sleep", "sleep", "5", NULL);
 // If execl returns, it means the command failed
 printf("Command failed\n");
 exit(1);
 } else {
 // Parent process
 printf("Parent process waiting for child process %d\n", child_pid);
 pid = waitpid(child_pid, &status, 0);
 if (pid == -1) {
 // waitpid failed
 printf("waitpid failed\n");
 exit(1);
 } else {
 printf("Parent process ID: %d\n", getpid());
 printf("Child process ID: %d\n", child_pid);
 printf("Child process exit status: %d\n", WEXITSTATUS(status));
 }
 }

 // Introduce a zombie process
 child_pid = fork();
 if (child_pid == 0) {
 // Child process
 exit(0); // Child process exits immediately
 } else if (child_pid > 0) {
 // Parent process
 sleep(10); // Parent process sleeps for 10 seconds
 printf("Zombie process has been created\n");
 // Handle the zombie process by calling waitpid() again
 pid = waitpid(child_pid, &status, 0);
 if (pid == -1) {
 fprintf(stderr, "waitpid failed\n");
 exit(1);
 } else {
 printf("Zombie process has been cleaned up\n");
 }
 } else {
 printf("Fork failed\n");
 exit(1);
 }

 return 0;
 }
