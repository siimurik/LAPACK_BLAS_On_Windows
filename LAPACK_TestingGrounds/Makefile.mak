# Run with
# 		mingw32-make -f Makefile.mak
# Delete .exe files
#		mingw32-make -f Makefile.mak clean
# Compiler and flags
CC = gcc
FC = gfortran
CFLAGS = -I"C:/OpenBLAS/build/generated" -I"C:/OpenBLAS/build" -I"C:/lapack-3.12.0/build/include" -L"C:/OpenBLAS/build/lib" -L"C:/lapack-3.12.0/build/lib" -lopenblas -llapack -lgfortran -lm
FCFLAGS = -L"C:\OpenBLAS\build\lib" -L"C:\lapack-3.12.0\build\lib" -lopenblas -llapack

# Targets
TARGETS = Crun.exe Frun.exe

# Default target
all: $(TARGETS)

# Build C executable
Crun.exe: C_lapackTEST.c
	$(CC) C_lapackTEST.c -o Crun.exe $(CFLAGS)

# Build Fortran executable
Frun.exe: Fortran_lapackTEST.f90
	$(FC) Fortran_lapackTEST.f90 -o Frun.exe $(FCFLAGS)

# Clean up build files
clean:
	del *.exe
