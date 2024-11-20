# Compiling LAPACK and BLAS commands in C and FORTRAN codes on Windows

Firstly, to avoid us some drouble, we make use of the `Makefile.txt`.

To compile the files on Windows, run the following:

```
mingw32-make -f Makefile.mak
```

To clean up the `.exe` files, run the command:
```
mingw32-make -f Makefile.mak clean
```