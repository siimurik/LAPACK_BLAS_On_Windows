# Compiler and flags
CC = gcc
FC = gfortran
CFLAGS = -I"C:\OpenBLAS\build\generated" -I"C:\OpenBLAS\build" -L"C:\OpenBLAS\build\lib" -lopenblas
FCFLAGS = -L"C:\OpenBLAS\build\lib" -lopenblas

# Targets
TARGETS = Crun.exe Frun.exe

# Default target
all: $(TARGETS)

# Build C executable
Crun.exe: test_C.c
	$(CC) test_C.c -o Crun.exe $(CFLAGS)

# Build Fortran executable
Frun.exe: test_FORTRAN.f90
	$(FC) test_FORTRAN.f90 -o Frun.exe $(FCFLAGS)

# Clean up build files
clean:
	del *.exe
