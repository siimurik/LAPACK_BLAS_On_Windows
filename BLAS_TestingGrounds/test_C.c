#include <stdio.h>
#include <cblas.h>

int main() {
    double A[4] = {1.0, 2.0, 3.0, 4.0};
    double B[2] = {1.0, 1.0};
    double C[2] = {0.0, 0.0};

    cblas_dgemv(CblasRowMajor, CblasNoTrans, 2, 2, 1.0, A, 2, B, 1, 0.0, C, 1);

    printf("C[0] = %f\n", C[0]);
    printf("C[1] = %f\n", C[1]);

    return 0;
}
