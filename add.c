#include<stdio.h>
#define N 1000
int A[N],B[N],C[N];
int main(){
	int i;
	for(i = 0; i < N; i++){
		A[i] = i;
		B[N-1-i] = i;
	}
	for(i = 0; i < N; i++){
		C[i] = A[i] + B[i];
		printf("%d ",C[i]);
	}
}
