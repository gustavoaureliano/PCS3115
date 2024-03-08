#include <stdio.h>
#include <stdlib.h>

int main(int argc, char* argv[]) {
	int i;
	int N = atoi(argv[1]);
	int primo = 1;
	int count = 0;
	for (i = 1; i <= N; i++) {
		if (N % i == 0) {
			count++;
		}
		printf("%d\n", i);
		if (count > 2) {
			printf("count: %d  --> não é primo", count);
			return 0;
		}
	}
	printf("count: %d  --> é primo", count);
	return 0;
}
