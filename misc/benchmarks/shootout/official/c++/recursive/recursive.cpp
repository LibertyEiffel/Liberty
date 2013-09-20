// The Computer Language Shootout
// http://shootout.alioth.debian.org/
// by bearophile, Jan 24 2006
// converted to C++ by Greg Buchholz
// modified by Paul Kitchin

#include <iomanip>
#include <iostream>
#include <sstream>

template < class N >
N Ack(N x, N y) __attribute__((fastcall, const, nothrow));

template < class N >
N Ack(N x, N y)
{
  return __builtin_expect(x == 0, 0) ? y + 1 : ((y == 0) ? Ack(x - 1, 1) : Ack(x - 1, Ack(x, y - 1)));
}

template < class N >
N Fib(N n) __attribute__((fastcall, const, nothrow));

template < class N >
N Fib(N n)
{
  return __builtin_expect(n < 2, 0) ? 1 : Fib(n - 2) + Fib(n - 1);
}

template < class N >
N Tak(N x, N y, N z) __attribute__((fastcall, const, nothrow));

template < class N >
N Tak(N x, N y, N z)
{
  return __builtin_expect(y < x, 0) ? Tak(Tak(x - 1, y, z), Tak(y - 1, z, x), Tak(z - 1, x, y)) : z;
}

int main(int argc, char * * argv)
{
  if (argc != 2)
    {
      std::cerr << "usage: nsieve <n>\n";
      return 1;
    }
  int n;
  {
    std::istringstream convertor(argv[1]);
    if (!(convertor >> n) || !convertor.eof())
      {
	std::cerr << "usage: nsieve <n>\n";
	std::cerr << "   n must be an integer\n";
	return 1;
      }
  }
  std::cout << std::setprecision(1) << std::setiosflags(std::ios_base::fixed);
  std::cout << "Ack(3," << n << "): " << Ack(3, n) << '\n';
  std::cout << "Fib(" << (27.0 + n) << "): " << Fib(27.0 + n) << '\n';
  --n;
  std::cout << "Tak(" << (3 * n) << ',' << (2 * n) << ',' << n << "): " << Tak(3 * n, 2 * n, n) << '\n';
  std::cout << "Fib(3): " << Fib(3) << '\n';
  std::cout << "Tak(3.0,2.0,1.0): " << Tak(3.0, 2.0, 1.0) << '\n';
}

