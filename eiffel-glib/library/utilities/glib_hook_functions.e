deferred class GLIB_HOOK_FUNCTIONS
--    Hook Functions

--    Hook Functions -- support for manipulating lists of hook functions.

-- Synopsis


--  #include <glib.h>


--              GHookList;
--  void        (*GHookFinalizeFunc)            (GHookList *hook_list,
--                                               GHook *hook);
--              GHook;
--  void        (*GHookFunc)                    (gpointer data);
--  gboolean    (*GHookCheckFunc)               (gpointer data);

--  void        g_hook_list_init                (GHookList *hook_list,
--                                               guint hook_size);
--  void        g_hook_list_invoke              (GHookList *hook_list,
--                                               gboolean may_recurse);
--  void        g_hook_list_invoke_check        (GHookList *hook_list,
--                                               gboolean may_recurse);
--  void        g_hook_list_marshal             (GHookList *hook_list,
--                                               gboolean may_recurse,
--                                               GHookMarshaller marshaller,
--                                               gpointer marshal_data);
--  void        (*GHookMarshaller)              (GHook *hook,
--                                               gpointer marshal_data);
--  void        g_hook_list_marshal_check       (GHookList *hook_list,
--                                               gboolean may_recurse,
--                                               GHookCheckMarshaller marshaller,
--                                               gpointer marshal_data);
--  gboolean    (*GHookCheckMarshaller)         (GHook *hook,
--                                               gpointer marshal_data);
--  void        g_hook_list_clear               (GHookList *hook_list);

--  GHook*      g_hook_alloc                    (GHookList *hook_list);
--  #define     g_hook_append                   ( hook_list, hook )
--  void        g_hook_prepend                  (GHookList *hook_list,
--                                               GHook *hook);
--  void        g_hook_insert_before            (GHookList *hook_list,
--                                               GHook *sibling,
--                                               GHook *hook);
--  void        g_hook_insert_sorted            (GHookList *hook_list,
--                                               GHook *hook,
--                                               GHookCompareFunc func);
--  gint        (*GHookCompareFunc)             (GHook *new_hook,
--                                               GHook *sibling);
--  gint        g_hook_compare_ids              (GHook *new_hook,
--                                               GHook *sibling);

--  GHook*      g_hook_get                      (GHookList *hook_list,
--                                               gulong hook_id);
--  GHook*      g_hook_find                     (GHookList *hook_list,
--                                               gboolean need_valids,
--                                               GHookFindFunc func,
--                                               gpointer data);
--  gboolean    (*GHookFindFunc)                (GHook *hook,
--                                               gpointer data);
--  GHook*      g_hook_find_data                (GHookList *hook_list,
--                                               gboolean need_valids,
--                                               gpointer data);
--  GHook*      g_hook_find_func                (GHookList *hook_list,
--                                               gboolean need_valids,
--                                               gpointer func);
--  GHook*      g_hook_find_func_data           (GHookList *hook_list,
--                                               gboolean need_valids,
--                                               gpointer func,
--                                               gpointer data);

--  GHook*      g_hook_first_valid              (GHookList *hook_list,
--                                               gboolean may_be_in_call);
--  GHook*      g_hook_next_valid               (GHookList *hook_list,
--                                               GHook *hook,
--                                               gboolean may_be_in_call);
--  enum        GHookFlagMask;
--  #define     G_HOOK_FLAGS                    (hook)
--  #define     G_HOOK_FLAG_USER_SHIFT

--  #define     G_HOOK                          (hook)
--  #define     G_HOOK_IS_VALID                 (hook)
--  #define     G_HOOK_ACTIVE                   (hook)
--  #define     G_HOOK_IN_CALL                  (hook)
--  #define     G_HOOK_IS_UNLINKED              (hook)

--  GHook*      g_hook_ref                      (GHookList *hook_list,
--                                               GHook *hook);
--  void        g_hook_unref                    (GHookList *hook_list,
--                                               GHook *hook);
--  void        g_hook_free                     (GHookList *hook_list,
--                                               GHook *hook);
--  gboolean    g_hook_destroy                  (GHookList *hook_list,
--                                               gulong hook_id);
--  void        g_hook_destroy_link             (GHookList *hook_list,
--                                               GHook *hook);

-- Description

--    The GHookList, GHook and their related functions provide support for lists of
--    hook functions. Functions can be added and removed from the lists, and the list
--    of hook functions can be invoked.

-- Details

--   GHookList

--  typedef struct {
--    gulong            seq_id;
--    guint             hook_size : 16;
--    guint             is_setup : 1;
--    GHook            *hooks;
--    gpointer          dummy3;
--    GHookFinalizeFunc finalize_hook;
--    gpointer          dummy[2];
--  } GHookList;

--    The GHookList struct represents a list of hook functions.

--    gulong seq_id;                   the next free GHook id.
--    guint hook_size : 16;            the size of the GHookList elements, in bytes.
--    guint is_setup : 1;              1 if the GHookList has been initialized.
--    GHook *hooks;                    the first GHook element in the list.
--    gpointer dummy3;
--    GHookFinalizeFunc finalize_hook; the function to call to finalize a GHook
--                                     element. The default behaviour is to call the
--                                     hooks destroy function.
--    gpointer dummy[2];

--    ---------------------------------------------------------------------------------

--   GHookFinalizeFunc ()

--  void        (*GHookFinalizeFunc)            (GHookList *hook_list,
--                                               GHook *hook);

--    Defines the type of function to be called when a hook in a list of hooks gets
--    finalized.

--    hook_list : a GHookList.
--    hook :      the hook in hook_list that gets finalized.

--    ---------------------------------------------------------------------------------

--   GHook

--  typedef struct {
--    gpointer       data;
--    GHook         *next;
--    GHook         *prev;
--    guint          ref_count;
--    gulong         hook_id;
--    guint          flags;
--    gpointer       func;
--    GDestroyNotify destroy;
--  } GHook;

--    The GHook struct represents a single hook function in a GHookList.

--    gpointer data;          data which is passed to func when this hook is invoked.
--    GHook *next;            pointer to the next hook in the list.
--    GHook *prev;            pointer to the previous hook in the list.
--    guint ref_count;        the reference count of this hook.
--    gulong hook_id;         the id of this hook, which is unique within its list.
--    guint flags;            flags which are set for this hook. See GHookFlagMask for
--                            predefined flags.
--    gpointer func;          the function to call when this hook is invoked. The
--                            possible signatures for this function are GHookFunc and
--                            GHookCheckFunc.
--    GDestroyNotify destroy; the default finalize_hook function of a GHookList calls
--                            this member of the hook that is being finalized.

--    ---------------------------------------------------------------------------------

--   GHookFunc ()

--  void        (*GHookFunc)                    (gpointer data);

--    Defines the type of a hook function that can be invoked by g_hook_list_invoke().

--    data : the data field of the GHook is passed to the hook function here.

--    ---------------------------------------------------------------------------------

--   GHookCheckFunc ()

--  gboolean    (*GHookCheckFunc)               (gpointer data);

--    Defines the type of a hook function that can be invoked by
--    g_hook_list_invoke_check().

--    data :    the data field of the GHook is passed to the hook function here.
--    Returns : FALSE if the GHook should be destroyed.

--    ---------------------------------------------------------------------------------

--   g_hook_list_init ()

--  void        g_hook_list_init                (GHookList *hook_list,
--                                               guint hook_size);

--    Initializes a GHookList. This must be called before the GHookList is used.

--    hook_list : a GHookList.
--    hook_size : the size of each element in the GHookList, typically sizeof (GHook).

--    ---------------------------------------------------------------------------------

--   g_hook_list_invoke ()

--  void        g_hook_list_invoke              (GHookList *hook_list,
--                                               gboolean may_recurse);

--    Calls all of the GHook functions in a GHookList.

--    hook_list :   a GHookList.
--    may_recurse : TRUE if functions which are already running (e.g. in another
--                  thread) can be called. If set to FALSE, these are skipped.

--    ---------------------------------------------------------------------------------

--   g_hook_list_invoke_check ()

--  void        g_hook_list_invoke_check        (GHookList *hook_list,
--                                               gboolean may_recurse);

--    Calls all of the GHook functions in a GHookList. Any function which returns TRUE
--    is removed from the GHookList.

--    hook_list :   a GHookList.
--    may_recurse : TRUE if functions which are already running (e.g. in another
--                  thread) can be called. If set to FALSE, these are skipped.

--    ---------------------------------------------------------------------------------

--   g_hook_list_marshal ()

--  void        g_hook_list_marshal             (GHookList *hook_list,
--                                               gboolean may_recurse,
--                                               GHookMarshaller marshaller,
--                                               gpointer marshal_data);

--    Calls a function on each valid GHook.

--    hook_list :    a GHookList.
--    may_recurse :  TRUE if hooks which are currently running (e.g. in another thread)
--                   are considered valid. If set to FALSE, these are skipped.
--    marshaller :   the function to call for each GHook.
--    marshal_data : data to pass to marshaller.

--    ---------------------------------------------------------------------------------

--   GHookMarshaller ()

--  void        (*GHookMarshaller)              (GHook *hook,
--                                               gpointer marshal_data);

--    Defines the type of function used by g_hook_list_marshal().

--    hook :         a GHook.
--    marshal_data : user data.

--    ---------------------------------------------------------------------------------

--   g_hook_list_marshal_check ()

--  void        g_hook_list_marshal_check       (GHookList *hook_list,
--                                               gboolean may_recurse,
--                                               GHookCheckMarshaller marshaller,
--                                               gpointer marshal_data);

--    Calls a function on each valid GHook and destroys it if the function returns
--    FALSE.

--    hook_list :    a GHookList.
--    may_recurse :  TRUE if hooks which are currently running (e.g. in another thread)
--                   are considered valid. If set to FALSE, these are skipped.
--    marshaller :   the function to call for each GHook.
--    marshal_data : data to pass to marshaller.

--    ---------------------------------------------------------------------------------

--   GHookCheckMarshaller ()

--  gboolean    (*GHookCheckMarshaller)         (GHook *hook,
--                                               gpointer marshal_data);

--    Defines the type of function used by g_hook_list_marshal_check().

--    hook :         a GHook.
--    marshal_data : user data.
--    Returns :      FALSE if hook should be destroyed.

--    ---------------------------------------------------------------------------------

--   g_hook_list_clear ()

--  void        g_hook_list_clear               (GHookList *hook_list);

--    Removes all the GHook elements from a GHookList.

--    hook_list : a GHookList.

--    ---------------------------------------------------------------------------------

--   g_hook_alloc ()

--  GHook*      g_hook_alloc                    (GHookList *hook_list);

--    Allocates space for a GHook and initializes it.

--    hook_list : a GHookList.
--    Returns :   a new GHook.

--    ---------------------------------------------------------------------------------

--   g_hook_append()

--  #define     g_hook_append( hook_list, hook )

--    Appends a GHook onto the end of a GHookList.

--    hook_list : a GHookList.
--    hook :      the GHook to add to the end of hook_list.

--    ---------------------------------------------------------------------------------

--   g_hook_prepend ()

--  void        g_hook_prepend                  (GHookList *hook_list,
--                                               GHook *hook);

--    Prepends a GHook on the start of a GHookList.

--    hook_list : a GHookList.
--    hook :      the GHook to add to the start of hook_list.

--    ---------------------------------------------------------------------------------

--   g_hook_insert_before ()

--  void        g_hook_insert_before            (GHookList *hook_list,
--                                               GHook *sibling,
--                                               GHook *hook);

--    Inserts a GHook into a GHookList, before a given GHook.

--    hook_list : a GHookList.
--    sibling :   the GHook to insert the new GHook before.
--    hook :      the GHook to insert.

--    ---------------------------------------------------------------------------------

--   g_hook_insert_sorted ()

--  void        g_hook_insert_sorted            (GHookList *hook_list,
--                                               GHook *hook,
--                                               GHookCompareFunc func);

--    Inserts a GHook into a GHookList, sorted by the given function.

--    hook_list : a GHookList.
--    hook :      the GHook to insert.
--    func :      the comparison function used to sort the GHook elements.

--    ---------------------------------------------------------------------------------

--   GHookCompareFunc ()

--  gint        (*GHookCompareFunc)             (GHook *new_hook,
--                                               GHook *sibling);

--    Defines the type of function used to compare GHook elements in
--    g_hook_insert_sorted().

--    new_hook : the GHook being inserted.
--    sibling :  the GHook to compare with new_hook.
--    Returns :  a value <= 0 if new_hook should be before sibling.

--    ---------------------------------------------------------------------------------

--   g_hook_compare_ids ()

--  gint        g_hook_compare_ids              (GHook *new_hook,
--                                               GHook *sibling);

--    Compares the ids of two GHook elements, returning a negative value if the second
--    id is greater than the first.

--    new_hook : a GHook.
--    sibling :  a GHook to compare with new_hook.
--    Returns :  a value <= 0 if the id of sibling is >= the id of new_hook.

--    ---------------------------------------------------------------------------------

--   g_hook_get ()

--  GHook*      g_hook_get                      (GHookList *hook_list,
--                                               gulong hook_id);

--    Returns the GHook with the given id, or NULL if it is not found.

--    hook_list : a GHookList.
--    hook_id :   a hook id.
--    Returns :   the GHook with the given id, or NULL if it is not found.

--    ---------------------------------------------------------------------------------

--   g_hook_find ()

--  GHook*      g_hook_find                     (GHookList *hook_list,
--                                               gboolean need_valids,
--                                               GHookFindFunc func,
--                                               gpointer data);

--    Finds a GHook in a GHookList using the given function to test for a match.

--    hook_list :   a GHookList.
--    need_valids : TRUE if GHook elements which have been destroyed should be skipped.
--    func :        the function to call for each GHook, which should return TRUE when
--                  the GHook has been found.
--    data :        the data to pass to func.
--    Returns :     the found GHook or NULL if no matching GHook is found.

--    ---------------------------------------------------------------------------------

--   GHookFindFunc ()

--  gboolean    (*GHookFindFunc)                (GHook *hook,
--                                               gpointer data);

--    Defines the type of the function passed to g_hook_find().

--    hook :    a GHook.
--    data :    user data passed to g_hook_find_func().
--    Returns : TRUE if the required GHook has been found.

--    ---------------------------------------------------------------------------------

--   g_hook_find_data ()

--  GHook*      g_hook_find_data                (GHookList *hook_list,
--                                               gboolean need_valids,
--                                               gpointer data);

--    Finds a GHook in a GHookList with the given data.

--    hook_list :   a GHookList.
--    need_valids : TRUE if GHook elements which have been destroyed should be skipped.
--    data :        the data to find.
--    Returns :     the GHook with the given data or NULL if no matching GHook is
--                  found.

--    ---------------------------------------------------------------------------------

--   g_hook_find_func ()

--  GHook*      g_hook_find_func                (GHookList *hook_list,
--                                               gboolean need_valids,
--                                               gpointer func);

--    Finds a GHook in a GHookList with the given function.

--    hook_list :   a GHookList.
--    need_valids : TRUE if GHook elements which have been destroyed should be skipped.
--    func :        the function to find.
--    Returns :     the GHook with the given func or NULL if no matching GHook is
--                  found.

--    ---------------------------------------------------------------------------------

--   g_hook_find_func_data ()

--  GHook*      g_hook_find_func_data           (GHookList *hook_list,
--                                               gboolean need_valids,
--                                               gpointer func,
--                                               gpointer data);

--    Finds a GHook in a GHookList with the given function and data.

--    hook_list :   a GHookList.
--    need_valids : TRUE if GHook elements which have been destroyed should be skipped.
--    func :        the function to find.
--    data :        the data to find.
--    Returns :     the GHook with the given func and data or NULL if no matching GHook
--                  is found.

--    ---------------------------------------------------------------------------------

--   g_hook_first_valid ()

--  GHook*      g_hook_first_valid              (GHookList *hook_list,
--                                               gboolean may_be_in_call);

--    Returns the first GHook in a GHookList which has not been destroyed. The
--    reference count for the GHook is incremented, so you must call g_hook_unref() to
--    restore it when no longer needed. (Or call g_hook_next_valid() if you are
--    stepping through the GHookList.)

--    hook_list :      a GHookList.
--    may_be_in_call : TRUE if hooks which are currently running (e.g. in another
--                     thread) are considered valid. If set to FALSE, these are
--                     skipped.
--    Returns :        the first valid GHook, or NULL if none are valid.

--    ---------------------------------------------------------------------------------

--   g_hook_next_valid ()

--  GHook*      g_hook_next_valid               (GHookList *hook_list,
--                                               GHook *hook,
--                                               gboolean may_be_in_call);

--    Returns the next GHook in a GHookList which has not been destroyed. The reference
--    count for the GHook is incremented, so you must call g_hook_unref() to restore it
--    when no longer needed. (Or continue to call g_hook_next_valid() until NULL is
--    returned.)

--    hook_list :      a GHookList.
--    hook :           the current GHook.
--    may_be_in_call : TRUE if hooks which are currently running (e.g. in another
--                     thread) are considered valid. If set to FALSE, these are
--                     skipped.
--    Returns :        the next valid GHook, or NULL if none are valid.

--    ---------------------------------------------------------------------------------

--   enum GHookFlagMask

--  typedef enum
--  {
--    G_HOOK_FLAG_ACTIVE        = 1 << 0,
--    G_HOOK_FLAG_IN_CALL       = 1 << 1,
--    G_HOOK_FLAG_MASK          = 0x0f
--  } GHookFlagMask;

--    Flags used internally in the GHook implementation.

--    G_HOOK_FLAG_ACTIVE  set if the hook has not been destroyed.
--    G_HOOK_FLAG_IN_CALL set if the hook is currently being run.
--    G_HOOK_FLAG_MASK    A mask covering all bits reserved for hook flags; see
--                        G_HOOK_FLAGS_USER_SHIFT

--    ---------------------------------------------------------------------------------

--   G_HOOK_FLAGS()

--  #define G_HOOK_FLAGS(hook)              (G_HOOK (hook)->flags)

--    Returns the flags of a hook.

--    hook : a GHook.

--    ---------------------------------------------------------------------------------

--   G_HOOK_FLAG_USER_SHIFT

--  #define G_HOOK_FLAG_USER_SHIFT  (4)

--    The position of the first bit which is not reserved for internal use be the GHook
--    implementation, i.e. 1 << G_HOOK_FLAG_USER_SHIFT is the first bit which can be
--    used for application-defined flags.

--    ---------------------------------------------------------------------------------

--   G_HOOK()

--  #define G_HOOK(hook)                    ((GHook*) (hook))

--    Casts a pointer to a GHook*.

--    hook : a pointer.

--    ---------------------------------------------------------------------------------

--   G_HOOK_IS_VALID()

--  #define     G_HOOK_IS_VALID(hook)

--    Returns TRUE if the GHook is valid, i.e. it is in a GHookList, it is active and
--    it has not been destroyed.

--    hook :    a GHook.
--    Returns : TRUE if the GHook is valid.

--    ---------------------------------------------------------------------------------

--   G_HOOK_ACTIVE()

--  #define     G_HOOK_ACTIVE(hook)

--    Returns TRUE if the GHook is active, which is normally TRUE until the GHook is
--    destroyed.

--    hook :    a GHook.
--    Returns : TRUE if the GHook is active.

--    ---------------------------------------------------------------------------------

--   G_HOOK_IN_CALL()

--  #define     G_HOOK_IN_CALL(hook)

--    Returns TRUE if the GHook function is currently executing.

--    hook :    a GHook.
--    Returns : TRUE if the GHook function is currently executing.

--    ---------------------------------------------------------------------------------

--   G_HOOK_IS_UNLINKED()

--  #define     G_HOOK_IS_UNLINKED(hook)

--    Returns TRUE if the GHook is not in a GHookList.

--    hook :    a GHook.
--    Returns : TRUE if the GHook is not in a GHookList.

--    ---------------------------------------------------------------------------------

--   g_hook_ref ()

--  GHook*      g_hook_ref                      (GHookList *hook_list,
--                                               GHook *hook);

--    Increments the reference count for a GHook.

--    hook_list : a GHookList.
--    hook :      the GHook to increment the reference count of.
--    Returns :   the hook that was passed in (since 2.6)

--    ---------------------------------------------------------------------------------

--   g_hook_unref ()

--  void        g_hook_unref                    (GHookList *hook_list,
--                                               GHook *hook);

--    Decrements the reference count of a GHook. If the reference count falls to 0, the
--    GHook is removed from the GHookList and g_hook_free() is called to free it.

--    hook_list : a GHookList.
--    hook :      the GHook to unref.

--    ---------------------------------------------------------------------------------

--   g_hook_free ()

--  void        g_hook_free                     (GHookList *hook_list,
--                                               GHook *hook);

--    Calls the GHookList hook_free function if it exists, and frees the memory
--    allocated for the GHook.

--    hook_list : a GHookList.
--    hook :      the GHook to free.

--    ---------------------------------------------------------------------------------

--   g_hook_destroy ()

--  gboolean    g_hook_destroy                  (GHookList *hook_list,
--                                               gulong hook_id);

--    Destroys a GHook, given its ID.

--    hook_list : a GHookList.
--    hook_id :   a hook ID.
--    Returns :   TRUE if the GHook was found in the GHookList and destroyed.

--    ---------------------------------------------------------------------------------

--   g_hook_destroy_link ()

--  void        g_hook_destroy_link             (GHookList *hook_list,
--                                               GHook *hook);

--    Removes one GHook from a GHookList, marking it inactive and calling
--    g_hook_unref() on it.

--    hook_list : a GHookList.
--    hook :      the GHook to remove.
end -- class GLIB_HOOK_FUNCTIONS
