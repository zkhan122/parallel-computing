#include <iostream>

/*
Overall we use * to create pointer
& to access pointer memory address value
and neither * or & to get the actual value
*/
int main() {
    int x, *px;
    x = 5;
    px = &x;

    std::cout<<"Value of x: " << x << std::endl;
    std::cout<<"Address of x: "<< &x << std::endl;

    return 0;
}