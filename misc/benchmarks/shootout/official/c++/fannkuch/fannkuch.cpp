/*
 * The Computer Lannguage Benchmarks Game
 * http://shootout.alioth.debian.org/
 *
 * Originial c version contributed by Heiner Marxen
 * slightly adapted by Marc Halbruegge
 */

#include <iostream>
#include <vector>
#include <algorithm>

using namespace std;

int fannkuch(int n, ostream &o) {
  if (n < 1) return 0;

  int flipsMax=0;
  int r=n;
  int numPermutationsPrinted=0;

  vector<int> permutation(n);
  vector<int> permForFlipping(n);
  vector<int> count(n);

  /* initial (trivial) permu */
  for (int i=0; i<n; ++i) permutation[i] = i;

  for (;;) {
    if (numPermutationsPrinted++ < 30) {
      for (int i=0; i<n; ++i) {
	o << (1+permutation[i]);
      }
      o << endl;
    }
    for ( ; r!=1; --r) {
      count[r-1] = r;
    }

    if (!(permutation[0]==0 || permutation[n-1]==n-1)) {
      int flips = 0;
      for (int i=1; i<n; ++i) permForFlipping[i] = permutation[i];

      /* cache perm[0] in k */
      int k = permutation[0];

      do {
	int i,j;
	for (i=1, j=k-1; i<j; ++i, --j) {
	  swap(permForFlipping[i], permForFlipping[j]);
	}
	swap(permForFlipping[k], k);

	++flips;
      } while (k);

      if (flipsMax < flips) {
	flipsMax = flips;
      }
    }

    for (;;) {
      if (r == n) {
	return flipsMax;
      }

      /* rotate down perm[0..r] by one */
      int perm0 = permutation[0];
      for (int i=0; i<r; ++i) {
	permutation[i] = permutation[i+1];
      }
      permutation[r] = perm0;

      if (--count[r] > 0) break;

      ++r;
    }
  }
}


int main(int argc, const char **argv) {

  int n = (argc>1) ? atoi(argv[1]) : 0;

  cout << "Pfannkuchen(" << n << ") = "
       << fannkuch(n, cout) << endl;

  return 0;
}
