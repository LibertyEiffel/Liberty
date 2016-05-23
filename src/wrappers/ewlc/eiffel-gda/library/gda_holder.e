note
	description: "."
	copyright: "[
					Copyright (C) 2008 Paolo Redaelli
					
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

	wrapped_version: "3.99"

class GDA_HOLDER
	--   GdaHolder -- Container for a single GValue

	-- The GdaHolder is a container for a single GValue value. It also
	-- specifies various attributes of the contained value (default value, ...)
inherit
	G_OBJECT
		redefine
			copy
		end

insert
	GDA_HOLDER_EXTERNALS
	SHARED_G_ERROR

create {ANY} make, from_external_pointer

feature {} -- Creation
	make (a_type: like g_type) is
		-- Creates a new holder of type type
	do
		from_external_pointer(gda_holder_new(a_type)) 
	end
	
	--  gda_holder_new_string()
	--
	-- #define gda_holder_new_string(id,str) gda_holder_new_inline (G_TYPE_STRING, (id), (str))
	--
	--   id :
	--   str :
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_holder_new_boolean()
	--
	-- #define gda_holder_new_boolean(id,abool) gda_holder_new_inline (G_TYPE_BOOLEAN, (id), (abool))
	--
	--   id :
	--   abool :
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_holder_new_int()
	--
	-- #define gda_holder_new_int(id,anint) gda_holder_new_inline (G_TYPE_INT, (id), (anint))
	--
	--   id :
	--   anint :
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_holder_new_inline ()
	--
	-- GdaHolder*          gda_holder_new_inline               (GType type,
	--                                                          const gchar *id,
	--                                                          ...);
	--
	--   Creates a new GdaHolder object named name, of type type, and containing
	--   the value passed as the last argument.
	--
	--   Note that this function is a utility function and that anly a limited set
	--   of types are supported. Trying to use an unsupported type will result in a
	--   warning, and the returned value holder holding a safe default value.
	--
	--   type :    a valid GLib type
	--   id :      the id of the holder to create, or NULL
	--   ... :     value to set
	--   Returns : a new GdaHolder object
	--
feature {ANY} 	
	copy (another: like Current) is
		-- 
	do
		from_external_pointer(gda_holder_copy(another.handle))
	end
	
	value_type: like g_type is 
		-- Holder's type
	do
		Result:= gda_holder_get_g_type(handle)
	end

	id: CONST_STRING is
		-- the ID of holder. The ID can be set using holder's "id" property
		do
			create Result.from_external(gda_holder_get_id(handle))
		end
	
	value: G_VALUE is
		-- the value held into the holder. If holder is set to use its default
		-- value and that default value is not of the same type as holder,
		-- then Void is returned.

		-- TODO: Result is "const" in C, i.e. it cannot be changed. Implement
		-- this in Eiffel
	local p: POINTER
	do
		p:=gda_holder_get_value (handle)
		if p.is_not_null then 
			create Result.from_external_pointer(gda_holder_get_value(handle))
		end
	end
	
	value_as_string (a_data_handler: GDA_DATA_HANDLER): STRING is
		-- The value of the holder rendered as string (the conversion is done
		-- using `a_data_handler' if not Void, or the default data handler
		-- otherwise).
	local p: POINTER
	do
		p:=gda_holder_get_value_str(handle,null_or(a_data_handler))
		if p.is_not_null then
			create Result.from_external(p)
		end
	end

	set_value (a_value: G_VALUE) is
		-- Sets the value within the holder. If holder is an alias for another
		-- holder, then the value is also set for that other holder.
	
		-- The action of any call to `force_invalid' is cancelled as
		-- soon as this method is called, even if holder's value does not
		-- change.
	
		-- If the value is not different from the one already contained within
		-- holder, then holder is not chaged and no signal is emitted.

		-- `is_successful' will be set to True if value has been set, False
		-- otherwise
	require 
		value_not_void: a_value/=Void
	do
		is_successful:= gda_holder_set_value(handle, a_value.handle).to_boolean
	end
	
	--
	--  gda_holder_set_value_str ()
	--
	-- gboolean            gda_holder_set_value_str            (GdaHolder *holder,
	--                                                          GdaDataHandler *dh,
	--                                                          const gchar *value);
	--
	--   Same functionality as gda_holder_set_value() except that it uses a string
	--   representation of the value to set, which will be converted into a GValue
	--   first (using default data handler if dh is NULL).
	--
	--   Note that is value is NULL or is the "NULL" string, then holder's value is
	--   set to NULL.
	--
	--   holder :  a GdaHolder object
	--   dh :      a GdaDataHandler to use, or NULL
	--   value :   a value to set the holder to, as a string
	--   Returns : TRUE if value has been set
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_holder_take_value ()
	--
	-- gboolean            gda_holder_take_value               (GdaHolder *holder,
	--                                                          GValue *value);
	--
	--   Sets the value within the holder. If holder is an alias for another
	--   holder, then the value is also set for that other holder.
	--
	--   The action of any call to gda_holder_force_invalid() is cancelled as soon
	--   as this method is called, even if holder's value does not change.
	--
	--   If the value is not different from the one already contained within
	--   holder, then holder is not chaged and no signal is emitted.
	--
	--   holder :  a GdaHolder object
	--   value :   a value to set the holder to
	--   Returns : TRUE if value has been set
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_holder_get_default_value ()
	--
	-- const GValue*       gda_holder_get_default_value        (GdaHolder *holder);
	--
	--   Get the default value held into the holder. WARNING: the default value
	--   does not need to be of the same type as the one required by holder.
	--
	--   holder :  a GdaHolder object
	--   Returns : the default value
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_holder_set_default_value ()
	--
	-- void                gda_holder_set_default_value        (GdaHolder *holder,
	--                                                          const GValue *value);
	--
	--   Sets the default value within the holder. If value is NULL then holder
	--   won't have a default value anymore. To set a default value to NULL, then
	--   pass GValue created using gda_value_new_null().
	--
	--   NOTE: the default value does not need to be of the same type as the one
	--   required by holder.
	--
	--   holder : a GdaHolder object
	--   value :  a value to set the holder's default value, or NULL
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_holder_set_value_to_default ()
	--
	-- gboolean            gda_holder_set_value_to_default     (GdaHolder *holder);
	--
	--   Set holder's value to its default value.
	--
	--   holder :  a GdaHolder object
	--   Returns : TRUE if holder has got a default value
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_holder_value_is_default ()
	--
	-- gboolean            gda_holder_value_is_default         (GdaHolder *holder);
	--
	--   Tells if holder's current value is the default one.
	--
	--   holder :  a GdaHolder object
	--   Returns : TRUE if holder holder's current value is the default one
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_holder_force_invalid ()
	--
	-- void                gda_holder_force_invalid            (GdaHolder *holder);
	--
	--   Forces a holder to be invalid; to set it valid again, a new value must be
	--   assigned to it using gda_holder_set_value() or gda_holder_take_value().
	--
	--   holder's value is set to NULL.
	--
	--   holder : a GdaHolder object
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_holder_is_valid ()
	--
	-- gboolean            gda_holder_is_valid                 (GdaHolder *holder);
	--
	--   Get the validity of holder (that is, of the value held by holder)
	--
	--   holder :  a GdaHolder object
	--   Returns : TRUE if holder's value can safely be used
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_holder_set_not_null ()
	--
	-- void                gda_holder_set_not_null             (GdaHolder *holder,
	--                                                          gboolean not_null);
	--
	--   Sets if the holder can have a NULL value. If not_null is TRUE, then that
	--   won't be allowed
	--
	--   holder :   a GdaHolder object
	--   not_null :
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_holder_get_not_null ()
	--
	-- gboolean            gda_holder_get_not_null             (GdaHolder *holder);
	--
	--   Get wether the holder can be NULL or not
	--
	--   holder :  a GdaHolder object
	--   Returns : TRUE if the holder cannot be NULL
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_holder_set_source_model ()
	--
	-- gboolean            gda_holder_set_source_model         (GdaHolder *holder,
	--                                                          GdaDataModel *model,
	--                                                          gint col,
	--                                                          GError **error);
	--
	--   Sets a limit on the possible values for the holder holder: the value must
	--   be among the values contained in the col column of the model data model.
	--
	--   holder :  a GdaHolder object
	--   model :   a GdaDataModel object or NULL
	--   col :     the reference column in model
	--   error :   location to store error, or NULL
	--   Returns : TRUE if no error occurred
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_holder_get_source_model ()
	--
	-- GdaDataModel*       gda_holder_get_source_model         (GdaHolder *holder,
	--                                                          gint *col);
	--
	--   Tells if holder has its values sourceed by a GdaDataModel, and optionnaly
	--   allows to fetch the resteictions.
	--
	--   holder :  a GdaHolder
	--   col :     a place to store the column in the model sourceing the holder,
	--             or NULL
	--   Returns : a pointer to the GdaDataModel source for holder
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_holder_set_bind ()
	--
	-- void                gda_holder_set_bind                 (GdaHolder *holder,
	--                                                          GdaHolder *bind_to);
	--
	--   Sets holder to change when bind_to changes (and does not make bind_to
	--   change when holder changes).
	--
	--   If bind_to is NULL, then holder will not be bound anymore.
	--
	--   holder :  a GdaHolder
	--   bind_to : a GdaHolder or NULL
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_holder_get_bind ()
	--
	-- GdaHolder*          gda_holder_get_bind                 (GdaHolder *holder);
	--
	--   Get the holder which makes holder change its value when the holder's value
	--   is changed.
	--
	--   holder :  a GdaHolder
	--   Returns : the GdaHolder or NULL
	--
	--Property Details
	--
	--  The "description" property
	--
	--   "description"              gchar*                : Read / Write
	--
	--   Default value: NULL
	--
	--   --------------------------------------------------------------------------
	--
	--  The "full-bind" property
	--
	--   "full-bind"                GdaHolder*            : Read / Write
	--
	--   --------------------------------------------------------------------------
	--
	--  The "g-type" property
	--
	--   "g-type"                   gulong                : Read / Write / Construct Only
	--
	--   --------------------------------------------------------------------------
	--
	--  The "id" property
	--
	--   "id"                       gchar*                : Read / Write
	--
	--   Default value: NULL
	--
	--   --------------------------------------------------------------------------
	--
	--  The "name" property
	--
	--   "name"                     gchar*                : Read / Write
	--
	--   Default value: NULL
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
	--  The "plugin" property
	--
	--   "plugin"                   gchar*                : Read / Write
	--
	--   Default value: NULL
	--
	--   --------------------------------------------------------------------------
	--
	--  The "simple-bind" property
	--
	--   "simple-bind"              GdaHolder*            : Read / Write
	--
	--   --------------------------------------------------------------------------
	--
	--  The "source-column" property
	--
	--   "source-column"            gint                  : Read / Write
	--
	--   Allowed values: >= 0
	--
	--   Default value: 0
	--
	--   --------------------------------------------------------------------------
	--
	--  The "source-model" property
	--
	--   "source-model"             GdaDataModel*         : Read / Write
	--
	--Signal Details
	--
	--  The "changed" signal
	--
	-- void                user_function                      (GdaHolder *gdaholder,
	--                                                         gpointer   user_data)      : Run First
	--
	--   gdaholder : the object which received the signal.
	--   user_data : user data set when the signal handler was connected.
	--
	--   --------------------------------------------------------------------------
	--
	--  The "source-changed" signal
	--
	-- void                user_function                      (GdaHolder *gdaholder,
	--                                                         gpointer   user_data)      : Run First
	--
	--   gdaholder : the object which received the signal.
	--   user_data : user data set when the signal handler was connected.
	--
	--   --------------------------------------------------------------------------
	--
	--   Generated by GTK-Doc V1.10

feature {ANY} 
	struct_size: INTEGER is
		external "C inline use <libgda/libgda.h>"
		alias "sizeof(GdaHolder)"
		end

end -- class GDA_HOLDER
