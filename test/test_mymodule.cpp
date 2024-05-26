export module test_mymodule;
import mymodule;
import boost.ut;

export namespace mymodule {
void test()
{
  using namespace boost::ut;

  "mymodule"_test = [] {
    expect(1_i == mymodule::add(1, 0));
    expect(1._f == mymodule::add(0.5f, 0.5f));
  };
}
}// namespace mymodule
