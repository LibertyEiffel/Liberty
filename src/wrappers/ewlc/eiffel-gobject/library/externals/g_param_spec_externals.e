note
	description: "."
	copyright: "[
					Copyright (C) 2006-2017: eiffel-libraries team, GTK+ team
					
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
					
deferred class G_PARAM_SPEC_EXTERNALS

inherit ANY undefine is_equal, copy end

insert G_PARAM_FLAGS

feature {} -- External calls

	g_type_is_param(a_type: INTEGER): INTEGER
		external "C macro use <glib-object.h>"
		alias "G_TYPE_IS_PARAM"
		end

	g_is_param_spec (a_pspec: POINTER): INTEGER
			-- Checks whether pspec "is a" valid GParamSpec structure of type G_TYPE_PARAM or derived.
		external "C macro use <glib-object.h>"
		alias "G_IS_PARAM_SPEC"
		end

	g_is_param_spec_class (a_pclass: POINTER): INTEGER
			-- Checks whether pclass "is a" valid GParamSpecClass structure of type G_TYPE_PARAM or derived.
		external "C macro use <glib-object.h>"
		alias "G_IS_PARAM_SPEC_CLASS"
		end

	g_param_spec_get_class (a_pspec: POINTER): POINTER
			-- Retrieves the GParamSpecClass of a GParamSpec.
		external "C macro use <glib-object.h>"
		alias "G_PARAM_SPEC_GET_CLASS"
		end

	g_param_spec_type (a_pspec: POINTER): POINTER
			-- Retrieves the GType of this pspec.
		external "C macro use <glib-object.h>"
		alias "G_PARAM_SPEC_TYPE"
		end

	g_param_spec_type_name (a_pspec: POINTER): POINTER
			-- Retrieves the GType name of this pspec.
		external "C macro use <glib-object.h>"
		alias "G_PARAM_SPEC_TYPE_NAME"
		end

	g_param_spec_value_type (a_pspec: POINTER): INTEGER
			-- Retrieves the GType to initialize a GValue for this parameter.
		external "C macro use <glib-object.h>"
		alias "G_PARAM_SPEC_VALUE_TYPE"
		end


	-- TODO: wrap if necessary GParamSpec struct access
	
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
	get_flags (a_spec: POINTER): INTEGER
			-- GParamSpec.flags: GParamFlags flags for this parameter
		external "C struct GParamSpec get flags use <glib-object.h>"
		end

	get_value_type (a_spec: POINTER): INTEGER
			-- GType value_type: the GValue type for this parameter
		external "C struct GParamSpec get value_type use <glib-object.h>"
		end
	get_owner_type (a_spec: POINTER): INTEGER
			-- GType owner_type; GType type that uses (introduces) this paremeterq
		external "C struct GParamSpec get owner_type use <glib-object.h>"
		end
	get_param_id (a_spec: POINTER): INTEGER
			-- GParamSpec.param_id.
			-- Note: This is a private GObject feature!
		external "C struct GParamSpec get param_id use <glib-object.h>"
		end


	-- TODO: wrap in necessary access to GParamSpecClass struct
	
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
	

	g_param_spec_ref (a_gparam_spec: POINTER): POINTER is -- GParamSpec*
			-- Increments the reference count of pspec.
		external "C macro use <glib-object.h>"
		end

	g_param_spec_unref (a_gparam_spec: POINTER) is -- void
			-- Decrements the reference count of a pspec.
		external "C macro use <glib-object.h>"
		end

	g_param_spec_sink (a_gparam_spec: POINTER) is -- void
			-- The initial reference count of a newly created GParamSpec
			-- is 1, even though no one has explicitly called
			-- g_param_spec_ref() on it yet. So the initial reference
			-- count is flagged as "floating", until someone calls
			-- g_param_spec_ref (pspec); g_param_spec_sink (pspec); in
			-- sequence on it, taking over the initial reference count
			-- (thus ending up with a pspec that has a reference count of
			-- 1 still, but is not flagged "floating" anymore).
		external "C macro use <glib-object.h>"
		end

	g_param_spec_ref_sink (a_gparam_spec: POINTER): POINTER is -- GParamSpec*
			-- Convenience function to ref and sink a GParamSpec.
		external "C macro use <glib-object.h>"
		end

	g_param_value_set_default       (a_gparam_spec, a_value: POINTER)
			-- Sets value to its default value as specified in pspec.
		external "C use  <glib-object.h>"
		end

	g_param_value_defaults (a_g_param_spec: POINTER; a_value: POINTER): INTEGER is -- gboolean
			-- Checks whether value contains the default value as specified in pspec.
		external "C use <glib-object.h>"
		end

	g_param_value_validate (a_g_param_spec, a_value: POINTER): INTEGER is -- gboolean
			-- Ensures that the contents of value comply with the
			-- specifications set out by pspec. For example, a
			-- GParamSpecInt might require that integers stored in value
			-- may not be smaller than -42 and not be greater than
			-- +42. If value contains an integer outside of this range,
			-- it is modified accordingly, so the resulting value will
			-- fit into the range -42 .. +42.
		external "C use <glib-object.h>"
		end
	
	g_param_value_convert (a_g_param_spec, a_const_src_value, a_dest_value: POINTER; strict_validation_bool: INTEGER): INTEGER is -- gboolean
			-- Transforms src_value into dest_value if possible, and then
			-- validates dest_value, in order for it to conform to
			-- pspec. If strict_validation is TRUE this function will
			-- only succeed if the transformed dest_value complied to
			-- pspec without modifications. See also
			-- g_value_type_transformable(), g_value_transform() and
			-- g_param_value_validate().  Returns : TRUE if
			-- transformation and validation were successful, FALSE
			-- otherwise and dest_value is left untouched.
		external "C use <glib-object.h>"
		end

	g_param_values_cmp (a_g_param_spec, a_const_value, another_const_value: POINTER): INTEGER
			-- Compares value1 with value2 according to pspec, and return
			-- -1, 0 or +1, if value1 is found to be less than, equal to
			-- or greater than value2, respectively.
		
			-- pspec : a valid GParamSpec
			-- value1 : a GValue of correct type for pspec
			-- value2 : a GValue of correct type for pspec
			-- Returns : -1, 0 or +1, for a less than, equal to or greater than result
		external "C use <glib-object.h>"
		end
		
	g_param_spec_get_name (a_g_param_spec: POINTER): POINTER is -- const gchar*
			-- Returns the name of a GParamSpec.
			-- pspec : a valid GParamSpec
			-- Returns : the name of pspec.
		external "C use <glib-object.h>"
		end
	
	g_param_spec_get_nick (a_g_param_spec: POINTER): POINTER is -- const gchar*
			-- Returns the nickname of a GParamSpec.
			-- pspec : a valid GParamSpec
			-- Returns : the nickname of pspec.
		external "C use <glib-object.h>"
		end

	g_param_spec_get_blurb (a_g_param_spec: POINTER): POINTER is -- const gchar*
			-- Returns the short description of a GParamSpec.
			-- pspec : a valid GParamSpec
			-- Returns : the short description of pspec.
		external "C use <glib-object.h>"
		end

	g_param_spec_get_qdata (a_g_param_spec: POINTER;a_quark: INTEGER_32): POINTER is -- gpointer
			-- Gets back user data pointers stored via g_param_spec_set_qdata().
			-- pspec : a valid GParamSpec
			-- quark : a GQuark, naming the user data pointer
			-- Returns : the user data pointer set, or NULL
		external "C use <glib-object.h>"
		end

	g_param_spec_set_qdata (a_g_param_spec: POINTER; a_quark: INTEGER_32; data: POINTER)
			-- Sets an opaque, named pointer on a GParamSpec. The name is
			-- specified through a GQuark (retrieved e.g. via
			-- g_quark_from_static_string()), and the pointer can be
			-- gotten back from the pspec with
			-- g_param_spec_get_qdata(). Setting a previously set user
			-- data pointer, overrides (frees) the old pointer set, using
			-- NULL as pointer essentially removes the data stored.
		
			-- pspec : the GParamSpec to set store a user data pointer
			-- quark : a GQuark, naming the user data pointer
			-- data : an opaque user data pointer
		external "C use <glib-object.h>"
		end

	g_param_spec_set_qdata_full (a_g_param_spec: POINTER; a_quark: INTEGER_32; data, gdestroynotify: POINTER)
			-- This function works like g_param_spec_set_qdata(), but in
			-- addition, a void (*destroy) (gpointer) function may be
			-- specified which is called with data as argument when the
			-- pspec is finalized, or the data is being overwritten by a
			-- call to g_param_spec_set_qdata() with the same quark.
		
			-- pspec : the GParamSpec to set store a user data pointer
			-- quark : a GQuark, naming the user data pointer
			-- data : an opaque user data pointer
			-- destroy : function to invoke with data as argument, when data needs to be freed
		external "C use <glib-object.h>"
		end

	g_param_spec_steal_qdata (a_g_param_spec: POINTER; a_quark: INTEGER_32): POINTER is -- gpointer
			-- Gets back user data pointers stored via
			-- g_param_spec_set_qdata() and removes the data from pspec
			-- without invoking it's destroy() function (if any was
			-- set). Usually, calling this function is only required to
			-- update user data pointers with a destroy notifier.
		
			-- pspec : the GParamSpec to get a stored user data pointer from
			-- quark : a GQuark, naming the user data pointer
			-- Returns : the user data pointer set, or NULL
		external "C use <glib-object.h>"
		end

	g_param_spec_get_redirect_target (a_g_param_spec: POINTER): POINTER is -- GParamSpec**
			-- If the paramspec redirects operations to another paramspec,
			-- returns that paramspec. Redirect is used typically for
			-- providing a new implementation of a property in a derived
			-- type while preserving all the properties from the parent
			-- type. Redirection is established by creating a property of
			-- type GParamSpecOverride. See g_object_override_property() for
			-- an example of the use of this capability.  pspec : a
			-- GParamSpec Returns : paramspec to which requests on this
			-- paramspec should be redirected, or NULL if none.
		external "C use <glib-object.h>"
		end

	g_param_spec_internal (a_param_type: INTEGER; a_const_name, a_const_nick, a_const_blurb: POINTER; some_gparam_flags: INTEGER): POINTER is -- gpointer
			-- Creates a new GParamSpec instance. A property name
			-- consists of segments consisting of ASCII letters and
			-- digits, separated by either the '-' or '_' character. The
			-- first character of a property name must be a letter. Names
			-- which violate these rules lead to undefined behaviour.

			-- When creating and looking up a GParamSpec, either
			-- separator can be used, but they cannot be mixed. Using '-'
			-- is considerably more efficient and in fact required when
			-- using property names as detail strings for signals.
		
			-- param_type : the GType for the property; must be derived from G_TYPE_PARAM
			-- name : the canonical name of the property
			-- nick : the nickname of the property
			-- blurb : a short description of the property
			-- flags : a combination of GParamFlags
			-- Returns : a newly allocated GParamSpec instance
		require are_valid_param_flags (some_gparam_flags)
		external "C use <glib-object.h>"
		end


	-- TODO: wrap if necessary GParamSpecTypeInfo
	
	-- typedef struct {
	-- /* type system portion */
	-- guint16 instance_size; /* obligatory */
	-- guint16 n_preallocs; /* optional */
	--(*instance_init)	(GParamSpec *pspec) is
	-- /* optional */

	-- /* class portion */
	-- GType value_type; /* obligatory */
	-- void (*finalize) (GParamSpec *pspec); /* optional */
	-- void (*value_set_default) (GParamSpec *pspec, /* recommended */
	-- GValue *value);
	-- gboolean (*value_validate) (GParamSpec *pspec, /* optional */
	-- GValue *value);
	-- gint (*values_cmp) (GParamSpec *pspec, /* recommended */
	-- a_const_value: POINTER1, a_const_value: POINTER2);
	-- } GParamSpecTypeInfo;

	-- This structure is used to provide the type system with the information required to initialize and destruct (finalize) a parameter's class and instances thereof. The initialized structure is passed to the g_param_type_register_static() The type system will perform a deep copy of this structure, so it's memory does not need to be persistent across invocation of g_param_type_register_static().
	-- guint16 instance_size; Size of the instance (object) structure.
	-- guint16 n_preallocs; Prior to GLib 2.10, it specified the number of pre-allocated (cached) instances to reserve memory for (0 indicates no caching). Since GLib 2.10, it is ignored, since instances are allocated with the slice allocator now.
	-- instance_init () Location of the instance initialization function (optional).
	-- GType value_type; The GType of values conforming to this GParamSpec
	-- finalize () The instance finalization function (optional).
	-- value_set_default () Resets a value to the default value for pspec (recommended, the default is g_value_reset()), see g_param_value_set_default().
	-- value_validate () Ensures that the contents of value comply with the specifications set out by pspec (optional), see g_param_value_set_validate().
	-- values_cmp () Compares value1 with value2 according to pspec (recommended, the default is memcmp()), see g_param_values_cmp().

	-- g_param_type_register_static ()

	-- GType g_param_type_register_static (a_const_name: POINTER, const GParamSpecTypeInfo *pspec_info);

	-- Registers name as the name of a new static type derived from G_TYPE_PARAM. The type system uses the information contained in the GParamSpecTypeInfo structure pointed to by info to manage the GParamSpec type and its instances.
	-- name : 0-terminated string used as the name of the new GParamSpec type.
	-- pspec_info : The GParamSpecTypeInfo for this GParamSpec type.
	-- Returns : The new type identifier.


	-- GParamSpecPool

	-- typedef struct _GParamSpecPool GParamSpecPool;
	
	-- A GParamSpecPool maintains a collection of GParamSpecs which can
	-- be quickly accessed by owner and name. The implementation of the
	-- GObject property system uses such a pool to store the
	-- GParamSpecs of the properties all object types.
	
	g_param_spec_pool_new (type_prefixing_bool: INTEGER): POINTER is -- GParamSpecPool*
			-- Creates a new GParamSpecPool.
		
			-- If type_prefixing is TRUE, lookups in the newly created
			-- pool will allow to specify the owner as a colon-separated
			-- prefix of the property name, like
			-- "GtkContainer:border-width". This feature is deprecated,
			-- so you should always set type_prefixing to FALSE.
		
			-- type_prefixing : Whether the pool will support type-prefixed property names.
			-- Returns : a newly allocated GParamSpecPool.
		external "C macro use <glib-object.h>"
		end

	g_param_spec_pool_insert (a_spec_pool, a_g_param_spec: POINTER; owner_gtype: INTEGER)
			-- Inserts a GParamSpec in the pool.
			-- pool : a GParamSpecPool.
			-- pspec : the GParamSpec to insert
			-- owner_type : a GType identifying the owner of pspec
		external "C use <glib-object.h>"
		end
 

	g_param_spec_pool_remove (a_spec_pool, a_g_param_spec: POINTER)
			-- Removes a GParamSpec from the pool.
			-- pool : a GParamSpecPool
			-- pspec : the GParamSpec to remove
		external "C use <glib-object.h>"
		end

	g_param_spec_pool_lookup (a_spec_pool_pool, a_const_param_name: POINTER; an_owner_type: INTEGER; walk_ancestors_bool: INTEGER): POINTER is -- GParamSpec* 
			-- Looks up a GParamSpec in the pool.
			-- pool : a GParamSpecPool
			-- param_name : the name to look for
			-- owner_type : the owner to look for
			-- walk_ancestors : If TRUE, also try to find a GParamSpec with param_name owned by an ancestor of owner_type.
			-- Returns : The found GParamSpec, or NULL if no matching GParamSpec was found.
		external "C use <glib-object.h>"
		end

	
	g_param_spec_pool_list (a_spec_pool: POINTER; an_owner_type: INTEGER; guint_n_pspecs_p: POINTER): POINTER is -- GParamSpec**
			-- Gets an array of all GParamSpecs owned by owner_type in the pool.
			-- pool : a GParamSpecPool
			-- owner_type : the owner to look for
			-- n_pspecs_p : return location for the length of the returned array
			-- Returns : a newly allocated array containing pointers to all GParamSpecs owned by owner_type in the pool
		external "C use <glib-object.h>"
		end
		
	g_param_spec_pool_list_owned (a_spec_pool: POINTER; an_owner_type: INTEGER): POINTER is -- -- GList*
			-- Gets an GList of all GParamSpecs owned by owner_type in the pool.
			-- pool : a GParamSpecPool
			-- owner_type : the owner to look for
			-- Returns : a GList of all GParamSpecs owned by owner_type in the poolGParamSpecs.
		external "C use <glib-object.h>"
		end
		

feature {} -- External calls for parameter specs of boolean type
	g_is_param_spec_boolean (a_pspec: POINTER): INTEGER
			-- Return whether the given GParamSpec is of type G_TYPE_PARAM_BOOLEAN.
			-- pspec : a valid GParamSpec instance
		external "C macro use <glib-object.h>"
		alias "G_IS_PARAM_SPEC_BOOLEAN"
		end

	g_type_param_boolean: INTEGER
		-- -- The GType of GParamSpecBoolean.
		external "C macro use <glib-object.h>"
		alias "G_TYPE_PARAM_BOOLEAN"
		end

	-- typedef struct {
	-- GParamSpec parent_instance;	
	-- gboolean default_value;
	default_gboolean (spec:POINTER): INTEGER
			-- gboolean default_value; default value for the property specified
		external "C struct GParamSpecBoolean get default_value use <glib-object.h>"
		end

	-- } GParamSpecBoolean;
	
	-- A GParamSpec derived structure that contains the meta data for boolean properties.
	-- GParamSpec parent_instance; private GParamSpec portion
	
	
	g_param_spec_boolean (a_const_name, a_const_nick, a_const_blurb: POINTER;  default_bool_value: INTEGER; some_flags: INTEGER): POINTER is -- GParamSpec*
			-- Creates a new GParamSpecBoolean instance specifying a G_TYPE_BOOLEAN property.
		
			-- See g_param_spec_internal() for details on property names.
			-- name : canonical name of the property specified
			-- nick : nick name for the property specified
			-- blurb : description of the property specified
			-- default_value : default value for the property specified
			-- flags : flags for the property specified
			-- Returns : a newly created parameter specification
		require are_valid_param_flags (some_flags)
		external "C use <glib-object.h>"
		end

feature {} -- External calls for parameter specs of char type
		
	g_is_param_spec_char (a_pspec: POINTER): INTEGER
		external "C macro use <glib-object.h>"
		alias "G_IS_PARAM_SPEC_CHAR"
		end

	g_type_param_char: INTEGER
			-- The GType of GParamSpecChar.
		external "C macro use <glib-object.h>"
		alias "G_TYPE_PARAM_CHAR"
		end

	-- typedef struct {
	-- GParamSpec parent_instance;
	-- gint8 minimum;
	min_char (spec: POINTER): INTEGER_8
			-- gint8 minimum; minimum value for the property specified
		external "C struct GParamSpecChar get minumum use <glib-object.h>"
		end
	-- gint8 maximum;
	max_char (spec: POINTER): INTEGER_8
			-- gint8 maximum; maximum value for the property specified
		external "C struct GParamSpecChar get maximum use <glib-object.h>"
		end
	-- gint8 default_value;	
	def_char (spec: POINTER): INTEGER_8
			-- gint8 default_value; default value for the property specified
		external "C struct GParamSpecChar get default_value use <glib-object.h>"
		end
	-- } GParamSpecChar, a GParamSpec derived structure that contains
	-- the meta data for character properties.  GParamSpec
	-- parent_instance; private GParamSpec portion
	
	
	g_param_spec_char (a_const_name, a_const_nick, a_const_blurb: POINTER;
							 a_minimum, a_maximum, a_default_value: INTEGER_8; some_flags: INTEGER): POINTER is -- GParamSpec*
			-- Creates a new GParamSpecChar instance specifying a G_TYPE_CHAR property.
			-- name : canonical name of the property specified
			-- nick : nick name for the property specified
			-- blurb : description of the property specified
			-- minimum : minimum value for the property specified
			-- maximum : maximum value for the property specified
			-- default_value : default value for the property specified
			-- flags : flags for the property specified
			-- Returns : a newly created parameter specification
		require are_valid_param_flags (some_flags)
		external "C use <glib-object.h>"
		end

feature {} -- External calls for parameter specs of unsigned char type
	g_is_param_spec_uchar (a_pspec: POINTER): INTEGER
			-- Return whether the given GParamSpec is of type G_TYPE_PARAM_UCHAR.
			-- pspec : a valid GParamSpec instance
		external "C macro use <glib-object.h>"
		alias "G_IS_PARAM_SPEC_UCHAR"
		end

	g_type_param_uchar: INTEGER
			-- The GType of GParamSpecUChar.
		external "C macro use <glib-object.h>"
		alias "G_TYPE_PARAM_UCHAR"
		end

	-- TODO: wrap if necessary GParamSpecUChar

	-- typedef struct {
	-- GParamSpec parent_instance;
 
	-- guint8 minimum;
	-- guint8 maximum;
	-- guint8 default_value;
	-- } GParamSpecUChar;

	-- A GParamSpec derived structure that contains the meta data for unsigned character properties.
	-- GParamSpec parent_instance; private GParamSpec portion
	-- guint8 minimum; minimum value for the property specified
	-- guint8 maximum; maximum value for the property specified
	-- guint8 default_value; default value for the property specified

	g_param_spec_uchar (a_const_name, a_const_nick, a_const_blurb: POINTER; a_minimum, a_maximum, a_default_value: CHARACTER; some_flags: INTEGER): POINTER is -- GParamSpec* 
			-- Creates a new GParamSpecUChar instance specifying a G_TYPE_UCHAR property.
			-- name : canonical name of the property specified
			-- nick : nick name for the property specified
			-- blurb : description of the property specified
			-- minimum : minimum value for the property specified
			-- maximum : maximum value for the property specified
			-- default_value : default value for the property specified
			-- flags : flags for the property specified
			-- Returns : a newly created parameter specification
			-- TODO: In g_param_spec_uchar a_minimum, a_maximum, a_default_value shall be NATURAL_8 since they're guint8. Currently are CHARACTERs. They should fit well.
		require are_valid_param_flags (some_flags)
		external "C use <glib-object.h>"
		end

feature {} -- External calls for parameter specs of integer type
	g_is_param_spec_int (a_pspec: POINTER): INTEGER
			-- Return whether the given GParamSpec is of type G_TYPE_PARAM_INT.
		external "C macro use <glib-object.h>"
		alias "G_IS_PARAM_SPEC_INT"
		end

	g_type_param_int: INTEGER
			-- The GType of GParamSpecInt.
		external "C macro use <glib-object.h>"
		alias "G_TYPE_PARAM_INT"
		end
	
	-- typedef struct {
	-- GParamSpec parent_instance;
	-- gint minimum;
	get_min_int (spec: POINTER): INTEGER
			-- gint minimum; minimum value for the property specified
		external "C struct GParamSpecInt get minumum use <glib-object.h>"
		end
	-- gint maximum;
	get_max_int (spec: POINTER): INTEGER
			-- gint maximum; maximum value for the property specified
		external "C struct GParamSpecInt get maximum use <glib-object.h>"
		end
	-- gint default_value;
	get_default_int (spec: POINTER): INTEGER
		external "C struct GParamSpecInt get default_value use <glib-object.h>"
		end
	-- } GParamSpecInt;

	-- A GParamSpec derived structure that contains the meta data for integer properties.
	-- GParamSpec parent_instance; private GParamSpec portion
	
		-- gint default_value; default value for the property specified
	
	g_param_spec_int (a_const_name, a_const_nick, a_const_blurb: POINTER; a_minimum, a_maximum, a_default_value: INTEGER; some_flags: INTEGER): POINTER is -- GParamSpec* 
			-- Creates a new GParamSpecInt instance specifying a G_TYPE_INT property.
		
			-- See g_param_spec_internal() for details on property names.
			-- name : canonical name of the property specified
			-- nick : nick name for the property specified
			-- blurb : description of the property specified
			-- minimum : minimum value for the property specified
			-- maximum : maximum value for the property specified
			-- default_value : default value for the property specified
			-- flags : flags for the property specified
			-- Returns : a newly created parameter specification
		require are_valid_param_flags (some_flags)
		external "C use <glib-object.h>"
		end

feature {} -- External calls for parameter specs of unsigned integer type
	g_is_param_spec_uint (a_pspec: POINTER): INTEGER
			-- Return whether the given GParamSpec is of type G_TYPE_PARAM_UINT.
		external "C macro use <glib-object.h>"
		alias "G_IS_PARAM_SPEC_UINT"
		end

	g_type_param_uint: INTEGER
			-- The GType of GParamSpecUInt.
		external "C macro use <glib-object.h>"
		alias "G_TYPE_PARAM_UINT"
		end
	
	-- TODO: wrap if necessary GParamSpecUInt

	-- typedef struct {
	-- GParamSpec parent_instance;
 
	-- guint minimum;
	get_min_uint (spec: POINTER): INTEGER
		external "C struct GParamSpecUInt get minimum use <glib-object.h>"
		end
	-- guint maximum;
	get_max_uint (spec: POINTER): INTEGER
		external "C struct GParamSpecUInt get maximum use <glib-object.h>"
		end
	-- guint default_value;
	get_default_uint (spec: POINTER): INTEGER
		external "C struct GParamSpecUInt get default_value use <glib-object.h>"
		end
	-- } GParamSpecUInt;

	-- A GParamSpec derived structure that contains the meta data for unsigned integer properties.
	-- GParamSpec parent_instance; private GParamSpec portion
	-- guint minimum; minimum value for the property specified
	-- guint maximum; maximum value for the property specified
	-- guint default_value; default value for the property specified

	g_param_spec_uint (a_const_name, a_const_nick, a_const_blurb: POINTER; a_minimum, a_maximum, a_default_value:INTEGER ; some_flags: INTEGER): POINTER is -- GParamSpec* 
			-- Creates a new GParamSpecUInt instance specifying a G_TYPE_UINT property.
		
			-- See g_param_spec_internal() for details on property names.
			-- name : canonical name of the property specified
			-- nick : nick name for the property specified
			-- blurb : description of the property specified
			-- minimum : minimum value for the property specified
			-- maximum : maximum value for the property specified
			-- default_value : default value for the property specified
			-- flags : flags for the property specified
			-- Returns : a newly created parameter specification
			-- TODO: In g_param_spec_uint a_minimum, a_maximum, a_default_value shall be NATURAL since they're guint. Currently are INTEGER. This can produce overflows.
		require are_valid_param_flags (some_flags)
		external "C use <glib-object.h>"
		end

feature {} -- External calls for parameter specs of long type
	g_is_param_spec_long (a_pspec: POINTER): INTEGER
			-- Return whether the given GParamSpec is of type G_TYPE_PARAM_LONG.
		external "C macro use <glib-object.h>"
		alias "G_IS_PARAM_SPEC_LONG"
		end

	g_type_param_long: INTEGER
			-- The GType of GParamSpecLong.
		external "C macro use <glib-object.h>"
		alias "G_TYPE_PARAM_LONG"
		end

	-- typedef struct {
	-- GParamSpec parent_instance;
 
	-- glong minimum;
	min_long (spec: POINTER): INTEGER_64
			-- glong minimum; minimum value for the property specified
		external "C struct GParamSpecLong minumum use <glib-object.h>"
		end
	-- glong maximum;
	max_long (spec: POINTER): INTEGER_64
			-- glong maximum; maximum value for the property specified
		external "C struct GParamSpecLong maximum use <glib-object.h>"
		end
	-- glong default_value;
	default_long (spec: POINTER): INTEGER_64
			-- glong default_value; default value for the property specified
		external "C struct GParamSpecLong default_long use <glib-object.h>"
		end
	-- } GParamSpecLong, a GParamSpec derived structure that contains
	-- the meta data for long integer properties.  GParamSpec
	-- parent_instance; private GParamSpec portion

	g_param_spec_long (a_const_name, a_const_nick, a_const_blurb: POINTER;
							 a_minimum, a_maximum, a_default_value: INTEGER_64;
							 some_flags: INTEGER): POINTER is -- GParamSpec* 
			-- Creates a new GParamSpecLong instance specifying a G_TYPE_LONG property.

			-- See g_param_spec_internal() for details on property names.
			-- name : canonical name of the property specified
			-- nick : nick name for the property specified
			-- blurb : description of the property specified
			-- minimum : minimum value for the property specified
			-- maximum : maximum value for the property specified
			-- default_value : default value for the property specified
			-- flags : flags for the property specified
			-- Returns : a newly created parameter specification
		require are_valid_param_flags (some_flags)
		external "C use <glib-object.h>"
		end

feature {} -- External calls for parameter specs of unsigned long type
	g_is_param_spec_ulong (a_pspec: POINTER): INTEGER
			-- Return whether the given GParamSpec is of type G_TYPE_PARAM_ULONG.
		external "C macro use <glib-object.h>"
		alias "G_IS_PARAM_SPEC_ULONG"
		end

	g_type_param_ulong: INTEGER
			-- The GType of GParamSpecULong.
		external "C macro use <glib-object.h>"
		alias "G_TYPE_PARAM_ULONG"
		end
	
	-- TODO: wrap - if necessary - GParamSpecULong

	-- typedef struct {
	-- GParamSpec parent_instance;
 
	-- gulong minimum;
	-- gulong maximum;
	-- gulong default_value;
	-- } GParamSpecULong;

	-- A GParamSpec derived structure that contains the meta data for unsigned long integer properties.
	-- GParamSpec parent_instance; private GParamSpec portion
	-- gulong minimum; minimum value for the property specified
	-- gulong maximum; maximum value for the property specified
	-- gulong default_value; default value for the property specified

	g_param_spec_ulong (a_const_name, a_const_nick, a_const_blurb: POINTER;
							  a_minimum, a_maximum, a_default_value: INTEGER_64; some_flags: INTEGER): POINTER is -- GParamSpec* 
			-- Creates a new GParamSpecULong instance specifying a G_TYPE_ULONG property.
		
			-- See g_param_spec_internal() for details on property names.
			-- name : canonical name of the property specified
			-- nick : nick name for the property specified
			-- blurb : description of the property specified
			-- minimum : minimum value for the property specified
			-- maximum : maximum value for the property specified
			-- default_value : default value for the property specified
			-- flags : flags for the property specified
			-- Returns : a newly created parameter specification
			-- TODO: In g_param_spec_ulong a_minimum, a_maximum, a_default_value shall be NATURAL_64 since they're guint. Currently are INTEGER_64. This can produce overflows.
		require are_valid_param_flags (some_flags)
		external "C use <glib-object.h>"
		end

feature {} -- External calls for parameter specs of int64 type
	g_is_param_spec_int_64 (a_pspec: POINTER): INTEGER
			-- Return whether the given GParamSpec is of type G_TYPE_PARAM_INT64.
		external "C macro use <glib-object.h>"
		alias "G_IS_PARAM_SPEC_INT"
		end

	g_type_param_int_64: INTEGER
			-- The GType of GParamSpecInt64.
		external "C macro use <glib-object.h>"
		alias "G_TYPE_PARAM_INT"
		end

	-- TODO: wrap if necessary GParamSpecInt64

	-- typedef struct {
	-- GParamSpec parent_instance;
 
	-- gint64 minimum;
	-- gint64 maximum;
	-- gint64 default_value;
	-- } GParamSpecInt64;

	-- A GParamSpec derived structure that contains the meta data for 64bit integer properties.
	-- GParamSpec parent_instance; private GParamSpec portion
	-- gint64 minimum; minimum value for the property specified
	-- gint64 maximum; maximum value for the property specified
	-- gint64 default_value; default value for the property specified

	g_param_spec_int64 (a_const_name, a_const_nick, a_const_blurb: POINTER; a_minimum, a_maximum, a_default_value: INTEGER_64; some_flags: INTEGER): POINTER is -- GParamSpec* 
			-- Creates a new GParamSpecInt64 instance specifying a G_TYPE_INT64 property.

			-- See g_param_spec_internal() for details on property names.
			-- name : canonical name of the property specified
			-- nick : nick name for the property specified
			-- blurb : description of the property specified
			-- minimum : minimum value for the property specified
			-- maximum : maximum value for the property specified
			-- default_value : default value for the property specified
			-- flags : flags for the property specified
			-- Returns : a newly created parameter specification
		require are_valid_param_flags (some_flags)
		external "C use <glib-object.h>"
		end

feature {} -- External calls for parameter specs of uint64 type
	g_is_param_spec_uint_64(a_pspec: POINTER): INTEGER
			-- Return whether the given GParamSpec is of type G_TYPE_PARAM_UINT64.
		external "C macro use <glib-object.h>"
		alias "G_IS_PARAM_SPEC_UINT"
		end
	
	g_type_param_uint_64: INTEGER
			-- The GType of GParamSpecUInt64.
		external "C macro use <glib-object.h>"
		alias "G_TYPE_PARAM_UINT"
		end
	
	-- TODO: wrap if necessary GParamSpecUInt64

	-- typedef struct {
	-- GParamSpec parent_instance;
 
	-- guint64 minimum;
	-- guint64 maximum;
	-- guint64 default_value;
	-- } GParamSpecUInt64;

	-- A GParamSpec derived structure that contains the meta data for unsigned 64bit integer properties.
	-- GParamSpec parent_instance; private GParamSpec portion
	-- guint64 minimum; minimum value for the property specified
	-- guint64 maximum; maximum value for the property specified
	-- guint64 default_value; default value for the property specified

	g_param_spec_uint64 (a_const_name, a_const_nick, a_const_blurb: POINTER; a_minimum, a_maximum, a_default_value: INTEGER_64; some_flags: INTEGER): POINTER is -- GParamSpec*
			-- Creates a new GParamSpecUInt64 instance specifying a G_TYPE_UINT64 property.
		
			-- See g_param_spec_internal() for details on property names.
			-- name : canonical name of the property specified
			-- nick : nick name for the property specified
			-- blurb : description of the property specified
			-- minimum : minimum value for the property specified
			-- maximum : maximum value for the property specified
			-- default_value : default value for the property specified
			-- flags : flags for the property specified
			-- Returns : a newly created parameter specification
			-- TODO: In g_param_spec_uint64 a_minimum, a_maximum, a_default_value shall be NATURAL_64 since they're guint. Currently are INTEGER_64. This can produce overflows.
		require are_valid_param_flags (some_flags)
		external "C use <glib-object.h>"
		end

feature {} -- External calls for parameter specs of float type
	g_is_param_spec_float (a_pspec: POINTER): INTEGER
			-- Return whether the given GParamSpec is of type G_TYPE_PARAM_FLOAT.
		external "C macro use <glib-object.h>"
		alias "G_IS_PARAM_SPEC_FLOAT"
		end

	g_type_param_float: INTEGER
			-- The GType of GParamSpecFloat.
		external "C macro use <glib-object.h>"
		alias "G_TYPE_PARAM_FLOAT"
		end

	-- TODO: wrap if necessary GParamSpecFloat
	
	-- typedef struct {
	-- GParamSpec parent_instance;
	
	-- gfloat minimum;
	get_min_float (spec: POINTER): REAL_32
			-- gfloat minimum; minimum value for the property specified
		external "C struct GParamSpecFloat get minumum use <glib-object.h>"
		end
	
	get_max_float (spec: POINTER): REAL_32
			-- gfloat maximum; maximum value for the property specified
		external "C struct GParamSpecFloat get maximum use <glib-object.h>"
		end
	
	get_default_float (spec: POINTER): REAL_32
			-- gfloat maximum; maximum value for the property specified
		external "C struct GParamSpecFloat get default_value use <glib-object.h>"
		end

	get_epsilon_float (spec: POINTER): REAL_32
			-- gfloat epsilon; values closer than epsilon will be
			-- considered identical by g_param_values_cmp(); the default
			-- value is 1e-30.
		external "C struct GParamSpecFloat get epsilon use <glib-object.h>"
		end
	
	g_param_spec_float (a_const_name, a_const_nick, a_const_blurb: POINTER; a_minimum, a_maximum, a_default_value: REAL_32; some_flags: INTEGER): POINTER is -- GParamSpec* 
			-- Creates a new GParamSpecFloat instance specifying a G_TYPE_FLOAT property.

			-- See g_param_spec_internal() for details on property names.
			-- name : canonical name of the property specified
			-- nick : nick name for the property specified
			-- blurb : description of the property specified
			-- minimum : minimum value for the property specified
			-- maximum : maximum value for the property specified
			-- default_value : default value for the property specified
			-- flags : flags for the property specified
			-- Returns : a newly created parameter specification
			-- TODO: In g_param_spec_float a_minimum, a_maximum, a_default_value are currently REAL_32. This could be uncorrect on some platforms.
		require are_valid_param_flags (some_flags)
		external "C use <glib-object.h>"
		end

feature {} -- External calls for parameter specs of double type
	get_min_double (spec: POINTER): REAL_64
			-- gfloat minimum; minimum value for the property specified
		external "C struct GParamSpecDouble get minumum use <glib-object.h>"
		end
	
	get_max_double (spec: POINTER): REAL_64
			-- gfloat maximum; maximum value for the property specified
		external "C struct GParamSpecDouble get maximum use <glib-object.h>"
		end
	
	get_default_double (spec: POINTER): REAL_64
			-- gfloat maximum; maximum value for the property specified
		external "C struct GParamSpecDouble get default_value use <glib-object.h>"
		end

	get_epsilon_double (spec: POINTER): REAL_64
			-- gfloat epsilon; values closer than epsilon will be
			-- considered identical by g_param_values_cmp(); the default
			-- value is 1e-30.
		external "C struct GParamSpecDouble get epsilon use <glib-object.h>"
		end
		
	g_is_param_spec_double (a_pspec: POINTER): INTEGER
			-- Return whether the given GParamSpec is of type G_TYPE_PARAM_DOUBLE.
		external "C macro use <glib-object.h>"
		alias "G_IS_PARAM_SPEC_DOUBLE"
		end
	g_type_param_double: INTEGER
			-- The GType of GParamSpecDouble.
		external "C macro use <glib-object.h>"
		alias "G_TYPE_PARAM_DOUBLE"
		end

	-- TODO: wrap if necessary GParamSpecDouble

	-- typedef struct {
	-- GParamSpec parent_instance;
 
	-- gdouble minimum;
	-- gdouble maximum;
	-- gdouble default_value;
	-- gdouble epsilon;
	-- } GParamSpecDouble;

	-- A GParamSpec derived structure that contains the meta data for double properties.
	-- GParamSpec parent_instance; private GParamSpec portion
	-- gdouble minimum; minimum value for the property specified
	-- gdouble maximum; maximum value for the property specified
	-- gdouble default_value; default value for the property specified
	-- gdouble epsilon; values closer than epsilon will be considered identical by g_param_values_cmp(); the default value is 1e-90.

	g_param_spec_double (a_const_name, a_const_nick, a_const_blurb: POINTER; a_minimum, a_maximum, a_default_value: REAL; some_flags: INTEGER): POINTER is -- GParamSpec*

			-- Creates a new GParamSpecDouble instance specifying a G_TYPE_DOUBLE property.

			-- See g_param_spec_internal() for details on property names.
			-- name : canonical name of the property specified
			-- nick : nick name for the property specified
			-- blurb : description of the property specified
			-- minimum : minimum value for the property specified
			-- maximum : maximum value for the property specified
			-- default_value : default value for the property specified
			-- flags : flags for the property specified
			-- Returns : a newly created parameter specification
		require are_valid_param_flags (some_flags)
		external "C use <glib-object.h>"
		end

feature {} -- External calls for parameter specs of enum type
	g_is_param_spec_enum (a_pspec: POINTER): INTEGER
			-- Returns whether the given GParamSpec is of type G_TYPE_PARAM_ENUM.
		external "C macro use <glib-object.h>"
		alias "G_IS_PARAM_SPEC_ENUM"
		end
	
	g_type_param_enum: INTEGER
			-- The GType of GParamSpecEnum.
		external "C macro use <glib-object.h>"
		alias "G_TYPE_PARAM_ENUM"
		end

	-- TODO: wrap if necessary GParamSpecEnum
	
	-- typedef struct {
	-- GParamSpec parent_instance;
	
	-- GEnumClass *enum_class;
	-- gint default_value;
	-- } GParamSpecEnum;

	-- A GParamSpec derived structure that contains the meta data for enum properties.
	-- GParamSpec parent_instance; private GParamSpec portion
	-- GEnumClass *enum_class; the GEnumClass for the enum
	-- gint default_value; default value for the property specified
	
	g_param_spec_enum (a_const_name, a_const_nick, a_const_blurb: POINTER; an_enum_type: INTEGER; a_default_value: INTEGER; some_flags: INTEGER): POINTER is -- GParamSpec*
			-- Creates a new GParamSpecEnum instance specifying a G_TYPE_ENUM property.
		
			-- See g_param_spec_internal() for details on property names.
			-- name : canonical name of the property specified
			-- nick : nick name for the property specified
			-- blurb : description of the property specified
			-- enum_type : a GType derived from G_TYPE_ENUM
			-- default_value : default value for the property specified
			-- flags : flags for the property specified
			-- Returns : a newly created parameter specification
		require are_valid_param_flags (some_flags)
		external "C use <glib-object.h>"
		end

feature {} -- External calls for parameter specs of flags type
	g_is_param_spec_flags (a_pspec: POINTER): INTEGER
			-- Returns whether the given GParamSpec is of type G_TYPE_PARAM_FLAGS.
		external "C macro use <glib-object.h>"
		alias "G_IS_PARAM_SPEC_FLAGS"
		end

	g_type_param_flags: INTEGER
			-- The GType of GParamSpecFlags.
		external "C macro use <glib-object.h>"
		alias "G_TYPE_PARAM_FLAGS"
		end

	-- TODO: wrap if necessary GParamSpecFlags

	-- typedef struct {
	-- GParamSpec parent_instance;
 
	-- GFlagsClass *flags_class;
	-- guint default_value;
	-- } GParamSpecFlags;

	-- A GParamSpec derived structure that contains the meta data for flags properties.
	-- GParamSpec parent_instance; private GParamSpec portion
	-- GFlagsClass *flags_class; the GFlagsClass for the flags
	-- guint default_value; default value for the property specified

	g_param_spec_flags (a_const_name, a_const_nick, a_const_blurb: POINTER; a_flags_gtype: INTEGER; a_default_value: INTEGER; some_flags: INTEGER): POINTER is -- GParamSpec* 

-- Creates a new GParamSpecEnum instance specifying a G_TYPE_FLAGS property.

-- See g_param_spec_internal() for details on property names.
-- name : canonical name of the property specified
-- nick : nick name for the property specified
-- blurb : description of the property specified
-- flags_type : a GType derived from G_TYPE_FLAGS
-- default_value : default value for the property specified
-- flags : flags for the property specified
			-- Returns : a newly created parameter specification
			-- TODO: a_default_value should be NATURAL since it is a guint. Currently it is an INTEGER
		require are_valid_param_flags (some_flags)
		external "C use <glib-object.h>"
		end

feature {} -- External calls for parameter specs of flags type

	g_is_param_spec_string (a_pspec: POINTER): INTEGER
			-- Returns whether the given GParamSpec is of type G_TYPE_PARAM_STRING.
		external "C macro use <glib-object.h>"
		alias "G_IS_PARAM_SPEC_STRING"
		end

	g_type_param_string: INTEGER
			-- The GType of GParamSpecString.
		external "C macro use <glib-object.h>"
		alias "G_TYPE_PARAM_STRING"
		end

	-- TODO: wrap if necessary GParamSpecString

	-- typedef struct {
	-- GParamSpec parent_instance;
 
	-- gchar *default_value;
	-- gchar *cset_first;
	-- gchar *cset_nth;
	-- gchar substitutor;
	-- guint null_fold_if_empty : 1;
	-- guint ensure_non_null : 1;
	-- } GParamSpecString;

	-- A GParamSpec derived structure that contains the meta data for string properties.
	-- GParamSpec parent_instance; private GParamSpec portion
	-- gchar *default_value; default value for the property specified
	-- gchar *cset_first; a string containing the allowed values for the first byte
	-- gchar *cset_nth; a string containing the allowed values for the subsequent bytes
	-- gchar substitutor; the replacement byte for bytes which don't match cset_first or cset_nth.
	-- guint null_fold_if_empty : 1; replace empty string by NULL
	-- guint ensure_non_null : 1; replace NULL strings by an empty string
	-- gchararray

	-- typedef gchar* gchararray;

	-- A C representable type name for G_TYPE_STRING.

	g_param_spec_string (a_const_name, a_const_nick, a_const_blurb: POINTER; a_const_default_value: POINTER; some_flags: INTEGER): POINTER is -- GParamSpec* 
			-- Creates a new GParamSpecString instance.
		
			-- See g_param_spec_internal() for details on property names.
			-- name : canonical name of the property specified
			-- nick : nick name for the property specified
			-- blurb : description of the property specified
			-- default_value : default value for the property specified
			-- flags : flags for the property specified
			-- Returns : a newly created parameter specification
		require are_valid_param_flags (some_flags)
		external "C use <glib-object.h>"
		end

feature {} -- TODO: External calls for parameter specs of param type
	
-- -- G_IS_PARAM_SPEC_PARAM()

-- G_IS_PARAM_SPEC_PARAM (a_pspec: POINTER) (G_TYPE_CHECK_INSTANCE_TYPE ((pspec), G_TYPE_PARAM_PARAM)) is
--  external "C macro use <glib-object.h>"
--  alias "G_IS_PARAM_SPEC_PARAM"
--  end


-- -- Returns whether the given GParamSpec is of type G_TYPE_PARAM_PARAM.
-- -- pspec : a valid GParamSpec instance
-- -- G_PARAM_SPEC_PARAM()

-- G_PARAM_SPEC_PARAM (a_pspec: POINTER) (G_TYPE_CHECK_INSTANCE_CAST ((pspec), G_TYPE_PARAM_PARAM, GParamSpecParam)) is
--  external "C macro use <glib-object.h>"
--  alias "G_PARAM_SPEC_PARAM"
--  end


-- -- Casts a GParamSpec instance into a GParamSpecParam.
-- -- pspec : a valid GParamSpec instance
-- -- G_VALUE_HOLDS_PARAM()

-- G_VALUE_HOLDS_PARAM (value)	(G_TYPE_CHECK_VALUE_TYPE ((value), G_TYPE_PARAM)) is
--  external "C macro use <glib-object.h>"
--  alias "G_VALUE_HOLDS_PARAM"
--  end


-- -- Return whether the given GValue can hold values derived from type G_TYPE_PARAM.
-- -- value : a valid GValue structure
-- -- G_TYPE_PARAM_PARAM

-- G_TYPE_PARAM_PARAM (g_param_spec_types[15]) is
--  external "C macro use <glib-object.h>"
--  alias "G_TYPE_PARAM_PARAM"
--  end


-- -- The GType of GParamSpecParam.
-- -- GParamSpecParam

-- -- typedef struct {
-- -- GParamSpec parent_instance;
-- -- } GParamSpecParam;

-- -- A GParamSpec derived structure that contains the meta data for G_TYPE_PARAM properties.
-- -- GParamSpec parent_instance; private GParamSpec portion
-- -- g_param_spec_param ()

-- -- GParamSpec* g_param_spec_param (a_const_name: POINTER, a_const_nick: POINTER, a_const_blurb: POINTER, GType param_type, GParamFlags flags);

-- -- Creates a new GParamSpecParam instance specifying a G_TYPE_PARAM property.

-- -- See g_param_spec_internal() for details on property names.
-- -- name : canonical name of the property specified
-- -- nick : nick name for the property specified
-- -- blurb : description of the property specified
-- -- param_type : a GType derived from G_TYPE_PARAM
-- -- flags : flags for the property specified
-- -- Returns : a newly created parameter specification

feature {} -- TODO: External calls for parameter specs of boxed type


-- G_IS_PARAM_SPEC_BOXED (a_pspec: POINTER) (G_TYPE_CHECK_INSTANCE_TYPE ((pspec), G_TYPE_PARAM_BOXED)) is
--  external "C macro use <glib-object.h>"
--  alias "G_IS_PARAM_SPEC_BOXED"
--  end

-- -- Return whether the given GParamSpec is of type G_TYPE_PARAM_BOXED.

-- G_TYPE_PARAM_BOXED (g_param_spec_types[16]) is
--  external "C macro use <glib-object.h>"
--  alias "G_TYPE_PARAM_BOXED"
--  end


-- -- The GType of GParamSpecBoxed.
-- -- GParamSpecBoxed

-- -- typedef struct {
-- -- GParamSpec parent_instance;
-- -- } GParamSpecBoxed;

-- -- A GParamSpec derived structure that contains the meta data for boxed properties.
-- -- GParamSpec parent_instance; private GParamSpec portion
-- -- g_param_spec_boxed ()

-- -- GParamSpec* g_param_spec_boxed (a_const_name: POINTER, a_const_nick: POINTER, a_const_blurb: POINTER, GType boxed_type, GParamFlags flags);

-- -- Creates a new GParamSpecBoxed instance specifying a G_TYPE_BOXED derived property.

-- -- See g_param_spec_internal() for details on property names.
-- -- name : canonical name of the property specified
-- -- nick : nick name for the property specified
-- -- blurb : description of the property specified
-- -- boxed_type : G_TYPE_BOXED derived type of this property
-- -- flags : flags for the property specified
-- -- Returns : a newly created parameter specification

feature {} -- External calls for parameter specs of pointer type

	g_is_param_spec_pointer (a_pspec: POINTER): INTEGER
			-- Returns whether the given GParamSpec is of type G_TYPE_PARAM_POINTER.
		external "C macro use <glib-object.h>"
		alias "G_IS_PARAM_SPEC_POINTER"
		end

	g_type_param_pointer: INTEGER
			-- The GType of GParamSpecPointer.
		external "C macro use <glib-object.h>"
		alias "G_TYPE_PARAM_POINTER"
		end

	-- TODO: wrap if necessary GParamSpecPointer

	-- typedef struct {
	-- GParamSpec parent_instance;
	-- } GParamSpecPointer;

	-- A GParamSpec derived structure that contains the meta data for pointer properties.

	g_param_spec_pointer (a_const_name, a_const_nick, a_const_blurb: POINTER; some_flags: INTEGER): POINTER is -- GParamSpec* 
			-- Creates a new GParamSpecPoiner instance specifying a pointer property.

			-- See g_param_spec_internal() for details on property names.
			-- name : canonical name of the property specified
			-- nick : nick name for the property specified
			-- blurb : description of the property specified
			-- flags : flags for the property specified
			-- Returns : a newly created parameter specification
		require are_valid_param_flags (some_flags)
		external "C use <glib-object.h>"
		end

feature	{} -- TODO: Unwrapped code
-- -- G_IS_PARAM_SPEC_OBJECT()

-- G_IS_PARAM_SPEC_OBJECT (a_pspec: POINTER) (G_TYPE_CHECK_INSTANCE_TYPE ((pspec), G_TYPE_PARAM_OBJECT)) is
--  external "C macro use <glib-object.h>"
--  alias "G_IS_PARAM_SPEC_OBJECT"
--  end


-- -- Returns whether the given GParamSpec is of type G_TYPE_PARAM_OBJECT.
-- -- pspec : a valid GParamSpec instance
-- -- G_PARAM_SPEC_OBJECT()

-- G_PARAM_SPEC_OBJECT (a_pspec: POINTER) (G_TYPE_CHECK_INSTANCE_CAST ((pspec), G_TYPE_PARAM_OBJECT, GParamSpecObject)) is
--  external "C macro use <glib-object.h>"
--  alias "G_PARAM_SPEC_OBJECT"
--  end


-- -- Casts a GParamSpec instance into a GParamSpecObject.
-- -- pspec : a valid GParamSpec instance
-- -- G_VALUE_HOLDS_OBJECT()

-- G_VALUE_HOLDS_OBJECT (value) (G_TYPE_CHECK_VALUE_TYPE ((value), G_TYPE_OBJECT)) is
--  external "C macro use <glib-object.h>"
--  alias "G_VALUE_HOLDS_OBJECT"
--  end


-- -- Return whether the given GValue can hold values derived from type G_TYPE_OBJECT.
-- -- value : a valid GValue structure
-- -- G_TYPE_PARAM_OBJECT

-- G_TYPE_PARAM_OBJECT (g_param_spec_types[19]) is
--  external "C macro use <glib-object.h>"
--  alias "G_TYPE_PARAM_OBJECT"
--  end


-- -- The GType of GParamSpecObject.
-- -- GParamSpecObject

-- -- typedef struct {
-- -- GParamSpec parent_instance;
-- -- } GParamSpecObject;

-- -- A GParamSpec derived structure that contains the meta data for object properties.
-- -- GParamSpec parent_instance; private GParamSpec portion
-- -- g_param_spec_object ()

-- -- GParamSpec* g_param_spec_object (a_const_name: POINTER, a_const_nick: POINTER, a_const_blurb: POINTER, GType object_type, GParamFlags flags);

-- -- Creates a new GParamSpecBoxed instance specifying a G_TYPE_OBJECT derived property.

-- -- See g_param_spec_internal() for details on property names.
-- -- name : canonical name of the property specified
-- -- nick : nick name for the property specified
-- -- blurb : description of the property specified
-- -- object_type : G_TYPE_OBJECT derived type of this property
-- -- flags : flags for the property specified
-- -- Returns : a newly created parameter specification
-- -- g_value_set_object ()

-- g_value_set_object (a_value: POINTER, gpointer v_object) is
--  external "C use <glib-object.h>"
--  end


-- -- Set the contents of a G_TYPE_OBJECT derived GValue to v_object.
-- -- value : a valid GValue of G_TYPE_OBJECT derived type
-- -- v_object : object value to be set
-- -- g_value_take_object ()

-- g_value_take_object (a_value: POINTER, gpointer v_object) is
--  external "C use <glib-object.h>"
--  end


-- -- Sets the contents of a G_TYPE_OBJECT derived GValue to v_object and takes over the ownership of the callers reference to v_object; the caller doesn't have to unref it any more.
-- -- value : a valid GValue of G_TYPE_OBJECT derived type
-- -- v_object : object value to be set

-- -- Since 2.4
-- -- g_value_set_object_take_ownership ()

-- -- void g_value_set_object_take_ownership
-- -- (a_value: POINTER, gpointer v_object);

-- -- Warning

-- -- g_value_set_object_take_ownership has been deprecated since version 2.4 and should not be used in newly-written code. Use g_value_take_object() instead.

-- -- This is an internal function introduced mainly for C marshallers.
-- -- value : a valid GValue of G_TYPE_OBJECT derived type
-- -- v_object : object value to be set
-- -- g_value_get_object ()

-- g_value_get_object (a_const_value: POINTER) is -- gpointer
--  external "C macro use <glib-object.h>"
--  end


-- -- Get the contents of a G_TYPE_OBJECT derived GValue.
-- -- value : a valid GValue of G_TYPE_OBJECT derived type
-- -- Returns : object contents of value
-- -- g_value_dup_object ()

-- g_value_dup_object (a_const_value: POINTER) is -- GObject*
--  external "C macro use <glib-object.h>"
--  end


-- -- Get the contents of a G_TYPE_OBJECT derived GValue, increasing its reference count.
-- -- value : a valid GValue whose type is derived from G_TYPE_OBJECT
-- -- Returns : object content of value, should be unreferenced when no longer needed.
-- -- G_IS_PARAM_SPEC_UNICHAR()

-- G_IS_PARAM_SPEC_UNICHAR (a_pspec: POINTER) (G_TYPE_CHECK_INSTANCE_TYPE ((pspec), G_TYPE_PARAM_UNICHAR)) is
--  external "C macro use <glib-object.h>"
--  alias "G_IS_PARAM_SPEC_UNICHAR"
--  end


-- -- Return whether the given GParamSpec is of type G_TYPE_PARAM_UNICHAR.
-- -- pspec : a valid GParamSpec instance
-- -- G_PARAM_SPEC_UNICHAR()

-- G_PARAM_SPEC_UNICHAR (a_pspec: POINTER) (G_TYPE_CHECK_INSTANCE_CAST ((pspec), G_TYPE_PARAM_UNICHAR, GParamSpecUnichar)) is
--  external "C macro use <glib-object.h>"
--  alias "G_PARAM_SPEC_UNICHAR"
--  end


-- -- Cast a GParamSpec instance into a GParamSpecUnichar.
-- -- pspec : a valid GParamSpec instance
-- -- G_TYPE_PARAM_UNICHAR

-- G_TYPE_PARAM_UNICHAR (g_param_spec_types[9]) is
--  external "C macro use <glib-object.h>"
--  alias "G_TYPE_PARAM_UNICHAR"
--  end


-- -- The GType of GParamSpecUnichar.
-- -- GParamSpecUnichar

-- -- typedef struct {
-- -- GParamSpec parent_instance;
 
-- -- gunichar default_value;
-- -- } GParamSpecUnichar;

-- -- A GParamSpec derived structure that contains the meta data for unichar (unsigned integer) properties.
-- -- GParamSpec parent_instance; private GParamSpec portion
-- -- gunichar default_value; default value for the property specified
-- -- g_param_spec_unichar ()

-- -- GParamSpec* g_param_spec_unichar (a_const_name: POINTER, a_const_nick: POINTER, a_const_blurb: POINTER, gunichar default_value, GParamFlags flags);

-- -- Creates a new GParamSpecUnichar instance specifying a G_TYPE_UINT property. GValue structures for this property can be accessed with g_value_set_uint() and g_value_get_uint().

-- -- See g_param_spec_internal() for details on property names.
-- -- name : canonical name of the property specified
-- -- nick : nick name for the property specified
-- -- blurb : description of the property specified
-- -- default_value : default value for the property specified
-- -- flags : flags for the property specified
-- -- Returns : a newly created parameter specification
-- -- G_IS_PARAM_SPEC_VALUE_ARRAY()

-- G_IS_PARAM_SPEC_VALUE_ARRAY (a_pspec: POINTER) (G_TYPE_CHECK_INSTANCE_TYPE ((pspec), G_TYPE_PARAM_VALUE_ARRAY)) is
--  external "C macro use <glib-object.h>"
--  alias "G_IS_PARAM_SPEC_VALUE_ARRAY"
--  end


-- -- Return whether the given GParamSpec is of type G_TYPE_PARAM_VALUE_ARRAY.
-- -- pspec : a valid GParamSpec instance
-- -- G_PARAM_SPEC_VALUE_ARRAY()

-- G_PARAM_SPEC_VALUE_ARRAY (a_pspec: POINTER) (G_TYPE_CHECK_INSTANCE_CAST ((pspec), G_TYPE_PARAM_VALUE_ARRAY, GParamSpecValueArray)) is
--  external "C macro use <glib-object.h>"
--  alias "G_PARAM_SPEC_VALUE_ARRAY"
--  end


-- -- Cast a GParamSpec instance into a GParamSpecValueArray.
-- -- pspec : a valid GParamSpec instance
-- -- G_TYPE_PARAM_VALUE_ARRAY

-- G_TYPE_PARAM_VALUE_ARRAY (g_param_spec_types[18]) is
--  external "C macro use <glib-object.h>"
--  alias "G_TYPE_PARAM_VALUE_ARRAY"
--  end


-- -- The GType of GParamSpecValueArray.
-- -- GParamSpecValueArray

-- -- typedef struct {
-- -- GParamSpec parent_instance;
-- -- GParamSpec *element_spec;
-- -- guint fixed_n_elements;
-- -- } GParamSpecValueArray;

-- -- A GParamSpec derived structure that contains the meta data for GValueArray properties.
-- -- GParamSpec parent_instance; private GParamSpec portion
-- -- GParamSpec *element_spec; a GParamSpec describing the elements contained in arrays of this property, may be NULL
-- -- guint fixed_n_elements; if greater than 0, arrays of this property will always have this many elements
-- -- g_param_spec_value_array ()

-- -- GParamSpec* g_param_spec_value_array (a_const_name: POINTER, a_const_nick: POINTER, a_const_blurb: POINTER, GParamSpec *element_spec, GParamFlags flags);

-- -- Creates a new GParamSpecValueArray instance specifying a G_TYPE_VALUE_ARRAY property. G_TYPE_VALUE_ARRAY is a G_TYPE_BOXED type, as such, GValue structures for this property can be accessed with g_value_set_boxed() and g_value_get_boxed().

-- -- See g_param_spec_internal() for details on property names.
-- -- name : canonical name of the property specified
-- -- nick : nick name for the property specified
-- -- blurb : description of the property specified
-- -- element_spec : a GParamSpec describing the elements contained in arrays of this property, may be NULL
-- -- flags : flags for the property specified
-- -- Returns : a newly created parameter specification
-- -- G_IS_PARAM_SPEC_OVERRIDE()

-- G_IS_PARAM_SPEC_OVERRIDE (a_pspec: POINTER) (G_TYPE_CHECK_INSTANCE_TYPE ((pspec), G_TYPE_PARAM_OVERRIDE)) is
--  external "C macro use <glib-object.h>"
--  alias "G_IS_PARAM_SPEC_OVERRIDE"
--  end


-- -- Returns whether the given GParamSpec is of type G_TYPE_PARAM_OVERRIDE.
-- -- pspec : a GParamSpec

-- -- Since 2.4
-- -- G_PARAM_SPEC_OVERRIDE()

-- G_PARAM_SPEC_OVERRIDE (a_pspec: POINTER) (G_TYPE_CHECK_INSTANCE_CAST ((pspec), G_TYPE_PARAM_OVERRIDE, GParamSpecOverride)) is
--  external "C macro use <glib-object.h>"
--  alias "G_PARAM_SPEC_OVERRIDE"
--  end


-- -- Casts a GParamSpec into a GParamSpecOverride.
-- -- pspec : a GParamSpec

-- -- Since 2.4
-- -- G_TYPE_PARAM_OVERRIDE

-- G_TYPE_PARAM_OVERRIDE (g_param_spec_types[20]) is
--  external "C macro use <glib-object.h>"
--  alias "G_TYPE_PARAM_OVERRIDE"
--  end


-- -- The GType of GParamSpecOverride.

-- -- Since 2.4
-- -- GParamSpecOverride

-- -- typedef struct {
-- -- } GParamSpecOverride;

-- -- This is a type of GParamSpec type that simply redirects operations to another paramspec. All operations other than getting or setting the value are redirected, including accessing the nick and blurb, validating a value, and so forth. See g_param_spec_get_redirect_target() for retrieving the overidden property. GParamSpecOverride is used in implementing g_object_class_override_property(), and will not be directly useful unless you are implementing a new base type similar to GObject.

-- -- Since 2.4
-- -- g_param_spec_override ()

-- -- GParamSpec* g_param_spec_override (a_const_name: POINTER, GParamSpec *overridden);

-- -- Creates a new property of type GParamSpecOverride. This is used to direct operations to another paramspec, and will not be directly useful unless you are implementing a new base type similar to GObject.
-- -- name : the name of the property.
-- -- overridden : The property that is being overridden
-- -- Returns : the newly created GParamSpec

-- -- Since 2.4
-- -- G_IS_PARAM_SPEC_GTYPE()

-- G_IS_PARAM_SPEC_GTYPE (a_pspec: POINTER) (G_TYPE_CHECK_INSTANCE_TYPE ((pspec), G_TYPE_PARAM_GTYPE)) is
--  external "C macro use <glib-object.h>"
--  alias "G_IS_PARAM_SPEC_GTYPE"
--  end


-- -- Returns whether the given GParamSpec is of type G_TYPE_PARAM_GTYPE.
-- -- pspec : a GParamSpec

-- -- Since 2.10
-- -- G_PARAM_SPEC_GTYPE()

-- G_PARAM_SPEC_GTYPE (a_pspec: POINTER) (G_TYPE_CHECK_INSTANCE_CAST ((pspec), G_TYPE_PARAM_GTYPE, GParamSpecGType)) is
--  external "C macro use <glib-object.h>"
--  alias "G_PARAM_SPEC_GTYPE"
--  end


-- -- Casts a GParamSpec into a GParamSpecGType.
-- -- pspec : a GParamSpec

-- -- Since 2.10
-- -- G_TYPE_PARAM_GTYPE

-- G_TYPE_PARAM_GTYPE (g_param_spec_types[21]) is
--  external "C macro use <glib-object.h>"
--  alias "G_TYPE_PARAM_GTYPE"
--  end


-- -- The GType of GParamSpecGType.

-- -- Since 2.10
-- -- GParamSpecGType

-- -- typedef struct {
-- -- GParamSpec parent_instance;
-- -- GType is_a_type;
-- -- } GParamSpecGType;

-- -- A GParamSpec derived structure that contains the meta data for GType properties.
-- -- GParamSpec parent_instance; private GParamSpec portion
-- -- GType is_a_type; a GType whose subtypes can occur as values

-- -- Since 2.10
-- -- g_param_spec_gtype ()

-- -- GParamSpec* g_param_spec_gtype (a_const_name: POINTER, a_const_nick: POINTER, a_const_blurb: POINTER, GType is_a_type, GParamFlags flags);

-- -- Creates a new GParamSpecGType instance specifying a G_TYPE_GTYPE property.

-- -- See g_param_spec_internal() for details on property names.
-- -- name : canonical name of the property specified
-- -- nick : nick name for the property specified
-- -- blurb : description of the property specified
-- -- is_a_type : a GType whose subtypes are allowed as values of the property (use G_TYPE_NONE for any type)
-- -- flags : flags for the property specified
-- -- Returns : a newly created parameter specification

-- -- Since 2.10
-- -- See Also

-- -- GParamSpec, GValue, g_object_class_install_property().

end
