/* binarytrees.cpp
 *
 * The Great Computer Language Shootout
 * http://shootout.alioth.debian.org/
 *
 * Contributed by Jon Harrop
 * Modified by Alex Mizrahi
 */

#include <iostream>

struct Node {
  Node *l, *r;
  int i;
  Node(int i2) : l(0), r(0), i(i2) {}
  Node(Node *l2, int i2, Node *r2) : l(l2), r(r2), i(i2) {}
  ~Node() { delete l; delete r; }
  int check() const {
    if (l)
      return l->check() + i - r->check();
    else return i;
  }
};

Node *make(int i, int d) {
  if (d == 0) return new Node(i);
  return new Node(make(2*i-1, d-1), i, make(2*i, d-1));
}

int main(int argc, char *argv[]) {
  int min_depth = 4,
    max_depth = std::max(min_depth+2,
			 (argc == 2 ? atoi(argv[1]) : 10)),
    stretch_depth = max_depth+1;

  {
    Node *c = make(0, stretch_depth);
    std::cout << "stretch tree of depth " << stretch_depth << "\t "
	      << "check: " << c->check() << std::endl;
    delete c;
  }

  Node *long_lived_tree=make(0, max_depth);

  for (int d=min_depth; d<=max_depth; d+=2) {
    int iterations = 1 << (max_depth - d + min_depth), c=0;
    for (int i=1; i<=iterations; ++i) {
      Node *a = make(i, d), *b = make(-i, d);
      c += a->check() + b->check();
      delete a;
      delete b;
    }
    std::cout << (2*iterations) << "\t trees of depth " << d << "\t "
	      << "check: " << c << std::endl;
  }

  std::cout << "long lived tree of depth " << max_depth << "\t "
	    << "check: " << (long_lived_tree->check()) << "\n";

  delete long_lived_tree;

  return 0;
}
