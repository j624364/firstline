#include <stdio.h>
#include <stdlib.h>

#define BUFFER_SIZE 1024

char file_buffer[BUFFER_SIZE];

int main(int argc, char** argv) {
	FILE* file;
	int bytes_read;
	int i;
	char ch;

	bytes_read = 0;

	file = fopen("/dev/stdin", "r");
	if (!file)
		return EXIT_FAILURE;

	while ((bytes_read = fread(file_buffer, 1, BUFFER_SIZE, file)) > 0) {
		if (ferror(file)) {
			fclose(file);
			return EXIT_FAILURE;
		}

		for (i = 0; i < bytes_read; i++) {
			ch = file_buffer[i];

			if (ch == '\n')
				goto exit_gracefully;

			putchar(ch);
		}
	}

exit_gracefully:
	fclose(file);
	return EXIT_SUCCESS;
}
