note
	description: "Ancestor of all GTS objects."
	copyright: "[
					Copyright (C) 2006-2018: Paolo Redaelli, Gts team
					
					This library is free software; you can redistribute it and/or
					modify it under the terms of the GNU Lesser General Public License
					as published by the Free Software Foundation; either version 2.1 of
					the License, or (at your option) any later version.
					
					This library is distributed in the hope that it will be useful, but
					WITHOUT ANY WARRANTY; without even the implied warranty of
					MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
					Lesser General Public License for more details.

					You should have received a copy of the GNU Lesser General Public
					License along with this library; if not, write to the Free Software
					Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
					02110-1301 USA
			]"

deferred class GTS_OBJECT
	-- All GTS objects are derived from this base class.

inherit 
	COMPARABLE_SHARED_C_STRUCT
		redefine free
		end

feature {} -- Unwrapped code
	
	-- Note: much of this C features - functions, macros, defines - 
	-- are not useful in an Eiffel wrapper.

	--   GTS_CLASS_NAME_LENGTH

	--  #define GTS_CLASS_NAME_LENGTH 40

	--    Maximum class name length for GtsObjectClass.

	--    -----------------------------------------------------------------------------------------------------------

	--   GTS_OBJECT_CLASS()

	--  #define     GTS_OBJECT_CLASS(klass)

	--    Casts klass to GtsObjectClass.

	--     klass :  a GtsObjectClass.

	--    -----------------------------------------------------------------------------------------------------------

	--   GTS_OBJECT()

	--  #define     GTS_OBJECT(obj)

	--    Casts obj to GtsObject.

	--     obj :  a GtsObject.

	--    -----------------------------------------------------------------------------------------------------------

	--   GTS_IS_OBJECT()

	--  #define     GTS_IS_OBJECT(obj)

	--    Evaluates to TRUE if obj is a GtsObject, FALSE otherwise.

	--     obj :  a pointer to test.

	--    -----------------------------------------------------------------------------------------------------------

	--   GTS_OBJECT_CLASS_CAST()

	--  #define     GTS_OBJECT_CLASS_CAST(objklass, type, klass)

	--    This macro is used to define casting macros for object classes. You should need it only when writing new
	--    object class functions.

	--     objklass :  a GtsObjectClass.
	--     type :      The class type to cast objklass to (example: GtsObjectClass).
	--     klass :     the class to cast objklass to (example: gts_object_class()).

	--    -----------------------------------------------------------------------------------------------------------

	--   GTS_OBJECT_CAST()

	--  #define     GTS_OBJECT_CAST(obj, type, klass)

	--    This macro is used to define casting macros for object. You should need it only when writing new object
	--    functions.

	--     obj :    a GtsObject.
	--     type :   the object type to cast obj to (example: GtsObject).
	--     klass :  the object class to cast obj to (example: gts_object()).

	--    -----------------------------------------------------------------------------------------------------------

	--   GTS_OBJECT_FLAGS()

	--  #define GTS_OBJECT_FLAGS(obj)             (GTS_OBJECT (obj)->flags)

	--     obj :

	--    -----------------------------------------------------------------------------------------------------------

	--   GTS_OBJECT_SET_FLAGS()

	--  #define GTS_OBJECT_SET_FLAGS(obj,flag)    G_STMT_START{ (GTS_OBJECT_FLAGS (obj) |= (flag)); }G_STMT_END

	--     obj :
	--     flag :

	--    -----------------------------------------------------------------------------------------------------------

	--   GTS_OBJECT_UNSET_FLAGS()

	--  #define GTS_OBJECT_UNSET_FLAGS(obj,flag)  G_STMT_START{ (GTS_OBJECT_FLAGS (obj) &= ~(flag)); }G_STMT_END

	--     obj :
	--     flag :

	--    -----------------------------------------------------------------------------------------------------------

	--   GTS_OBJECT_DESTROYED()

	--  #define GTS_OBJECT_DESTROYED(obj)         ((GTS_OBJECT_FLAGS (obj) & GTS_DESTROYED) != 0)

	--     obj :

	--    -----------------------------------------------------------------------------------------------------------

	--   GtsObjectClass

	--  typedef struct {
	--    GtsObjectClassInfo info;
	--    GtsObjectClass * parent_class;

	--    void        (* clone)      (GtsObject *, GtsObject *);
	--    void        (* destroy)    (GtsObject *);
	--    void        (* read)       (GtsObject **, GtsFile *);
	--    void        (* write)      (GtsObject *, FILE *);
	--    GtsColor    (* color)      (GtsObject *);
	--    void        (* attributes) (GtsObject *, GtsObject *);
	--  } GtsObjectClass;

	--    The base object class structure. All the virtual functions clone, destroy, read and write can be
	--    overloaded. The default read and write methods are undefined. The default clone method just copies the
	--    object structure. The default destroy method frees the memory allocated for a given object structure.

	--    -----------------------------------------------------------------------------------------------------------

	--   GtsObject

	--  typedef struct {
	--    GtsObjectClass * klass;

	--    gpointer reserved;
	--    guint32 flags;
	--  } GtsObject;

	--    The base object structure.

	--     GtsObjectClass *klass;  The object class.
	--     gpointer reserved;      Used internally by the library.
	--     guint32 flags;          Used internally.

	--    -----------------------------------------------------------------------------------------------------------

	--   GtsObjectClassInfo

	--  typedef struct {
	--    gchar name[GTS_CLASS_NAME_LENGTH];
	--    guint object_size;
	--    guint class_size;
	--    GtsObjectClassInitFunc class_init_func;
	--    GtsObjectInitFunc object_init_func;
	--    GtsArgSetFunc arg_set_func;
	--    GtsArgGetFunc arg_get_func;
	--  } GtsObjectClassInfo;

	--    Informations about a GtsObjectClass, including name, size of the object structure to be allocated when
	--    constructing the object, size of the object class structure to be allocated when instanciating the object
	--    class, class initialization function, object initialization function.

	--    -----------------------------------------------------------------------------------------------------------

	--   GtsObjectClassInitFunc ()

	--  void        (*GtsObjectClassInitFunc)       (GtsObjectClass *objclass);

	--    A function to call to initialize an object class.

	--     objclass :  a GtsObjectClass to be initialized.

	--    -----------------------------------------------------------------------------------------------------------

	--   GtsObjectInitFunc ()

	--  void        (*GtsObjectInitFunc)            (GtsObject *obj);

	--    A function to call to initialize an object.

	--     obj :  a GtsObject.

	--    -----------------------------------------------------------------------------------------------------------

	--   GtsArgSetFunc ()

	--  void        (*GtsArgSetFunc)                (GtsObject *obj);

	--    Defined for future use.

	--     obj :  a GtsObject.

	--    -----------------------------------------------------------------------------------------------------------

	--   GtsArgGetFunc ()

	--  void        (*GtsArgGetFunc)                (GtsObject *obj);

	--    Defined for future use.

	--     obj :  a GtsObject.

	--    -----------------------------------------------------------------------------------------------------------

	--   enum GtsObjectFlags

	--  typedef enum
	--  {
	--    GTS_DESTROYED         = 1 < < 0,
	--    GTS_USER_FLAG         = 1 /* user flags start from here */
	--  } GtsObjectFlags;

	--    -----------------------------------------------------------------------------------------------------------

	--   GtsColor

	--  typedef struct {
	--    gfloat r, g, b;
	--  } GtsColor;

	--    -----------------------------------------------------------------------------------------------------------

	--   gts_object_class ()

	--  GtsObjectClass* gts_object_class            (void);

	--     Returns :  the GtsObjectClass.

	--    -----------------------------------------------------------------------------------------------------------

	--   gts_object_class_new ()

	--  gpointer    gts_object_class_new            (GtsObjectClass *parent_class,
	--                                               GtsObjectClassInfo *info);

	--     parent_class :  a GtsObjectClass.
	--     info :          a GtsObjectClassInfo, description of the new class to create.
	--     Returns :       a new GtsObjectClass derived from parent_class and described by info.

	--    -----------------------------------------------------------------------------------------------------------

	--   gts_object_class_check_cast ()

	--  gpointer    gts_object_class_check_cast     (gpointer klass,
	--                                               gpointer from);

	--     klass :    a GtsObjectClass.
	--     from :     a GtsObjectClass.
	--     Returns :  klass while emitting warnings if klass is not derived from from.

	--    -----------------------------------------------------------------------------------------------------------

	--   gts_object_class_is_from_class ()

	--  gpointer    gts_object_class_is_from_class  (gpointer klass,
	--                                               gpointer from);

	--     klass :    a GtsObjectClass.
	--     from :     a GtsObjectClass.
	--     Returns :  klass if klass is equal to from or if klass is derived from from, NULL otherwise.

	--    -----------------------------------------------------------------------------------------------------------

	--   gts_object_class_from_name ()

	--  GtsObjectClass* gts_object_class_from_name  (const gchar *name);

	--     name :     the name of a GtsObjectClass.
	--     Returns :  the GtsObjectClass with name name or NULL if it hasn't been instantiated yet.

	--    -----------------------------------------------------------------------------------------------------------

	--   gts_object_new ()

	--  GtsObject*  gts_object_new                  (GtsObjectClass *klass);

	--     klass :    a GtsObjectClass.
	--     Returns :  a new initialized object of class klass.

	--    -----------------------------------------------------------------------------------------------------------

	--   gts_object_init ()

	--  void        gts_object_init                 (GtsObject *object,
	--                                               GtsObjectClass *klass);

	--    Calls the init method of klass with object as argument. This is done recursively in the correct order (from
	--    the base class to the top). You should rarely need this function as it is called automatically by the
	--    constructor for each class.

	--     object :  a GtsObject.
	--     klass :   a GtsObjectClass.

	--    -----------------------------------------------------------------------------------------------------------

	--   gts_object_clone ()

	--  GtsObject*  gts_object_clone                (GtsObject *object);

	--    Calls the clone method of object. The call to this function will fail if no clone method exists for the
	--    given object.

	--     object :   a GtsObject.
	--     Returns :  a new object clone of object.

	--    -----------------------------------------------------------------------------------------------------------

	--   gts_object_attributes ()

	--  void        gts_object_attributes           (GtsObject *object,
	--                                               GtsObject *from);

	--    Calls the attributes() method of object using from as source.

	--     object :  a GtsObject.
	--     from :    a GtsObject.

	--    -----------------------------------------------------------------------------------------------------------

	--   gts_object_check_cast ()

	--  gpointer    gts_object_check_cast           (gpointer object,
	--                                               gpointer klass);

	--     object :   a GtsObject.
	--     klass :    a GtsObjectClass.
	--     Returns :  object while emitting warnings if object is not of class klass.

	--    -----------------------------------------------------------------------------------------------------------

	--   gts_object_is_from_class ()

	--  gpointer    gts_object_is_from_class        (gpointer object,
	--                                               gpointer klass);

	--     object :   a GtsObject.
	--     klass :    a GtsObjectClass.
	--     Returns :  object if object is of class klass or of a class derived from klass, NULL otherwise.

	--    -----------------------------------------------------------------------------------------------------------

	--   gts_object_reset_reserved ()

	--  void        gts_object_reset_reserved       (GtsObject *object);

	--    Reset the reserved field of object.

	--     object :  a GtsObject.

	--   gts_finalize ()

	--  void        gts_finalize                    (void);

	--    Free all the memory allocated by the object system of GTS. No other GTS function can be called after this
	--    function has been called.

feature {} -- size and memory handling
	free (a_pointer: POINTER)
			-- Calls the destroy method of object, freeing all memory
			-- allocated for it.
		do
			check freeing_current: a_pointer=handle end
			gts_object_destroy (a_pointer)
		end

	struct_size: INTEGER
		external "C inline use <gts.h>"
		alias "sizeof(GtsObject)"
		end

feature {} -- External calls
	-- Synopsis

	--  #include <gts.h>


	--  #define     GTS_CLASS_NAME_LENGTH
	--  #define     GTS_OBJECT_CLASS                (klass)
	--  #define     GTS_OBJECT                      (obj)
	--  #define     GTS_IS_OBJECT                   (obj)
	--  #define     GTS_OBJECT_CLASS_CAST           (objklass, type, klass)
	--  #define     GTS_OBJECT_CAST                 (obj, type, klass)
	--  #define     GTS_OBJECT_FLAGS                (obj)
	--  #define     GTS_OBJECT_SET_FLAGS            (obj,flag)
	--  #define     GTS_OBJECT_UNSET_FLAGS          (obj,flag)
	--  #define     GTS_OBJECT_DESTROYED            (obj)

	--              GtsObjectClass;
	--              GtsObject;
	--              GtsObjectClassInfo;
	--  void        (*GtsObjectClassInitFunc)       (GtsObjectClass *objclass);
	--  void        (*GtsObjectInitFunc)            (GtsObject *obj);
	--  void        (*GtsArgSetFunc)                (GtsObject *obj);
	--  void        (*GtsArgGetFunc)                (GtsObject *obj);
	--  enum        GtsObjectFlags;
	--              GtsColor;

	--  GtsObjectClass* gts_object_class            (void);
	--  gpointer    gts_object_class_new            (GtsObjectClass *parent_class,
	--                                               GtsObjectClassInfo *info);
	--  gpointer    gts_object_class_check_cast     (gpointer klass,
	--                                               gpointer from);
	--  gpointer    gts_object_class_is_from_class  (gpointer klass,
	--                                               gpointer from);
	--  GtsObjectClass* gts_object_class_from_name  (const gchar *name);
	--  GtsObject*  gts_object_new                  (GtsObjectClass *klass);
	--  void        gts_object_init                 (GtsObject *object,
	--                                               GtsObjectClass *klass);
	--  GtsObject*  gts_object_clone                (GtsObject *object);
	--  void        gts_object_attributes           (GtsObject *object,
	--                                               GtsObject *from);
	--  gpointer    gts_object_check_cast           (gpointer object,
	--                                               gpointer klass);
	--  gpointer    gts_object_is_from_class        (gpointer object,
	--                                               gpointer klass);
	--  void        gts_object_reset_reserved       (GtsObject *object);
	gts_object_destroy (object: POINTER)
		external "C use <gts.h>"
		end

	--  void        gts_finalize                    (void);

end -- class GTS_OBJECT

