## Step 1: Install OpenBLAS

Install OpenBLAS form this [link](https://github.com/OpenMathLib/OpenBLAS/releases) and extract it to to the C:\ drive.

## Step 2

To set up LAPACK and OpenBLAS with the files you've extracted, you'll need to compile the library files and set up environment variables to make them accessible to your development environment. Here's a step-by-step guide:

1. **Install CMake and Make (if needed):**
   - If you don’t already have CMake, download and install it from [cmake.org](https://cmake.org/download/).
   - You can also install `make` using MinGW (Minimalist GNU for Windows) or similar.

2. **Open a Command Prompt and Navigate to the Directory:**
   - Open Command Prompt as Administrator.
   - Navigate to the extracted directory, for example:
     ```cmd
     cd C:\OpenMathLib-OpenBLAS-5ef8b19
     ```

3. **Create a Build Directory and Run CMake:**
   - In the OpenBLAS directory, create a new directory for your build files:
     ```cmd
     mkdir build
     cd build
     ```
   - Then, configure the build with CMake:
     ```cmd
     cmake .. -G "MinGW Makefiles"
     ```

4. **Compile the Library with Make:**
   - Run the following command to compile:
     ```cmd
     mingw32-make
     ```
   - This will generate the necessary `.lib` and `.dll` files for OpenBLAS. Look for them in the `build` directory.

5. **Set Environment Variables:**
   - Add the path to your compiled OpenBLAS files (e.g., `C:\OpenMathLib-OpenBLAS-5ef8b19\build`) to your `PATH` environment variable.
     - Open the Environment Variables dialog in Windows.
     - Under “System Variables,” find the `Path` variable, and add the directory where the compiled DLL is located.

6. **Link the Library in Your C Code:**
   - In your compiler settings, link against the OpenBLAS library files (e.g., `-lopenblas` or specify the path to the `.lib` files) when compiling your code.

7. **Test the Installation:**
   - Run a small test program that uses OpenBLAS functions to verify that everything is set up correctly.

## Step 3

After these steps, your system should be ready to use OpenBLAS functions in your C projects on Windows. Let me know if you'd like further help with any part of the process!

The error indicates that CMake can’t find `make` or a C compiler, likely because MinGW or its binaries aren’t in the system’s PATH. Here are steps to ensure the necessary tools are in place:

1. **Install MinGW**: If not already installed, download and install [MinGW](https://sourceforge.net/projects/mingw/) (or MSYS2, which also provides MinGW tools). Ensure you have both the `mingw32-make` (GNU Make) and `gcc` (C compiler) packages installed.

2. **Add MinGW to PATH**:
   - Open System Properties → Environment Variables.
   - In the `Path` variable, add the path to your MinGW `bin` directory (e.g., `C:\MinGW\bin` or similar).

3. **Verify Installation**:
   - Open a new Command Prompt and check that `gcc` and `mingw32-make` are accessible by running:
     ```bash
     gcc --version
     mingw32-make --version
     ```

4. **Run CMake with MinGW Makefiles**:
   - In your build directory, use the following commands:
     ```bash
     cmake .. -G "MinGW Makefiles" -DCMAKE_MAKE_PROGRAM=mingw32-make -DCMAKE_C_COMPILER=gcc
     mingw32-make
     ```

If successful, this should compile OpenBLAS using the MinGW toolchain.

The error indicates that CMake can’t find `make` or a C compiler, likely because MinGW or its binaries aren’t in the system’s PATH. Here are steps to ensure the necessary tools are in place:

1. **Install MinGW**: If not already installed, download and install [MinGW](https://sourceforge.net/projects/mingw/) (or MSYS2, which also provides MinGW tools). Ensure you have both the `mingw32-make` (GNU Make) and `gcc` (C compiler) packages installed.

2. **Add MinGW to PATH**:
   - Open System Properties → Environment Variables.
   - In the `Path` variable, add the path to your MinGW `bin` directory (e.g., `C:\MinGW\bin` or similar).

3. **Verify Installation**:
   - Open a new Command Prompt and check that `gcc` and `mingw32-make` are accessible by running:
     ```bash
     gcc --version
     mingw32-make --version
     ```

4. **Run CMake with MinGW Makefiles**:
   - In your build directory, use the following commands:
     ```bash
     cmake .. -G "MinGW Makefiles" -DCMAKE_MAKE_PROGRAM=mingw32-make -DCMAKE_C_COMPILER=gcc
     mingw32-make
     ```

If successful, this should compile OpenBLAS using the MinGW toolchain.

## Step 4

Great! Now that you’ve successfully built OpenBLAS, you’ll need to install the library and configure your environment to use it in your C/C++ projects.

### 1. **Install the Library**
   - Run the following command from the build directory to install the library:
     ```bash
     make install
     ```
   - By default, this will install OpenBLAS in `/usr/local`, but on Windows with MinGW, it may install to a `bin` or `lib` folder within your MinGW directory. 

### 2. **Configure the Environment**
   - Add the OpenBLAS library path to your `PATH` and `LIBRARY_PATH` so that the compiler and linker can locate it. Assuming OpenBLAS installed to a directory like `C:\OpenBLAS\lib`, add that directory to your system `PATH`.
   - Update your environment variables:
     ```bash
     set PATH=%PATH%;C:\OpenBLAS\bin
     set LIBRARY_PATH=%LIBRARY_PATH%;C:\OpenBLAS\lib
     set INCLUDE_PATH=%INCLUDE_PATH%;C:\OpenBLAS\include
     ```

### 3. **Link OpenBLAS in Your Project**
   - When compiling a C/C++ project that uses OpenBLAS, include `-lopenblas` to link with the OpenBLAS library. For example:
     ```bash
     gcc your_code.c -lopenblas -o your_program
     ```

### 4. **Test the Installation**
   - Create a small test file to ensure OpenBLAS is working. For example:
     ```c
     #include <stdio.h>
     #include <cblas.h>

     int main() {
         double A[4] = {1.0, 2.0, 3.0, 4.0};
         double B[2] = {1.0, 1.0};
         double C[2] = {0.0, 0.0};

         // Perform matrix-vector multiplication: C = A * B
         cblas_dgemv(CblasRowMajor, CblasNoTrans, 2, 2, 1.0, A, 2, B, 1, 0.0, C, 1);

         printf("C[0] = %f\n", C[0]);
         printf("C[1] = %f\n", C[1]);

         return 0;
     }
     ```
   - Compile and run this code:
     ```bash
     gcc test_openblas.c -lopenblas -o test_openblas
     ./test_openblas
     ```

If it outputs the expected result, then your OpenBLAS installation is successful and ready for use!

There are a few issues in your Makefile that need addressing for it to work correctly:

1. **Target Name Mismatch**: The target `main.exe` does not match the expected output name `test_C.exe`. In your rules, you are specifying that `test_C.c` builds `test_C.exe`, but in the target definition, you refer to `main.exe`.

2. **Inconsistent Rule Names**: The rule for the Fortran executable refers to `test_openblas.f90` but tries to compile `test_FORTRAN.f90`, which is likely a typo or inconsistency. Make sure the file names match exactly.

3. **Clean Target**: The clean target will remove all `.exe` files, which is fine, but ensure you really want to do this when you run `make clean`.

Here’s the corrected version of your Makefile:

### Corrected Makefile (`Makefile.txt`)

```makefile
# Compiler and flags
CC = gcc
FC = gfortran
CFLAGS = -I"C:\OpenMathLib-OpenBLAS-5ef8b19\build\generated" -I"C:\OpenMathLib-OpenBLAS-5ef8b19\build" -L"C:\OpenMathLib-OpenBLAS-5ef8b19\build\lib" -lopenblas
FCFLAGS = -L"C:\OpenMathLib-OpenBLAS-5ef8b19\build\lib" -lopenblas

# Targets
TARGETS = test_C.exe test_FORTRAN.exe

# Default target
all: $(TARGETS)

# Build C executable
test_C.exe: test_C.c
	$(CC) test_C.c -o test_C.exe $(CFLAGS)

# Build Fortran executable
test_FORTRAN.exe: test_FORTRAN.f90
	$(FC) test_FORTRAN.f90 -o test_FORTRAN.exe $(FCFLAGS)

# Clean up build files
clean:
	del *.exe
```

### Key Changes Made

1. **Corrected the C Executable Rule**: Changed `main.exe:` to `test_C.exe:` to match the output file name.

2. **Fortran Rule Consistency**: Made sure the Fortran target matches the source file `test_FORTRAN.f90`. If your Fortran file is indeed named `test_openblas.f90`, update the rule accordingly.

3. **Make Sure of Filename Consistency**: Verify that both `test_C.c` and `test_FORTRAN.f90` are the actual names of your source files in the directory.

### Running the Makefile

Now, when you run:

```bash
mingw32-make -f Makefile.txt
```

It should build both `test_C.exe` and `test_FORTRAN.exe` correctly. If you still encounter issues, double-check that your source files are named exactly as referenced in the Makefile.