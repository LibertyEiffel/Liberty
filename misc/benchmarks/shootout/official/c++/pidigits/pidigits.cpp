/*
** The Computer Language Shootout
** http://shootout.alioth.debian.org/
** contributed by Mike Pall
** converted to C++ by Mario Pernici
** g++ -O2  -o pidigits pidigits.cc -lgmpxx -lgmp
*/

#include <cstdio>
#include <cstdlib>
#include <gmpxx.h>

typedef struct ctx_s {
  ctx_s(int dd, int ii, int qq, int rr, int ss, int tt):
    d(dd), i(ii), q(qq), r(rr), s(ss), t(tt) {}
  mpz_class q, r, s, t;     /* Transformation matrix components. */
  mpz_class u, v, w;        /* Temporary numbers. */
  int d, i, n;          /* Counters. */
  char digits[10+1];    /* Accumulated digits for one line. */
} ctx_t;

/* Compose matrix with numbers on the right. */
static void compose_r(ctx_t *c, int bq, int br, int bs, int bt)
{
  c->u = c->r * bs;
  c->r = c->r * bq;
  c->v = c->t * br;
  c->r = c->r + c->v;
  c->t = c->t * bt;
  c->t = c->t + c->u;
  c->s = c->s * bt;
  c->u = c->q * bs;
  c->s = c->s + c->u;
  c->q = c->q * bq;
}

/* Compose matrix with numbers on the left. */
static void compose_l(ctx_t *c, int bq, int br, int bs, int bt)
{
  c->r = c->r * bt;
  c->u = c->q * br;
  c->r = c->r + c->u;
  c->u = c->t * bs;
  c->t = c->t * bt;
  c->v = c->s * br;
  c->t = c->t + c->v;
  c->s = c->s * bq;
  c->s = c->s + c->u;
  c->q = c->q * bq;
}

/* Extract one digit. */
static int extract(ctx_t *c, unsigned int j)
{
  c->u = c->q * j;
  c->u = c->u + c->r;
  c->v = c->s * j;
  c->v = c->v + c->t;
  c->w = c->u / c->v;
  return c->w.get_ui();
}

/* Print one digit. Returns 1 for the last digit. */
static int prdigit(ctx_t *c, int y)
{
  c->digits[c->d++] = '0'+y;
  if (++c->i % 10 == 0 || c->i == c->n) {
    c->digits[c->d] = '\0';
    printf("%-10s\t:%d\n", c->digits, c->i);
    c->d = 0;
  }
  return c->i == c->n;
}

/* Generate successive digits of PI. */
static void pidigits(ctx_t *c)
{
  int k = 1;
  for (;;) {
    int y = extract(c, 3);
    if (y == extract(c, 4)) {
      if (prdigit(c, y)) return;
      compose_r(c, 10, -10*y, 0, 1);
    } else {
      compose_l(c, k, 4*k+2, 0, 2*k+1);
      k++;
    }
  }
}

int main(int argc, char **argv)
{
  ctx_s c(0, 0, 1, 0, 0, 1);
  c.n = argc > 1 ? atoi(argv[1]) : 27;
  pidigits(&c);
  return 0;
}

