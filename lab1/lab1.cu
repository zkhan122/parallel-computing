#include <iostream>
#include <math.h>

/*
remember the kernel is the device code and is program that 
controls the hardware
*/

// adding elements from 2 arrays and finding max sum

// add function definition

// void add(int n, float *x, float *y) { // host code

// now we are running on the GPU instead (CUDA Kernel function) - device code
__global__ 
void add(int n, float *x, float *y) {
    for (int i = 0; i < n; i++) {
        y[i] = x[i] + y[i];
    }
}

int main(void) {
    int N = 1<<20; // 1M elements

    float *x, *y;

    // allocate unified memory accessible from the CPU or GPU
    cudaMallocManaged(&x, N*sizeof(float));
    cudaMallocManaged(&y, N*sizeof(float));


    // initialize x and y arrays on the host 
    for (int i = 0; i < N; i++) {
        x[i] = 1.0f;
        y[i] = 2.0f;
    }

    // Run kernel on 1M elements on the CPU
    // add(N, x, y);

    // Running on GPU CUDA kernel
    add<<<1, 1>>>(N, x, y);

    // make sure the GPU completes its threads first
    cudaDeviceSynchronize();

    // Check for errors (all values should be 3.0f)
    float maxError = 0.0f;
    for (int i = 0; i < N; i++) {
        maxError = fmax(maxError, fabs(y[i]-3.0f));
    }
    std::cout << "Max Error: " << maxError << std::endl;

    // Free memory
    // delete [] x;
    // delete [] y;

    // freeing memory using CUDA
    cudaFree(x);
    cudaFree(y);

    return 0;
}