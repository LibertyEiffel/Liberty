/*   The Computer Language Shootout
   http://shootout.alioth.debian.org/
   C version by Greg Buchholz
   converted to C++ and modified by Paul Kitchin
*/

#include <complex>
#include <iostream>
#include <sstream>
#include <emmintrin.h>

typedef __m128d sse_packed_doubles_t;

struct sse_packed_doubles
{
  sse_packed_doubles()
  {
  }
  sse_packed_doubles(double first, double second)
  {
    double packed_values[2] __attribute__((aligned(16))) = {first, second};
    values = _mm_load_pd(packed_values);
  }
  sse_packed_doubles & assign(double first, double second)
  {
    double packed_values[2] __attribute__((aligned(16))) = {first, second};
    values = _mm_load_pd(packed_values);
    return *this;
  }
  sse_packed_doubles & assign_multiplied(sse_packed_doubles const & lhs, sse_packed_doubles const & rhs)
  {
    values = _mm_mul_pd(lhs.values, rhs.values);
    return *this;
  }
  sse_packed_doubles & assign_subtracted(sse_packed_doubles const & lhs, sse_packed_doubles const & rhs)
  {
    values = _mm_sub_pd(lhs.values, rhs.values);
    return *this;
  }
  sse_packed_doubles_t values;
};

sse_packed_doubles & operator+=(sse_packed_doubles & lhs, sse_packed_doubles const & rhs)
{
  lhs.values = _mm_add_pd(lhs.values, rhs.values);
  return lhs;
}

sse_packed_doubles & operator-=(sse_packed_doubles & lhs, sse_packed_doubles const & rhs)
{
  lhs.values = _mm_sub_pd(lhs.values, rhs.values);
  return lhs;
}

sse_packed_doubles & operator*=(sse_packed_doubles & lhs, sse_packed_doubles const & rhs)
{
  lhs.values = _mm_mul_pd(lhs.values, rhs.values);
  return lhs;
}

struct sse_packed_complex
{
  void values(double * const values) const
  {
    _mm_store_pd(values, real.values);
    _mm_store_pd(values + 2, imaginary.values);
  }
  sse_packed_doubles real;
  sse_packed_doubles imaginary;
};

int main(int argc, char * * argv)
{
  char bit_number = 0;
  char byte_accumulator = 0;
  unsigned int const iterations = 50;
  double const limit = 2.0 * 2.0;

  std::ios_base::sync_with_stdio(false);
  if (argc != 2)
    {
      std::cerr << "usage: mandlebrot <n>\n";
      return 1;
    }
  unsigned int dimension;
  {
    std::stringstream convertor(argv[1]);
    if (!(convertor >> dimension) || !convertor.eof())
      {
	std::cerr << "usage: mandlebrot <n>\n";
	std::cerr << "   n must be an integer\n";
	return 1;
      }
  }

  std::cout << "P4\n" << dimension << " " << dimension << '\n';

  sse_packed_complex Z;
  sse_packed_complex C;
  sse_packed_complex Z_components_squared;
  sse_packed_doubles one(1.0, 1.0);
  sse_packed_doubles one_point_five(1.5, 1.5);
  sse_packed_doubles two(2.0, 2.0);
  double Z_squared_values[4] __attribute__((aligned(16)));
  for  (double y = 0; y < dimension; ++y)
    {
      C.imaginary.assign(y / (dimension / 2), y / (dimension / 2));
      C.imaginary -= one;
      for (double x = 0; x < dimension; x += 2)
	{
	  C.real.assign(x / (dimension / 2), (x + 1.0) / (dimension / 2));
	  C.real -= one_point_five;
	  Z.imaginary = C.imaginary;
	  Z.real = C.real;
	  Z_components_squared.imaginary.assign_multiplied(Z.imaginary, Z.imaginary);
	  Z_components_squared.real.assign_multiplied(Z.real, Z.real);
	  Z_components_squared.values(Z_squared_values);

	  for (unsigned int i = 1;
	       (Z_squared_values[0] + Z_squared_values[2] <= limit ||
		Z_squared_values[1] + Z_squared_values[3] <= limit) &&
		 i < iterations; ++i)
	    {
	      Z.imaginary *= Z.real;
	      Z.imaginary *= two;
	      Z.imaginary += C.imaginary;
	      Z.real.assign_subtracted(Z_components_squared.real, Z_components_squared.imaginary);
	      Z.real += C.real;
	      Z_components_squared.imaginary.assign_multiplied(Z.imaginary, Z.imaginary);
	      Z_components_squared.real.assign_multiplied(Z.real, Z.real);
	      Z_components_squared.values(Z_squared_values);
	    }
	  byte_accumulator = (byte_accumulator * 4) |
            ((Z_squared_values[0] + Z_squared_values[2] <= limit) * 2) |
            (Z_squared_values[1] + Z_squared_values[3] <= limit);

	  bit_number += 2;
	  if (__builtin_expect(bit_number == 8, 0))
	    {
	      std::cout << byte_accumulator;
	      bit_number = 0;
	      byte_accumulator = 0;
	    }
	  else if (__builtin_expect(x == dimension - 1, 0))
	    {
	      byte_accumulator <<= 8 - (dimension & 7);
	      std::cout << byte_accumulator;
	      bit_number = 0;
	      byte_accumulator = 0;
	    }
	}
    }
}

