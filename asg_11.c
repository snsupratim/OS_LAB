#include<stdio.h>
#include<fcntl.h>
#include <sys/stat.h>
#include <semaphore.h>
#include <unistd.h>

int main() {
    int count = 0;
    char sem_name[50];
    sem_t *sem;

    while (1) {
        sprintf(sem_name, "sem_%d", count); // format the output
        sem = sem_open(sem_name, O_CREAT | O_EXCL, 644, 1);
        if (sem == SEM_FAILED) {
            perror("sem_open failed");
            printf("Maximum number of semaphores that can be created: %d\n", count);
            break;
        }
        sem_close(sem);
        count++;
    }

    // Cleanup created semaphores
    for (int i = 0; i < count; i++) {
        sprintf(sem_name, "sem_%d", i);
        sem_unlink(sem_name);
    }

    return 0;
}

