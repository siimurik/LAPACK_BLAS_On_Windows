program test_openblas
    implicit none
    integer, parameter :: n = 2
    double precision :: alpha, beta
    double precision :: A(n, n), B(n, n), C(n, n)
    integer :: i, j

    ! Initialize the scalar values for multiplication
    alpha = 1.0d0
    beta = 0.0d0

    ! Initialize matrices A and B
    A = reshape([1.0d0, 2.0d0, 3.0d0, 4.0d0], [n, n])
    B = reshape([5.0d0, 6.0d0, 7.0d0, 8.0d0], [n, n])
    
    ! Initialize the matrix C to zero
    C = 0.0d0

    ! Perform matrix multiplication: C = alpha * A * B + beta * C
    call dgemm('N', 'N', n, n, n, alpha, A, n, B, n, beta, C, n)

    ! Print the result matrix C
    print *, "Result matrix C:"
    do i = 1, n
        print *, (C(i, j), j = 1, n)
    end do

end program test_openblas
