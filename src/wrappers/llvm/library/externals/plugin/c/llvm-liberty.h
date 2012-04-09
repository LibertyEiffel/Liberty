#ifdef DEBUG // Let's be verbose during compile
#   warning "LLVM-liberty starting include" 
#endif

/* #ifdef __llvm__ */
extern unsigned int __builtin_bswap32(unsigned int _data);
extern unsigned long __builtin_bswap64(unsigned long _data);
/* #endif / * __llvm__ */ 

#include <llvm-c/Analysis.h>
#include <llvm-c/BitReader.h>
#include <llvm-c/BitWriter.h>
#include <llvm-c/Core.h>
#include <llvm-c/ExecutionEngine.h>
// #include <llvm-c/LinkTimeOptimizer.h>
// #include <llvm-c/Target.h>
// #include <llvm-c/lto.h>
// #include <llvm-c/Transforms/IPO.h>
// #include <llvm-c/Transforms/Scalar.h>
#ifdef DEBUG // Let's be verbose during compile
#   warning "LLVM-liberty ending include"
#endif
