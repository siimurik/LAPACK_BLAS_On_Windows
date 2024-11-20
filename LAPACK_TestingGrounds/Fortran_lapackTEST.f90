program test_lapack
    implicit none
    integer, parameter :: n = 3, nrhs = 1, lda = n, ldb = n
    integer :: info
    integer :: ipiv(n)

    ! Define matrix A and vector b
    double precision :: A(lda, n) = reshape([ &
        3.0d0, -1.0d0, 2.0d0, &
        2.0d0,  4.0d0, 0.0d0, &
        -1.0d0, 2.0d0, 5.0d0], shape(A))

    double precision :: b(ldb) = [10.0d0, 4.0d0, -1.0d0]

    ! Call LAPACK's DGESV
    call dgesv(n, nrhs, A, lda, ipiv, b, ldb, info)

    if (info == 0) then
        print *, "Solution found:"
        print *, "x =", b
    else
        print *, "LAPACK dgesv failed with error code", info
    end if
end program test_lapack
