indexing
	description: "GdaParameter -- Represents a GValue with various attributes"
	copyright: "[
					Copyright (C) 2007 Paolo Redaelli, GDA team
					
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

	wrapped_version: "3.0.1"

class GDA_PARAMETER
	-- A GDA_PARAMETER object basically is a specification for a value
	-- and can convey a value once one has been set.
	
	-- The GdaParameter object offers other features such as:
	
	-- o keeping a list of objects which "are interested" (mentioned as
	--   "users" in the API) in the value placed in the parameter: this
	--   feature is usefull when parameters are created by objects and
	--   when these objects want to be reminded that the parameter has
	--   been created by them at a later time
	
	-- o aliasing (binding) to another parameter: this is an easy way
	--   to keep several parameters synchronized. There are two modes:
	--   one where parameters A and B will always have the same value
	--   and where parameter B will update itself whan A changes to
	--   mirror tha change but will be allowed to have its own changes
	--   afterwards.

	-- o values restrictions: a parameter can be told to choose a value
	--   among the values in a colmun in a GdaDataModel (beware that
	--   this is a declarative feature only and that no policy is
	--   enforced regarding values changes)

inherit 
	GDA_OBJECT
		rename
			make as allocate_struct
		export {}
			allocate_struct 
		redefine
			copy, type
		end

		-- GdaParameter implements GdaReferer.

insert 
	SHARED_G_ERROR
	GDA_PARAMETER_EXTERNALS

creation 
	dummy, 
	make, from_external_pointer, copy, make_string, make_boolean

feature {} -- Creation
	make (a_type: INTEGER) is
			-- Creates a new parameter of `a_type' - the requested GType.
		do
			from_external_pointer (gda_parameter_new (a_type))
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

feature {ANY} -- Copying
	copy (other: like Current) is
		do
			from_external_pointer(gda_parameter_new_copy(other.handle))
		end

feature {ANY}
	type: INTEGER is
			-- The type of the parameter
		require
			valid_handle: handle.is_not_null
		do
			Result := gda_parameter_get_g_type (handle)
		end 
	
	value: G_VALUE is
			-- the value held into the parameter. An SQL NULL value
			-- returns a `GDA_TYPE_NULL' Result.
		local p: POINTER
		do
			p:=gda_parameter_get_value (handle)
			check pointer_not_null: p.is_not_null end
			if stored_value=Void then create stored_value.from_external_pointer(p) end
			if stored_value.handle/=p then 
				debug io.put_line("GDA_PARAMETER.value: stored_value.handle differs from gda_parameter_get_value(handle); replacing previous stored_value with a new one") end
				create stored_value.from_external_pointer(p)
			end
			Result := stored_value
		ensure not_void: Result /= Void
		end
	
	set_value (a_value: G_VALUE) is
		require value_not_void: a_value /= Void
		do
			gda_parameter_set_value (handle, a_value.handle)
		end

	string_value: STRING is 
			-- A string representation of the value stored in
			-- param. Calling `set_string_value' with this value will
			-- restore the parameter's current state. Void if the
			-- parameter's value is an SQL NULL.
		local p: POINTER
		do
			p:=gda_parameter_get_value_str(handle)
			if p.is_not_null then create Result.from_external(p) end
		end

	set_string_value (a_string: STRING) is
			-- Same function as `set_value' except that the value is
			-- provided as a string; `is_successful' may be False if the
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
			create Result.from_external_pointer(gda_parameter_get_default_value(handle))
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

	set_has_default_value (a_setting: BOOLEAN) is
			-- Sets if parameter has default unspecified value. This is
			-- usefull if one wants to inform that parameter has a
			-- default value but does not know what that default value
			-- actually is.
		do
			gda_parameter_set_exists_default_value (handle, a_setting.to_integer)
		ensure set: has_default_value
		end
	
	enable_default_value is 
			-- Give the parameter a default value.
		do 
			set_has_default_value(True)
		end

	disable_default_value is 
			-- Remove the default value from the paramter.
		do
			set_has_default_value(False) 
		end
	
	set_not_null (a_setting: BOOLEAN) is
			-- Sets if the parameter can have a NULL value. If
			-- `a_setting' is True, then that won't be allowed.
		do
			gda_parameter_set_not_null (handle, a_setting.to_integer)
		ensure definition: a_setting = is_null_forbidden
		end

	forbid_null is
			-- Does not allow the parameter to have a NULL value.
		do
			set_not_null(True)
		ensure null_forbidden: is_null_forbidden
		end

	allow_null is
			-- Allows the parameter to have a NULL value.
		do
			set_not_null(False)
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
		do
			is_successful:=(gda_parameter_restrict_values
								 (handle, null_or(a_model), a_column,
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
			-- GdaDataModel? After calling this feature `model_values'
			-- and `values_column' will contains the allowed values.
		do
			if model_values=Void then create model_values.make end
			Result := (gda_parameter_has_restrict_values
						  (handle, address_of (model_values.handle),
							$values_column)).to_boolean
		ensure
			model_values_not_void: Result=True implies (model_values /= Void)
		end

	bind_to_param (a_binding_parameter: GDA_PARAMETER) is
			-- Sets Current to change when `a_binding_parameter's (and
			-- does not make `a_binding_parameter' change when Current
			-- changes). `a_binding_parameter' can be Void
		do
			gda_parameter_bind_to_param (handle,null_or(a_binding_parameter))
		end
	
	binding_parameter: GDA_PARAMETER is
			-- the parameter which makes Current change its value when
			-- the param's value is changed.
		local p: POINTER
		do
			p:=gda_parameter_get_bind_param  (handle)
			if p.is_not_null then
				if wrappers.has(p) then Result::=wrappers.at(p)
				else create Result.from_external_pointer(p) end
			end
		end
	
feature {} -- TODO: The "restrict-changed" signal

	--  void user_function (GdaParameter *gdaparameter, gpointer
	--  user_data) : Run first
	
	--    gdaparameter : the object which received the signal.
	--    user_data :    user data set when the signal handler was connected.
	
feature -- size
	struct_size: INTEGER is
		external "C inline use <libgda/libgda.h>"
		alias "sizeof(GdaParameter)"
		end

feature {} -- Implementation
	stored_value: G_VALUE
	
feature -- Property Details

	--  The "entry-plugin" property
	--
	--   "entry-plugin"             gchararray            : Read / Write
	--
	--   Default value: NULL
	--
	--   --------------------------------------------------------------------------
	--
	--  The "full-bind" property
	--
	--   "full-bind"                GdaParameter          : Read / Write
	--
	--   --------------------------------------------------------------------------
	--
	--  The "g-type" property
	--
	--   "g-type"                   gulong                : Read / Write / Construct Only
	--
	--   --------------------------------------------------------------------------
	--
	--  The "not-null" property
	--
	--   "not-null"                 gboolean              : Read / Write
	--
	--   Default value: FALSE
	--
	--   --------------------------------------------------------------------------
	--
	--  The "restrict-column" property
	--
	--   "restrict-column"          gint                  : Read / Write
	--
	--   Allowed values: >= 0
	--
	--   Default value: 0
	--
	--   --------------------------------------------------------------------------
	--
	--  The "restrict-model" property
	--
	--   "restrict-model"           GdaDataModel          : Read / Write
	--
	--   --------------------------------------------------------------------------
	--
	--  The "simple-bind" property
	--
	--   "simple-bind"              GdaParameter          : Read / Write
	--
	--   --------------------------------------------------------------------------
	--
	--  The "use-default-value" property
	--
	--   "use-default-value"        gboolean              : Read / Write
	--
	--   Default value: FALSE
	--
	--Signal Details
	--
	--  The "restrict-changed" signal
	--
	-- void                user_function                      (GdaParameter *gdaparameter,
	--                                                         gpointer      user_data)         : Run First
	--
	--   gdaparameter : the object which received the signal.
	--   user_data :    user data set when the signal handler was connected.

end -- class GDA_PARAMETER
