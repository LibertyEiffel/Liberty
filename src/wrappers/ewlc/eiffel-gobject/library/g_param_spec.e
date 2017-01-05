note
	description: "GParamSpec, Metadata for parameter specifications"
	copyright: "[
					Copyright (C) 2006-2017: eiffel-libraries team, GTK+ team
					Copyright (C) 2008-2017: Raphael Mack
					
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
				
class G_PARAM_SPEC
	-- GParamSpec is an object structure that encapsulates the metadata
	-- required to specify parameters, such as e.g. GObject properties.
	
	-- Parameter names need to start with a letter (a-z or
	-- A-Z). Subsequent characters can be letters, numbers or a
	-- '-'. All other characters are replaced by a '-' during
	-- construction.

	-- Note: this class in an Eiffel-only design would have been deferred. 
	-- It is used as a quicker way to handle parameter specification 
	-- of unknown type without having to write a big inspect clause.

	-- When the parameter specification type is known it is better to 
	-- use the correct heir; i.e. G_PARAM_SPEC_BOOLEAN.
	
inherit
	C_STRUCT
		redefine 
			from_external_pointer
		end
	MIXED_MEMORY_HANDLING 
	-- TODO: check it C_OWNED is actually better.	
	--	undefine from_external_pointer end
insert
	G_PARAM_SPEC_EXTERNALS
	G_TYPE_EXTERNALS

create {ANY} from_external_pointer
	
feature {ANY} -- Creation
	from_external_pointer (a_ptr: POINTER)
			-- TODO: G_PARAM_SPEC should be deferred and its place should be taken by specialized heirs such as G_PARAM_SPEC_BOOLEAN
		do
			Precursor {C_STRUCT} (a_ptr)
			owner_class := g_type_class_peek (get_owner_type (a_ptr))
			param_id := get_param_id (a_ptr)
		end

feature {ANY} -- Flags

	flags: INTEGER
		do
			Result := get_flags (handle)
		ensure are_valid_param_flags (Result)
		end

	is_readable: BOOLEAN
			-- Is Current parameter readable?
		do
			Result:= (flags & g_param_readable).to_boolean
		end

	is_writable: BOOLEAN
			-- Is Current parameter writable?
		do
			Result:= (flags & g_param_writable).to_boolean
		end

	is_set_at_construction: BOOLEAN
			-- Will the parameter be set upon object construction?
		do
			Result:= (flags & g_param_construct).to_boolean
		end
	
	is_set_only_at_construction: BOOLEAN
			-- Will the parameter only be set upon object construction?
		do
			Result:= (flags & g_param_construct_only).to_boolean
		end

	-- TODO: find a better, not-clashing name for is_readable: BOOLEAN
	-- is -- Is strict validation not required upon parameter
	-- conversion?  (see `convert') do Result:=
	-- flags.bit_test(g_param_lax_validation_bit) end
	

-- Doesn't work in GTK 2.6
--	is_static_name: BOOLEAN is
			-- Is the string used as name when constructing the parameter
			-- guaranteed to remain valid and unmodified for the lifetime
			-- of the parameter?
--		do
--			Result:= (flags & g_param_static_name).to_boolean
--		end

-- Doesn't work in GTK 2.6
--	is_static_blurb: BOOLEAN is
			-- Is the string used as blurb when constructing the parameter
			-- guaranteed to remain valid and unmodified for the lifetime
			-- of the parameter?
--		do
--			Result:= (flags & g_param_static_blurb).to_boolean
--		end

	is_readwrite: BOOLEAN
			-- Is parameter read/write?
		do
			Result := (flags & g_param_readwrite).to_boolean
		ensure definition: Result implies (is_readable and is_writable)
		end

feature {ANY}
	set_default (a_value: G_VALUE)
			-- Sets `a_value' to its default value as specified in Current.
		require valid_value: a_value /= Void
			-- TODO a GValue of correct type for current
		do
			g_param_value_set_default (handle, a_value.handle)
		end

	is_default_value (a_value: G_VALUE): BOOLEAN
			-- Does `a_value' contains the default value specified in
			-- Current?
		require
			value_not_void: a_value /= Void
			correct_value_type: a_value.type = value_gtype
		do
			Result:=(g_param_value_defaults(handle,a_value.handle)).to_boolean
		end

	validate (a_value: G_VALUE): BOOLEAN
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

	convert (a_source, a_destination: G_VALUE; strict_validation: BOOLEAN): BOOLEAN
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

	compare (value1,value2: G_VALUE): INTEGER
			-- Compares value1 with value2 according to Current, and
			-- return -1, 0 or +1, if value1 is found to be less than,
			-- equal to or greater than value2, respectively.
		require -- TODO value1 and 2: a GValue of correct type for pspec
		do
			Result := (g_param_values_cmp (handle,value1.handle,value2.handle))
		end
	

feature {ANY} -- queries
	name: STRING
			-- the name of a G_PARAM_SPEC
		do
			--create 
			--Result.from_external_copy(g_param_spec_get_name(handle))
			create {CONST_STRING} Result.from_external(g_param_spec_get_name(handle))
		end

	nick: STRING
			-- the nick of a G_PARAM_SPEC
		do
			--create 
			--Result.from_external_copy(g_param_spec_get_nick(handle))
			create {CONST_STRING} Result.from_external(g_param_spec_get_nick(handle))
		end
	
	blurb: STRING
			-- the blurb of a G_PARAM_SPEC
		do
			-- create Result.from_external_copy(g_param_spec_get_blurb(handle))
			create {CONST_STRING} Result.from_external(g_param_spec_get_blurb(handle))
		end

feature {ANY} 
	is_initialized: BOOLEAN
			-- Is hidden implementation data correctly initialized?
		do
			Result := (owner_class.is_not_null and (param_id /= 0))
		end

feature {WRAPPER} -- Implementation 
	owner_class: POINTER
			-- The GObjectClass the created and installed the corresponding property
	param_id: INTEGER 
			-- The parameter id to be passed to the property
			-- setter/getter function
feature {ANY} -- name validity
	is_a_valid_name (a_string: STRING): BOOLEAN
			-- Does `a_string' comply with the rules for G_PARAM_SPEC names?
		do
			-- When creating and looking up a GParamSpec, either separator can be used, but they cannot be mixed. Using '-' is considerably more efficient and in fact required when using property names as detail strings for signals.
			not_yet_implemented
		end

	type_name: STRING
			-- the GType name of this parameter spec.
		do
			create Result.from_external_copy (g_param_spec_type(handle))
		ensure result_not_void: Result /= Void
		end

	value_gtype: INTEGER
			-- the GType to initialize a GValue for this parameter.
		do
			Result:= g_param_spec_value_type (handle)
			ensure 
				is_valid_gtype: -- TODO: since this require a somehow
				-- complete G_TYPES class
		end

feature {} -- Creation

	make_integer (a_name,a_nick,a_blurb: STRING;
				  a_min,a_max,a_default: INTEGER; some_flags: INTEGER)
			-- Creates a parameter specification for an integer setting.
			-- `a_name' is the canonical name of the property specified,
			-- `a_nick' is the nick name for the property specified,
			-- `a_blurb' is a description of the property specified.
			--`a_default' is the default value for the property
			--`some_flags' are flags for the property specified
		require
			max_greater_than_min: a_min < a_max
				default_in_range: a_default.in_range (a_min, a_max)
		do
			handle := g_param_spec_int (a_name.to_external, a_nick.to_external, a_blurb.to_external,
										 a_min, a_max, a_default,
										 some_flags)
			-- Note: where Gobject type system took this?
			owner_class := g_type_class_peek(get_owner_type(handle))
			param_id := get_param_id (handle)
		ensure is_integer: is_integer
		end

feature {ANY} -- Boolean parameter
	is_boolean: BOOLEAN
			-- Is this a boolean parameter?
		do
			Result := g_is_param_spec_boolean (handle).to_boolean
		end

	default_boolean: BOOLEAN
			-- default boolean value
		do
			Result := default_gboolean(handle).to_boolean
		end

feature {ANY} -- Integer parameter
	is_integer: BOOLEAN
			-- Is this an integer parameter?
		do
			Result := g_is_param_spec_int (handle).to_boolean
		end

	default_integer: INTEGER
			-- The default integer value
		require is_integer: is_integer
		do
			Result := get_default_int (handle)
		end

	minimum_integer: INTEGER
			-- The minimum integer value
		require is_integer: is_integer
		do
			Result := get_min_int (handle)
		end

	maximum_integer: INTEGER
			-- The maximum integer value
		require is_integer: is_integer
		do
			Result := get_max_int (handle)
		end

feature {} -- Natural parameter
	is_natural: BOOLEAN
			-- Is this a natural parameter?
		do
			Result := (g_is_param_spec_uint (handle).to_boolean)
		end

	default_natural: INTEGER
			-- The default natural value
		require is_natural: is_natural
		do
			Result := get_default_uint (handle)
		end

	minimum_natural: INTEGER
			-- The minimum natural value
		require is_natural: is_natural
		do
			Result := get_min_uint (handle)
		end

	maximum_natural: INTEGER
			-- The maximum natural value
		require is_natural: is_natural
		do
			Result := get_max_uint (handle)
		end

feature {ANY} -- TODO: INTEGER_64 (int64) parameter

feature {ANY} -- TODO: long parameter. Note: could it be the same of INTEGER_64?

feature {ANY} -- TODO: unsigned long parameter. Note: could it be the same of an eventual NATURAL_64?
feature {ANY} -- TODO: NATURAL_64 (uint64) parameter

feature {ANY} -- TODO: REAL_32 (float) parameter
	is_real_32: BOOLEAN
			-- Is this an integer parameter?
		do
			Result := g_is_param_spec_float (handle).to_boolean
		end

	default_real_32: REAL_32
			-- The default integer value
		require is_real_32: is_real_32
		do
			Result := get_default_float (handle)
		end

	minimum_real_32: REAL_32
			-- The minimum real_32 value
		require is_real_32: is_real_32
		do
			Result := get_min_float (handle)
		end

	maximum_real_32: REAL_32
			-- The maximum real_32 value
		require is_real_32: is_real_32
		do
			Result := get_max_float (handle)
		end

feature {ANY} -- TODO: REAL_64 (double) parameter
	is_real_64: BOOLEAN
			-- Is this an real_64 parameter?
		do
			Result := g_is_param_spec_double (handle).to_boolean
		end

	default_real_64: REAL_64
			-- The default integer value
		require is_real_64: is_real_64
		do
			Result := get_default_double (handle)
		end

	minimum_real_64: REAL_64
			-- The minimum real_64 value
		require is_real_64: is_real_64
		do
			Result := get_min_double (handle)
		end

	maximum_real_64: REAL_64
			-- The maximum real_64 value
		require is_real_64: is_real_64
		do
			Result := get_max_double (handle)
		end

feature {ANY} -- TODO: enum parameter. Note: this need a wrapper for G_ENUM
	is_enum: BOOLEAN
			-- Is this an enumeration (Enum in C) parameter?
		do
			Result := (g_is_param_spec_enum (handle).to_boolean)
		end


feature {ANY} -- TODO: flags parameter. Note: this could need a wrapper for G_FLAG_CLASS and G_FLAG_VALUE

feature {ANY} -- TODO: STRING parameter
	is_string: BOOLEAN
			-- Is this a string parameter?
		do
			Result := (g_is_param_spec_string (handle).to_boolean)
		end


feature {ANY} -- TODO: G_PARAM_SPEC parameter 
	-- Note: call me dumb but it seems a little too recursive IMHO. Paolo 2006-06-28
feature {ANY} -- TODO: G_BOXED parameter. Note: this require a wrapper for G_BOXED
feature {ANY} -- TODO: POINTER parameter. Note: is this really needed? Paolo 2006-06-28
feature {ANY} -- TODO: G_OBJECT parameter

feature {ANY} -- TODO: UNICODE CHARACTER parameter
	
feature {ANY} -- CHARACTER parameter
	is_character: BOOLEAN
			-- Is this a character parameter?
		do
			Result := g_is_param_spec_char (handle).to_boolean
		end

	default_character: CHARACTER
			-- The default character value
		require is_character: is_character
		do
			Result := def_char (handle).to_character
		end

	minimum_character: CHARACTER
			-- The minimum character value
		require is_character: is_character
		do
			Result := min_char (handle).to_character
		end

	maximum_character: CHARACTER
			-- The maximum character value
		require is_character: is_character
		do
			Result := max_char (handle).to_character
		end
	
feature {ANY} -- TODO: (if meaningful) unsigned char parameter
feature {ANY} -- TODO: G_VALUE_ARRAY parameter
feature {ANY} -- TODO: override parameter
feature {ANY} -- TODO: (if meaningful) G_TYPE parameter


feature {} -- Unwrapped API
	
--   GParamSpec

--  typedef struct {
--    GTypeInstance  g_type_instance;

--    gchar         *name;
--    GParamFlags    flags;
--    GType          value_type;
--    GType          owner_type;    /* class or interface using this property */
--  } GParamSpec;

--    All fields of the GParamSpec struct are private and should not be used
--    directly, except for the following:

--    GTypeInstance g_type_instance; private GTypeInstance portion
--    gchar *name;                   name of this parameter
--    GParamFlags flags;             GParamFlags flags for this parameter
--    GType value_type;              the GValue type for this parameter
--    GType owner_type;              GType type that uses (introduces) this
--                                   paremeter

--    -----------------------------------------------------------------------

--   GParamSpecClass

--  typedef struct {
--    GTypeClass      g_type_class;

--    GType           value_type;

--    void          (*finalize)             (GParamSpec   *pspec);

--    /* GParam methods */
--    void          (*value_set_default)    (GParamSpec   *pspec,
--                                           GValue       *value);
--    gboolean      (*value_validate)       (GParamSpec   *pspec,
--                                           GValue       *value);
--    gint          (*values_cmp)           (GParamSpec   *pspec,
--                                           const GValue *value1,
--                                           const GValue *value2);
--  } GParamSpecClass;

--    The class structure for the GParamSpec type. Normally, GParamSpec
--    classes are filled by g_param_type_register_static().

--    GTypeClass g_type_class; the parent class
--    GType value_type;        the GValue type for this parameter
--    finalize ()              The instance finalization function (optional),
--                             should chain up to the finalize method of the
--                             parent class.
--    value_set_default ()     Resets a value to the default value for this
--                             type (recommended, the default is
--                             g_value_reset()), see
--                             g_param_value_set_default().
--    value_validate ()        Ensures that the contents of value comply with
--                             the specifications set out by this type
--                             (optional), see g_param_value_set_validate().
--    values_cmp ()            Compares value1 with value2 according to this
--                             type (recommended, the default is memcmp()),
--                             see g_param_values_cmp().

--    -----------------------------------------------------------------------

--   enum GParamFlags

--  typedef enum
--  {
--    G_PARAM_READABLE            = 1 < < 0,
--    G_PARAM_WRITABLE            = 1 < < 1,
--    G_PARAM_CONSTRUCT           = 1 < < 2,
--    G_PARAM_CONSTRUCT_ONLY      = 1 < < 3,
--    G_PARAM_LAX_VALIDATION      = 1 < < 4,
--    G_PARAM_STATIC_NAME         = 1 < < 5,
--  #ifndef G_DISABLE_DEPRECATED
--    G_PARAM_PRIVATE             = G_PARAM_STATIC_NAME,
--  #endif
--    G_PARAM_STATIC_NICK         = 1 < < 6,
--    G_PARAM_STATIC_BLURB        = 1 < < 7
--  } GParamFlags;

--    Through the GParamFlags flag values, certain aspects of parameters can
--    be configured.

--    G_PARAM_READABLE       the parameter is readable
--    G_PARAM_WRITABLE       the parameter is writable
--    G_PARAM_CONSTRUCT      the parameter will be set upon object
--                           construction
--    G_PARAM_CONSTRUCT_ONLY the parameter will only be set upon object
--                           construction
--    G_PARAM_LAX_VALIDATION upon parameter conversion (see
--                           g_param_value_convert()) strict validation is
--                           not required
--    G_PARAM_STATIC_NAME    the string used as name when constructing the
--                           parameter is guaranteed to remain valid and
--                           unmodified for the lifetime of the parameter.
--                           Since 2.8
--    G_PARAM_STATIC_BLURB   the string used as blurb when constructing the
--                           parameter is guaranteed to remain valid and
--                           unmodified for the lifetime of the parameter.
--                           Since 2.8

--    -----------------------------------------------------------------------

--   G_PARAM_READWRITE

--  #define G_PARAM_READWRITE       (G_PARAM_READABLE | G_PARAM_WRITABLE)

--    GParamFlags value alias for G_PARAM_READABLE | G_PARAM_WRITABLE.

--    -----------------------------------------------------------------------

--   G_PARAM_MASK

--  #define G_PARAM_MASK            (0x000000ff)

--    Mask containing the bits of GParamSpec.flags which are reserved for
--    GLib.

--    -----------------------------------------------------------------------

--   G_PARAM_USER_SHIFT

--  #define G_PARAM_USER_SHIFT      (8)

--    Minimum shift count to be used for user defined flags, to be stored in
--    GParamSpec.flags.

--    -----------------------------------------------------------------------

--   g_param_spec_ref ()

--  GParamSpec* g_param_spec_ref                (GParamSpec *pspec);

--    Increments the reference count of pspec.

--    pspec :   a valid GParamSpec
--    Returns : the GParamSpec that was passed into this function

--    -----------------------------------------------------------------------

--   g_param_spec_unref ()

--  void        g_param_spec_unref              (GParamSpec *pspec);

--    Decrements the reference count of a pspec.

--    pspec : a valid GParamSpec

--    -----------------------------------------------------------------------

--   g_param_spec_sink ()

--  void        g_param_spec_sink               (GParamSpec *pspec);

--    The initial reference count of a newly created GParamSpec is 1, even
--    though no one has explicitly called g_param_spec_ref() on it yet. So
--    the initial reference count is flagged as "floating", until someone
--    calls g_param_spec_ref (pspec); g_param_spec_sink (pspec); in sequence
--    on it, taking over the initial reference count (thus ending up with a
--    pspec that has a reference count of 1 still, but is not flagged
--    "floating" anymore).

--    pspec : a valid GParamSpec

--    -----------------------------------------------------------------------

--   g_param_spec_ref_sink ()

--  GParamSpec* g_param_spec_ref_sink           (GParamSpec *pspec);

--    Convenience function to ref and sink a GParamSpec.

--    pspec :   a valid GParamSpec
--    Returns : the GParamSpec that was passed into this function

--    Since 2.10

--    -----------------------------------------------------------------------

--   g_param_value_set_default ()

--  void        g_param_value_set_default       (GParamSpec *pspec,
--                                               GValue *value);

--    Sets value to its default value as specified in pspec.

--    pspec : a valid GParamSpec
--    value : a GValue of correct type for pspec

--    -----------------------------------------------------------------------

--   g_param_value_defaults ()

--  gboolean    g_param_value_defaults          (GParamSpec *pspec,
--                                               GValue *value);

--    Checks whether value contains the default value as specified in pspec.

--    pspec :   a valid GParamSpec
--    value :   a GValue of correct type for pspec
--    Returns : whether value contains the canonical defualt for this pspec

--    -----------------------------------------------------------------------

--   g_param_value_validate ()

--  gboolean    g_param_value_validate          (GParamSpec *pspec,
--                                               GValue *value);

--    Ensures that the contents of value comply with the specifications set
--    out by pspec. For example, a GParamSpecInt might require that integers
--    stored in value may not be smaller than -42 and not be greater than
--    +42. If value contains an integer outside of this range, it is modified
--    accordingly, so the resulting value will fit into the range -42 .. +42.

--    pspec :   a valid GParamSpec
--    value :   a GValue of correct type for pspec
--    Returns : whether modifying value was necessary to ensure validity

--    -----------------------------------------------------------------------

--   g_param_value_convert ()

--  gboolean    g_param_value_convert           (GParamSpec *pspec,
--                                               const GValue *src_value,
--                                               GValue *dest_value,
--                                               gboolean strict_validation);

--    Transforms src_value into dest_value if possible, and then validates
--    dest_value, in order for it to conform to pspec. If strict_validation
--    is TRUE this function will only succeed if the transformed dest_value
--    complied to pspec without modifications. See also
--    g_value_type_transformable(), g_value_transform() and
--    g_param_value_validate().

--    pspec :             a valid GParamSpec
--    src_value :         souce GValue
--    dest_value :        destination GValue of correct type for pspec
--    strict_validation : TRUE requires dest_value to conform to pspec
--                        without modifications
--    Returns :           TRUE if transformation and validation were
--                        successful, FALSE otherwise and dest_value is left
--                        untouched.

--    -----------------------------------------------------------------------

--   g_param_values_cmp ()

--  gint        g_param_values_cmp              (GParamSpec *pspec,
--                                               const GValue *value1,
--                                               const GValue *value2);

--    Compares value1 with value2 according to pspec, and return -1, 0 or +1,
--    if value1 is found to be less than, equal to or greater than value2,
--    respectively.

--    pspec :   a valid GParamSpec
--    value1 :  a GValue of correct type for pspec
--    value2 :  a GValue of correct type for pspec
--    Returns : -1, 0 or +1, for a less than, equal to or greater than result

--    -----------------------------------------------------------------------

--   g_param_spec_get_name ()

--  const gchar* g_param_spec_get_name          (GParamSpec *pspec);

--    Returns the name of a GParamSpec.

--    pspec :   a valid GParamSpec
--    Returns : the name of pspec.

--    -----------------------------------------------------------------------

--   g_param_spec_get_nick ()

--  const gchar* g_param_spec_get_nick          (GParamSpec *pspec);

--    Returns the nickname of a GParamSpec.

--    pspec :   a valid GParamSpec
--    Returns : the nickname of pspec.

--    -----------------------------------------------------------------------

--   g_param_spec_get_blurb ()

--  const gchar* g_param_spec_get_blurb         (GParamSpec *pspec);

--    Returns the short description of a GParamSpec.

--    pspec :   a valid GParamSpec
--    Returns : the short description of pspec.

--    -----------------------------------------------------------------------

--   g_param_spec_get_qdata ()

--  gpointer    g_param_spec_get_qdata          (GParamSpec *pspec,
--                                               GQuark quark);

--    Gets back user data pointers stored via g_param_spec_set_qdata().

--    pspec :   a valid GParamSpec
--    quark :   a GQuark, naming the user data pointer
--    Returns : the user data pointer set, or NULL

--    -----------------------------------------------------------------------

--   g_param_spec_set_qdata ()

--  void        g_param_spec_set_qdata          (GParamSpec *pspec,
--                                               GQuark quark,
--                                               gpointer data);

--    Sets an opaque, named pointer on a GParamSpec. The name is specified
--    through a GQuark (retrieved e.g. via g_quark_from_static_string()), and
--    the pointer can be gotten back from the pspec with
--    g_param_spec_get_qdata(). Setting a previously set user data pointer,
--    overrides (frees) the old pointer set, using NULL as pointer
--    essentially removes the data stored.

--    pspec : the GParamSpec to set store a user data pointer
--    quark : a GQuark, naming the user data pointer
--    data :  an opaque user data pointer

--    -----------------------------------------------------------------------

--   g_param_spec_set_qdata_full ()

--  void        g_param_spec_set_qdata_full     (GParamSpec *pspec,
--                                               GQuark quark,
--                                               gpointer data,
--                                               GDestroyNotify destroy);

--    This function works like g_param_spec_set_qdata(), but in addition, a
--    void (*destroy) (gpointer) function may be specified which is called
--    with data as argument when the pspec is finalized, or the data is being
--    overwritten by a call to g_param_spec_set_qdata() with the same quark.

--    pspec :   the GParamSpec to set store a user data pointer
--    quark :   a GQuark, naming the user data pointer
--    data :    an opaque user data pointer
--    destroy : function to invoke with data as argument, when data needs to
--              be freed

--    -----------------------------------------------------------------------

--   g_param_spec_steal_qdata ()

--  gpointer    g_param_spec_steal_qdata        (GParamSpec *pspec,
--                                               GQuark quark);

--    Gets back user data pointers stored via g_param_spec_set_qdata() and
--    removes the data from pspec without invoking it's destroy() function
--    (if any was set). Usually, calling this function is only required to
--    update user data pointers with a destroy notifier.

--    pspec :   the GParamSpec to get a stored user data pointer from
--    quark :   a GQuark, naming the user data pointer
--    Returns : the user data pointer set, or NULL

--    -----------------------------------------------------------------------

--   g_param_spec_get_redirect_target ()

--  GParamSpec* g_param_spec_get_redirect_target
--                                              (GParamSpec *pspec);

--    If the paramspec redirects operations to another paramspec, returns
--    that paramspec. Redirect is used typically for providing a new
--    implementation of a property in a derived type while preserving all the
--    properties from the parent type. Redirection is established by creating
--    a property of type GParamSpecOverride. See g_object_override_property()
--    for an example of the use of this capability.

--    pspec :   a GParamSpec
--    Returns : paramspec to which requests on this paramspec should be
--              redirected, or NULL if none.

--    Since 2.4

--    -----------------------------------------------------------------------

--   g_param_spec_internal ()

--  gpointer    g_param_spec_internal           (GType param_type,
--                                               const gchar *name,
--                                               const gchar *nick,
--                                               const gchar *blurb,
--                                               GParamFlags flags);

--    Creates a new GParamSpec instance.

--    A property name consists of segments consisting of ASCII letters and
--    digits, separated by either the '-' or '_' character. The first
--    character of a property name must be a letter. Names which violate
--    these rules lead to undefined behaviour.

--    When creating and looking up a GParamSpec, either separator can be
--    used, but they cannot be mixed. Using '-' is considerably more
--    efficient and in fact required when using property names as detail
--    strings for signals.

--    param_type : the GType for the property; must be derived from
--                 G_TYPE_PARAM
--    name :       the canonical name of the property
--    nick :       the nickname of the property
--    blurb :      a short description of the property
--    flags :      a combination of GParamFlags
--    Returns :    a newly allocated GParamSpec instance

--    -----------------------------------------------------------------------

--   GParamSpecTypeInfo

--  typedef struct {
--    /* type system portion */
--    guint16         instance_size;                               /* obligatory */
--    guint16         n_preallocs;                                 /* optional */
--    void          (*instance_init)        (GParamSpec   *pspec); /* optional */

--    /* class portion */
--    GType           value_type;                                  /* obligatory */
--    void          (*finalize)             (GParamSpec   *pspec); /* optional */
--    void          (*value_set_default)    (GParamSpec   *pspec,  /* recommended */
--                                           GValue       *value);
--    gboolean      (*value_validate)       (GParamSpec   *pspec,  /* optional */
--                                           GValue       *value);
--    gint          (*values_cmp)           (GParamSpec   *pspec,  /* recommended */
--                                           const GValue *value1,
--                                           const GValue *value2);
--  } GParamSpecTypeInfo;

--    This structure is used to provide the type system with the information
--    required to initialize and destruct (finalize) a parameter's class and
--    instances thereof. The initialized structure is passed to the
--    g_param_type_register_static() The type system will perform a deep copy
--    of this structure, so it's memory does not need to be persistent across
--    invocation of g_param_type_register_static().

--    guint16 instance_size; Size of the instance (object) structure.
--    guint16 n_preallocs;   Prior to GLib 2.10, it specified the number of
--                           pre-allocated (cached) instances to reserve
--                           memory for (0 indicates no caching). Since GLib
--                           2.10, it is ignored, since instances are
--                           allocated with the slice allocator now.
--    instance_init ()       Location of the instance initialization function
--                           (optional).
--    GType value_type;      The GType of values conforming to this
--                           GParamSpec
--    finalize ()            The instance finalization function (optional).
--    value_set_default ()   Resets a value to the default value for pspec
--                           (recommended, the default is g_value_reset()),
--                           see g_param_value_set_default().
--    value_validate ()      Ensures that the contents of value comply with
--                           the specifications set out by pspec (optional),
--                           see g_param_value_set_validate().
--    values_cmp ()          Compares value1 with value2 according to pspec
--                           (recommended, the default is memcmp()), see
--                           g_param_values_cmp().

--    -----------------------------------------------------------------------

--   g_param_type_register_static ()

--  GType       g_param_type_register_static    (const gchar *name,
--                                               const GParamSpecTypeInfo *pspec_info);

--    Registers name as the name of a new static type derived from
--    G_TYPE_PARAM. The type system uses the information contained in the
--    GParamSpecTypeInfo structure pointed to by info to manage the
--    GParamSpec type and its instances.

--    name :       0-terminated string used as the name of the new GParamSpec
--                 type.
--    pspec_info : The GParamSpecTypeInfo for this GParamSpec type.
--    Returns :    The new type identifier.

--    -----------------------------------------------------------------------

--   GParamSpecPool

--  typedef struct _GParamSpecPool GParamSpecPool;

--    A GParamSpecPool maintains a collection of GParamSpecs which can be
--    quickly accessed by owner and name. The implementation of the GObject
--    property system uses such a pool to store the GParamSpecs of the
--    properties all object types.

--    -----------------------------------------------------------------------

--   g_param_spec_pool_new ()

--  GParamSpecPool* g_param_spec_pool_new       (gboolean type_prefixing);

--    Creates a new GParamSpecPool.

--    If type_prefixing is TRUE, lookups in the newly created pool will allow
--    to specify the owner as a colon-separated prefix of the property name,
--    like "GtkContainer:border-width". This feature is deprecated, so you
--    should always set type_prefixing to FALSE.

--    type_prefixing : Whether the pool will support type-prefixed property
--                     names.
--    Returns :        a newly allocated GParamSpecPool.

--    -----------------------------------------------------------------------

--   g_param_spec_pool_insert ()

--  void        g_param_spec_pool_insert        (GParamSpecPool *pool,
--                                               GParamSpec *pspec,
--                                               GType owner_type);

--    Inserts a GParamSpec in the pool.

--    pool :       a GParamSpecPool.
--    pspec :      the GParamSpec to insert
--    owner_type : a GType identifying the owner of pspec

--    -----------------------------------------------------------------------

--   g_param_spec_pool_remove ()

--  void        g_param_spec_pool_remove        (GParamSpecPool *pool,
--                                               GParamSpec *pspec);

--    Removes a GParamSpec from the pool.

--    pool :  a GParamSpecPool
--    pspec : the GParamSpec to remove

--    -----------------------------------------------------------------------

--   g_param_spec_pool_lookup ()

--  GParamSpec* g_param_spec_pool_lookup        (GParamSpecPool *pool,
--                                               const gchar *param_name,
--                                               GType owner_type,
--                                               gboolean walk_ancestors);

--    Looks up a GParamSpec in the pool.

--    pool :           a GParamSpecPool
--    param_name :     the name to look for
--    owner_type :     the owner to look for
--    walk_ancestors : If TRUE, also try to find a GParamSpec with param_name
--                     owned by an ancestor of owner_type.
--    Returns :        The found GParamSpec, or NULL if no matching
--                     GParamSpec was found.

--    -----------------------------------------------------------------------

--   g_param_spec_pool_list ()

--  GParamSpec** g_param_spec_pool_list         (GParamSpecPool *pool,
--                                               GType owner_type,
--                                               guint *n_pspecs_p);

--    Gets an array of all GParamSpecs owned by owner_type in the pool.

--    pool :       a GParamSpecPool
--    owner_type : the owner to look for
--    n_pspecs_p : return location for the length of the returned array
--    Returns :    a newly allocated array containing pointers to all
--                 GParamSpecs owned by owner_type in the pool

--    -----------------------------------------------------------------------

--   g_param_spec_pool_list_owned ()

--  GList*      g_param_spec_pool_list_owned    (GParamSpecPool *pool,
--                                               GType owner_type);

--    Gets an GList of all GParamSpecs owned by owner_type in the pool.

--    pool :       a GParamSpecPool
--    owner_type : the owner to look for
--    Returns :    a GList of all GParamSpecs owned by owner_type in the
--                 poolGParamSpecs.
feature {ANY} -- size

	struct_size: INTEGER
		external "C use <glib-object.h>"
		alias "sizeof(GParamSpec)"
		end

	-- invariant 
	-- is_shared: is_shared
	-- initialized: is_initialized
end
