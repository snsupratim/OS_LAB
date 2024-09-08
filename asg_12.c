#include <stdio.h>
#include <sys/ipc.h>
#include <sys/shm.h>
#include <sys/msg.h>
#include <unistd.h>
#include <string.h>

// Structure for message queue
struct mesg_buffer {
    long mesg_type;
    char mesg_text[100];
} message;

int main() {
    // Shared Memory
    key_t shm_key = ftok("shmfile", 65);
    int shmid = shmget(shm_key, 1024, 0666 | IPC_CREAT);
    if (shmid == -1) {
        perror("shmget");
        return 1;
    }
    printf("Shared memory segment created with ID: %d\n", shmid);

    // Attach to shared memory
    char *shm_str = (char*) shmat(shmid, (void*)0, 0);
    if (shm_str == (char*) -1) {
        perror("shmat");
        return 1;
    }
    printf("Shared memory attached\n");

    // Write to shared memory
    strcpy(shm_str, "Hello, shared memory!");
    printf("Data written to shared memory: %s\n", shm_str);

    // Message Queue
    key_t msg_key = ftok("progfile", 65);
    int msgid = msgget(msg_key, 0666 | IPC_CREAT);
    if (msgid == -1) {
        perror("msgget");
        return 1;
    }
    printf("Message queue created with ID: %d\n", msgid);

    // Write to message queue
    message.mesg_type = 1;
    strcpy(message.mesg_text, "Hello, message queue!");
    if (msgsnd(msgid, &message, sizeof(message), 0) == -1) {
        perror("msgsnd");
        return 1;
    }
    printf("Data sent to message queue: %s\n", message.mesg_text);

    // Pipe
    int fd[2];
    if (pipe(fd) == -1) {
        perror("pipe");
        return 1;
    }
    printf("Pipe created with file descriptors: [%d, %d]\n", fd[0], fd[1]);

    // Write to pipe
    char pipe_message[] = "Hello, pipe!";
    if (write(fd[1], pipe_message, strlen(pipe_message) + 1) == -1) {
        perror("write");
        return 1;
    }
    printf("Data written to pipe: %s\n", pipe_message);

    // Read from pipe
    char pipe_buffer[100];
    if (read(fd[0], pipe_buffer, sizeof(pipe_buffer)) == -1) {
        perror("read");
        return 1;
    }
    printf("Data read from pipe: %s\n", pipe_buffer);

    // Detach from shared memory
    if (shmdt(shm_str) == -1) {
        perror("shmdt");
        return 1;
    }
    printf("Shared memory detached\n");

    // Remove shared memory
    if (shmctl(shmid, IPC_RMID, NULL) == -1) {
        perror("shmctl");
        return 1;
    }
    printf("Shared memory removed\n");

    // Remove message queue
    if (msgctl(msgid, IPC_RMID, NULL) == -1) {
        perror("msgctl");
        return 1;
    }
    printf("Message queue removed\n");

    return 0;
}
