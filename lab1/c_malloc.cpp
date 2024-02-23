#include <iostream>

/*
we can use malloc to dynamically request memory from the OS. Takes in number of bytes in 
memory and returns the memory address of the first byte of allocated memory
*/

int main() {
    int *px;

    size_t N = 3; // SIZE_T is max size of object
    // allocate memory for the first 3 int elements
    px = (int*)malloc(N* sizeof(int));

    for (int i = 0; i < N; i++) {
        px[i] = i;
    }

    for (int i = 0; i < N; i++) {
        std::cout << "Address of the first byte stored in px[" << i << "]: " << &px[i] << std::endl;
        std::cout << "Value in (dereferencing) px[" << i << "]: " << px[i] << std::endl;
    }
    std::cout << "Not the size of N=3 integer: " << sizeof(px) << std::endl;
    return 0;
}