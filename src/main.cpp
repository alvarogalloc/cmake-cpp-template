import mymodule;
import std;


int main([[maybe_unused]] int argc, [[maybe_unused]] char *argv[])
{
  std::println("Hello, World!, 1+1 is = {}", mymodule::add(1, 1));
  return 0;
}
