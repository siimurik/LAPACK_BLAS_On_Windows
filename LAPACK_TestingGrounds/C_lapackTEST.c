#include <stdio.h>
#include <cblas.h>
#include <lapacke.h>

int main() {
    // Define matrix A (3x3) and vector b
    int n = 3; // Matrix size
    int nrhs = 1; // Number of right-hand sides
    int lda = n, ldb = n; // Leading dimensions
    int ipiv[3]; // Pivot array
    int info;

    double A[9] = {
        3.0, -1.0, 2.0,
        2.0,  4.0, 0.0,
        -1.0, 2.0, 5.0
    };
    double b[3] = {10.0, 4.0, -1.0};

    // Call LAPACK's dgesv (double-precision general linear solver)
    info = LAPACKE_dgesv(LAPACK_ROW_MAJOR, n, nrhs, A, lda, ipiv, b, ldb);

    // Check for success
    if (info == 0) {
        printf("Solution found:\n");
        for (int i = 0; i < n; i++) {
            printf("x[%d] = %f\n", i, b[i]);
        }
    } else {
        printf("LAPACK dgesv failed with error code %d\n", info);
    }

    return 0;
}
