#include <sqlite3.h>

#define se_sqlite3_prepare(db, zSql, nBytes, ppStmt, pzTail) sqlite3_prepare(db, zSql, nBytes, ppStmt, ((const char**) pzTail))

