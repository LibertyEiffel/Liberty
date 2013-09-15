/*   The Computer Language Shootout
   http://shootout.alioth.debian.org/

   written by Jon Harrop, 2005
   modified by Paul Kitchin, 2006
*/

#include <iostream>
#include <iomanip>
#include <limits>
#include <sstream>
#include <vector>

int nsieve(int max)
{
  std::size_t const bits = std::numeric_limits< unsigned int >::digits;
  std::vector< unsigned int > sieve((max / bits) + 1);
  int count = 0;
  for (int value = 2; value <= max; ++value)
    {
      if (!(sieve[value / bits] & (1 << (value % bits))))
	{
	  ++count;
	  for (int multiple = value * 2; multiple <= max; multiple += value)
	    {
	      if (!(sieve[multiple / bits] & (1 << (multiple % bits))))
		{
		  sieve[multiple / bits] ^= (1 << (multiple % bits));
		}
	    }
	}
    }
  return count;
}

void test(int n)
{
  int m = (1 << n) * 10000;
  std::cout << "Primes up to " << std::setw(8) << m << " " << std::setw(8) << nsieve(m) << std::endl;
}

int main(int argc, char * * argv)
{
  if (argc != 2)
    {
      std::cerr << "usage: nsieve <n>\n";
      return 1;
    }
  std::istringstream convertor(argv[1]);
  int n;
  if (!(convertor >> n) || !convertor.eof())
    {
      std::cerr << "usage: nsieve <n>\n";
      std::cerr << "   n must be an integer\n";
      return 1;
    }
  test(n);
  if (n >= 1)
    {
      test(n - 1);
    }
  if (n >= 2)
    {
      test(n - 2);
    }
}
