#include <stdio.h>
#include <signal.h>
#include <unistd.h>
#include <stdlib.h>

void custom_signal_handler(int sig) {
    printf("Caught signal %d: Handling it customarily this time.\n", sig);
    // After handling, reset to default behavior
    if (signal(SIGINT, SIG_DFL) == SIG_ERR) {
        perror("Error resetting signal handler");
        exit(EXIT_FAILURE);
    }
    printf("Signal handler reset to default. Press Ctrl+C again to exit.\n");
}

int main() {
    // Set up the custom signal handler for SIGINT
    if (signal(SIGINT, custom_signal_handler) == SIG_ERR) {
        perror("Error setting signal handler");
        return EXIT_FAILURE;
    }
    printf("Program running. Press Ctrl+C to trigger SIGINT.\n");

    // Infinite loop to keep the program running and able to respond to signals
    while (1) {
        printf("Inside Infinite Loop\n");
        sleep(1);  // Sleep to reduce CPU usage, simulating ongoing work
    }

    return 0;  // We will never reach here in this program.
}

