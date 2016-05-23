deferred class GLIB_DYNAMIC_LOADING_OF_MODULES
	
--    Dynamic Loading of Modules

--    Dynamic Loading of Modules -- portable method for dynamically loading
--    'plug-ins'.

-- Synopsis


--  #include <gmodule.h>


--              GModule;
--  gboolean    g_module_supported              (void);
--  gchar*      g_module_build_path             (const gchar *directory,
--                                               const gchar *module_name);
--  GModule*    g_module_open                   (const gchar *file_name,
--                                               GModuleFlags flags);
--  enum        GModuleFlags;
--  gboolean    g_module_symbol                 (GModule *module,
--                                               const gchar *symbol_name,
--                                               gpointer *symbol);
--  const gchar* g_module_name                  (GModule *module);
--  void        g_module_make_resident          (GModule *module);
--  gboolean    g_module_close                  (GModule *module);
--  const gchar* g_module_error                 (void);

--  const gchar* (*GModuleCheckInit)            (GModule *module);
--  void        (*GModuleUnload)                (GModule *module);
--  #define     G_MODULE_SUFFIX
--  #define     G_MODULE_EXPORT
--  #define     G_MODULE_IMPORT

-- Description

--    These functions provide a portable way to dynamically load object files (commonly
--    known as 'plug-ins'). The current implementation supports all systems that
--    provide an implementation of dlopen() (e.g. Linux/Sun), as well as HP-UX via its
--    shl_load() mechanism, and Windows platforms via DLLs.

--    A program which wants to use these functions must be linked to the libraries
--    output by the command pkg-config --libs gmodule-2.0.

--    To use them you must first determine whether dynamic loading is supported on the
--    platform by calling g_module_supported(). If it is, you can open a module with
--    g_module_open(), find the module's symbols (e.g. function names) with
--    g_module_symbol(), and later close the module with g_module_close().
--    g_module_name() will return the file name of a currently opened module.

--    If any of the above functions fail, the error status can be found with
--    g_module_error().

--    The GModule implementation features reference counting for opened modules, and
--    supports hook functions within a module which are called when the module is
--    loaded and unloaded (see GModuleCheckInit and GModuleUnload).

--    If your module introduces static data to common subsystems in the running
--    program, e.g. through calling g_quark_from_static_string ("my-module-stuff"), it
--    must ensure that it is never unloaded, by calling g_module_make_resident().

--    Example 12. Calling a function defined in a GModule

--  /* the function signature for 'say_hello' */
--  typedef void (* SayHelloFunc) (const char *message);

--  gboolean
--  just_say_hello (const char *filename, GError **error)
--  {
--    SayHelloFunc  say_hello;
--    GModule      *module;

--    module = g_module_open (filename, G_MODULE_BIND_LAZY);
--    if (!module)
--      {
--        g_set_error (error, FOO_ERROR, FOO_ERROR_BLAH,
--                     "%s", g_module_error ());
--        return FALSE;
--      }

--    if (!g_module_symbol (module, "say_hello", (gpointer *)&say_hello))
--      {
--        g_set_error (error, SAY_ERROR, SAY_ERROR_OPEN,
--                     "%s: %s", filename, g_module_error ());
--        if (!g_module_close (module))
--          g_warning ("%s: %s", filename, g_module_error ());
--        return FALSE;
--      }

--    /* call our function in the module */
--    say_hello ("Hello world!");

--    if (!g_module_close (module))
--      g_warning ("%s: %s", filename, g_module_error ());

--    return TRUE;
--  }

-- Details

--   GModule

--  typedef struct _GModule GModule;

--    The GModule struct is an opaque data structure to represent a Dynamically-Loaded
--    Module. It should only be accessed via the following functions.

--    ---------------------------------------------------------------------------------

--   g_module_supported ()

--  gboolean    g_module_supported              (void);

--    Checks if modules are supported on the current platform.

--    Returns : TRUE if modules are supported.

--    ---------------------------------------------------------------------------------

--   g_module_build_path ()

--  gchar*      g_module_build_path             (const gchar *directory,
--                                               const gchar *module_name);

--    A portable way to build the filename of a module. The platform-specific prefix
--    and suffix are added to the filename, if needed, and the result is added to the
--    directory, using the correct separator character.

--    The directory should specify the directory where the module can be found. It can
--    be NULL or an empty string to indicate that the module is in a standard
--    platform-specific directory, though this is not recommended since the wrong
--    module may be found.

--    For example, calling g_module_build_path() on a Linux system with a directory of
--    /lib and a module_name of "mylibrary" will return /lib/libmylibrary.so. On a
--    Windows system, using \Windows as the directory it will return
--    \Windows\mylibrary.dll.

--    directory :   the directory where the module is. This can be NULL or the empty
--                  string to indicate that the standard platform-specific directories
--                  will be used, though that is not recommended.
--    module_name : the name of the module.
--    Returns :     the complete path of the module, including the standard library
--                  prefix and suffix. This should be freed when no longer needed.

--    ---------------------------------------------------------------------------------

--   g_module_open ()

--  GModule*    g_module_open                   (const gchar *file_name,
--                                               GModuleFlags flags);

--    Opens a module. If the module has already been opened, its reference count is
--    incremented.

--    First of all g_module_open() tries to open file_name as a module. If that fails
--    and file_name has the ".la"-suffix (and is a libtool archive) it tries to open
--    the corresponding module. If that fails and it doesn't have the proper module
--    suffix for the platform (G_MODULE_SUFFIX), this suffix will be appended and the
--    corresponding module will be opended. If that fails and file_name doesn't have
--    the ".la"-suffix, this suffix is appended and g_module_open() tries to open the
--    corresponding module. If eventually that fails as well, NULL is returned.

--    file_name : the name of the file containing the module, or NULL to obtain a
--                GModule representing the main program itself.
--    flags :     the flags used for opening the module. This can be the logical OR of
--                any of the GModuleFlags.
--    Returns :   a GModule on success, or NULL on failure.

--    ---------------------------------------------------------------------------------

--   enum GModuleFlags

--  typedef enum
--  {
--    G_MODULE_BIND_LAZY    = 1 << 0,
--    G_MODULE_BIND_LOCAL   = 1 << 1,
--    G_MODULE_BIND_MASK    = 0x03
--  } GModuleFlags;

--    Flags passed to g_module_open(). Note that these flags are not supported on all
--    platforms.

--    G_MODULE_BIND_LAZY  specifies that symbols are only resolved when needed. The
--                        default action is to bind all symbols when the module is
--                        loaded.
--    G_MODULE_BIND_LOCAL specifies that symbols in the module should not be added to
--                        the global name space. The default action on most platforms
--                        is to place symbols in the module in the global name space,
--                        which may cause conflicts with existing symbols.
--    G_MODULE_BIND_MASK  mask for all flags.

--    ---------------------------------------------------------------------------------

--   g_module_symbol ()

--  gboolean    g_module_symbol                 (GModule *module,
--                                               const gchar *symbol_name,
--                                               gpointer *symbol);

--    Gets a symbol pointer from a module.

--    module :      a GModule.
--    symbol_name : the name of the symbol to find.
--    symbol :      returns the pointer to the symbol value.
--    Returns :     TRUE on success.

--    ---------------------------------------------------------------------------------

--   g_module_name ()

--  const gchar* g_module_name                  (GModule *module);

--    Gets the filename from a GModule.

--    module :  a GModule.
--    Returns : the filename of the module, or "main" if the module is the main program
--              itself.

--    ---------------------------------------------------------------------------------

--   g_module_make_resident ()

--  void        g_module_make_resident          (GModule *module);

--    Ensures that a module will never be unloaded. Any future g_module_close() calls
--    on the module will be ignored.

--    module : a GModule to make permanently resident.

--    ---------------------------------------------------------------------------------

--   g_module_close ()

--  gboolean    g_module_close                  (GModule *module);

--    Closes a module.

--    module :  a GModule to close.
--    Returns : TRUE on success.

--    ---------------------------------------------------------------------------------

--   g_module_error ()

--  const gchar* g_module_error                 (void);

--    Gets a string describing the last module error.

--    Returns : a string describing the last module error.

--    ---------------------------------------------------------------------------------

--   GModuleCheckInit ()

--  const gchar* (*GModuleCheckInit)            (GModule *module);

--    Specifies the type of the module initialization function. If a module contains a
--    function named g_module_check_init() it is called automatically when the module
--    is loaded. It is passed the GModule structure and should return NULL on success
--    or a string describing the initialization error.

--    module :  the GModule corresponding to the module which has just been loaded.
--    Returns : NULL on success, or a string describing the initialization error.

--    ---------------------------------------------------------------------------------

--   GModuleUnload ()

--  void        (*GModuleUnload)                (GModule *module);

--    Specifies the type of the module function called when it is unloaded. If a module
--    contains a function named g_module_unload() it is called automatically when the
--    module is unloaded. It is passed the GModule structure.

--    module : the GModule about to be unloaded.

--    ---------------------------------------------------------------------------------

--   G_MODULE_SUFFIX

--  #define G_MODULE_SUFFIX "so"

--    Expands to the proper shared library suffix for the current platform without the
--    leading dot. For the most Unices and Linux this is "so", for some HP-UX versions
--    this is "sl" and for Windows this is "dll".

--    ---------------------------------------------------------------------------------

--   G_MODULE_EXPORT

--  #define     G_MODULE_EXPORT

--    Used to declare functions exported by modules.

--    ---------------------------------------------------------------------------------

--   G_MODULE_IMPORT

--  #define G_MODULE_IMPORT         extern

--    Used to declare functions imported from modules.
end --  class GLIB_DYNAMIC_LOADING_OF_MODULES
