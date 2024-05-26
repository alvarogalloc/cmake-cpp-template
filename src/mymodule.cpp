export module mymodule;
import stdmodule;

export namespace mymodule {
template<typename T> constexpr T add(T a, T b) { return a + b; }

}// namespace mymodule

