/* The Computer Language Shootout
   http://shootout.alioth.debian.org/

   contributed by Felix Koehler
*/

#include <vector>
#include <iostream>
#include <iomanip>
#include <cstdlib>

#define bool unsigned char
#define true 1
#define false 0

void nsieve(unsigned m)
{
  unsigned i, j;
  unsigned count=0;
  std::vector<bool> b(m+1, true);
  for (i=2; i<=m; ++i) {
    if (b[i]) {
      ++count;
      j=i*2;
      while (j<=m) {
	b[j]=false;
	j+=i;
      }
    }
  }
  std::cout
    << "Primes up to "
    << std::setw(8) << m << " "
    << std::setw(8) << count << "\n";
}

int main(int argc, char **argv)
{
  unsigned m=std::atoi(argv[1]);
  for (unsigned i = 0; i < 3; i++)
    nsieve(10000 << (m-i));
}

