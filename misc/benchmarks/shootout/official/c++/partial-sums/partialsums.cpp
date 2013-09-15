// The Computer Language Benchmarks Game
// http://shootout.alioth.debian.org/

#include <cmath>
#include <cstdlib>
#include <iostream>

int main(const int argc, const char* argv[])
{
  std::ios_base::sync_with_stdio(false);

  std::cout.precision(9u);
  std::cout.flags(std::ios_base::fixed);

  const int n = std::atoi(argv[1]);

  double res1 = double(n >= 0), res2 = 0.0, res3 = 0.0,
    res4 = 0.0,            res5 = 0.0, res6 = 0.0,
    res7 = 0.0,            res8 = 0.0, res9 = 0.0;

  if (n > 0) {
    const double dt = 2.0 / 3.0;
    double sink, cosk, pot = 1.0, kd, kd2, kd3;

    for (int k = 1; k <= n; ++k, pot = -pot) {
      kd  = double(k);
      kd2 = kd * kd;
      kd3 = kd * kd2;

      sink = std::sin(kd);
      cosk = std::cos(kd);

      res1 += std::pow(dt, kd);
      res2 += 1.0 / std::sqrt(kd);
      res3 += 1.0 / (kd2 + kd);
      res4 += 1.0 / (kd3 * sink * sink);
      res5 += 1.0 / (kd3 * cosk * cosk);
      res6 += 1.0 / kd;
      res7 += 1.0 / kd2;
      res8 += pot / kd;
      res9 += pot / (2.0 * kd - 1.0);
    }
  }

  std::cout << res1 << "\t(2/3)^k\n"
	    << res2 << "\tk^-0.5\n"
	    << res3 << "\t1/k(k+1)\n"
	    << res4 << "\tFlint Hills\n"
	    << res5 << "\tCookson Hills\n"
	    << res6 << "\tHarmonic\n"
	    << res7 << "\tRiemann Zeta\n"
	    << res8 << "\tAlternating Harmonic\n"
	    << res9 << "\tGregory\n";
}
