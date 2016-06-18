note
	copyright: "(C) 2005 Paolo Redaelli "
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision "$REvision:$"

deferred class G_VALUE_EXTERNALS

inherit ANY undefine is_equal, copy end

feature {C_STRUCT} -- allocation

	malloc_g_value: POINTER
			-- Allocate a GValue struct
		external "C inline use <glib-object.h>"
		alias "g_malloc0(sizeof(GValue))"
		ensure not_null: Result.is_not_null
		end

	gvalue_size: INTEGER
		external "C use <glib-object.h>"
		alias "sizeof (GValue)"
		end

feature {C_STRUCT}

	g_value_holds(value: POINTER; type: INTEGER): INTEGER
			 -- Returns TRUE if value holds (or contains) a value of type. This macro will also check for value != NULL and issue a warning if the check fails.
			 -- value : 	A GValue structure.
			 -- type : 	A GType value.
		external "C macro use <glib-object.h>"
		alias "G_VALUE_HOLDS"
		end

	g_value_type (value: POINTER): INTEGER
			 -- Returns the type identifier of value.
			 -- value : 	A GValue structure.
		external "C macro use <glib-object.h>"
		alias "G_VALUE_TYPE"
		end

	g_value_type_name(value: POINTER): POINTER
			 -- Returns the type name of value.
			 -- value : 	A GValue structure.
		external "C macro use <glib-object.h>"
		alias "G_VALUE_TYPE_NAME"
		end

	-- #define	G_TYPE_IS_VALUE(type)		(g_type_check_is_value_type (type))

	-- Return whether the passed in type ID can be used for g_value_init(). That is, this macro checks whether this type provides an implementation of the GTypeValueTable functions required for a type to create a GValue of.
	-- type : 	A GType value.
	-- Returns : 	Whether type is suitable as a GValue type.

	-- G_TYPE_IS_VALUE_ABSTRACT()

	-- #define G_TYPE_IS_VALUE_ABSTRACT(type)          (g_type_test_flags ((type), G_TYPE_FLAG_VALUE_ABSTRACT))

	-- Returns TRUE if type is an abstract value type. An abstract value type introduces a value table, but can't be used for g_value_init() and is normally used as an abstract base type for derived value types.
 -- type : 	A GType value.

	g_is_value (a_value: POINTER): INTEGER
			-- Returns TRUE if value is a valid and initialized GValue structure.
			-- value : 	A GValue structure.
		external "C macro use <glib-object.h>"
		alias "G_IS_VALUE"
		end

	-- G_TYPE_VALUE

	-- #define	G_TYPE_VALUE		(g_value_get_type ())

	-- Returns the type ID of the "GValue" type which is a boxed type, used to pass around pointers to GValues.
	-- G_TYPE_VALUE_ARRAY

	-- #define	G_TYPE_VALUE_ARRAY	(g_value_array_get_type ())

	-- Returns the type ID of the "GValueArray" type which is a boxed type, used to pass around pointers to GValueArrays.

	g_value_init (gvalue: POINTER; g_type: INTEGER_64): POINTER
			 -- Initializes value with the default value of type.
			 -- gvalue: 	A zero-filled (uninitialized) GValue structure.
			 -- g_type : 	Type the GValue should hold values of.
			 -- Returns : 	the GValue structure that has been passed in

			 -- Note: g_type is actually a gulong, which should map to a
			 -- NATURAL_64, not to INTEGER_64. Paolo 2005-12-11
		 external "C use <glib-object.h>"
		 end

	g_value_copy (src,dest: POINTER)
		 -- Copies the value of src_value into dest_value.
		 -- src: An initialized GValue structure.
		 -- dest: An initialized GValue structure of the same type as src_value.
		 external "C use <glib-object.h>"
		 end

	g_value_reset (value: POINTER): POINTER
			 -- Clears the current value in value and resets it to the default value (as if the value had just been initialized).
		 external "C use <glib-object.h>"
		 end

	g_value_unset (value: POINTER)
			 -- Clears the current value in value and "unsets" the type, this releases all resources associated with this GValue. An unset value is the same as an uninitialized (zero-filled) GValue structure.
		 external "C use <glib-object.h>"
		 end

	-- g_value_fits_pointer ()

	-- gboolean    g_value_fits_pointer            (const GValue *value);

	-- Determines if value will fit inside the size of a pointer value. This is an internal function introduced mainly for C marshallers.
	-- value : 	An initialized GValue structure.
	-- Returns : 	TRUE if value will fit inside a pointer value.

	-- g_value_peek_pointer ()

	-- gpointer    g_value_peek_pointer            (const GValue *value);

	-- Return the value contents as pointer. This function asserts that g_value_fits_pointer() returned TRUE for the passed in value. This is an internal function introduced mainly for C marshallers.
	-- value : 	An initialized GValue structure.
	-- Returns : 	TRUE if value will fit inside a pointer value.

	g_value_type_compatible (src_type,dest_type: INTEGER_64): INTEGER
			 -- Returns whether a GValue of type src_type can be copied into a GValue of type dest_type.
			 -- src_type : 	source type to be copied.
			 -- dest_type : 	destination type for copying.
			 -- Returns : 	TRUE if g_value_copy() is possible with src_type and dest_type.
		 external "C use <glib-object.h>"
		 end

	-- g_value_type_transformable ()

	-- gboolean    g_value_type_transformable      (GType src_type,
	-- 															GType dest_type);

	-- Check whether g_value_transform() is able to transform values of type src_type into values of type dest_type.
	-- src_type : 	Source type.
	-- dest_type : 	Target type.
	-- Returns : 	TRUE if the transformation is possible, FALSE otherwise.
	-- g_value_transform ()

	-- gboolean    g_value_transform               (const GValue *src_value,
	-- 															GValue *dest_value);

	-- Tries to cast the contents of src_value into a type appropriate to store in dest_value, e.g. to transform a G_TYPE_INT value into a G_TYPE_FLOAT value. Performing transformations between value types might incur precision lossage. Especially transformations into strings might reveal seemingly arbitrary results and shouldn't be relied upon for production code (such as rcfile value or object property serialization).
	-- src_value : 	Source value.
	-- dest_value : 	Target value.
	-- Returns : 	Whether a transformation rule was found and could be applied. Upon failing transformations, dest_value is left untouched.
	-- GValueTransform ()

	-- void        (*GValueTransform)              (const GValue *src_value,
	-- 															GValue *dest_value);

	-- The type of value transformation functions which can be registered with g_value_register_transform_func().
	-- src_value : 	Source value.
	-- dest_value : 	Target value.
	-- g_value_register_transform_func ()

	-- void        g_value_register_transform_func (GType src_type,
	-- 															GType dest_type,
	-- 															GValueTransform transform_func);

	-- Registers a value transformation function for use in g_value_transform(). A previously registered transformation function for src_type and dest_type will be replaced.
	-- src_type : 	Source type.
	-- dest_type : 	Target type.
	-- transform_func : 	a function which transforms values of type src_type into value of type dest_type

	g_strdup_value_contents (value: POINTER): POINTER
			 -- Return a newly allocated string, which describes the contents of a GValue. The main purpose of this function is to describe GValue contents for debugging output, the way in which the contents are described may change between different GLib versions.
			 -- value : 	GValue which contents are to be described.
			 -- Returns : 	Newly allocated string.
		 external "C use <glib-object.h>"
		 end

	-- Commenting out this casting macro. Casting is not needed in
	-- Eiffel g_param_spec_boolean (param_spec: POINTER): INTEGER is
	-- external "C macro use <glib-object.h>" alias
	-- "G_PARAM_SPEC_BOOLEAN" end

	g_value_holds_boolean (value: POINTER): INTEGER
		external "C macro use <glib-object.h>"
		alias "G_VALUE_HOLDS_BOOLEAN"
		end
	
	-- GParamSpec* g_param_spec_boolean            (const gchar *name,
	--                                              const gchar *nick,
	--                                              const gchar *blurb,
	--                                              gboolean default_value,
	--                                              GParamFlags flags);
	g_value_set_boolean (gvalue: POINTER; gboolean: INTEGER)
		external "C use <glib-object.h>"
		end

	g_value_get_boolean (gvalue: POINTER): INTEGER
		external "C use <glib-object.h>"
		end

	g_value_holds_char (value: POINTER): INTEGER
		external "C macro use <glib-object.h>"
		alias "G_VALUE_HOLDS_CHAR"
		end

	g_value_set_char (gvalue: POINTER; gchar: CHARACTER)
		external "C use <glib-object.h>"
		end

	g_value_get_char (gvalue: POINTER):CHARACTER
		external "C use <glib-object.h>"
		end

	-- TODO wrap g_value_holds_uchar (value): INTEGER is
	-- 		external "C macro use <glib-object.h>"
	--alias "G_VALUE_HOLDS_UCHAR"
	-- end			

	-- TODO wrap void g_value_set_uchar (GValue *value, guchar
	-- v_uchar);

	-- TODO wrap guchar g_value_get_uchar (const GValue *value);

	g_value_holds_int (value: POINTER): INTEGER
		external "C macro use <glib-object.h>"
		alias "G_VALUE_HOLDS_INT"
		end

	g_value_set_int (gvalue: POINTER; gint: INTEGER)
		external "C use <glib-object.h>"
		end

	g_value_get_int (gvalue: POINTER): INTEGER
		external "C use <glib-object.h>"
		end

	g_value_holds_uint (value: POINTER): INTEGER
		external "C macro use <glib-object.h>"
		alias "G_VALUE_HOLDS_UINT"
		end

	g_value_set_uint (gvalue: POINTER; guint: INTEGER)
			-- TODO: obsolete "g_value_set_uint shall use NATUAL instead INTEGER"
		require positive_int: guint >= 0
		external "C use <glib-object.h>"
		end

	g_value_get_uint (gvalue: POINTER): INTEGER
		-- TODO: obsolete "g_value_get_uint shall return NATURAL instead of INTEGER"
		external "C use <glib-object.h>"
		ensure positive: Result>=0
		end

	g_value_holds_long (value: POINTER): INTEGER
		external "C macro use <glib-object.h>"
		alias "G_VALUE_HOLDS_LONG"
		end

	g_value_set_long (gvalue: POINTER; glong: INTEGER_64)
		external "C use <glib-object.h>"
		end

	g_value_get_long (gvalue: POINTER): INTEGER_64
		external "C use <glib-object.h>"
		end

	-- TODO g_value_holds_ulong (value: POINTER): INTEGER is
	-- 		external "C macro use <glib-object.h>"
	--		alias "G_VALUE_HOLDS_ULONG"
	-- end			
	-- void        g_value_set_ulong               (GValue *value,
	--                                              gulong v_ulong);
	-- gulong      g_value_get_ulong               (const GValue *value);
	
	g_value_holds_int64 (value: POINTER): INTEGER
		external "C macro G_VALUE_HOLDS_INT64 use <glib-object.h>"
		end

	g_value_set_int64 (gvalue: POINTER; gint64: INTEGER_64)
		external "C use <glib-object.h>"
		end

	g_value_get_int64 (gvalue: POINTER): INTEGER_64
		external "C use <glib-object.h>"
		end

	-- TODO wrap #define     G_VALUE_HOLDS_UINT64            (value: POINTER)
	
	-- TODO wrap void g_value_set_uint64 (GValue *value, guint64
	-- v_uint64);
	
	-- TODO wrap guint64 g_value_get_uint64 (const GValue *value);

	g_value_holds_float (value: POINTER): INTEGER
		external "C macro use <glib-object.h>"
		alias "G_VALUE_HOLDS_FLOAT"
		end

	g_value_set_float (gvalue: POINTER; gfloat: REAL_32)
		external "C use <glib-object.h>"
		end

	g_value_get_float (gvalue: POINTER): REAL_32
		external "C use <glib-object.h>"
		end

	g_value_holds_double (value: POINTER): INTEGER
		external "C macro use <glib-object.h>"
		alias "G_VALUE_HOLDS_DOUBLE"
		end

	g_value_set_double (gvalue: POINTER; gdouble: REAL_64)
		external "C use <glib-object.h>"
		end

	g_value_get_double (gvalue: POINTER): REAL_64
		external "C use <glib-object.h>"
		end

	g_value_holds_enum (value: POINTER): INTEGER
		external "C macro use <glib-object.h>"
		alias "G_VALUE_HOLDS_ENUM"
		end

	g_value_set_enum (gvalue: POINTER; enum: INTEGER)
		external "C use <glib-object.h>"
		end

	g_value_get_enum (gvalue: POINTER): INTEGER
		external "C use <glib-object.h>"
		end

	g_value_holds_flags (value: POINTER): INTEGER
		external "C macro use <glib-object.h>"
		alias "G_VALUE_HOLDS_FLAGS"
		end

	g_value_set_flags (gvalue: POINTER; guint: INTEGER)
			-- TODO: obsolete "g_value_set_flags' guint shall be NATURAL instead of INTEGER"
		require positive_int: guint>=0
		external "C use <glib-object.h>"
		end

	g_value_get_flags (gvalue: POINTER): INTEGER
			-- TODO: obsolete "g_value_get_flags shall return NATURAL instead of INTEGER"
		external "C use <glib-object.h>"
		ensure positive: Result>=0
		end

	g_value_holds_string (value: POINTER): INTEGER
		external "C macro use <glib-object.h>"
		alias "G_VALUE_HOLDS_STRING"
		end

	g_value_set_string (gvalue, string: POINTER)
		external "C use <glib-object.h>"
		end

	-- TODO: shall g_value_set_static_string be wrapped"
	g_value_take_string (gvalue, string: POINTER)
		external "C use <glib-object.h>"
		end

	g_value_get_string (gvalue: POINTER): POINTER
		external "C use <glib-object.h>"
		end

	g_value_dup_string (gvalue: POINTER): POINTER
		external "C use <glib-object.h>"
		end

	g_value_holds_param (value: POINTER): INTEGER
		external "C macro use <glib-object.h>"
		alias "G_VALUE_HOLDS_PARAM"
		end

	g_value_set_param (gvalue, param: POINTER)
		external "C use <glib-object.h>"
		end

	g_value_take_param (gvalue, param: POINTER)
		external "C use <glib-object.h>"
		end

	g_value_set_param_take_ownership (gvalue, param: POINTER)
		external "C use <glib-object.h>"
		end

	g_value_get_param (gvalue: POINTER): POINTER
		external "C use <glib-object.h>"
		end

	g_value_dup_param (gvalue: POINTER): POINTER
		external "C use <glib-object.h>"
		end

	g_value_holds_boxed (value: POINTER): INTEGER
		external "C macro use <glib-object.h>"
		alias "G_VALUE_HOLDS_BOXED"
		end

	g_value_set_boxed (gvalue, boxed: POINTER)
		external "C use <glib-object.h>"
		end
	-- TODO: shall be wrapper" void g_value_set_static_boxed (GValue
	-- *value,-- gconstpointer v_boxed);

	g_value_take_boxed (gvalue, boxed: POINTER)
		external "C use <glib-object.h>"
		end

	g_value_get_boxed (gvalue: POINTER)
		external "C use <glib-object.h>"
		end

	g_value_dup_boxed (gvalue: POINTER)
		external "C use <glib-object.h>"
		end

	g_value_holds_pointer (value: POINTER): INTEGER
		external "C macro use <glib-object.h>"
		alias "G_VALUE_HOLDS_POINTER"
		end

	g_value_set_pointer (gvalue, pointer: POINTER)
		external "C use <glib-object.h>"
		end

	g_value_get_pointer (gvalue: POINTER): POINTER
		external "C use <glib-object.h>"
		end

	g_value_holds_object (value: POINTER): INTEGER
		external "C macro use <glib-object.h>"
		alias "G_VALUE_HOLDS_OBJECT"
		end

	g_value_set_object (gvalue, pointer: POINTER)
		external "C use <glib-object.h>"
		end

	g_value_get_object (gvalue: POINTER): POINTER
		external "C use <glib-object.h>"
		end

-- FIXME: I am not sure if we will need g_value_take_object. And I am
-- almost sure that we don't need g_value_dup_object **trixx, 20060608

	-- #define     G_IS_PARAM_SPEC_UNICHAR         (pspec)
	-- #define     G_PARAM_SPEC_UNICHAR            (pspec)
	-- #define     G_TYPE_PARAM_UNICHAR
	--             GParamSpecUnichar;
	-- GParamSpec* g_param_spec_unichar            (const gchar *name,
	--                                              const gchar *nick,
	--                                              const gchar *blurb,
	--                                              gunichar default_value,
	--                                              GParamFlags flags);

	-- #define     G_IS_PARAM_SPEC_VALUE_ARRAY     (pspec)
	-- #define     G_PARAM_SPEC_VALUE_ARRAY        (pspec)
	-- #define     G_TYPE_PARAM_VALUE_ARRAY
	--             GParamSpecValueArray;
	-- GParamSpec* g_param_spec_value_array        (const gchar *name,
	--                                              const gchar *nick,
	--                                              const gchar *blurb,
	--                                              GParamSpec *element_spec,
	--                                              GParamFlags flags);

	-- #define     G_IS_PARAM_SPEC_OVERRIDE        (pspec)
	-- #define     G_PARAM_SPEC_OVERRIDE           (pspec)
	-- #define     G_TYPE_PARAM_OVERRIDE
	--             GParamSpecOverride;
	-- GParamSpec* g_param_spec_override           (const gchar *name,
	--                                              GParamSpec *overridden);


	-- Description

	-- GValue provides an abstract container structure which can be copied, transformed and compared while holding a value of any (derived) type, which is registered as a GType with a GTypeValueTable in its GTypeInfo structure. Parameter specifications for most value types can be created as GParamSpec derived instances, to implement e.g. GObject properties which operate on GValue containers.

	-- Parameter names need to start with a letter (a-z or A-Z). Subsequent characters can be letters, numbers or a '-'. All other characters are replaced by a '-' during construction.
	-- Details
	-- G_IS_PARAM_SPEC_BOOLEAN()

	-- #define G_IS_PARAM_SPEC_BOOLEAN(pspec)     (G_TYPE_CHECK_INSTANCE_TYPE ((pspec), G_TYPE_PARAM_BOOLEAN))

	-- Return whether the given GParamSpec is of type G_TYPE_PARAM_BOOLEAN.
	-- pspec : 	a valid GParamSpec instance
	-- G_PARAM_SPEC_BOOLEAN()

	-- #define G_PARAM_SPEC_BOOLEAN(pspec)        (G_TYPE_CHECK_INSTANCE_CAST ((pspec), G_TYPE_PARAM_BOOLEAN, GParamSpecBoolean))

	-- Cast a GParamSpec instance into a GParamSpecBoolean.
	-- pspec : 	a valid GParamSpec instance
	-- G_VALUE_HOLDS_BOOLEAN()

	-- #define G_VALUE_HOLDS_BOOLEAN(value)	 (G_TYPE_CHECK_VALUE_TYPE ((value), G_TYPE_BOOLEAN))

	-- Return whether the given GValue can hold values of type G_TYPE_BOOLEAN.
	-- value : 	a valid GValue structure
	-- G_TYPE_PARAM_BOOLEAN

	-- #define	G_TYPE_PARAM_BOOLEAN		   (g_param_spec_types[2])

	-- The GType of GParamSpecBoolean.
	-- GParamSpecBoolean

	-- typedef struct {
	--   GParamSpec    parent_instance;

	--   gboolean      default_value;
	-- } GParamSpecBoolean;

	-- A GParamSpec derived structure that contains the meta data for boolean properties.
	-- GParamSpec parent_instance; 	private GParamSpec portion
	-- gboolean default_value; 	default value for the property specified
	-- g_param_spec_boolean ()

	-- GParamSpec* g_param_spec_boolean            (const gchar *name,
	--                                              const gchar *nick,
	--                                              const gchar *blurb,
	--                                              gboolean default_value,
	--                                              GParamFlags flags);

	-- Creates a new GParamSpecBoolean instance specifying a G_TYPE_BOOLEAN property.

	-- See g_param_spec_internal() for details on property names.
	-- name : 	canonical name of the property specified
	-- nick : 	nick name for the property specified
	-- blurb : 	description of the property specified
	-- default_value : 	default value for the property specified
	-- flags : 	flags for the property specified
	-- Returns : 	a newly created parameter specification
	-- g_value_set_boolean ()

	-- void        g_value_set_boolean             (GValue *value,
	--                                              gboolean v_boolean);

	-- Set the contents of a G_TYPE_BOOLEAN GValue to v_boolean.
	-- value : 	a valid GValue of type G_TYPE_BOOLEAN
	-- v_boolean : 	boolean value to be set
	-- g_value_get_boolean ()

	-- gboolean    g_value_get_boolean             (const GValue *value);

	-- Get the contents of a G_TYPE_BOOLEAN GValue.
	-- value : 	a valid GValue of type G_TYPE_BOOLEAN
	-- Returns : 	boolean contents of value
	-- G_IS_PARAM_SPEC_CHAR()

	-- #define G_IS_PARAM_SPEC_CHAR(pspec)        (G_TYPE_CHECK_INSTANCE_TYPE ((pspec), G_TYPE_PARAM_CHAR))

	-- Return whether the given GParamSpec is of type G_TYPE_PARAM_CHAR.
	-- pspec : 	a valid GParamSpec instance
	-- G_PARAM_SPEC_CHAR()

	-- #define G_PARAM_SPEC_CHAR(pspec)           (G_TYPE_CHECK_INSTANCE_CAST ((pspec), G_TYPE_PARAM_CHAR, GParamSpecChar))

	-- Cast a GParamSpec instance into a GParamSpecChar.
	-- pspec : 	a valid GParamSpec instance
	-- G_VALUE_HOLDS_CHAR()

	-- #define G_VALUE_HOLDS_CHAR(value)	 (G_TYPE_CHECK_VALUE_TYPE ((value), G_TYPE_CHAR))

	-- Return whether the given GValue can hold values of type G_TYPE_CHAR.
	-- value : 	a valid GValue structure
	-- G_TYPE_PARAM_CHAR

	-- #define	G_TYPE_PARAM_CHAR		   (g_param_spec_types[0])

	-- The GType of GParamSpecChar.
	-- GParamSpecChar

	-- typedef struct {
	--   GParamSpec    parent_instance;

	--   gint8         minimum;
	--   gint8         maximum;
	--   gint8         default_value;
	-- } GParamSpecChar;

	-- A GParamSpec derived structure that contains the meta data for character properties.
	-- GParamSpec parent_instance; 	private GParamSpec portion
	-- gint8 minimum; 	minimum value for the property specified
	-- gint8 maximum; 	maximum value for the property specified
	-- gint8 default_value; 	default value for the property specified
	-- g_param_spec_char ()

	-- GParamSpec* g_param_spec_char               (const gchar *name,
	--                                              const gchar *nick,
	--                                              const gchar *blurb,
	--                                              gint8 minimum,
	--                                              gint8 maximum,
	--                                              gint8 default_value,
	--                                              GParamFlags flags);

	-- Creates a new GParamSpecChar instance specifying a G_TYPE_CHAR property.
	-- name : 	canonical name of the property specified
	-- nick : 	nick name for the property specified
	-- blurb : 	description of the property specified
	-- minimum : 	minimum value for the property specified
	-- maximum : 	maximum value for the property specified
	-- default_value : 	default value for the property specified
	-- flags : 	flags for the property specified
	-- Returns : 	a newly created parameter specification
	-- g_value_set_char ()

	-- void        g_value_set_char                (GValue *value,
	--                                              gchar v_char);

	-- Set the contents of a G_TYPE_CHAR GValue to v_char.
	-- value : 	a valid GValue of type G_TYPE_CHAR
	-- v_char : 	character value to be set
	-- g_value_get_char ()

	-- gchar       g_value_get_char                (const GValue *value);

	-- Get the contents of a G_TYPE_CHAR GValue.
	-- value : 	a valid GValue of type G_TYPE_CHAR
	-- Returns : 	character contents of value
	-- G_IS_PARAM_SPEC_UCHAR()

	-- #define G_IS_PARAM_SPEC_UCHAR(pspec)       (G_TYPE_CHECK_INSTANCE_TYPE ((pspec), G_TYPE_PARAM_UCHAR))

	-- Return whether the given GParamSpec is of type G_TYPE_PARAM_UCHAR.
	-- pspec : 	a valid GParamSpec instance
	-- G_PARAM_SPEC_UCHAR()

	-- #define G_PARAM_SPEC_UCHAR(pspec)          (G_TYPE_CHECK_INSTANCE_CAST ((pspec), G_TYPE_PARAM_UCHAR, GParamSpecUChar))

	-- Cast a GParamSpec instance into a GParamSpecUChar.
	-- pspec : 	a valid GParamSpec instance
	-- G_VALUE_HOLDS_UCHAR()

	-- #define G_VALUE_HOLDS_UCHAR(value)	 (G_TYPE_CHECK_VALUE_TYPE ((value), G_TYPE_UCHAR))

	-- Return whether the given GValue can hold values of type G_TYPE_UCHAR.
	-- value : 	a valid GValue structure
	-- G_TYPE_PARAM_UCHAR

	-- #define	G_TYPE_PARAM_UCHAR		   (g_param_spec_types[1])

	-- The GType of GParamSpecUChar.
	-- GParamSpecUChar

	-- typedef struct {
	--   GParamSpec    parent_instance;

	--   guint8        minimum;
	--   guint8        maximum;
	--   guint8        default_value;
	-- } GParamSpecUChar;

	-- A GParamSpec derived structure that contains the meta data for unsigned character properties.
	-- GParamSpec parent_instance; 	private GParamSpec portion
	-- guint8 minimum; 	minimum value for the property specified
	-- guint8 maximum; 	maximum value for the property specified
	-- guint8 default_value; 	default value for the property specified
	-- g_param_spec_uchar ()

	-- GParamSpec* g_param_spec_uchar              (const gchar *name,
	--                                              const gchar *nick,
	--                                              const gchar *blurb,
	--                                              guint8 minimum,
	--                                              guint8 maximum,
	--                                              guint8 default_value,
	--                                              GParamFlags flags);

	-- Creates a new GParamSpecUChar instance specifying a G_TYPE_UCHAR property.
	-- name : 	canonical name of the property specified
	-- nick : 	nick name for the property specified
	-- blurb : 	description of the property specified
	-- minimum : 	minimum value for the property specified
	-- maximum : 	maximum value for the property specified
	-- default_value : 	default value for the property specified
	-- flags : 	flags for the property specified
	-- Returns : 	a newly created parameter specification
	-- g_value_set_uchar ()

	-- void        g_value_set_uchar               (GValue *value,
	--                                              guchar v_uchar);

	-- Set the contents of a G_TYPE_UCHAR GValue to v_uchar.
	-- value : 	a valid GValue of type G_TYPE_UCHAR
	-- v_uchar : 	unsigned character value to be set
	-- g_value_get_uchar ()

	-- guchar      g_value_get_uchar               (const GValue *value);

	-- Get the contents of a G_TYPE_UCHAR GValue.
	-- value : 	a valid GValue of type G_TYPE_UCHAR
	-- Returns : 	unsigned character contents of value
	-- G_IS_PARAM_SPEC_INT()

	-- #define G_IS_PARAM_SPEC_INT(pspec)         (G_TYPE_CHECK_INSTANCE_TYPE ((pspec), G_TYPE_PARAM_INT))

	-- Return whether the given GParamSpec is of type G_TYPE_PARAM_INT.
	-- pspec : 	a valid GParamSpec instance
	-- G_PARAM_SPEC_INT()

	-- #define G_PARAM_SPEC_INT(pspec)            (G_TYPE_CHECK_INSTANCE_CAST ((pspec), G_TYPE_PARAM_INT, GParamSpecInt))

	-- Cast a GParamSpec instance into a GParamSpecInt.
	-- pspec : 	a valid GParamSpec instance
	-- G_VALUE_HOLDS_INT()

	-- #define G_VALUE_HOLDS_INT(value)	 (G_TYPE_CHECK_VALUE_TYPE ((value), G_TYPE_INT))

	-- Return whether the given GValue can hold values of type G_TYPE_INT.
	-- value : 	a valid GValue structure
	-- G_TYPE_PARAM_INT

	-- #define	G_TYPE_PARAM_INT		   (g_param_spec_types[3])

	-- The GType of GParamSpecInt.
	-- GParamSpecInt

	-- typedef struct {
	--   GParamSpec    parent_instance;
  
	--   gint          minimum;
	--   gint          maximum;
	--   gint          default_value;
	-- } GParamSpecInt;

	-- A GParamSpec derived structure that contains the meta data for integer properties.
	-- GParamSpec parent_instance; 	private GParamSpec portion
	-- gint minimum; 	minimum value for the property specified
	-- gint maximum; 	maximum value for the property specified
	-- gint default_value; 	default value for the property specified
	-- g_param_spec_int ()

	-- GParamSpec* g_param_spec_int                (const gchar *name,
	--                                              const gchar *nick,
	--                                              const gchar *blurb,
	--                                              gint minimum,
	--                                              gint maximum,
	--                                              gint default_value,
	--                                              GParamFlags flags);

	-- Creates a new GParamSpecInt instance specifying a G_TYPE_INT property.

	-- See g_param_spec_internal() for details on property names.
	-- name : 	canonical name of the property specified
	-- nick : 	nick name for the property specified
	-- blurb : 	description of the property specified
	-- minimum : 	minimum value for the property specified
	-- maximum : 	maximum value for the property specified
	-- default_value : 	default value for the property specified
	-- flags : 	flags for the property specified
	-- Returns : 	a newly created parameter specification
	-- g_value_set_int ()

	-- void        g_value_set_int                 (GValue *value,
	--                                              gint v_int);

	-- Set the contents of a G_TYPE_INT GValue to v_int.
	-- value : 	a valid GValue of type G_TYPE_INT
	-- v_int : 	integer value to be set
	-- g_value_get_int ()

	-- gint        g_value_get_int                 (const GValue *value);

	-- Get the contents of a G_TYPE_INT GValue.
	-- value : 	a valid GValue of type G_TYPE_INT
	-- Returns : 	integer contents of value
	-- G_IS_PARAM_SPEC_UINT()

	-- #define G_IS_PARAM_SPEC_UINT(pspec)        (G_TYPE_CHECK_INSTANCE_TYPE ((pspec), G_TYPE_PARAM_UINT))

	-- Return whether the given GParamSpec is of type G_TYPE_PARAM_UINT.
	-- pspec : 	a valid GParamSpec instance
	-- G_PARAM_SPEC_UINT()

	-- #define G_PARAM_SPEC_UINT(pspec)           (G_TYPE_CHECK_INSTANCE_CAST ((pspec), G_TYPE_PARAM_UINT, GParamSpecUInt))

	-- Cast a GParamSpec instance into a GParamSpecUInt.
	-- pspec : 	a valid GParamSpec instance
	-- G_VALUE_HOLDS_UINT()

	-- #define G_VALUE_HOLDS_UINT(value)	 (G_TYPE_CHECK_VALUE_TYPE ((value), G_TYPE_UINT))

	-- Return whether the given GValue can hold values of type G_TYPE_UINT.
	-- value : 	a valid GValue structure
	-- G_TYPE_PARAM_UINT

	-- #define	G_TYPE_PARAM_UINT		   (g_param_spec_types[4])

	-- The GType of GParamSpecUInt.
	-- GParamSpecUInt

	-- typedef struct {
	--   GParamSpec    parent_instance;
  
	--   guint         minimum;
	--   guint         maximum;
	--   guint         default_value;
	-- } GParamSpecUInt;

	-- A GParamSpec derived structure that contains the meta data for unsigned integer properties.
	-- GParamSpec parent_instance; 	private GParamSpec portion
	-- guint minimum; 	minimum value for the property specified
	-- guint maximum; 	maximum value for the property specified
	-- guint default_value; 	default value for the property specified
	-- g_param_spec_uint ()

	-- GParamSpec* g_param_spec_uint               (const gchar *name,
	--                                              const gchar *nick,
	--                                              const gchar *blurb,
	--                                              guint minimum,
	--                                              guint maximum,
	--                                              guint default_value,
	--                                              GParamFlags flags);

	-- Creates a new GParamSpecUInt instance specifying a G_TYPE_UINT property.

	-- See g_param_spec_internal() for details on property names.
	-- name : 	canonical name of the property specified
	-- nick : 	nick name for the property specified
	-- blurb : 	description of the property specified
	-- minimum : 	minimum value for the property specified
	-- maximum : 	maximum value for the property specified
	-- default_value : 	default value for the property specified
	-- flags : 	flags for the property specified
	-- Returns : 	a newly created parameter specification
	-- g_value_set_uint ()

	-- void        g_value_set_uint                (GValue *value,
	--                                              guint v_uint);

	-- Set the contents of a G_TYPE_UINT GValue to v_uint.
	-- value : 	a valid GValue of type G_TYPE_UINT
	-- v_uint : 	unsigned integer value to be set
	-- g_value_get_uint ()

	-- guint       g_value_get_uint                (const GValue *value);

	-- Get the contents of a G_TYPE_UINT GValue.
	-- value : 	a valid GValue of type G_TYPE_UINT
	-- Returns : 	unsigned integer contents of value
	-- G_IS_PARAM_SPEC_LONG()

	-- #define G_IS_PARAM_SPEC_LONG(pspec)        (G_TYPE_CHECK_INSTANCE_TYPE ((pspec), G_TYPE_PARAM_LONG))

	-- Return whether the given GParamSpec is of type G_TYPE_PARAM_LONG.
	-- pspec : 	a valid GParamSpec instance
	-- G_PARAM_SPEC_LONG()

	-- #define G_PARAM_SPEC_LONG(pspec)           (G_TYPE_CHECK_INSTANCE_CAST ((pspec), G_TYPE_PARAM_LONG, GParamSpecLong))

	-- Cast a GParamSpec instance into a GParamSpecLong.
	-- pspec : 	a valid GParamSpec instance
	-- G_VALUE_HOLDS_LONG()

	-- #define G_VALUE_HOLDS_LONG(value)	 (G_TYPE_CHECK_VALUE_TYPE ((value), G_TYPE_LONG))

	-- Return whether the given GValue can hold values of type G_TYPE_LONG.
	-- value : 	a valid GValue structure
	-- G_TYPE_PARAM_LONG

	-- #define	G_TYPE_PARAM_LONG		   (g_param_spec_types[5])

	-- The GType of GParamSpecLong.
	-- GParamSpecLong

	-- typedef struct {
	--   GParamSpec    parent_instance;
  
	--   glong         minimum;
	--   glong         maximum;
	--   glong         default_value;
	-- } GParamSpecLong;

	-- A GParamSpec derived structure that contains the meta data for long integer properties.
	-- GParamSpec parent_instance; 	private GParamSpec portion
	-- glong minimum; 	minimum value for the property specified
	-- glong maximum; 	maximum value for the property specified
	-- glong default_value; 	default value for the property specified
	-- g_param_spec_long ()

	-- GParamSpec* g_param_spec_long               (const gchar *name,
	--                                              const gchar *nick,
	--                                              const gchar *blurb,
	--                                              glong minimum,
	--                                              glong maximum,
	--                                              glong default_value,
	--                                              GParamFlags flags);

	-- Creates a new GParamSpecLong instance specifying a G_TYPE_LONG property.

	-- See g_param_spec_internal() for details on property names.
	-- name : 	canonical name of the property specified
	-- nick : 	nick name for the property specified
	-- blurb : 	description of the property specified
	-- minimum : 	minimum value for the property specified
	-- maximum : 	maximum value for the property specified
	-- default_value : 	default value for the property specified
	-- flags : 	flags for the property specified
	-- Returns : 	a newly created parameter specification
	-- g_value_set_long ()

	-- void        g_value_set_long                (GValue *value,
	--                                              glong v_long);

	-- Set the contents of a G_TYPE_LONG GValue to v_long.
	-- value : 	a valid GValue of type G_TYPE_LONG
	-- v_long : 	long integer value to be set
	-- g_value_get_long ()

	-- glong       g_value_get_long                (const GValue *value);

	-- Get the contents of a G_TYPE_LONG GValue.
	-- value : 	a valid GValue of type G_TYPE_LONG
	-- Returns : 	long integer contents of value
	-- G_IS_PARAM_SPEC_ULONG()

	-- #define G_IS_PARAM_SPEC_ULONG(pspec)       (G_TYPE_CHECK_INSTANCE_TYPE ((pspec), G_TYPE_PARAM_ULONG))

	-- Return whether the given GParamSpec is of type G_TYPE_PARAM_ULONG.
	-- pspec : 	a valid GParamSpec instance
	-- G_PARAM_SPEC_ULONG()

	-- #define G_PARAM_SPEC_ULONG(pspec)          (G_TYPE_CHECK_INSTANCE_CAST ((pspec), G_TYPE_PARAM_ULONG, GParamSpecULong))

	-- Cast a GParamSpec instance into a GParamSpecULong.
	-- pspec : 	a valid GParamSpec instance
	-- G_VALUE_HOLDS_ULONG()

	-- #define G_VALUE_HOLDS_ULONG(value)	 (G_TYPE_CHECK_VALUE_TYPE ((value), G_TYPE_ULONG))

	-- Return whether the given GValue can hold values of type G_TYPE_ULONG.
	-- value : 	a valid GValue structure
	-- G_TYPE_PARAM_ULONG

	-- #define	G_TYPE_PARAM_ULONG		   (g_param_spec_types[6])

	-- The GType of GParamSpecULong.
	-- GParamSpecULong

	-- typedef struct {
	--   GParamSpec    parent_instance;
  
	--   gulong        minimum;
	--   gulong        maximum;
	--   gulong        default_value;
	-- } GParamSpecULong;

	-- A GParamSpec derived structure that contains the meta data for unsigned long integer properties.
	-- GParamSpec parent_instance; 	private GParamSpec portion
	-- gulong minimum; 	minimum value for the property specified
	-- gulong maximum; 	maximum value for the property specified
	-- gulong default_value; 	default value for the property specified
	-- g_param_spec_ulong ()

	-- GParamSpec* g_param_spec_ulong              (const gchar *name,
	--                                              const gchar *nick,
	--                                              const gchar *blurb,
	--                                              gulong minimum,
	--                                              gulong maximum,
	--                                              gulong default_value,
	--                                              GParamFlags flags);

	-- Creates a new GParamSpecULong instance specifying a G_TYPE_ULONG property.

	-- See g_param_spec_internal() for details on property names.
	-- name : 	canonical name of the property specified
	-- nick : 	nick name for the property specified
	-- blurb : 	description of the property specified
	-- minimum : 	minimum value for the property specified
	-- maximum : 	maximum value for the property specified
	-- default_value : 	default value for the property specified
	-- flags : 	flags for the property specified
	-- Returns : 	a newly created parameter specification
	-- g_value_set_ulong ()

	-- void        g_value_set_ulong               (GValue *value,
	--                                              gulong v_ulong);

	-- Set the contents of a G_TYPE_ULONG GValue to v_ulong.
	-- value : 	a valid GValue of type G_TYPE_ULONG
	-- v_ulong : 	unsigned long integer value to be set
	-- g_value_get_ulong ()

	-- gulong      g_value_get_ulong               (const GValue *value);

	-- Get the contents of a G_TYPE_ULONG GValue.
	-- value : 	a valid GValue of type G_TYPE_ULONG
	-- Returns : 	unsigned long integer contents of value
	-- G_IS_PARAM_SPEC_INT64()

	-- #define G_IS_PARAM_SPEC_INT64(pspec)       (G_TYPE_CHECK_INSTANCE_TYPE ((pspec), G_TYPE_PARAM_INT64))

	-- Return whether the given GParamSpec is of type G_TYPE_PARAM_INT64.
	-- pspec : 	a valid GParamSpec instance
	-- G_PARAM_SPEC_INT64()

	-- #define G_PARAM_SPEC_INT64(pspec)          (G_TYPE_CHECK_INSTANCE_CAST ((pspec), G_TYPE_PARAM_INT64, GParamSpecInt64))

	-- Cast a GParamSpec instance into a GParamSpecInt64.
	-- pspec : 	a valid GParamSpec instance
	-- G_VALUE_HOLDS_INT64()

	-- #define G_VALUE_HOLDS_INT64(value)	 (G_TYPE_CHECK_VALUE_TYPE ((value), G_TYPE_INT64))

	-- Return whether the given GValue can hold values of type G_TYPE_INT64.
	-- value : 	a valid GValue structure
	-- G_TYPE_PARAM_INT64

	-- #define	G_TYPE_PARAM_INT64		   (g_param_spec_types[7])

	-- The GType of GParamSpecInt64.
	-- GParamSpecInt64

	-- typedef struct {
	--   GParamSpec    parent_instance;
  
	--   gint64        minimum;
	--   gint64        maximum;
	--   gint64        default_value;
	-- } GParamSpecInt64;

	-- A GParamSpec derived structure that contains the meta data for 64bit integer properties.
	-- GParamSpec parent_instance; 	private GParamSpec portion
	-- gint64 minimum; 	minimum value for the property specified
	-- gint64 maximum; 	maximum value for the property specified
	-- gint64 default_value; 	default value for the property specified
	-- g_param_spec_int64 ()

	-- GParamSpec* g_param_spec_int64              (const gchar *name,
	--                                              const gchar *nick,
	--                                              const gchar *blurb,
	--                                              gint64 minimum,
	--                                              gint64 maximum,
	--                                              gint64 default_value,
	--                                              GParamFlags flags);

	-- Creates a new GParamSpecInt64 instance specifying a G_TYPE_INT64 property.

	-- See g_param_spec_internal() for details on property names.
	-- name : 	canonical name of the property specified
	-- nick : 	nick name for the property specified
	-- blurb : 	description of the property specified
	-- minimum : 	minimum value for the property specified
	-- maximum : 	maximum value for the property specified
	-- default_value : 	default value for the property specified
	-- flags : 	flags for the property specified
	-- Returns : 	a newly created parameter specification
	-- g_value_set_int64 ()

	-- void        g_value_set_int64               (GValue *value,
	--                                              gint64 v_int64);

	-- Set the contents of a G_TYPE_INT64 GValue to v_int64.
	-- value : 	a valid GValue of type G_TYPE_INT64
	-- v_int64 : 	64bit integer value to be set
	-- g_value_get_int64 ()

	-- gint64      g_value_get_int64               (const GValue *value);

	-- Get the contents of a G_TYPE_INT64 GValue.
	-- value : 	a valid GValue of type G_TYPE_INT64
	-- Returns : 	64bit integer contents of value
	-- G_IS_PARAM_SPEC_UINT64()

	-- #define G_IS_PARAM_SPEC_UINT64(pspec)      (G_TYPE_CHECK_INSTANCE_TYPE ((pspec), G_TYPE_PARAM_UINT64))

	-- Return whether the given GParamSpec is of type G_TYPE_PARAM_UINT64.
	-- pspec : 	a valid GParamSpec instance
	-- G_PARAM_SPEC_UINT64()

	-- #define G_PARAM_SPEC_UINT64(pspec)         (G_TYPE_CHECK_INSTANCE_CAST ((pspec), G_TYPE_PARAM_UINT64, GParamSpecUInt64))

	-- Cast a GParamSpec instance into a GParamSpecUInt64.
	-- pspec : 	a valid GParamSpec instance
	-- G_VALUE_HOLDS_UINT64()

	-- #define G_VALUE_HOLDS_UINT64(value)	 (G_TYPE_CHECK_VALUE_TYPE ((value), G_TYPE_UINT64))

	-- Return whether the given GValue can hold values of type G_TYPE_UINT64.
	-- value : 	a valid GValue structure
	-- G_TYPE_PARAM_UINT64

	-- #define	G_TYPE_PARAM_UINT64		   (g_param_spec_types[8])

	-- The GType of GParamSpecUInt64.
	-- GParamSpecUInt64

	-- typedef struct {
	--   GParamSpec    parent_instance;
  
	--   guint64       minimum;
	--   guint64       maximum;
	--   guint64       default_value;
	-- } GParamSpecUInt64;

	-- A GParamSpec derived structure that contains the meta data for unsigned 64bit integer properties.
	-- GParamSpec parent_instance; 	private GParamSpec portion
	-- guint64 minimum; 	minimum value for the property specified
	-- guint64 maximum; 	maximum value for the property specified
	-- guint64 default_value; 	default value for the property specified
	-- g_param_spec_uint64 ()

	-- GParamSpec* g_param_spec_uint64             (const gchar *name,
	--                                              const gchar *nick,
	--                                              const gchar *blurb,
	--                                              guint64 minimum,
	--                                              guint64 maximum,
	--                                              guint64 default_value,
	--                                              GParamFlags flags);

	-- Creates a new GParamSpecUInt64 instance specifying a G_TYPE_UINT64 property.

	-- See g_param_spec_internal() for details on property names.
	-- name : 	canonical name of the property specified
	-- nick : 	nick name for the property specified
	-- blurb : 	description of the property specified
	-- minimum : 	minimum value for the property specified
	-- maximum : 	maximum value for the property specified
	-- default_value : 	default value for the property specified
	-- flags : 	flags for the property specified
	-- Returns : 	a newly created parameter specification
	-- g_value_set_uint64 ()

	-- void        g_value_set_uint64              (GValue *value,
	--                                              guint64 v_uint64);

	-- Set the contents of a G_TYPE_UINT64 GValue to v_uint64.
	-- value : 	a valid GValue of type G_TYPE_UINT64
	-- v_uint64 : 	unsigned 64bit integer value to be set
	-- g_value_get_uint64 ()

	-- guint64     g_value_get_uint64              (const GValue *value);

	-- Get the contents of a G_TYPE_UINT64 GValue.
	-- value : 	a valid GValue of type G_TYPE_UINT64
	-- Returns : 	unsigned 64bit integer contents of value
	-- G_IS_PARAM_SPEC_FLOAT()

	-- #define G_IS_PARAM_SPEC_FLOAT(pspec)       (G_TYPE_CHECK_INSTANCE_TYPE ((pspec), G_TYPE_PARAM_FLOAT))

	-- Return whether the given GParamSpec is of type G_TYPE_PARAM_FLOAT.
	-- pspec : 	a valid GParamSpec instance
	-- G_PARAM_SPEC_FLOAT()

	-- #define G_PARAM_SPEC_FLOAT(pspec)          (G_TYPE_CHECK_INSTANCE_CAST ((pspec), G_TYPE_PARAM_FLOAT, GParamSpecFloat))

	-- Cast a GParamSpec instance into a GParamSpecFloat.
	-- pspec : 	a valid GParamSpec instance
	-- G_VALUE_HOLDS_FLOAT()

	-- #define G_VALUE_HOLDS_FLOAT(value)	 (G_TYPE_CHECK_VALUE_TYPE ((value), G_TYPE_FLOAT))

	-- Return whether the given GValue can hold values of type G_TYPE_FLOAT.
	-- value : 	a valid GValue structure
	-- G_TYPE_PARAM_FLOAT

	-- #define	G_TYPE_PARAM_FLOAT		   (g_param_spec_types[12])

	-- The GType of GParamSpecFloat.
	-- GParamSpecFloat

	-- typedef struct {
	--   GParamSpec    parent_instance;
  
	--   gfloat        minimum;
	--   gfloat        maximum;
	--   gfloat        default_value;
	--   gfloat        epsilon;
	-- } GParamSpecFloat;

	-- A GParamSpec derived structure that contains the meta data for float properties.
	-- GParamSpec parent_instance; 	private GParamSpec portion
	-- gfloat minimum; 	minimum value for the property specified
	-- gfloat maximum; 	maximum value for the property specified
	-- gfloat default_value; 	default value for the property specified
	-- gfloat epsilon; 	values closer than epsilon will be considered identical by g_param_values_cmp(); the default value is 1e-30.
	-- g_param_spec_float ()

	-- GParamSpec* g_param_spec_float              (const gchar *name,
	--                                              const gchar *nick,
	--                                              const gchar *blurb,
	--                                              gfloat minimum,
	--                                              gfloat maximum,
	--                                              gfloat default_value,
	--                                              GParamFlags flags);

	-- Creates a new GParamSpecFloat instance specifying a G_TYPE_FLOAT property.

	-- See g_param_spec_internal() for details on property names.
	-- name : 	canonical name of the property specified
	-- nick : 	nick name for the property specified
	-- blurb : 	description of the property specified
	-- minimum : 	minimum value for the property specified
	-- maximum : 	maximum value for the property specified
	-- default_value : 	default value for the property specified
	-- flags : 	flags for the property specified
	-- Returns : 	a newly created parameter specification
	-- g_value_set_float ()

	-- void        g_value_set_float               (GValue *value,
	--                                              gfloat v_float);

	-- Set the contents of a G_TYPE_FLOAT GValue to v_float.
	-- value : 	a valid GValue of type G_TYPE_FLOAT
	-- v_float : 	float value to be set
	-- g_value_get_float ()

	-- gfloat      g_value_get_float               (const GValue *value);

	-- Get the contents of a G_TYPE_FLOAT GValue.
	-- value : 	a valid GValue of type G_TYPE_FLOAT
	-- Returns : 	float contents of value
	-- G_IS_PARAM_SPEC_DOUBLE()

	-- #define G_IS_PARAM_SPEC_DOUBLE(pspec)      (G_TYPE_CHECK_INSTANCE_TYPE ((pspec), G_TYPE_PARAM_DOUBLE))

	-- Return whether the given GParamSpec is of type G_TYPE_PARAM_DOUBLE.
	-- pspec : 	a valid GParamSpec instance
	-- G_PARAM_SPEC_DOUBLE()

	-- #define G_PARAM_SPEC_DOUBLE(pspec)         (G_TYPE_CHECK_INSTANCE_CAST ((pspec), G_TYPE_PARAM_DOUBLE, GParamSpecDouble))

	-- Cast a GParamSpec instance into a GParamSpecDouble.
	-- pspec : 	a valid GParamSpec instance
	-- G_VALUE_HOLDS_DOUBLE()

	-- #define G_VALUE_HOLDS_DOUBLE(value)	 (G_TYPE_CHECK_VALUE_TYPE ((value), G_TYPE_DOUBLE))

	-- Return whether the given GValue can hold values of type G_TYPE_DOUBLE.
	-- value : 	a valid GValue structure
	-- G_TYPE_PARAM_DOUBLE

	-- #define	G_TYPE_PARAM_DOUBLE		   (g_param_spec_types[13])

	-- The GType of GParamSpecDouble.
	-- GParamSpecDouble

	-- typedef struct {
	--   GParamSpec    parent_instance;
  
	--   gdouble       minimum;
	--   gdouble       maximum;
	--   gdouble       default_value;
	--   gdouble       epsilon;
	-- } GParamSpecDouble;

	-- A GParamSpec derived structure that contains the meta data for double properties.
	-- GParamSpec parent_instance; 	private GParamSpec portion
	-- gdouble minimum; 	minimum value for the property specified
	-- gdouble maximum; 	maximum value for the property specified
	-- gdouble default_value; 	default value for the property specified
	-- gdouble epsilon; 	values closer than epsilon will be considered identical by g_param_values_cmp(); the default value is 1e-90.
	-- g_param_spec_double ()

	-- GParamSpec* g_param_spec_double             (const gchar *name,
	--                                              const gchar *nick,
	--                                              const gchar *blurb,
	--                                              gdouble minimum,
	--                                              gdouble maximum,
	--                                              gdouble default_value,
	--                                              GParamFlags flags);

	-- Creates a new GParamSpecDouble instance specifying a G_TYPE_DOUBLE property.

	-- See g_param_spec_internal() for details on property names.
	-- name : 	canonical name of the property specified
	-- nick : 	nick name for the property specified
	-- blurb : 	description of the property specified
	-- minimum : 	minimum value for the property specified
	-- maximum : 	maximum value for the property specified
	-- default_value : 	default value for the property specified
	-- flags : 	flags for the property specified
	-- Returns : 	a newly created parameter specification
	-- g_value_set_double ()

	-- void        g_value_set_double              (GValue *value,
	--                                              gdouble v_double);

	-- Set the contents of a G_TYPE_DOUBLE GValue to v_double.
	-- value : 	a valid GValue of type G_TYPE_DOUBLE
	-- v_double : 	double value to be set
	-- g_value_get_double ()

	-- gdouble     g_value_get_double              (const GValue *value);

	-- Get the contents of a G_TYPE_DOUBLE GValue.
	-- value : 	a valid GValue of type G_TYPE_DOUBLE
	-- Returns : 	double contents of value
	-- G_IS_PARAM_SPEC_ENUM()

	-- #define G_IS_PARAM_SPEC_ENUM(pspec)        (G_TYPE_CHECK_INSTANCE_TYPE ((pspec), G_TYPE_PARAM_ENUM))

	-- Returns whether the given GParamSpec is of type G_TYPE_PARAM_ENUM.
	-- pspec : 	a valid GParamSpec instance
	-- G_PARAM_SPEC_ENUM()

	-- #define G_PARAM_SPEC_ENUM(pspec)           (G_TYPE_CHECK_INSTANCE_CAST ((pspec), G_TYPE_PARAM_ENUM, GParamSpecEnum))

	-- Cast a GParamSpec instance into a GParamSpecEnum.
	-- pspec : 	a valid GParamSpec instance
	-- G_VALUE_HOLDS_ENUM()

	-- #define G_VALUE_HOLDS_ENUM(value)      (G_TYPE_CHECK_VALUE_TYPE ((value), G_TYPE_ENUM))

	-- Return whether the given GValue can hold values derived from type G_TYPE_ENUM.
	-- value : 	a valid GValue structure
	-- G_TYPE_PARAM_ENUM

	-- #define	G_TYPE_PARAM_ENUM		   (g_param_spec_types[10])

	-- The GType of GParamSpecEnum.
	-- GParamSpecEnum

	-- typedef struct {
	--   GParamSpec    parent_instance;
  
	--   GEnumClass   *enum_class;
	--   gint          default_value;
	-- } GParamSpecEnum;

	-- A GParamSpec derived structure that contains the meta data for enum properties.
	-- GParamSpec parent_instance; 	private GParamSpec portion
	-- GEnumClass *enum_class; 	the GEnumClass for the enum
	-- gint default_value; 	default value for the property specified
	-- g_param_spec_enum ()

	-- GParamSpec* g_param_spec_enum               (const gchar *name,
	--                                              const gchar *nick,
	--                                              const gchar *blurb,
	--                                              GType enum_type,
	--                                              gint default_value,
	--                                              GParamFlags flags);

	-- Creates a new GParamSpecEnum instance specifying a G_TYPE_ENUM property.

	-- See g_param_spec_internal() for details on property names.
	-- name : 	canonical name of the property specified
	-- nick : 	nick name for the property specified
	-- blurb : 	description of the property specified
	-- enum_type : 	a GType derived from G_TYPE_ENUM
	-- default_value : 	default value for the property specified
	-- flags : 	flags for the property specified
	-- Returns : 	a newly created parameter specification
	-- g_value_set_enum ()

	-- void        g_value_set_enum                (GValue *value,
	--                                              gint v_enum);

	-- Set the contents of a G_TYPE_ENUM GValue to v_enum.
	-- value : 	a valid GValue whose type is derived from G_TYPE_ENUM
	-- v_enum : 	enum value to be set
	-- g_value_get_enum ()

	-- gint        g_value_get_enum                (const GValue *value);

	-- Get the contents of a G_TYPE_ENUM GValue.
	-- value : 	a valid GValue whose type is derived from G_TYPE_ENUM
	-- Returns : 	enum contents of value
	-- G_IS_PARAM_SPEC_FLAGS()

	-- #define G_IS_PARAM_SPEC_FLAGS(pspec)       (G_TYPE_CHECK_INSTANCE_TYPE ((pspec), G_TYPE_PARAM_FLAGS))

	-- Returns whether the given GParamSpec is of type G_TYPE_PARAM_FLAGS.
	-- pspec : 	a valid GParamSpec instance
	-- G_PARAM_SPEC_FLAGS()

	-- #define G_PARAM_SPEC_FLAGS(pspec)          (G_TYPE_CHECK_INSTANCE_CAST ((pspec), G_TYPE_PARAM_FLAGS, GParamSpecFlags))

	-- Cast a GParamSpec instance into a GParamSpecFlags.
	-- pspec : 	a valid GParamSpec instance
	-- G_VALUE_HOLDS_FLAGS()

	-- #define G_VALUE_HOLDS_FLAGS(value)     (G_TYPE_CHECK_VALUE_TYPE ((value), G_TYPE_FLAGS))

	-- Returns whether the given GValue can hold values derived from type G_TYPE_FLAGS.
	-- value : 	a valid GValue structure
	-- G_TYPE_PARAM_FLAGS

	-- #define	G_TYPE_PARAM_FLAGS		   (g_param_spec_types[11])

	-- The GType of GParamSpecFlags.
	-- GParamSpecFlags

	-- typedef struct {
	--   GParamSpec    parent_instance;
  
	--   GFlagsClass  *flags_class;
	--   guint         default_value;
	-- } GParamSpecFlags;

	-- A GParamSpec derived structure that contains the meta data for flags properties.
	-- GParamSpec parent_instance; 	private GParamSpec portion
	-- GFlagsClass *flags_class; 	the GFlagsClass for the flags
	-- guint default_value; 	default value for the property specified
	-- g_param_spec_flags ()

	-- GParamSpec* g_param_spec_flags              (const gchar *name,
	--                                              const gchar *nick,
	--                                              const gchar *blurb,
	--                                              GType flags_type,
	--                                              guint default_value,
	--                                              GParamFlags flags);

	-- Creates a new GParamSpecEnum instance specifying a G_TYPE_FLAGS property.

	-- See g_param_spec_internal() for details on property names.
	-- name : 	canonical name of the property specified
	-- nick : 	nick name for the property specified
	-- blurb : 	description of the property specified
	-- flags_type : 	a GType derived from G_TYPE_FLAGS
	-- default_value : 	default value for the property specified
	-- flags : 	flags for the property specified
	-- Returns : 	a newly created parameter specification
	-- g_value_set_flags ()

	-- void        g_value_set_flags               (GValue *value,
	--                                              guint v_flags);

	-- Set the contents of a G_TYPE_FLAGS GValue to v_flags.
	-- value : 	a valid GValue whose type is derived from G_TYPE_FLAGS
	-- v_flags : 	flags value to be set
	-- g_value_get_flags ()

	-- guint       g_value_get_flags               (const GValue *value);

	-- Get the contents of a G_TYPE_FLAGS GValue.
	-- value : 	a valid GValue whose type is derived from G_TYPE_FLAGS
	-- Returns : 	flags contents of value
	-- G_IS_PARAM_SPEC_STRING()

	-- #define G_IS_PARAM_SPEC_STRING(pspec)      (G_TYPE_CHECK_INSTANCE_TYPE ((pspec), G_TYPE_PARAM_STRING))

	-- Returns whether the given GParamSpec is of type G_TYPE_PARAM_STRING.
	-- pspec : 	a valid GParamSpec instance
	-- G_PARAM_SPEC_STRING()

	-- #define G_PARAM_SPEC_STRING(pspec)         (G_TYPE_CHECK_INSTANCE_CAST ((pspec), G_TYPE_PARAM_STRING, GParamSpecString))

	-- Casts a GParamSpec instance into a GParamSpecString.
	-- pspec : 	a valid GParamSpec instance
	-- G_VALUE_HOLDS_STRING()

	-- #define G_VALUE_HOLDS_STRING(value)	 (G_TYPE_CHECK_VALUE_TYPE ((value), G_TYPE_STRING))

	-- Return whether the given GValue can hold values of type G_TYPE_STRING.
	-- value : 	a valid GValue structure
	-- G_TYPE_PARAM_STRING

	-- #define	G_TYPE_PARAM_STRING		   (g_param_spec_types[14])

	-- The GType of GParamSpecString.
	-- GParamSpecString

	-- typedef struct {
	--   GParamSpec    parent_instance;
  
	--   gchar        *default_value;
	--   gchar        *cset_first;
	--   gchar        *cset_nth;
	--   gchar         substitutor;
	--   guint         null_fold_if_empty : 1;
	--   guint         ensure_non_null : 1;
	-- } GParamSpecString;

	-- A GParamSpec derived structure that contains the meta data for string properties.
	-- GParamSpec parent_instance; 	private GParamSpec portion
	-- gchar *default_value; 	default value for the property specified
	-- gchar *cset_first; 	a string containing the allowed values for the first byte
	-- gchar *cset_nth; 	a string containing the allowed values for the subsequent bytes
	-- gchar substitutor; 	the replacement byte for bytes which don't match cset_first or cset_nth.
	-- guint null_fold_if_empty : 1; 	replace empty string by NULL
	-- guint ensure_non_null : 1; 	replace NULL strings by an empty string
	-- gchararray

	-- typedef gchar* gchararray;

	-- A C representable type name for G_TYPE_STRING.
	-- g_param_spec_string ()

	-- GParamSpec* g_param_spec_string             (const gchar *name,
	--                                              const gchar *nick,
	--                                              const gchar *blurb,
	--                                              const gchar *default_value,
	--                                              GParamFlags flags);

	-- Creates a new GParamSpecString instance.

	-- See g_param_spec_internal() for details on property names.
	-- name : 	canonical name of the property specified
	-- nick : 	nick name for the property specified
	-- blurb : 	description of the property specified
	-- default_value : 	default value for the property specified
	-- flags : 	flags for the property specified
	-- Returns : 	a newly created parameter specification
	-- g_value_set_string ()

	-- void        g_value_set_string              (GValue *value,
	--                                              const gchar *v_string);

	-- Set the contents of a G_TYPE_STRING GValue to v_string.
	-- value : 	a valid GValue of type G_TYPE_STRING
	-- v_string : 	string to be set
	-- g_value_set_static_string ()

	-- void        g_value_set_static_string       (GValue *value,
	--                                              const gchar *v_string);

	-- Set the contents of a G_TYPE_STRING GValue to v_string. The string is assumed to be static, and is thus not duplicated when setting the GValue.
	-- value : 	a valid GValue of type G_TYPE_STRING
	-- v_string : 	static string to be set
	-- g_value_take_string ()

	-- void        g_value_take_string             (GValue *value,
	--                                              gchar *v_string);

	-- Sets the contents of a G_TYPE_STRING GValue to v_string.
	-- value : 	a valid GValue of type G_TYPE_STRING
	-- v_string : 	duplicated unowned string to be set

	-- Since 2.4
	-- g_value_set_string_take_ownership ()

	-- void        g_value_set_string_take_ownership
	--                                             (GValue *value,
	--                                              gchar *v_string);

	-- Warning

	-- g_value_set_string_take_ownership is deprecated and should not be used in newly-written code. Use g_value_take_string() instead.

	-- This is an internal function introduced mainly for C marshallers.
	-- value : 	a valid GValue of type G_TYPE_STRING
	-- v_string : 	duplicated unowned string to be set
	-- g_value_get_string ()

	-- const gchar* g_value_get_string             (const GValue *value);

	-- Get the contents of a G_TYPE_STRING GValue.
	-- value : 	a valid GValue of type G_TYPE_STRING
	-- Returns : 	string content of value
	-- g_value_dup_string ()

	-- gchar*      g_value_dup_string              (const GValue *value);

	-- Get a copy the contents of a G_TYPE_STRING GValue.
	-- value : 	a valid GValue of type G_TYPE_STRING
	-- Returns : 	a newly allocated copy of the string content of value
	-- G_IS_PARAM_SPEC_PARAM()

	-- #define G_IS_PARAM_SPEC_PARAM(pspec)       (G_TYPE_CHECK_INSTANCE_TYPE ((pspec), G_TYPE_PARAM_PARAM))

	-- Returns whether the given GParamSpec is of type G_TYPE_PARAM_PARAM.
	-- pspec : 	a valid GParamSpec instance
	-- G_PARAM_SPEC_PARAM()

	-- #define G_PARAM_SPEC_PARAM(pspec)          (G_TYPE_CHECK_INSTANCE_CAST ((pspec), G_TYPE_PARAM_PARAM, GParamSpecParam))

	-- Casts a GParamSpec instance into a GParamSpecParam.
	-- pspec : 	a valid GParamSpec instance
	-- G_VALUE_HOLDS_PARAM()

	-- #define G_VALUE_HOLDS_PARAM(value)	(G_TYPE_CHECK_VALUE_TYPE ((value), G_TYPE_PARAM))

	-- Return whether the given GValue can hold values derived from type G_TYPE_PARAM.
	-- value : 	a valid GValue structure
	-- G_TYPE_PARAM_PARAM

	-- #define	G_TYPE_PARAM_PARAM		   (g_param_spec_types[15])

	-- The GType of GParamSpecParam.
	-- GParamSpecParam

	-- typedef struct {
	--   GParamSpec    parent_instance;
	-- } GParamSpecParam;

	-- A GParamSpec derived structure that contains the meta data for G_TYPE_PARAM properties.
	-- GParamSpec parent_instance; 	private GParamSpec portion
	-- g_param_spec_param ()

	-- GParamSpec* g_param_spec_param              (const gchar *name,
	--                                              const gchar *nick,
	--                                              const gchar *blurb,
	--                                              GType param_type,
	--                                              GParamFlags flags);

	-- Creates a new GParamSpecParam instance specifying a G_TYPE_PARAM property.

	-- See g_param_spec_internal() for details on property names.
	-- name : 	canonical name of the property specified
	-- nick : 	nick name for the property specified
	-- blurb : 	description of the property specified
	-- param_type : 	a GType derived from G_TYPE_PARAM
	-- flags : 	flags for the property specified
	-- Returns : 	a newly created parameter specification
	-- g_value_set_param ()

	-- void        g_value_set_param               (GValue *value,
	--                                              GParamSpec *param);

	-- Set the contents of a G_TYPE_PARAM GValue to param.
	-- value : 	a valid GValue of type G_TYPE_PARAM
	-- param : 	the GParamSpec to be set
	-- g_value_take_param ()

	-- void        g_value_take_param              (GValue *value,
	--                                              GParamSpec *param);

	-- Sets the contents of a G_TYPE_PARAM GValue to param and takes over the ownership of the callers reference to param; the caller doesn't have to unref it any more.
	-- value : 	a valid GValue of type G_TYPE_PARAM
	-- param : 	the GParamSpec to be set

	-- Since 2.4
	-- g_value_set_param_take_ownership ()

	-- void        g_value_set_param_take_ownership
	--                                             (GValue *value,
	--                                              GParamSpec *param);

	-- Warning

	-- g_value_set_param_take_ownership is deprecated and should not be used in newly-written code. Use g_value_take_param() instead.

	-- This is an internal function introduced mainly for C marshallers.
	-- value : 	a valid GValue of type G_TYPE_PARAM
	-- param : 	the GParamSpec to be set
	-- g_value_get_param ()

	-- GParamSpec* g_value_get_param               (const GValue *value);

	-- Get the contents of a G_TYPE_PARAM GValue.
	-- value : 	a valid GValue whose type is derived from G_TYPE_PARAM
	-- Returns : 	GParamSpec content of value
	-- g_value_dup_param ()

	-- GParamSpec* g_value_dup_param               (const GValue *value);

	-- Get the contents of a G_TYPE_PARAM GValue, increasing its reference count.
	-- value : 	a valid GValue whose type is derived from G_TYPE_PARAM
	-- Returns : 	GParamSpec content of value, should be unreferenced when no longer needed.
	-- G_IS_PARAM_SPEC_BOXED()

	-- #define G_IS_PARAM_SPEC_BOXED(pspec)       (G_TYPE_CHECK_INSTANCE_TYPE ((pspec), G_TYPE_PARAM_BOXED))

	-- Return whether the given GParamSpec is of type G_TYPE_PARAM_BOXED.
	-- pspec : 	a valid GParamSpec instance
	-- G_PARAM_SPEC_BOXED()

	-- #define G_PARAM_SPEC_BOXED(pspec)          (G_TYPE_CHECK_INSTANCE_CAST ((pspec), G_TYPE_PARAM_BOXED, GParamSpecBoxed))

	-- Cast a GParamSpec instance into a GParamSpecBoxed.
	-- pspec : 	a valid GParamSpec instance
	-- G_VALUE_HOLDS_BOXED()

	-- #define G_VALUE_HOLDS_BOXED(value) (G_TYPE_CHECK_VALUE_TYPE ((value), G_TYPE_BOXED))

	-- Return whether the given GValue can hold values derived from type G_TYPE_BOXED.
	-- value : 	a valid GValue structure
	-- G_TYPE_PARAM_BOXED

	-- #define	G_TYPE_PARAM_BOXED		   (g_param_spec_types[16])

	-- The GType of GParamSpecBoxed.
	-- GParamSpecBoxed

	-- typedef struct {
	--   GParamSpec    parent_instance;
	-- } GParamSpecBoxed;

	-- A GParamSpec derived structure that contains the meta data for boxed properties.
	-- GParamSpec parent_instance; 	private GParamSpec portion
	-- g_param_spec_boxed ()

	-- GParamSpec* g_param_spec_boxed              (const gchar *name,
	--                                              const gchar *nick,
	--                                              const gchar *blurb,
	--                                              GType boxed_type,
	--                                              GParamFlags flags);

	-- Creates a new GParamSpecBoxed instance specifying a G_TYPE_BOXED derived property.

	-- See g_param_spec_internal() for details on property names.
	-- name : 	canonical name of the property specified
	-- nick : 	nick name for the property specified
	-- blurb : 	description of the property specified
	-- boxed_type : 	G_TYPE_BOXED derived type of this property
	-- flags : 	flags for the property specified
	-- Returns : 	a newly created parameter specification
	-- g_value_set_boxed ()

	-- void        g_value_set_boxed               (GValue *value,
	--                                              gconstpointer v_boxed);

	-- Set the contents of a G_TYPE_BOXED derived GValue to v_boxed.
	-- value : 	a valid GValue of G_TYPE_BOXED derived type
	-- v_boxed : 	boxed value to be set
	-- g_value_set_static_boxed ()

	-- void        g_value_set_static_boxed        (GValue *value,
	--                                              gconstpointer v_boxed);

	-- Set the contents of a G_TYPE_BOXED derived GValue to v_boxed. The boxed value is assumed to be static, and is thus not duplicated when setting the GValue.
	-- value : 	a valid GValue of G_TYPE_BOXED derived type
	-- v_boxed : 	static boxed value to be set
	-- g_value_take_boxed ()

	-- void        g_value_take_boxed              (GValue *value,
	--                                              gconstpointer v_boxed);

	-- Sets the contents of a G_TYPE_BOXED derived GValue to v_boxed and takes over the ownership of the callers reference to v_boxed; the caller doesn't have to unref it any more.
	-- value : 	a valid GValue of G_TYPE_BOXED derived type
	-- v_boxed : 	duplicated unowned boxed value to be set

	-- Since 2.4
	-- g_value_set_boxed_take_ownership ()

	-- void        g_value_set_boxed_take_ownership
	--                                             (GValue *value,
	--                                              gconstpointer v_boxed);

	-- Warning

	-- g_value_set_boxed_take_ownership is deprecated and should not be used in newly-written code. Use g_value_take_boxed() instead.

	-- This is an internal function introduced mainly for C marshallers.
	-- value : 	a valid GValue of G_TYPE_BOXED derived type
	-- v_boxed : 	duplicated unowned boxed value to be set
	-- g_value_get_boxed ()

	-- gpointer    g_value_get_boxed               (const GValue *value);

	-- Get the contents of a G_TYPE_BOXED derived GValue.
	-- value : 	a valid GValue of G_TYPE_BOXED derived type
	-- Returns : 	boxed contents of value
	-- g_value_dup_boxed ()

	-- gpointer    g_value_dup_boxed               (const GValue *value);

	-- Get the contents of a G_TYPE_BOXED derived GValue. Upon getting, the boxed value is duplicated and needs to be later freed with g_boxed_free(), e.g. like: g_boxed_free (G_VALUE_TYPE (value), return_value);
	-- value : 	a valid GValue of G_TYPE_BOXED derived type
	-- Returns : 	boxed contents of value
	-- G_IS_PARAM_SPEC_POINTER()

	-- #define G_IS_PARAM_SPEC_POINTER(pspec)     (G_TYPE_CHECK_INSTANCE_TYPE ((pspec), G_TYPE_PARAM_POINTER))

	-- Returns whether the given GParamSpec is of type G_TYPE_PARAM_POINTER.
	-- pspec : 	a valid GParamSpec instance
	-- G_PARAM_SPEC_POINTER()

	-- #define G_PARAM_SPEC_POINTER(pspec)        (G_TYPE_CHECK_INSTANCE_CAST ((pspec), G_TYPE_PARAM_POINTER, GParamSpecPointer))

	-- Casts a GParamSpec instance into a GParamSpecPointer.
	-- pspec : 	a valid GParamSpec instance
	-- G_VALUE_HOLDS_POINTER()

	-- #define G_VALUE_HOLDS_POINTER(value)	 (G_TYPE_CHECK_VALUE_TYPE ((value), G_TYPE_POINTER))

	-- Return whether the given GValue can hold values of type G_TYPE_POINTER.
	-- value : 	a valid GValue structure
	-- G_TYPE_PARAM_POINTER

	-- #define	G_TYPE_PARAM_POINTER		   (g_param_spec_types[17])

	-- The GType of GParamSpecPointer.
	-- GParamSpecPointer

	-- typedef struct {
	--   GParamSpec    parent_instance;
	-- } GParamSpecPointer;

	-- A GParamSpec derived structure that contains the meta data for pointer properties.
	-- GParamSpec parent_instance; 	private GParamSpec portion
	-- g_param_spec_pointer ()

	-- GParamSpec* g_param_spec_pointer            (const gchar *name,
	--                                              const gchar *nick,
	--                                              const gchar *blurb,
	--                                              GParamFlags flags);

	-- Creates a new GParamSpecPoiner instance specifying a pointer property.

	-- See g_param_spec_internal() for details on property names.
	-- name : 	canonical name of the property specified
	-- nick : 	nick name for the property specified
	-- blurb : 	description of the property specified
	-- flags : 	flags for the property specified
	-- Returns : 	a newly created parameter specification
	-- g_value_set_pointer ()

	-- void        g_value_set_pointer             (GValue *value,
	--                                              gpointer v_pointer);

	-- Set the contents of a pointer GValue to v_pointer.
	-- value : 	a valid GValue of G_TYPE_POINTER
	-- v_pointer : 	pointer value to be set
	-- g_value_get_pointer ()

	-- gpointer    g_value_get_pointer             (const GValue *value);

	-- Get the contents of a pointer GValue.
	-- value : 	a valid GValue of G_TYPE_POINTER
	-- Returns : 	pointer contents of value
	-- G_IS_PARAM_SPEC_OBJECT()

	-- #define G_IS_PARAM_SPEC_OBJECT(pspec)      (G_TYPE_CHECK_INSTANCE_TYPE ((pspec), G_TYPE_PARAM_OBJECT))

	-- Returns whether the given GParamSpec is of type G_TYPE_PARAM_OBJECT.
	-- pspec : 	a valid GParamSpec instance
	-- G_PARAM_SPEC_OBJECT()

	-- #define G_PARAM_SPEC_OBJECT(pspec)         (G_TYPE_CHECK_INSTANCE_CAST ((pspec), G_TYPE_PARAM_OBJECT, GParamSpecObject))

	-- Casts a GParamSpec instance into a GParamSpecObject.
	-- pspec : 	a valid GParamSpec instance
	-- G_VALUE_HOLDS_OBJECT()

	-- #define G_VALUE_HOLDS_OBJECT(value) (G_TYPE_CHECK_VALUE_TYPE ((value), G_TYPE_OBJECT))

	-- Return whether the given GValue can hold values derived from type G_TYPE_OBJECT.
	-- value : 	a valid GValue structure
	-- G_TYPE_PARAM_OBJECT

	-- #define	G_TYPE_PARAM_OBJECT		   (g_param_spec_types[19])

	-- The GType of GParamSpecObject.
	-- GParamSpecObject

	-- typedef struct {
	--   GParamSpec    parent_instance;
	-- } GParamSpecObject;

	-- A GParamSpec derived structure that contains the meta data for object properties.
	-- GParamSpec parent_instance; 	private GParamSpec portion
	-- g_param_spec_object ()

	-- GParamSpec* g_param_spec_object             (const gchar *name,
	--                                              const gchar *nick,
	--                                              const gchar *blurb,
	--                                              GType object_type,
	--                                              GParamFlags flags);

	-- Creates a new GParamSpecBoxed instance specifying a G_TYPE_OBJECT derived property.

	-- See g_param_spec_internal() for details on property names.
	-- name : 	canonical name of the property specified
	-- nick : 	nick name for the property specified
	-- blurb : 	description of the property specified
	-- object_type : 	G_TYPE_OBJECT derived type of this property
	-- flags : 	flags for the property specified
	-- Returns : 	a newly created parameter specification
	-- g_value_set_object ()

	-- void        g_value_set_object              (GValue *value,
	--                                              gpointer v_object);

	-- Set the contents of a G_TYPE_OBJECT derived GValue to v_object.
	-- value : 	a valid GValue of G_TYPE_OBJECT derived type
	-- v_object : 	object value to be set
	-- g_value_take_object ()

	-- void        g_value_take_object             (GValue *value,
	--                                              gpointer v_object);

	-- Sets the contents of a G_TYPE_OBJECT derived GValue to v_object and takes over the ownership of the callers reference to v_object; the caller doesn't have to unref it any more.
	-- value : 	a valid GValue of G_TYPE_OBJECT derived type
	-- v_object : 	object value to be set

	-- Since 2.4
	-- g_value_set_object_take_ownership ()

	-- void        g_value_set_object_take_ownership
	--                                             (GValue *value,
	--                                              gpointer v_object);

	-- Warning

	-- g_value_set_object_take_ownership is deprecated and should not be used in newly-written code. Use g_value_take_object() instead.

	-- This is an internal function introduced mainly for C marshallers.
	-- value : 	a valid GValue of G_TYPE_OBJECT derived type
	-- v_object : 	object value to be set
	-- g_value_get_object ()

	-- gpointer    g_value_get_object              (const GValue *value);

	-- Get the contents of a G_TYPE_OBJECT derived GValue.
	-- value : 	a valid GValue of G_TYPE_OBJECT derived type
	-- Returns : 	object contents of value
	-- g_value_dup_object ()

	-- GObject*    g_value_dup_object              (const GValue *value);

	-- Get the contents of a G_TYPE_OBJECT derived GValue, increasing its reference count.
	-- value : 	a valid GValue whose type is derived from G_TYPE_OBJECT
	-- Returns : 	object content of value, should be unreferenced when no longer needed.
	-- G_IS_PARAM_SPEC_UNICHAR()

	-- #define G_IS_PARAM_SPEC_UNICHAR(pspec)     (G_TYPE_CHECK_INSTANCE_TYPE ((pspec), G_TYPE_PARAM_UNICHAR))

	-- Return whether the given GParamSpec is of type G_TYPE_PARAM_UNICHAR.
	-- pspec : 	a valid GParamSpec instance
	-- G_PARAM_SPEC_UNICHAR()

	-- #define G_PARAM_SPEC_UNICHAR(pspec)        (G_TYPE_CHECK_INSTANCE_CAST ((pspec), G_TYPE_PARAM_UNICHAR, GParamSpecUnichar))

	-- Cast a GParamSpec instance into a GParamSpecUnichar.
	-- pspec : 	a valid GParamSpec instance
	-- G_TYPE_PARAM_UNICHAR

	-- #define	G_TYPE_PARAM_UNICHAR		   (g_param_spec_types[9])

	-- The GType of GParamSpecUnichar.
	-- GParamSpecUnichar

	-- typedef struct {
	--   GParamSpec    parent_instance;
  
	--   gunichar      default_value;
	-- } GParamSpecUnichar;

	-- A GParamSpec derived structure that contains the meta data for unichar (unsigned integer) properties.
	-- GParamSpec parent_instance; 	private GParamSpec portion
	-- gunichar default_value; 	default value for the property specified
	-- g_param_spec_unichar ()

	-- GParamSpec* g_param_spec_unichar            (const gchar *name,
	--                                              const gchar *nick,
	--                                              const gchar *blurb,
	--                                              gunichar default_value,
	--                                              GParamFlags flags);

	-- Creates a new GParamSpecUnichar instance specifying a G_TYPE_UINT property. GValue structures for this property can be accessed with g_value_set_uint() and g_value_get_uint().

	-- See g_param_spec_internal() for details on property names.
	-- name : 	canonical name of the property specified
	-- nick : 	nick name for the property specified
	-- blurb : 	description of the property specified
	-- default_value : 	default value for the property specified
	-- flags : 	flags for the property specified
	-- Returns : 	a newly created parameter specification
	-- G_IS_PARAM_SPEC_VALUE_ARRAY()

	-- #define G_IS_PARAM_SPEC_VALUE_ARRAY(pspec) (G_TYPE_CHECK_INSTANCE_TYPE ((pspec), G_TYPE_PARAM_VALUE_ARRAY))

	-- Return whether the given GParamSpec is of type G_TYPE_PARAM_VALUE_ARRAY.
	-- pspec : 	a valid GParamSpec instance
	-- G_PARAM_SPEC_VALUE_ARRAY()

	-- #define G_PARAM_SPEC_VALUE_ARRAY(pspec)    (G_TYPE_CHECK_INSTANCE_CAST ((pspec), G_TYPE_PARAM_VALUE_ARRAY, GParamSpecValueArray))

	-- Cast a GParamSpec instance into a GParamSpecValueArray.
	-- pspec : 	a valid GParamSpec instance
	-- G_TYPE_PARAM_VALUE_ARRAY

	-- #define	G_TYPE_PARAM_VALUE_ARRAY	   (g_param_spec_types[18])

	-- The GType of GParamSpecValueArray.
	-- GParamSpecValueArray

	-- typedef struct {
	--   GParamSpec    parent_instance;
	--   GParamSpec   *element_spec;
	--   guint		fixed_n_elements;
	-- } GParamSpecValueArray;

	-- A GParamSpec derived structure that contains the meta data for GValueArray properties.
	-- GParamSpec parent_instance; 	private GParamSpec portion
	-- GParamSpec *element_spec; 	a GParamSpec describing the elements contained in arrays of this property, may be NULL
	-- guint fixed_n_elements; 	if greater than 0, arrays of this property will always have this many elements
	-- g_param_spec_value_array ()

	-- GParamSpec* g_param_spec_value_array        (const gchar *name,
	--                                              const gchar *nick,
	--                                              const gchar *blurb,
	--                                              GParamSpec *element_spec,
	--                                              GParamFlags flags);

	-- Creates a new GParamSpecValueArray instance specifying a G_TYPE_VALUE_ARRAY property. G_TYPE_VALUE_ARRAY is a G_TYPE_BOXED type, as such, GValue structures for this property can be accessed with g_value_set_boxed() and g_value_get_boxed().

	-- See g_param_spec_internal() for details on property names.
	-- name : 	canonical name of the property specified
	-- nick : 	nick name for the property specified
	-- blurb : 	description of the property specified
	-- element_spec : 	a GParamSpec describing the elements contained in arrays of this property, may be NULL
	-- flags : 	flags for the property specified
	-- Returns : 	a newly created parameter specification
	-- G_IS_PARAM_SPEC_OVERRIDE()

	-- #define G_IS_PARAM_SPEC_OVERRIDE(pspec)    (G_TYPE_CHECK_INSTANCE_TYPE ((pspec), G_TYPE_PARAM_OVERRIDE))

	-- Returns whether the given GParamSpec is of type G_TYPE_PARAM_OBJECT.
	-- pspec : 	a GParamSpec

	-- Since 2.4
	-- G_PARAM_SPEC_OVERRIDE()

	-- #define G_PARAM_SPEC_OVERRIDE(pspec)       (G_TYPE_CHECK_INSTANCE_CAST ((pspec), G_TYPE_PARAM_OVERRIDE, GParamSpecOverride))

	-- Casts a GParamSpec into a GParamSpecObject.
	-- pspec : 	a GParamSpec

	-- Since 2.4
	-- G_TYPE_PARAM_OVERRIDE

	-- #define	G_TYPE_PARAM_OVERRIDE		   (g_param_spec_types[20])

	-- The GType of GParamSpecOverride.

	-- Since 2.4
	-- GParamSpecOverride

	-- typedef struct {
	-- } GParamSpecOverride;

	-- This is a type of GParamSpec type that simply redirects operations to another paramspec. All operations other than getting or setting the value are redirected, including accessing the nick and blurb, validating a value, and so forth. See g_param_spec_get_redirect_target() for retrieving the overidden property. GParamSpecOverride is used in implementing g_object_class_override_property(), and will not be directly useful unless you are implementing a new base type similar to GObject.

	-- Since 2.4
	-- g_param_spec_override ()

	-- GParamSpec* g_param_spec_override           (const gchar *name,
	--                                              GParamSpec *overridden);

	-- Creates a new property of type GParamSpecOverride. This is used to direct operations to another paramspec, and will not be directly useful unless you are implementing a new base type similar to GObject.
	-- name : 	the name of the property.
	-- overridden : 	The property that is being overridden
	-- Returns : 	the newly created GParamSpec

	-- Since 2.4
	-- See Also

	-- GParamSpec, GValue, g_object_class_install_property().

end
