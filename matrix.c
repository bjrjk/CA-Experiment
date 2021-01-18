#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#define N 10

int A[N][N], B[N][N], C[N][N];

int main(int argc, char *argv[]) {
	int i, j, k;
	for (i = 0; i < N; i++) {
		for (j = 0; j < N; j++) {
			A[i][j] = rand() % 10;
			B[i][j] = rand() % 10;
		}
	}
	printf("Matrix A: (Size=%d) \n", N);
	for (i = 0; i < N; i++) {
		for (j = 0; j < N; j++) {
			printf("%d ", A[i][j]);
		}
		printf("\n");
	}
	printf("Matrix B: (Size=%d) \n", N);
	for (i = 0; i < N; i++) {
		for (j = 0; j < N; j++) {
			printf("%d ", B[i][j]);
		}
		printf("\n");
	}
	for (i = 0; i < N; i++) {
		for (j = 0; j < N; j++) {
			C[i][j] = 0;
			for (k = 0; k < N; k++) {
				C[i][j] += A[i][k] * B[k][j];
			}
		}
	}
	printf("Matrix C: (Size=%d) \n", N);
	for (i = 0; i < N; i++) {
		for (j = 0; j < N; j++) {
			printf("%d ", C[i][j]);
		}
		printf("\n");
	}
}