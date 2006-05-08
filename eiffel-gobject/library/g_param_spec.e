indexing

	description: "GParamSpec, Metadata for parameter specifications"
	long: "[
			 GParamSpec is an object structure that encapsulates the metadata required to specify parameters, such as e.g. GObject properties.

			 Parameter names need to start with a letter (a-z or A-Z). Subsequent characters can be letters, numbers or a '-'. All other characters are replaced by a '-' during construction.
			 ]"
	copyright: "Copyright (c) 2005, Paolo Redaelli"
	license: "LGPL"
	date: "$Date:  $"
	revision: "$ $"

class G_PARAM_SPEC
obsolete "This class shall be redesigned, removing all its G_PARAM_SPEC_[INT|BOOL|...] heirs"		
inherit C_STRUCT
creation make,from_external_pointer
feature -- Flags
	flags: INTEGER is
		obsolete "TODO: it is not implemented"
		do
		end
	
	is_readable: BOOLEAN is
			-- Is Current parameter readable?
		obsolete "TODO: it is not implemented"
		do
			--Result:= flags.bit_test(g_param_readable_bit)
		end
	is_writable: BOOLEAN is
			-- Is Current parameter writable?
		obsolete "TODO: it is not implemented"
		do
			--Result:= flags.bit_test(g_param_writable_bit)
		end
	is_set_at_construction: BOOLEAN is
			-- Will the parameter be set upon object construction?
		obsolete "TODO: it is not implemented"
		do
			--			Result:= flags.bit_test(g_param_construct_bit)
		end
	is_set_only_at_construction: BOOLEAN is
			-- Will the parameter only be set upon object construction?
		obsolete "TODO: it is not implemented"
		do
			--Result:= flags.bit_test(g_param_construct_only_bit)
		end

	-- TODO: find a better, not-clashing name for is_readable: BOOLEAN
	-- is -- Is strict validation not required upon parameter
	-- conversion?  (see `convert') do Result:=
	-- flags.bit_test(g_param_lax_validation_bit) end
	
	is_static_name: BOOLEAN is
			-- Is the string used as name when constructing the parameter
			-- guaranteed to remain valid and unmodified for the lifetime
			-- of the parameter?
		obsolete "TODO: it is not implemented"
		do
			--Result:= flags.bit_test(g_param_static_name_bit)
		end
	
	is_static_blurb: BOOLEAN is
			-- Is the string used as blurb when constructing the parameter
			-- guaranteed to remain valid and unmodified for the lifetime
			-- of the parameter?
		obsolete "TODO: it is not implemented"
		do
			--Result:= flags.bit_test(g_param_static_blurb_bit)
		end

	is_readwrite: BOOLEAN is
			-- Is parameter read/write?
		do
			Result := is_readable and is_writable
		end

feature
	set_default (a_value: G_VALUE) is
			-- Sets `a_value' to its default value as specified in Current.
		require valid_value: a_value /= Void
			-- TODO a GValue of correct type for current
		do
			g_param_value_set_default (handle, a_value.handle)
		end

	is_default_value (a_value: G_VALUE): BOOLEAN is
			-- Does `a_value' contains the default value specified in
			-- Current?
		require valid_value: a_value /= Void
			-- TODO a GValue of correct type for current
		do
			Result:=(g_param_value_defaults(handle,a_value.handle)).to_boolean
		end

	validate (a_value: G_VALUE): BOOLEAN is
			-- Has `a_value' to be changed to comply with the
			-- specifications set out by Current? For example, a
			-- G_PARAM_SPEC_INT might require that integers stored in
			-- value may not be smaller than -42 and not be greater than
			-- +42. If value contains an integer outside of this range,
			-- it is modified accordingly, so the resulting value will
			-- fit into the range -42 .. +42.
		require valid_value: a_value /= Void
			-- TODO a GValue of correct type for current
		do
			Result:=(g_param_value_validate(handle,a_value.handle)).to_boolean
		end

	convert (a_source, a_destination: G_VALUE; strict_validation: BOOLEAN): BOOLEAN is
			-- Transforms `a_source' into `a_destination' if possible,
			-- and then validates `a_destination', in order for it to
			-- conform to Current. If `strict_validation' is True this
			-- function will only succeed if the transformed
			-- `a_destination' complied to Current without
			-- modifications. True if transformation and validation were
			-- successful, False otherwise and dest_value is left
			-- untouched.
		require -- TODO valid destination of corret type for Current
		do
			Result:=(g_param_value_convert(handle,
													 a_source.handle, a_destination.handle,
													 strict_validation.to_integer)).to_boolean
		end

	compare (value1,value2: G_VALUE): INTEGER is
			-- Compares value1 with value2 according to Current, and
			-- return -1, 0 or +1, if value1 is found to be less than,
			-- equal to or greater than value2, respectively.
		require -- TODO value1 and 2: a GValue of correct type for pspec
		do
			Result := (g_param_values_cmp (handle,value1.handle,value2.handle))
		end
	

feature -- queries
	name: STRING is
			-- the name of a G_PARAM_SPEC
		do
			create Result.from_external_copy(g_param_spec_get_name(handle))
		end

	nick: STRING is
			-- the nick of a G_PARAM_SPEC
		do
			create Result.from_external_copy(g_param_spec_get_nick(handle))
		end
	
	blurb: STRING is
			-- the blurb of a G_PARAM_SPEC
		do
			create Result.from_external_copy(g_param_spec_get_blurb(handle))
		end

feature -- name validity
	is_a_valid_name (a_string: STRING): BOOLEAN is
			-- Does `a_string' comply with the rules for G_PARAM_SPEC names?
		do
			-- When creating and looking up a GParamSpec, either separator can be used, but they cannot be mixed. Using '-' is considerably more efficient and in fact required when using property names as detail strings for signals.
			not_yet_implemented
		end

feature {NONE} -- External calls
	g_type_is_param (type: INTEGER): INTEGER is
		-- Is `type' a G_TYPE_PARAM?
		external "C macro G_TYPE_IS_PARAM use <glib-object.h>"
		end

	-- #define G_PARAM_SPEC(pspec)		(G_TYPE_CHECK_INSTANCE_CAST ((pspec), G_TYPE_PARAM, GParamSpec))

	-- Casts a derived GParamSpec object (e.g. of type GParamSpecInt) into a GParamSpec object.
	-- pspec : 	a valid GParamSpec
	-- G_IS_PARAM_SPEC()
	
	-- #define G_IS_PARAM_SPEC(pspec)		(G_TYPE_CHECK_INSTANCE_TYPE ((pspec), G_TYPE_PARAM))
	
	-- Checks whether pspec "is a" valid GParamSpec structure of type G_TYPE_PARAM or derived.
	-- pspec : 	a GParamSpec
	-- G_PARAM_SPEC_CLASS()
	
	-- #define G_PARAM_SPEC_CLASS(pclass)      (G_TYPE_CHECK_CLASS_CAST ((pclass), G_TYPE_PARAM, GParamSpecClass))
	
	-- Casts a derived GParamSpecClass structure into a GParamSpecClass structure.
	-- pclass : 	a valid GParamSpecClass
	-- G_IS_PARAM_SPEC_CLASS()

	-- #define G_IS_PARAM_SPEC_CLASS(pclass)   (G_TYPE_CHECK_CLASS_TYPE ((pclass), G_TYPE_PARAM))

	-- Checks whether pclass "is a" valid GParamSpecClass structure of type G_TYPE_PARAM or derived.
	-- pclass : 	a GParamSpecClass
	-- G_PARAM_SPEC_GET_CLASS()
	
	-- #define G_PARAM_SPEC_GET_CLASS(pspec)	(G_TYPE_INSTANCE_GET_CLASS ((pspec), G_TYPE_PARAM, GParamSpecClass))
	
	-- Retrieves the GParamSpecClass of a GParamSpec.
	-- pspec : 	a valid GParamSpec
	-- G_PARAM_SPEC_TYPE()
	
	-- #define G_PARAM_SPEC_TYPE(pspec)	(G_TYPE_FROM_INSTANCE (pspec))

	-- Retrieves the GType of this pspec.
	-- pspec : 	a valid GParamSpec
	-- G_PARAM_SPEC_TYPE_NAME()
	
	-- #define G_PARAM_SPEC_TYPE_NAME(pspec)	(g_type_name (G_PARAM_SPEC_TYPE (pspec)))
	
	-- Retrieves the GType name of this pspec.
	-- pspec : 	a valid GParamSpec
	-- G_PARAM_SPEC_VALUE_TYPE()
	
	-- #define	G_PARAM_SPEC_VALUE_TYPE(pspec)	(G_PARAM_SPEC (pspec)->value_type)
	
	-- Retrieves the GType to initialize a GValue for this parameter.
	-- pspec : 	a valid GParamSpec
	-- GParamSpec
	
	-- typedef struct {
	--   GTypeInstance  g_type_instance;
	
	--   gchar         *name;
	--   GParamFlags    flags;
	--   GType		 value_type;
	--   GType		 owner_type;	/* class or interface using this property */
	-- } GParamSpec;
	
	-- All fields of the GParamSpec struct are private and should not be used directly, except for the following:
	-- GTypeInstance g_type_instance; 	private GTypeInstance portion
	-- gchar *name; 	name of this parameter
	-- GParamFlags flags; 	GParamFlags flags for this parameter
	-- GType value_type; 	the GValue type for this parameter
	-- GType owner_type; 	GType type that uses (introduces) this paremeter
	-- GParamSpecClass
	
	-- typedef struct {
	--   GTypeClass      g_type_class;
	
	--   GType		  value_type;
	
	--   void	        (*finalize)		(GParamSpec   *pspec);
	
	--   /* GParam methods */
	--   void          (*value_set_default)    (GParamSpec   *pspec,
	-- 					 GValue       *value);
	--   gboolean      (*value_validate)       (GParamSpec   *pspec,
	-- 					 GValue       *value);
	--   gint          (*values_cmp)           (GParamSpec   *pspec,
	-- 					 const GValue *value1,
	-- 					 const GValue *value2);
	-- } GParamSpecClass;
	
	-- The class structure for the GParamSpec type. Normally, GParamSpec classes are filled by g_param_type_register_static().
	-- GTypeClass g_type_class; 	the parent class
	-- GType value_type; 	the GValue type for this parameter
	-- finalize () 	The instance finalization function (optional), should chain up to the finalize method of the parent class.
	-- value_set_default () 	Resets a value to the default value for this type (recommended, the default is g_value_reset()), see g_param_value_set_default().
	-- value_validate () 	Ensures that the contents of value comply with the specifications set out by this type (optional), see g_param_value_set_validate().
	-- values_cmp () 	Compares value1 with value2 according to this type (recommended, the default is memcmp()), see g_param_values_cmp().

feature {ANY} -- enum GParamFlags
	
	g_param_readable: INTEGER is 1 -- 1 < < 0, 
	g_param_writable: INTEGER is 2 -- 1 < < 1, 
	g_param_construct: INTEGER is 4 -- 1 < < 2,
	g_param_construct_only: INTEGER is 8 -- 1 < < 3,
	g_param_lax_validation: INTEGER is 16 -- 1 < < 4,
	g_param_static_name: INTEGER is 32 -- 1 < < 5,
	g_param_static_nick: INTEGER is 64 -- 1 < < 6,
	g_param_static_blurb: INTEGER is 128 -- 1 < < 7

	g_param_readable_bit: INTEGER is 0
	g_param_writable_bit: INTEGER_8 is 1 
	g_param_construct_bit: INTEGER_8 is 2
	g_param_construct_only_bit: INTEGER_8 is 3
	g_param_lax_validation_bit: INTEGER_8 is 4
	g_param_static_name_bit: INTEGER_8 is 5
	g_param_static_nick_bit: INTEGER_8 is 6
	g_param_static_blurb_bit: INTEGER_8 is 7

feature {NONE} -- External calls
	g_param_spec_ref (spec: POINTER): POINTER is
		external "C use <glib-object.h>"
		end

	g_param_spec_unref (spec: POINTER) is
		external "C use <glib-object.h>"
		end

	g_param_spec_sink (spec: POINTER) is
		external "C use <glib-object.h>"
		end

	g_param_value_set_default (spec,value: POINTER) is
		external "C use <glib-object.h>"
		end

	
	g_param_value_defaults (spec, value: POINTER): INTEGER is
		external "C use <glib-object.h>"
		end

	g_param_value_validate (spec,value: POINTER): INTEGER is
		external "C use <glib-object.h>"
		end

	g_param_value_convert (spec,src,dest: POINTER; strict_validation: INTEGER): INTEGER is
		external "C use <glib-object.h>"
		end

	g_param_values_cmp (spec,value1,value2: POINTER): INTEGER is
		external "C use <glib-object.h>"
		end

	g_param_spec_get_name (spec: POINTER): POINTER is
		external "C use <glib-object.h>"
		end

	g_param_spec_get_nick (spec: POINTER): POINTER is
		external "C use <glib-object.h>"
		end
	g_param_spec_get_blurb (spec: POINTER): POINTER is
		external "C use <glib-object.h>"
		end

	g_param_spec_get_qdata (spec,quark: POINTER): POINTER is
		external "C use <glib-object.h>"
		end

	g_param_spec_set_qdata (spec,quark,data: POINTER) is
		external "C use <glib-object.h>"
		end
	
	-- TODO: wrap g_param_spec_set_qdata_full ()
	
	-- void        g_param_spec_set_qdata_full     (GParamSpec *pspec,
	--                                              GQuark quark,
	--                                              gpointer data,
	--                                              GDestroyNotify destroy);

	-- This function works like g_param_spec_set_qdata(), but in addition, a void (*destroy) (gpointer) function may be specified which is called with data as argument when the pspec is finalized, or the data is being overwritten by a call to g_param_spec_set_qdata() with the same quark.
	-- pspec : 	the GParamSpec to set store a user data pointer
	-- quark : 	a GQuark, naming the user data pointer
	-- data : 	an opaque user data pointer
	-- destroy : 	function to invoke with data as argument, when data needs to be freed
	-- TODO: wrap g_param_spec_steal_qdata ()

	-- gpointer    g_param_spec_steal_qdata        (GParamSpec *pspec,
	--                                              GQuark quark);
	
	-- Gets back user data pointers stored via g_param_spec_set_qdata() and removes the data from pspec without invoking it's destroy() function (if any was set). Usually, calling this function is only required to update user data pointers with a destroy notifier.
	-- pspec : 	the GParamSpec to get a stored user data pointer from
-- quark : 	a GQuark, naming the user data pointer
	-- Returns : 	the user data pointer set, or NULL
	-- TODO: g_param_spec_get_redirect_target ()

	-- GParamSpec* g_param_spec_get_redirect_target
	--                                             (GParamSpec *pspec);
	
	-- If the paramspec redirects operations to another paramspec, returns that paramspec. Redirect is used typically for providing a new implementation of a property in a derived type while preserving all the properties from the parent type. Redirection is established by creating a property of type GParamSpecOverride. See g_object_override_property() for an example of the use of this capability.
	-- pspec : 	a GParamSpec
	-- Returns : 	paramspec to which requests on this paramspec should be redirected, or NULL if none.
	
	-- Since 2.4

	

	g_param_spec_internal (gtype: INTEGER; a_name, a_nick, a_blurb: POINTER; some_flags: INTEGER): POINTER is
		external "C use <glib-object.h>"
		end
	
-- GParamSpecTypeInfo

-- typedef struct {
--   /* type system portion */
--   guint16         instance_size;                               /* obligatory */
--   guint16         n_preallocs;                                 /* optional */
--   void		(*instance_init)	(GParamSpec   *pspec); /* optional */

--   /* class portion */
--   GType           value_type;				       /* obligatory */
--   void          (*finalize)             (GParamSpec   *pspec); /* optional */
--   void          (*value_set_default)    (GParamSpec   *pspec,  /* recommended */
-- 					 GValue       *value);
--   gboolean      (*value_validate)       (GParamSpec   *pspec,  /* optional */
-- 					 GValue       *value);
--   gint          (*values_cmp)           (GParamSpec   *pspec,  /* recommended */
-- 					 const GValue *value1,
-- 					 const GValue *value2);
-- } GParamSpecTypeInfo;

-- This structure is used to provide the type system with the information required to initialize and destruct (finalize) a parameter's class and instances thereof. The initialized structure is passed to the g_param_type_register_static() The type system will perform a deep copy of this structure, so it's memory does not need to be persistent across invocation of g_param_type_register_static().
-- guint16 instance_size; 	Size of the instance (object) structure.
-- guint16 n_preallocs; 	Number of pre-allocated (cached) instances to reserve memory for (0 indicates no caching).
-- instance_init () 	Location of the instance initialization function (optional).
-- GType value_type; 	The GType of values conforming to this GParamSpec
-- finalize () 	The instance finalization function (optional).
-- value_set_default () 	Resets a value to the default value for pspec (recommended, the default is g_value_reset()), see g_param_value_set_default().
-- value_validate () 	Ensures that the contents of value comply with the specifications set out by pspec (optional), see g_param_value_set_validate().
-- values_cmp () 	Compares value1 with value2 according to pspec (recommended, the default is memcmp()), see g_param_values_cmp().
-- g_param_type_register_static ()

-- GType       g_param_type_register_static    (const gchar *name,
--                                              const GParamSpecTypeInfo *pspec_info);

-- Registers name as the name of a new static type derived from G_TYPE_PARAM. The type system uses the information contained in the GParamSpecTypeInfo structure pointed to by info to manage the GParamSpec type and its instances.
-- name : 	0-terminated string used as the name of the new GParamSpec type.
-- pspec_info : 	The GParamSpecTypeInfo for this GParamSpec type.
-- Returns : 	The new type identifier.
-- GParamSpecPool

-- typedef struct _GParamSpecPool GParamSpecPool;

-- A GParamSpecPool maintains a collection of GParamSpecs which can be quickly accessed by owner and name. The implementation of the GObject property system uses such a pool to store the GParamSpecs of the properties all object types.
-- g_param_spec_pool_new ()

-- GParamSpecPool* g_param_spec_pool_new       (gboolean type_prefixing);

-- Creates a new GParamSpecPool.

-- If type_prefixing is TRUE, lookups in the newly created pool will allow to specify the owner as a colon-separated prefix of the property name, like "GtkContainer:border-width". This feature is deprecated, so you should always set type_prefixing to FALSE.
-- type_prefixing : 	Whether the pool will support type-prefixed property names.
-- Returns : 	a newly allocated GParamSpecPool.
-- g_param_spec_pool_insert ()

-- void        g_param_spec_pool_insert        (GParamSpecPool *pool,
--                                              GParamSpec *pspec,
--                                              GType owner_type);

-- Inserts a GParamSpec in the pool.
-- pool : 	a GParamSpecPool.
-- pspec : 	the GParamSpec to insert
-- owner_type : 	a GType identifying the owner of pspec
-- g_param_spec_pool_remove ()

-- void        g_param_spec_pool_remove        (GParamSpecPool *pool,
--                                              GParamSpec *pspec);

-- Removes a GParamSpec from the pool.
-- pool : 	a GParamSpecPool
-- pspec : 	the GParamSpec to remove
-- g_param_spec_pool_lookup ()

-- GParamSpec* g_param_spec_pool_lookup        (GParamSpecPool *pool,
--                                              const gchar *param_name,
--                                              GType owner_type,
--                                              gboolean walk_ancestors);

-- Looks up a GParamSpec in the pool.
-- pool : 	a GParamSpecPool
-- param_name : 	the name to look for
-- owner_type : 	the owner to look for
-- walk_ancestors : 	If TRUE, also try to find a GParamSpec with param_name owned by an ancestor of owner_type.
-- Returns : 	The found GParamSpec, or NULL if no matching GParamSpec was found.
-- g_param_spec_pool_list ()

-- GParamSpec** g_param_spec_pool_list         (GParamSpecPool *pool,
--                                              GType owner_type,
--                                              guint *n_pspecs_p);

-- Gets an array of all GParamSpecs owned by owner_type in the pool.
-- pool : 	a GParamSpecPool
-- owner_type : 	the owner to look for
-- n_pspecs_p : 	return location for the length of the returned array
-- Returns : 	a newly allocated array containing pointers to all GParamSpecs owned by owner_type in the pool
-- g_param_spec_pool_list_owned ()

-- GList*      g_param_spec_pool_list_owned    (GParamSpecPool *pool,
--                                              GType owner_type);

-- Gets an GList of all GParamSpecs owned by owner_type in the pool.
-- pool : 	a GParamSpecPool
-- owner_type : 	the owner to look for
-- Returns : 	a GList of all GParamSpecs owned by owner_type in the poolGParamSpecs.
-- See Also

-- g_object_class_install_property(), g_object_set(), g_object_get(), g_object_set_property(), g_object_get_property(), g_value_register_transform_func()

feature {NONE} -- boolean parameter specification
	
	default_gboolean (spec:POINTER): INTEGER is
		external "C struct GParamSpecBoolean get default_value use <glib-object.h>"
		end

	g_param_spec_boolean (a_name, a_nick, a_blurb: POINTER;
								 a_default, some_flags: INTEGER): POINTER is
		external "C use <glib-object.h>"
		end
	
feature {NONE} -- character parameter specification
	min_char (spec: POINTER): INTEGER is
		external "C struct GParamSpecChar get minumum use <glib-object.h>"
		end
	
	max_char (spec: POINTER): INTEGER is
		external "C struct GParamSpecChar get maximum use <glib-object.h>"
		end
	
	def_char (spec: POINTER): INTEGER is
		external "C struct GParamSpecChar get defualt_value use <glib-object.h>"
		end
	
	g_param_spec_char (a_name, a_nick, a_blurb: POINTER;
							 min_c,max_c,default_char, some_flags: INTEGER_8): POINTER is
		external "C use <glib-object.h>"
		end

	--	TODO wrap unsigned character spec parameter
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
	-- 															const gchar *nick,
	-- 															const gchar *blurb,
	-- 															guint8 minimum,
	-- 															guint8 maximum,
	-- 															guint8 default_value,
	-- 															GParamFlags flags);
	
	-- Creates a new GParamSpecUChar instance specifying a G_TYPE_UCHAR property.
	-- name : 	canonical name of the property specified
	-- nick : 	nick name for the property specified
	-- blurb : 	description of the property specified
	-- minimum : 	minimum value for the property specified
	-- maximum : 	maximum value for the property specified
	-- default_value : 	default value for the property specified
	-- flags : 	flags for the property specified
	-- Returns : 	a newly created parameter specification

feature {NONE} -- integer parameter specification
	min_int (spec: POINTER): INTEGER is
		external "C struct GParamSpecInt get minumum use <glib-object.h>"
		end
	max_int (spec: POINTER): INTEGER is
		external "C struct GParamSpecInt get maximum use <glib-object.h>"
		end
	def_int (spec: POINTER): INTEGER is
		external "C struct GParamSpecInt get defualt_value use <glib-object.h>"
		end

	g_param_spec_int (a_name, a_nick, a_blurb: POINTER;
							min_i, max_i, def_i, some_flags: INTEGER) is
		external "C use <glib-object.h>"
		end

	-- TODO wrap unsigned integer parameter specification
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

feature {NONE} -- integer parameter specification
	
	min_long (spec: POINTER): INTEGER_64 is
		external "C struct GParamSpecLong minumum use <glib-object.h>"
		end
	max_long (spec: POINTER): INTEGER_64 is
		external "C struct GParamSpecLong maximum use <glib-object.h>"
		end
	default_long (spec: POINTER): INTEGER_64 is
		external "C struct GParamSpecLong default_long use <glib-object.h>"
		end
	
	g_param_spec_long (a_name, a_nick, a_blurb: POINTER;
							 a_min,a_max,a_default: INTEGER_64;
							 some_flags: INTEGER): POINTER is
		external "C use <glib-object.h>"
		end
	
	-- 			GParamSpecULong

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
	-- 															const gchar *nick,
	-- 															const gchar *blurb,
	-- 															gulong minimum,
	-- 															gulong maximum,
	-- 															gulong default_value,
	-- 															GParamFlags flags);

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
	-- 	GParamSpecInt64

	-- 	typedef struct {
	-- 	GParamSpec    parent_instance;
  
	-- 	gint64        minimum;
	-- 	gint64        maximum;
	-- 	gint64        default_value;
	-- 	} GParamSpecInt64;

	-- 	A GParamSpec derived structure that contains the meta data for 64bit integer properties.
	-- 	GParamSpec parent_instance; 	private GParamSpec portion
	-- 	gint64 minimum; 	minimum value for the property specified
	-- 	gint64 maximum; 	maximum value for the property specified
	-- 	gint64 default_value; 	default value for the property specified
	-- 	g_param_spec_int64 ()

	-- 	GParamSpec* g_param_spec_int64              (const gchar *name,
	-- 																const gchar *nick,
	-- 																const gchar *blurb,
	-- 																gint64 minimum,
	-- 																gint64 maximum,
	-- 																gint64 default_value,
	-- 																GParamFlags flags);

	-- 	Creates a new GParamSpecInt64 instance specifying a G_TYPE_INT64 property.

	-- 	See g_param_spec_internal() for details on property names.
	-- 	name : 	canonical name of the property specified
	-- 	nick : 	nick name for the property specified
	-- 	blurb : 	description of the property specified
	-- 	minimum : 	minimum value for the property specified
	-- 	maximum : 	maximum value for the property specified
	-- 	default_value : 	default value for the property specified
	-- 	flags : 	flags for the property specified
	-- 	Returns : 	a newly created parameter specification

	-- 	GParamSpecUInt64

	-- 	typedef struct {
	-- 	GParamSpec    parent_instance;
  
	-- 	guint64       minimum;
	-- 	guint64       maximum;
	-- 	guint64       default_value;
	-- 	} GParamSpecUInt64;

	-- 	A GParamSpec derived structure that contains the meta data for unsigned 64bit integer properties.
	-- 	GParamSpec parent_instance; 	private GParamSpec portion
	-- 	guint64 minimum; 	minimum value for the property specified
	-- 	guint64 maximum; 	maximum value for the property specified
	-- 	guint64 default_value; 	default value for the property specified
	-- 	g_param_spec_uint64 ()

	-- 	GParamSpec* g_param_spec_uint64             (const gchar *name,
	-- 																const gchar *nick,
	-- 																const gchar *blurb,
	-- 																guint64 minimum,
	-- 																guint64 maximum,
	-- 																guint64 default_value,
	-- 																GParamFlags flags);

	-- 	Creates a new GParamSpecUInt64 instance specifying a G_TYPE_UINT64 property.

	-- 	See g_param_spec_internal() for details on property names.
	-- 	name : 	canonical name of the property specified
	-- 	nick : 	nick name for the property specified
	-- 	blurb : 	description of the property specified
	-- 	minimum : 	minimum value for the property specified
	-- 	maximum : 	maximum value for the property specified
	-- 	default_value : 	default value for the property specified
	-- 	flags : 	flags for the property specified
	-- 	Returns : 	a newly created parameter specification

	-- 	GParamSpecFloat

	-- 	typedef struct {
	-- 	GParamSpec    parent_instance;
  
	-- 	gfloat        minimum;
	-- 	gfloat        maximum;
	-- 	gfloat        default_value;
	-- 	gfloat        epsilon;
	-- 	} GParamSpecFloat;

	-- 	A GParamSpec derived structure that contains the meta data for float properties.
	-- 	GParamSpec parent_instance; 	private GParamSpec portion
	-- 	gfloat minimum; 	minimum value for the property specified
	-- 	gfloat maximum; 	maximum value for the property specified
	-- 	gfloat default_value; 	default value for the property specified
	-- 	gfloat epsilon; 	values closer than epsilon will be considered identical by g_param_values_cmp(); the default value is 1e-30.
	-- 	g_param_spec_float ()

	-- 	GParamSpec* g_param_spec_float              (const gchar *name,
	-- 																const gchar *nick,
	-- 																const gchar *blurb,
	-- 																gfloat minimum,
	-- 																gfloat maximum,
	-- 																gfloat default_value,
	-- 																GParamFlags flags);

	-- 	Creates a new GParamSpecFloat instance specifying a G_TYPE_FLOAT property.

	-- 	See g_param_spec_internal() for details on property names.
	-- 	name : 	canonical name of the property specified
	-- 	nick : 	nick name for the property specified
	-- 	blurb : 	description of the property specified
	-- 	minimum : 	minimum value for the property specified
	-- 	maximum : 	maximum value for the property specified
	-- 	default_value : 	default value for the property specified
	-- 	flags : 	flags for the property specified
	-- 	Returns : 	a newly created parameter specification

	-- 	GParamSpecDouble

	-- 	typedef struct {
	-- 	GParamSpec    parent_instance;
  
	-- 	gdouble       minimum;
	-- 	gdouble       maximum;
	-- 	gdouble       default_value;
	-- 	gdouble       epsilon;
	-- 	} GParamSpecDouble;

	-- 	A GParamSpec derived structure that contains the meta data for double properties.
	-- 	GParamSpec parent_instance; 	private GParamSpec portion
	-- 	gdouble minimum; 	minimum value for the property specified
	-- 	gdouble maximum; 	maximum value for the property specified
	-- 	gdouble default_value; 	default value for the property specified
	-- 	gdouble epsilon; 	values closer than epsilon will be considered identical by g_param_values_cmp(); the default value is 1e-90.
	-- 	g_param_spec_double ()

	-- 	GParamSpec* g_param_spec_double             (const gchar *name,
	-- 																const gchar *nick,
	-- 																const gchar *blurb,
	-- 																gdouble minimum,
	-- 																gdouble maximum,
	-- 																gdouble default_value,
	-- 																GParamFlags flags);

	-- 	Creates a new GParamSpecDouble instance specifying a G_TYPE_DOUBLE property.

	-- 	See g_param_spec_internal() for details on property names.
	-- 	name : 	canonical name of the property specified
	-- 	nick : 	nick name for the property specified
	-- 	blurb : 	description of the property specified
	-- 	minimum : 	minimum value for the property specified
	-- 	maximum : 	maximum value for the property specified
	-- 	default_value : 	default value for the property specified
	-- 	flags : 	flags for the property specified
	-- 	Returns : 	a newly created parameter specification

	-- 	GParamSpecEnum

	-- 	typedef struct {
	-- 	GParamSpec    parent_instance;
  
	-- 	GEnumClass   *enum_class;
	-- 	gint          default_value;
	-- 	} GParamSpecEnum;

	-- 	A GParamSpec derived structure that contains the meta data for enum properties.
	-- 	GParamSpec parent_instance; 	private GParamSpec portion
	-- 	GEnumClass *enum_class; 	the GEnumClass for the enum
	-- 	gint default_value; 	default value for the property specified
	-- 	g_param_spec_enum ()

	-- 	GParamSpec* g_param_spec_enum               (const gchar *name,
	-- 																const gchar *nick,
	-- 																const gchar *blurb,
	-- 																GType enum_type,
	-- 																gint default_value,
	-- 																GParamFlags flags);

	-- 	Creates a new GParamSpecEnum instance specifying a G_TYPE_ENUM property.

	-- 	See g_param_spec_internal() for details on property names.
	-- 	name : 	canonical name of the property specified
	-- 	nick : 	nick name for the property specified
	-- 	blurb : 	description of the property specified
	-- 	enum_type : 	a GType derived from G_TYPE_ENUM
	-- 	default_value : 	default value for the property specified
	-- 	flags : 	flags for the property specified
	-- 	Returns : 	a newly created parameter specification
	-- 	GParamSpecFlags

	-- 	typedef struct {
	-- 	GParamSpec    parent_instance;
  
	-- 	GFlagsClass  *flags_class;
	-- 	guint         default_value;
	-- 	} GParamSpecFlags;

	-- 	A GParamSpec derived structure that contains the meta data for flags properties.
	-- 	GParamSpec parent_instance; 	private GParamSpec portion
	-- 	GFlagsClass *flags_class; 	the GFlagsClass for the flags
	-- 	guint default_value; 	default value for the property specified
	-- 	g_param_spec_flags ()

	-- 	GParamSpec* g_param_spec_flags              (const gchar *name,
	-- 																const gchar *nick,
	-- 																const gchar *blurb,
	-- 																GType flags_type,
	-- 																guint default_value,
	-- 																GParamFlags flags);

	-- 	Creates a new GParamSpecEnum instance specifying a G_TYPE_FLAGS property.

	-- 	See g_param_spec_internal() for details on property names.
	-- 	name : 	canonical name of the property specified
	-- 	nick : 	nick name for the property specified
	-- 	blurb : 	description of the property specified
	-- 	flags_type : 	a GType derived from G_TYPE_FLAGS
	-- 	default_value : 	default value for the property specified
	-- 	flags : 	flags for the property specified
	-- 	Returns : 	a newly created parameter specification

	-- 	GParamSpecString

	-- 	typedef struct {
	-- 	GParamSpec    parent_instance;
  
	-- 	gchar        *default_value;
	-- 	gchar        *cset_first;
	-- 	gchar        *cset_nth;
	-- 	gchar         substitutor;
	-- 	guint         null_fold_if_empty : 1;
	-- 	guint         ensure_non_null : 1;
	-- 	} GParamSpecString;

	-- 	A GParamSpec derived structure that contains the meta data for string properties.
	-- 	GParamSpec parent_instance; 	private GParamSpec portion
	-- 	gchar *default_value; 	default value for the property specified
	-- 	gchar *cset_first; 	a string containing the allowed values for the first byte
	-- 	gchar *cset_nth; 	a string containing the allowed values for the subsequent bytes
	-- 	gchar substitutor; 	the replacement byte for bytes which don't match cset_first or cset_nth.
	-- 	guint null_fold_if_empty : 1; 	replace empty string by NULL
	-- 	guint ensure_non_null : 1; 	replace NULL strings by an empty string
	-- 	gchararray

	-- 	typedef gchar* gchararray;

	-- 	A C representable type name for G_TYPE_STRING.
	-- 	g_param_spec_string ()

	-- 	GParamSpec* g_param_spec_string             (const gchar *name,
	-- 						const gchar *nick,
	-- 						const gchar *blurb,
	-- 						const gchar *default_value,
	-- 						GParamFlags flags);

	-- 	Creates a new GParamSpecString instance.

	-- 	See g_param_spec_internal() for details on property names.
	-- 	name : 	canonical name of the property specified
	-- 	nick : 	nick name for the property specified
	-- 	blurb : 	description of the property specified
	-- 	default_value : 	default value for the property specified
	-- 	flags : 	flags for the property specified
	-- 	Returns : 	a newly created parameter specification



	-- TODO: wrap g_param_spec[pointer|object|valuearray|unichar|boxed|param]

end
	
