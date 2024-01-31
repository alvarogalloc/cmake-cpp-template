module;
#include <iostream>

export module mymodule;
export namespace mymodule {
void sayhello();
}

module :private;

namespace mymodule {
void sayhello() { std::cout << "hello from module!!\n"; }
}// namespace mymodule
