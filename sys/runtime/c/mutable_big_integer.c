/*
-- ------------------------------------------------------------------------------------------------------------
-- Copyright notice below. Please read.
--
-- Copyright(C) 1994-2002: INRIA - LORIA (INRIA Lorraine) - ESIAL U.H.P.       - University of Nancy 1 - FRANCE
-- Copyright(C) 2003-2005: INRIA - LORIA (INRIA Lorraine) - I.U.T. Charlemagne - University of Nancy 2 - FRANCE
--
-- Authors: Dominique COLNET, Philippe RIBET, Cyril ADRIAN, Vincent CROIZIER, Frederic MERIZEN
--
-- Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated
-- documentation files (the "Software"), to deal in the Software without restriction, including without
-- limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
-- the Software, and to permit persons to whom the Software is furnished to do so, subject to the following
-- conditions:
--
-- The above copyright notice and this permission notice shall be included in all copies or substantial
-- portions of the Software.
--
-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT
-- LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO
-- EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN
-- AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE
-- OR OTHER DEALINGS IN THE SOFTWARE.
--
-- http://SmartEiffel.loria.fr - SmartEiffel@loria.fr
-- ------------------------------------------------------------------------------------------------------------
*/
EIF_BOOLEAN mbi_inc (int32_t *p) {
    if ((++(*p)) == 0) {
      return 1;
    }
    else {
      return 0;
    }
}

EIF_BOOLEAN mbi_add (int32_t a, int32_t b, int32_t *p) {
  (*p) = a + b;
  if (((uint32_t)(*p)) < ((uint32_t)(a))) {
    return 1;
  }
  else {
    return 0;
  }
}

EIF_BOOLEAN mbi_add_with_inc (int32_t a, int32_t b, int32_t *p) {
  (*p) = a + b + 1;
  if (((uint32_t)(*p)) <= ((uint32_t)(a))) {
    return 1;
  }
  else {
    return 0;
  }
}

EIF_BOOLEAN mbi_dec (int32_t *p) {
    if (((*p)--) == 0) {
      return 1;
    }
    else {
      return 0;
    }
}

EIF_BOOLEAN mbi_subtract (int32_t a, int32_t b, int32_t *p) {
  (*p) = a - b;
  if (((uint32_t)(*p)) > ((uint32_t)(a))) {
    return 1;
  }
  else {
    return 0;
  }
}

EIF_BOOLEAN mbi_subtract_with_dec (int32_t a, int32_t b, int32_t *p) {
  (*p) = a - b - 1;
  if (((uint32_t)(*p)) >= ((uint32_t)(a))) {
    return 1;
  }
  else {
    return 0;
  }
}

EIF_INTEGER mbi_multiply (int32_t a, int32_t b, int32_t *p) {
  uint64_t x;
  x = ((uint64_t)((uint32_t)(a))) * ((uint32_t)(b));
  (*p) = (uint32_t)(x);
  return ((uint32_t)(x >> 32));
}

EIF_INTEGER mbi_multiply_with_add (int32_t a, int32_t b, int32_t c, int32_t *p) {
  uint64_t x;
  x = ((uint64_t)((uint32_t)(a))) * ((uint32_t)(b)) + ((uint32_t)(c));
  (*p) = (uint32_t)(x);
  return ((uint32_t)(x >> 32));
}

EIF_INTEGER mbi_multiply_with_2_add (int32_t a, int32_t b, int32_t c, int32_t d, int32_t *p) {
  uint64_t x;
  x = ((uint64_t)((uint32_t)(a))) * ((uint32_t)(b)) + ((uint32_t)(c)) + ((uint32_t)(d));
  (*p) = (uint32_t)(x);
  return ((uint32_t)(x >> 32));
}

EIF_INTEGER mbi_divide (int32_t a, int32_t b, int32_t d, int32_t *r) {
  uint64_t x;
  x = (((uint64_t)((uint32_t)(a))) << 32) + ((uint32_t)(b));
  (*r) = (uint32_t)(x % ((uint32_t)(d)));
  return ((uint32_t)(x / ((uint32_t)(d))));
}
