indexing
	description: "GdaParameter -- Represents a GValue with various attributes"
	copyright: "[
					Copyright (C) 2006 Paolo Redaelli, GTK+ team
					
					This library is free software; you can redistribute it and/or
					modify it under the terms of the GNU Lesser General Public License
					as published by the Free Software Foundation; either version 2.1 of
					the License, or (at your option) any later version.
					
					This library is distributed in the hopeOA that it will be useful, but
					WITHOUT ANY WARRANTY; without even the implied warranty of
					MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
					Lesser General Public License for more details.

					You should have received a copy of the GNU Lesser General Public
					License along with this library; if not, write to the Free Software
					Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
					02110-1301 USA
			]"

			-- A GdaParameter object basically is a specification for a
			-- value and can convey a value once one has been set.

			-- The GdaParameter object offers other features such as:

			-- o keeping a list of objects which "are interested"
			-- (mentioned as "users" in the API) in the value placed in
			-- the parameter: this feature is usefull when parameters are
			-- created by objects and when these objects want to be
			-- reminded that the parameter has been created by them at a
			-- later time

			-- o aliasing (binding) to another parameter: this is an easy
			-- way to keep several parameters synchronized. There are two
			-- modes: one where parameters A and B will always have the
			-- same value and where parameter B will update itself whan A
			-- changes to mirror tha change but will be allowed to have
			-- its own changes afterwards.

			-- o values restrictions: a parameter can be told to choose a
			-- value among the values in a colmun in a GdaDataModel
			-- (beware that this is a declarative feature only and that
			-- no policy is enforced regarding values changes)

class GDA_PARAMETER

inherit 
	GDA_OBJECT
		rename make as allocate_struct
		export {} allocate_struct 
		undefine struct_size
		redefine copy, type
		end
		--    GdaParameter implements GdaReferer.
insert 
	SHARED_G_ERROR
	GDA_PARAMETER_EXTERNALS

creation make, from_external_pointer, copy, make_string, make_boolean

feature {} -- Creation
	make (a_type: INTEGER) is
			-- Creates a new parameter of `a_type' - the requested GType.
		do
			from_external_pointer (gda_parameter_new (a_type))
		end

	copy (another: like Current) is
			-- Copy constructor.
		do
			from_external_pointer(gda_parameter_new_copy(another.handle))
		end

	make_string (a_name, some_contents: STRING) is
			-- Creates a new STRING-GdaParameter, with `a_name' as name 
			-- and with `some_contents'
		require 
			name_not_void: a_name /= Void
			contents_not_void: some_contents /= Void
		do
			from_external_pointer (gda_parameter_new_string 
										  (a_name.to_external,
											some_contents.to_external))
		end

	make_boolean (a_name: STRING; a_boolean: BOOLEAN) is
			-- Creates a new boolen GDA_PARAMETER
		require 
			name_not_void: a_name /= Void
		do
			from_external_pointer (gda_parameter_new_boolean  (a_name.to_external,a_boolean.to_integer))
		end

feature    
	type: INTEGER is
			-- The type of the parameter
		do
			Result := gda_parameter_get_gda_type (handle)
		end 
	
	declare_user (an_user: GDA_OBJECT) is
			--  Tells that `an_user' is potentially using Current parameter.

		require
			user_not_void: an_user /= Void
		do
			gda_parameter_declare_param_user (handle, an_user.handle)
		end

	users: G_SLIST [GDA_OBJECT] is
			-- the GdaEntityField objects which created param (and which
			-- will use its value)
		do
			create Result.from_external_pointer (gda_parameter_get_param_users (handle))
			Result.set_shared
			-- Note: the returned list of GdaEntityField objects must not be
			-- changed or free'd
			
			-- TODO: implement the above note into G_SLIST with those 
			-- features: `is_changeable', `set_changeable', 
			-- `set_unchangeable'.
		end

	value: G_VALUE is
			-- the value held into the parameter. 
		local ptr: POINTER
		do
			ptr:=gda_parameter_get_value (handle)
			check pointer_not_null: ptr.is_not_null end
			create Result.from_external_pointer (ptr)
		ensure not_void: Result /= Void
		end
	
	set_value (a_value: G_VALUE) is
		require value_not_void: a_value /= Void
		do
			gda_parameter_set_value (handle, a_value.handle)
		end

	set_string_value (a_string: STRING) is
			-- Same function as `set_value' except that the value is
			-- provided as a string, `is_successful' may be False if the
			-- string did not represent a correct value for the data type
			-- of the parameter.
		require string_not_void: a_string /= Void
		do			
			is_successful:=(gda_parameter_set_value_str
								 (handle, a_string.to_external)).to_boolean
		end

	declare_invalid is
			-- Forces a parameter to be invalid; to set it valid again, a
			-- new value must be assigned to it using `set_value'.
		do
			gda_parameter_declare_invalid (handle)
		ensure invalid: not is_valid
		end

	is_valid: BOOLEAN is
			-- Is Current parameter valid? If True the value can safely be used.
		do
			Result:=gda_parameter_is_valid(handle).to_boolean
		end

	default_value: G_VALUE is
			-- the default value held into the parameter. WARNING: the
			-- default value does not need to be of the same type as the
			-- one required by param.
		do
			create Result.from_external_pointer (gda_parameter_get_default_value(handle))
		end

	set_default_value (a_value: G_VALUE) is
		require value_not_void: a_value /= Void
		do
			gda_parameter_set_default_value (handle, a_value.handle)
		end

	has_default_value: BOOLEAN is
			-- Does current have a default value (which may be unspecified)?
		do
			Result:= gda_parameter_get_exists_default_value (handle).to_boolean
		end

	set_has_default_value: BOOLEAN is
			-- Tells if param has default unspecified value. This
			-- function is usefull if one wants to inform that param has
			-- a default value but does not know what that default value
			-- actually is.
		do
			gda_parameter_set_exists_default_value (handle, 1)
		ensure set: has_default_value
		end
	
	unset_has_default_value: BOOLEAN is
			-- Unset default value. See `set_has_default_value'.
		do
			gda_parameter_set_exists_default_value (handle, 0)
		ensure unset: not has_default_value
		end

	forbid_null is
			-- Does not allow the parameter to have a NULL value.
		do
			gda_parameter_set_not_null (handle, 1)
		ensure null_forbidden: is_null_forbidden
		end

	allow_null is
			-- Allows the parameter to have a NULL value.
		do
			gda_parameter_set_not_null (handle, 0)
		ensure null_allowed: not is_null_forbidden
		end

	is_null_forbidden: BOOLEAN is
			-- Cannot the parameter be NULL? True if the parameter cannot be NULL
		do
			Result := gda_parameter_get_not_null (handle).to_boolean
		end

	restrict_values (a_model: GDA_DATA_MODEL; a_column: INTEGER) is
			-- Sets a limit on the possible values for the Current
			-- parameter: the value must be among the values contained in
			-- `a_column' of `a_model' data model. `is_successful' will 
			-- be True if no error occurred.

			-- TODO: the original C library allow a_model to be 
			-- NULL/Void. It is not clear what it should mean.
		require 
			model_not_void: a_model/=Void
			correct_columnd: -- TODO:
		do
			is_successful:=(gda_parameter_restrict_values
								 (handle, a_model.handle, a_column,
								  address_of (error.handle))).to_boolean
		end

	model_values: GDA_DATA_MODEL
			-- The data model that store the possible values for Current
			-- parameter. It is updated by `has_restrict_values'.
	
	values_column: INTEGER
			-- The column of `model_values' that store the possible
			-- values for Current parameter. It is updated by
			-- `has_restrict_values'.
	
	has_restrict_values: BOOLEAN is
			-- Does the Current parameter have its values restricted by a
			-- GdaDataModel? and optionnaly allows to fetch the
			-- resteictions.

			-- param : a GdaParameter 

			-- model : a place to store a pointer to the model
			-- restricting the parameter, or NULL 

			-- col : a place to store the column in the model restricting
			-- the parameter, or NULL Returns : TRUE if param has its
			-- values restricted.

		do
			if model_values=Void then create model_values.make end
			Result := (gda_parameter_has_restrict_values
						  (handle,
							address_of (model_values.handle),
							$values_column)).to_boolean
		ensure
			model_values_not_void: Result=True implies (model_values /= Void)
			--TODO: and model_values.is_valid_column(values_column))
		end

	-- TODO: replace_users (some_replacements: G_HASH_TABLE ) is
	-- requires G_HASH_TABLE
	-- 			-- For each declared parameter user in the replacements keys,
	-- 			-- declare the value stored in replacements also as a user of
	-- 			-- param.
	
	-- 			-- replacements : the (objects to be replaced, replacing object) 
	-- 			-- pairs
	-- 		require
	-- 			replacements_not_void: some_replacements /= Void
	-- 		do
	-- 			gda_parameter_replace_param_users (handle, some_replacements.handle)
	-- 		end
	
	bind_to_param (a_binding_parameter: GDA_PARAMETER) is
			-- Sets Current to change when `a_binding_parameter's (and
			-- does not make `a_binding_parameter' change when Current
			-- changes). `a_binding_parameter' can be Void

			-- TODO: it is not clear what happens when
			-- `a_binding_parameter' is Void.
		do
			if a_binding_parameter = Void then
				gda_parameter_bind_to_param (handle,default_pointer)
			else
				gda_parameter_bind_to_param (handle,a_binding_parameter.handle)
			end
		end
	
	binding_parameter: GDA_PARAMETER is
			-- the parameter which makes Current change its value when
			-- the param's value is changed.
		local ptr: POINTER
		do
			ptr:=gda_parameter_get_bind_param  (handle)
			if ptr.is_not_null then
				create Result.from_external_pointer (ptr)
			end
		end
	
feature -- TODO: Properties
--    "entry-plugin"         gchararray            : Read / Write
--    "full-bind"            gpointer              : Read / Write
--    "gda-type"             gulong                : Read / Write / Construct Only
--    "restrict-column"      gint                  : Read / Write
--    "restrict-model"       gpointer              : Read / Write
--    "simple-bind"          gpointer              : Read / Write
--    "use-default-value"    gboolean              : Read / Write

-- Property Details

--   The "entry-plugin" property

--    "entry-plugin"         gchararray            : Read / Write

--    Default value: NULL

--    ---------------------------------------------------------------------------------------

--   The "full-bind" property

--    "full-bind"            gpointer              : Read / Write

--    ---------------------------------------------------------------------------------------

--   The "gda-type" property

--    "gda-type"             gulong                : Read / Write / Construct Only

--    ---------------------------------------------------------------------------------------

--   The "restrict-column" property

--    "restrict-column"      gint                  : Read / Write

--    Allowed values: >= 0

--    Default value: 0

--    ---------------------------------------------------------------------------------------

--   The "restrict-model" property

--    "restrict-model"       gpointer              : Read / Write

--    ---------------------------------------------------------------------------------------

--   The "simple-bind" property

--    "simple-bind"          gpointer              : Read / Write

--    ---------------------------------------------------------------------------------------

--   The "use-default-value" property

--    "use-default-value"    gboolean              : Read / Write

--    Default value: FALSE

feature -- TODO: Signals
--  "restrict-changed"
--              void        user_function      (GdaParameter *gdaparameter,
--                                              gpointer      user_data)         : Run first

-- Signal Details

--   The "restrict-changed" signal

--  void        user_function                  (GdaParameter *gdaparameter,
--                                              gpointer      user_data)         : Run first

--    gdaparameter : the object which received the signal.
--    user_data :    user data set when the signal handler was connected.

end -- class GDA_PARAMETER
