indexing
	description: "GdaObject The base class for many of the library's objects."
	copyright: "[
					Copyright (C) 2006 Paolo Redaelli
					
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

deferred class GDA_OBJECT
	-- This class defines a common behaviour for most of the objects of
	-- this library. As the data dictionary is quite dynamic, the
	-- default way by which GObjects are managed (referenced and
	-- unreferenced when not needed anymore using g_object_[un]ref())
	-- is not enough: sometimes this behaviour should be kept, and
	-- sometimes an object's destruction should be forced and all the
	-- other reference holders of that object should take appropriate
	-- actions and drop their reference on that object.

	-- Just an example to illustrate this: suppose a data type has been
	-- removed from the database itself, then the corresponding
	-- GdaDictType must be destroyed since it does not represent a
	-- valid data type anymore.  GdaDictType object are all managed by
	-- a GdaDict which has a reference on them. When the GdaDict object
	-- does a metadata sychronization (using
	-- gda_dict_update_dbms_meta_data()), it calls gda_object_destroy()
	-- on the proper GdaDictType which must be destroyed. The other
	-- objects which did use tha particular GdaDictType object (such as
	-- GdaDictField and GdaDictFunction for example) catch the
	-- "destroy" signal which is emitted by the GdaDictType object
	-- being destroyed and take appropriate actions (in this case both
	-- these objects will destroy themselves and release any reference
	-- they had on the GdaDictType object). The reference count of the
	-- GdaDictType object being destroyed then should normally reach 0
	-- and the destruction occur as for any other GObject object.
	
	-- This class also introduces common attributes that can be
	-- exploited by the classes inheriting that class, such as:

	-- o The GdaDict object to which any GdaObject relates
	
	-- o The string ID of the object: any string which uniquely
	--   identifies a GdaObject within a dictionary
	
	-- o The ID as a guint, the name, description and owner attached to
	--   the GdaObject.

inherit 
	G_OBJECT redefine dispose end

		-- Known heirs: GdaHandlerTime, GdaHandlerBoolean,
		-- GdaHandlerString, GdaHandlerNumerical, GdaHandlerBin,
		-- GdaHandlerType, GdaDataModelRow, GdaDataModelImport,
		-- GdaParameterList, GdaDataModelQuery, GdaDataAccessWrapper,
		-- GdaDataProxy, GdaDictAggregate, GdaDictConstraint,
		-- GdaDictDatabase, GdaDictField, GdaDictFunction, GdaDictTable,
		-- GdaDictType, GdaGraphviz, GdaObjectRef, GdaParameter,
		-- GdaQueryObject, GdaGraph, GdaGraphItem,

		-- Known Derived Interfaces: GdaObject is required by
		-- GdaDataModel, GdaEntity, GdaEntityField and GdaXmlStorage.
	
insert GDA_OBJECT_EXTERNALS


feature
	dict: GDA_DICT is 
			-- the GdaDict object to which an object is attached to 
		local dict_factory: G_OBJECT[GDA_DICT]
		do 
			Result := dict_factory.wrapper(gda_object_get_dict (handle))
			-- create Result.from_external_pointer ()
		ensure not_void: Result /= Void 
		end

	set_id (an_id: STRING) is
			-- Sets the string ID of the object object.  The string ID
			-- must be unique for all the objects related to a given
			-- GdaDict object.
		require
			id_not_void: an_id /= Void
		do
			gda_object_set_id (handle, an_id.to_external)
		end

	set_name (a_name: STRING) is
			-- Sets the name of the GdaObject object. If the name is
			-- changed, then the "name_changed" signal is emitted.
		require
			name_not_void: a_name /= Void
		do
			gda_object_set_name (handle, a_name.to_external)
		end

	set_description (a_description: STRING) is
			-- Sets the description of the GdaObject object. If the
			-- description is changed, then the "descr_changed" signal is
			-- emitted.
		require
			description_not_void: a_description /= Void
		do
			gda_object_set_description (handle, a_description.to_external)
		end

	set_owner (an_owner: STRING) is
			-- Sets the owner of the GdaObject object. If the owner is
			-- changed, then the "owner_changed" signal is emitted.
		require
			owner_not_void: an_owner /= Void
		do
			gda_object_set_owner (handle, an_owner.to_external)
		end

	id: CONST_STRING is
			-- the string ID of the GdaObject object.
		do
			create Result.from_external (gda_object_get_id(handle))
		end

	name: CONST_STRING is
			-- the name of the GdaObject object.
		do
			create Result.from_external (gda_object_get_name(handle))
		end


	description: CONST_STRING is
			-- the description of the GdaObject object.
		do
			create Result.from_external (gda_object_get_description(handle))
		end

	owner: CONST_STRING is
			-- the owner of the GdaObject object.
		do
			create Result.from_external (gda_object_get_owner(handle))
		end

	destroy is
			-- Force the gdaobj object to be destroyed, even if we don't
			-- have a reference on it (we can't call `G_OBJECT.unref'
			-- then) and even if the object is referenced multiple times
			-- by other objects.

			-- The "destroyed" signal is then emitted to tell the other
			-- reference holders that the object must be destroyed and
			-- that they should give back their reference (using
			-- `G_OBJECT.unref'). However if a reference is still
			-- present, the object will not actually be destroyed and
			-- will still be alive, but its state may not be
			-- deterministic.

			-- This is usefull because sometimes objects need to
			-- disappear even if they are referenced by other
			-- objects. This usage is the same as with the
			-- `GTK_WIDGET.destroy' function on widgets.

			-- When this feature returns, the Current object should have
			-- been destroyed and should not be used anymore.
		do
			gda_object_destroy (handle)
		end

	destroy_check is
			-- Checks that the object has been destroyed, and if not,
			-- then calls gda_object_destroy() on it. This is usefull for
			-- objects inheriting the GdaObject object to be called first
			-- line in their dispose() method.
		do
			gda_object_destroy_check (handle)
		end

	-- gda_object_connect_destroy ()

	-- gulong      gda_object_connect_destroy      (gpointer object,
	--                                              GCallback callback,
	--                                              gpointer data);

	-- Connects the "destoy" signal of the gdaobj object but first cheks that gdaobj exists and has not yet been destroyed.

	-- object : 	
	-- callback : 	
	-- data : 	
	-- Returns : 	the handler id of the signal
	-- gda_object_changed ()

	-- void        gda_object_changed              (GdaObject *object);

	-- Force emission of the "changed" signal, except if gda_object_block_changed() has been called.

	-- object : 	

	block_changed is
			-- No "changed" signal will be emitted.
		do
			gda_object_block_changed(handle)
		end

	unblock_changed is
			-- The "changed" signal will again be emitted.
		do
			gda_object_unblock_changed(handle)
		end

	-- TODO: uncomment if necessary dump (an_offset: INTEGER) is Writes
	-- a textual description of the object to STDOUT. This function
	-- only exists if libergeant is compiled with the "--enable-debug"
	-- option. This is a virtual function. offset : the offset (in
	-- caracters) at which the dump will start require positive_offset:
	-- an_offset>=0 do gda_object_dump(handle,offset) end

feature {} -- TODO: Properties

	--   "changed-blocked"      gboolean              : Read / Write
	--   "dict"                 gpointer              : Read / Write / Construct Only
	--   "string-id"            gchararray            : Read / Write

	-- Property Details
	-- The "changed-blocked" property

	--   "changed-blocked"      gboolean              : Read / Write

	-- Default value: FALSE
	-- The "dict" property

	--   "dict"                 gpointer              : Read / Write / Construct Only

	-- Dictionary to which the object is related.
	-- The "string-id" property

	--   "string-id"            gchararray            : Read / Write

	-- Default value: NULL

feature {} -- TODO: Signals
	-- "changed"   void        user_function      (GdaObject *gdaobject,
	--                                             gpointer   user_data)      : Run first
	-- "descr-changed"
	--             void        user_function      (GdaObject *gdaobject,
	--                                             gpointer   user_data)      : Run first
	-- "destroyed" void        user_function      (GdaObject *gdaobject,
	--                                             gpointer   user_data)      : Run first
	-- "id-changed"
	--             void        user_function      (GdaObject *gdaobject,
	--                                             gpointer   user_data)      : Run first
	-- "name-changed"
	--             void        user_function      (GdaObject *gdaobject,
	--                                             gpointer   user_data)      : Run first
	-- "owner-changed"
	--             void        user_function      (GdaObject *gdaobject,
	--                                             gpointer   user_data)      : Run first
	-- "to-be-destroyed"
	--             void        user_function      (GdaObject *gdaobject,
	--                                             gpointer   user_data)      : Run first

	-- Signal Details
	-- The "changed" signal

	-- void        user_function                  (GdaObject *gdaobject,
	--                                             gpointer   user_data)      : Run first

	-- dbbase : 	the object which received the signal.
	-- user_data : 	user data set when the signal handler was connected.
	-- The "descr-changed" signal

	-- void        user_function                  (GdaObject *gdaobject,
	--                                             gpointer   user_data)      : Run first

	-- dbbase : 	the object which received the signal.
	-- user_data : 	user data set when the signal handler was connected.
	-- The "destroyed" signal

	-- void        user_function                  (GdaObject *gdaobject,
	--                                             gpointer   user_data)      : Run first

	-- dbbase : 	the object which received the signal.
	-- user_data : 	user data set when the signal handler was connected.
	-- The "id-changed" signal

	-- void        user_function                  (GdaObject *gdaobject,
	--                                             gpointer   user_data)      : Run first

	-- dbbase : 	the object which received the signal.
	-- user_data : 	user data set when the signal handler was connected.
	-- The "name-changed" signal

	-- void        user_function                  (GdaObject *gdaobject,
	--                                             gpointer   user_data)      : Run first

	-- dbbase : 	the object which received the signal.
	-- user_data : 	user data set when the signal handler was connected.
	-- The "owner-changed" signal

	-- void        user_function                  (GdaObject *gdaobject,
	--                                             gpointer   user_data)      : Run first

	-- dbbase : 	the object which received the signal.
	-- user_data : 	user data set when the signal handler was connected.
	-- The "to-be-destroyed" signal

	-- void        user_function                  (GdaObject *gdaobject,
	--                                             gpointer   user_data)      : Run first

	-- gdaobject : 	the object which received the signal.
	-- user_data : 	user data set when the signal handler was connected.

	--
end -- class GDA_OBJECT
