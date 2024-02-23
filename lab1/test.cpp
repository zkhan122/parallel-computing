#include <iostream>
int main() {
    int x;
    std::cout << "Integer division: " << &x << std::endl;
    std::cout << "Value of uninitialized variable: " << x << std::endl;
    return 0;
}