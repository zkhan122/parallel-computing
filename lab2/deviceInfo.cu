#include <iostream>
#include <cuda_runtime.h>

int main(int argc, char** argv) {
    int deviceCount;

    cudaGetDeviceCount(&deviceCount);
    std::cout << "Device Count: " << deviceCount << std::endl;

    for (int device = 0; device < deviceCount; device++) {
        cudaDeviceProp deviceProp; 

        cudaGetDeviceProperties(&deviceProp, device);

        if (device == 0) {
            if (deviceProp.major == 9999 && deviceProp.minor == 9999) {
                std::cout << "No CUDA GPU has been detected" << std::endl;
            } else if (deviceCount == 1) {
                std::cout << "There is one device supporting CUDA" << std::endl;
            } else {
                std::cout << "There are multiple devices supporting CUDA" << std::endl;
            }
        }

        std::cout << "Device: " << device << ", name: " << deviceProp.name << std::endl;
        std::cout << "Computational Capabilities: " << deviceProp.major << "." << deviceProp.minor << std::endl;
        std::cout << "Maximum global memory size: " << deviceProp.totalGlobalMem << std::endl;
        std::cout << "Maximum constant memory size: " << deviceProp.totalConstMem << std::endl;
        std::cout << "Maximum shared memory size: " << deviceProp.sharedMemPerBlock << std::endl;
        // Max block dim tells us how many threads per block in x and y dim and then last num is threads in z dim
        std::cout << "Maximum block dimensions: " << deviceProp.maxThreadsDim[0] << " x " << deviceProp.maxThreadsDim[1] << " x " << deviceProp.maxThreadsDim[2] << std::endl;
        std::cout << "Maximum grid dimensions: " << deviceProp.maxGridSize[0] << " x " << deviceProp.maxGridSize[1] << " x " << deviceProp.maxGridSize[2] << std::endl;
        // warp size is how many threads can be executed at the same time
        std::cout << "Warp size: " << deviceProp.warpSize << std::endl;
    }
    return 0;
}
