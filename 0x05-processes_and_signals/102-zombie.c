#include <stdio.h>
#include <stdlib.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <unistd.h>

/**
 * infinite_while - infinite while loop.
 *
 * Return: Always 0.
 */
int infinite_while(void)
{
	while (1)
		sleep(1);
	return (0);
}

/**
 * main - Creates 5 zombie child process.
 *
 * Return: Always 0.
 */
int main(void)
{
	pid_t pid;
	int cont = 0;

	while (cont < 5)
	{
		pid = fork();
		if (pid != 0)
		{
			printf("Zombie process created, PID: %d\n", pid);
			cont++;
		}
		else
			exit(0);
	}
	infinite_while();
	return (0);
}
