   SQLite Logo
   Small. Fast. Reliable.
   Choose any three.

   About Sitemap Documentation Download License News Support                                                            _____________________ 
                                                                                                                        [ Go ]                

SQLite C Interface

Constants Defining Special Destructor Behavior

 typedef void (*sqlite3_destructor_type)(void*);
 #define SQLITE_STATIC      ((sqlite3_destructor_type)0)
 #define SQLITE_TRANSIENT   ((sqlite3_destructor_type)-1)

   These are special values for the destructor that is passed in as the final argument to routines like sqlite3_result_blob(). If the
   destructor argument is SQLITE_STATIC, it means that the content pointer is constant and will never change. It does not need to be
   destroyed. The SQLITE_TRANSIENT value means that the content will likely change in the near future and that SQLite should make its own
   private copy of the content before returning.

   The typedef is necessary to work around problems in certain C++ compilers.

   See also lists of Objects, Constants, and Functions.
