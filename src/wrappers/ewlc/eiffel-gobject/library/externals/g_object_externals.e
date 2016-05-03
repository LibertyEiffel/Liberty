note
	description: "External features of G_OBJECT"
	copyright: "(C) 2005 Paolo Redaelli "
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision "$REvision:$"


deferred class G_OBJECT_EXTERNALS

inherit ANY undefine is_equal, copy end

feature {} -- External calls
	-- #include <glib-object.h>

	--             GObject;
	--             GObjectClass;
	--             GObjectConstructParam;
	-- void        (*GObjectGetPropertyFunc)       (GObject *object,
	--                                              guint property_id,
	--                                              GValue *value,
	--                                              GParamSpec *pspec);
	-- void        (*GObjectSetPropertyFunc)       (GObject *object,
	--                                              guint property_id,
	--                                              const GValue *value,
	--                                              GParamSpec *pspec);
	-- void        (*GObjectFinalizeFunc)          (GObject *object);

	g_type_is_object (type: INTEGER): INTEGER is
			-- Returns a boolean value of FALSE or TRUE indicating whether the
			-- passed in type id is a G_TYPE_OBJECT or derived from it.  type :
			-- Type id to check for is a G_TYPE_OBJECT relationship.  Returns :
			-- FALSE or TRUE, indicating whether type is a G_TYPE_OBJECT.
		external "C macro use <glib-object.h>"
		alias "G_TYPE_IS_OBJECT"
		end

	g_object (a_pointer: POINTER): POINTER is
		external "C macro use <glib-object.h>"
		alias "G_OBJECT"
		end

	g_is_object (object: POINTER): INTEGER is
		external "C macro use <glib-object.h>"
		alias "G_IS_OBJECT"
		end

	-- Note: shall we wrap casting macro such as G_OBJECT_CLASS
	-- (class)? Paolo 2006-07-27

	g_is_object_class (a_class: POINTER): INTEGER is
		external "C macro use  <glib-object.h>"
		alias "G_IS_OBJECT_CLASS"
		end

	g_object_get_class (an_object: POINTER): POINTER is
		external "C macro use  <glib-object.h>"
		alias "G_OBJECT_GET_CLASS"
		end

	g_object_type (an_object: POINTER): INTEGER is
			-- Return the type id of an object.
			-- object : 	Object to return the type id for.
			-- Returns : 	Type id of object.
		external "C macro use  <glib-object.h>"
		alias "G_OBJECT_TYPE"
		end

	g_object_type_name (an_object: POINTER): POINTER is
		external "C macro use <glib-object.h>"
		alias "G_OBJECT_TYPE_NAME"
		end

	-- #define     G_OBJECT_TYPE_NAME              (object)
	-- #define     G_OBJECT_CLASS_TYPE             (class)
	-- #define     G_OBJECT_CLASS_NAME             (class)
	-- void        g_object_class_install_property (GObjectClass *oclass,
	--                                              guint property_id,
	--                                              GParamSpec *pspec);

	-- GParamSpec** g_object_class_list_properties (GObjectClass *oclass,
	--                                              guint *n_properties);
	-- void        g_object_class_override_property
	--                                             (GObjectClass *oclass,
	--                                              guint property_id,
	--                                              const gchar *name);
	-- void        g_object_interface_install_property
	--                                             (gpointer g_iface,
	--                                              GParamSpec *pspec);
	-- GParamSpec* g_object_interface_find_property
	--                                             (gpointer g_iface,
	--                                              const gchar *property_name);
	-- GParamSpec** g_object_interface_list_properties
	--                                             (gpointer g_iface,
	--                                              guint *n_properties_p);
	-- gpointer    g_object_new                    (GType object_type,
	--                                              const gchar *first_property_name,
	--                                              ...);
	-- gpointer    g_object_newv                   (GType object_type,
	--                                              guint n_parameters,
	--                                              GParameter *parameters);
	--             GParameter;
	-- gpointer    g_object_ref                    (gpointer object);
	-- void        g_object_unref                  (gpointer object);
	-- void        (*GWeakNotify)                  (gpointer data,
	--                                              GObject *where_the_object_was);
	-- void        g_object_weak_ref               (GObject *object,
	--                                              GWeakNotify notify,
	--                                              gpointer data);
	-- void        g_object_weak_unref             (GObject *object,
	--                                              GWeakNotify notify,
	--                                              gpointer data);
	-- void        g_object_add_weak_pointer       (GObject *object,
	--                                              gpointer *weak_pointer_location);
	-- void        g_object_remove_weak_pointer    (GObject *object,
	--                                              gpointer *weak_pointer_location);
	-- void        (*GToggleNotify)                (gpointer data,
	--                                              GObject *object,
	--                                              gboolean is_last_ref);
	-- void        g_object_add_toggle_ref         (GObject *object,
	--                                              GToggleNotify notify,
	--                                              gpointer data);
	-- void        g_object_remove_toggle_ref      (GObject *object,
	--                                              GToggleNotify notify,
	--                                              gpointer data);
	-- gpointer    g_object_connect                (gpointer object,
	--                                              const gchar *signal_spec,
	--                                              ...);
	-- void        g_object_disconnect             (gpointer object,
	--                                              const gchar *signal_spec,
	--                                              ...);
	-- void        g_object_set                    (gpointer object,
	--                                              const gchar *first_property_name,
	--                                              ...);
	-- void        g_object_get                    (gpointer object,
	--                                              const gchar *first_property_name,
	--                                              ...);
	-- void        g_object_notify                 (GObject *object,
	--                                              const gchar *property_name);
	-- void        g_object_freeze_notify          (GObject *object);
	-- void        g_object_thaw_notify            (GObject *object);
	-- gpointer    g_object_get_data               (GObject *object,
	--                                              const gchar *key);
	-- void        g_object_set_data               (GObject *object,
	--                                              const gchar *key,
	--                                              gpointer data);
	-- void        g_object_set_data_full          (GObject *object,
	--                                              const gchar *key,
	--                                              gpointer data,
	--                                              GDestroyNotify destroy);
	-- gpointer    g_object_steal_data             (GObject *object,
	--                                              const gchar *key);
	-- gpointer    g_object_get_qdata              (GObject *object,
	--                                              GQuark quark);
	-- void        g_object_set_qdata              (GObject *object,
	--                                              GQuark quark,
	--                                              gpointer data);
	-- void        g_object_set_qdata_full         (GObject *object,
	--                                              GQuark quark,
	--                                              gpointer data,
	--                                              GDestroyNotify destroy);
	-- gpointer    g_object_steal_qdata            (GObject *object,
	--                                              GQuark quark);
	-- void        g_object_set_property           (GObject *object,
	--                                              const gchar *property_name,
	--                                              const GValue *value);
	-- void        g_object_get_property           (GObject *object,
	--                                              const gchar *property_name,
	--                                              GValue *value);
	-- GObject*    g_object_new_valist             (GType object_type,
	--                                              const gchar *first_property_name,
	--                                              va_list var_args);
	-- void        g_object_set_valist             (GObject *object,
	--                                              const gchar *first_property_name,
	--                                              va_list var_args);
	-- void        g_object_get_valist             (GObject *object,
	--                                              const gchar *first_property_name,
	--                                              va_list var_args);
	-- void        g_object_watch_closure          (GObject *object,
	--                                              GClosure *closure);
	-- void        g_object_run_dispose            (GObject *object);
	-- #define     G_OBJECT_WARN_INVALID_PROPERTY_ID(object, property_id, pspec)

	-- G_OBJECT_TYPE_NAME()

	-- #define G_OBJECT_TYPE_NAME(object)  (g_type_name (G_OBJECT_TYPE (object)))

	-- Returns the name of an object's type.
	-- object : 	Object to return the type name for.
	-- Returns : 	Type name of object. The string is owned by the type system and should not be freed.
	-- G_OBJECT_CLASS_TYPE()

	-- #define G_OBJECT_CLASS_TYPE(class)  (G_TYPE_FROM_CLASS (class))

	-- Return the type id of a class structure.
	-- class : 	a valid GObjectClass
	-- Returns : 	Type id of class.
	-- G_OBJECT_CLASS_NAME()

	-- #define G_OBJECT_CLASS_NAME(class)  (g_type_name (G_OBJECT_CLASS_TYPE (class)))

	-- Return the name of a class structure's type.
	-- class : 	a valid GObjectClass
	-- Returns : 	Type name of class. The string is owned by the type system and should not be freed.
	-- g_object_class_install_property ()

	g_object_class_install_property (gobjectclass: POINTER;
												property_id: INTEGER;
												gparamspec: POINTER) is
			-- Installs a new property. This is usually done in the class
			-- initializer.  gobjectoclass: a GObjectClass; property_id: the id for
			-- the new property; pspec: the GParamSpec for the new property
		external "C use <glib-object.h>"
		end

	g_object_class_find_property (oclass, property_name: POINTER): POINTER is
			-- Looks up the GParamSpec for a property of a class.  oclass: a
			-- GObjectClass property_name: the name of the property to look up
			-- Returns : the GParamSpec for the property, or NULL if the class
			-- doesn't have a property of that name
		external "C use <glib-object.h>"
		end

	g_object_class_list_properties (oclass,n_properties: POINTER): POINTER is
			-- Returns an array of GParamSpec* for all properties of a class.
			-- oclass: a GObjectClass n_properties: return location for the length
			-- of the returned array (i.e. a guint *). Returns: an array of
			-- GParamSpec* (i.e. a GParamSpec**) which should be freed after use
		external "C use <glib-object.h>"
		end


	g_object_class_override_property (oclass: POINTER; guint_property_id: INTEGER; gchar_name: STRING) is
			-- Registers property_id as referring to a property with the name name
			-- in a parent class or in an interface implemented by oclass. This
			-- allows this class to override a property implementation in a parent
			-- class or to provide the implementation of a property from an
			-- interface.

			-- Note: Internally, overriding is implemented by creating a property
			-- of type GParamSpecOverride; generally operations that query the
			-- properties of the object class, such as
			-- g_object_class_find_property() or g_object_class_list_properties()
			-- will return the overridden property. However, in one case, the
			-- construct_properties argument of the constructor virtual function,
			-- the GParamSpecOverride is passed instead, so that the param_id field
			-- of the GParamSpec will be correct. For virtually all uses, this
			-- makes no difference. If you need to get the overridden property, you
			-- can call g_param_spec_get_redirect_target().

			-- oclass: 	a GObjectClass

			-- property_id: 	the new property ID

			-- name: the name of a property registered in a parent class or in an
			-- interface of this class.
		external "C use <glib-object.h>"
		end

	
	-- void        g_object_interface_install_property
	--                                             (gpointer g_iface,
	--                                              GParamSpec *pspec);

	-- Add a property to an interface; this is only useful for interfaces that
	-- are added to GObject-derived types. Adding a property to an interface
	-- forces all objects classes with that interface to have a compatible
	-- property. The compatible property could be a newly created GParamSpec, but
	-- normally g_object_class_override_property() will be used so that the
	-- object class only needs to provide an implementation and inherits the
	-- property description, default value, bounds, and so forth from the
	-- interface property.

	-- This function is meant to be called from the interface's default vtable
	-- initialization function (the class_init member of GTypeInfo.) It must not
	-- be called after after class_init has been called for any object types
	-- implementing this interface.  g_iface : any interface vtable for the
	-- interface, or the default vtable for the interface.  pspec : the
	-- GParamSpec for the new property

	-- Since 2.4

	-- g_object_interface_find_property ()

	-- GParamSpec* g_object_interface_find_property
	--                                             (gpointer g_iface,
	--                                              const gchar *property_name);

	-- Find the GParamSpec with the given name for an interface. Generally, the interface vtable passed in as g_iface will be the default vtable from g_type_default_interface_ref(), or, if you know the interface has already been loaded, g_type_default_interface_peek().
	-- g_iface : 	any interface vtable for the interface, or the default vtable for the interface
	-- property_name : 	name of a property to lookup.
	-- Returns : 	the GParamSpec for the property of the interface with the name property_name, or NULL if no such property exists.

	-- Since 2.4

	-- g_object_interface_list_properties ()

	-- GParamSpec** g_object_interface_list_properties
	--                                             (gpointer g_iface,
	--                                              guint *n_properties_p);

	-- Lists the properties of an interface.Generally, the interface vtable passed in as g_iface will be the default vtable from g_type_default_interface_ref(), or, if you know the interface has already been loaded, g_type_default_interface_peek().
	-- g_iface : 	any interface vtable for the interface, or the default vtable for the interface
	-- n_properties_p : 	location to store number of properties returned.
	-- Returns : 	a pointer to an array of pointers to GParamSpec structures. The paramspecs are owned by GLib, but the array should be freed with g_free() when you are done with it.

	-- Since 2.4

		
	-- g_object_new ()
	
	g_object_new (gtype_object_type: INTEGER; gchar_first_property_name:POINTER):POINTER is
			-- Creates a new instance of a GObject subtype and sets its properties.
		
			-- Construction parameters (see G_PARAM_CONSTRUCT, G_PARAM_CONSTRUCT_ONLY) which are not explicitly specified are set to their default values.
			-- object_type : 	the type id of the GObject subtype to instantiate
			-- first_property_name : 	the name of the first property;
			-- ... : 	the value of the first property, followed optionally by more name/value pairs, followed by NULL
			-- Returns : 	a new instance of object_type
			-- NOTE: this variadic call is called always with no additional parameters
		external "C use <glib-object.h>"
		end

	g_object_is_floating (object: POINTER): INTEGER is
		--	Checks wether object has a floating reference
		external "C use <glib-object.h>"
		end

	g_object_newv (gtype_object_type: INTEGER; guint_n_parameters: INTEGER;
						parameters: POINTER): POINTER is
			-- Creates a new instance of a GObject subtype and sets its properties.

			-- Construction parameters (see G_PARAM_CONSTRUCT,
			-- G_PARAM_CONSTRUCT_ONLY) which are not explicitly specified are set
			-- to their default values.

			-- object_type : 	the type id of the GObject subtype to instantiate
			-- n_parameters : 	the length of the parameters array
			-- parameters : 	an array of GParameter (i.e. GParameter *)
			-- Returns : 	a new instance of object_type
		external "C use <glib-object.h>"
		end
		
	g_object_ref (object: POINTER): POINTER is
			-- Increases the reference count of object.
			-- object : 	a GObject
			-- Returns : 	object
		external "C use <glib-object.h>"
		end

	g_object_unref (object: POINTER) is
			-- Decreases the reference count if object. When its reference count drops to 0, the object is finalized (i.e. its memory is freed).
			-- object : 	a GObject
		external "C use <glib-object.h>"
		end
	
	g_object_weak_ref (gobject, gweaknotify, data: POINTER) is
		external "C use <glib-object.h>"
		end

	g_object_weak_unref (gobject, gweaknotify, data: POINTER) is
		external "C use <glib-object.h>"
		end

	g_object_add_weak_pointer (gobject, weak_pointer_location: POINTER) is
		external "C use <glib-object.h>"
		end

	g_object_remove_weak_pointer (gobject, weak_pointer_location: POINTER) is
		external "C use <glib-object.h>"
		end

	-- void (*GToggleNotify) (gpointer data, GObject *object, gboolean
	-- is_last_ref);

	g_object_add_toggle_ref (gobject, gtogglenotify, data: POINTER) is
		external "C use <glib-object.h>"
		end

	g_object_remove_toggle_ref  (gobject, gtogglenotify, data: POINTER) is
		external "C use <glib-object.h>"
		end

	-- Note: g_object_connect not wrapped since it is variadic 

	-- Note: g_object_disconnect () not wrapped since it is variadic 

feature {} -- Property low-level setters
	-- Note: g_object_set is variadic; we wrap it with various kind of basic 
	-- types

	-- void        g_object_set                    (gpointer object,
	--                                              const gchar *first_property_name,
	--                                              ...);

	-- Sets properties on an object.
	-- object : 	a GObject
	-- first_property_name : 	name of the first property to set
	-- ... : 	value for the first property, followed optionally by more name/value pairs, followed by NULL
		-- external "C use <glib-object.h>"
		-- end

feature {} -- Low-level properties getters
	-- Note: g_object_get since it is variadic is wrapped many times
	-- with various name and various number of parameters. Paolo
	-- 2006-05-08

	-- void g_object_get (gpointer object, const gchar
	-- *first_property_name, ...);
	
	g_object_get_one_property (object, a_property_name, its_address, null_pointer: POINTER) is
		require last_pointer_is_null: null_pointer.is_null
		external "C use <glib-object.h>"
		alias "g_object_get"
		end

	g_object_get_two_properties (object, first_property_name, first_address, second_property_name, second_address, null_pointer: POINTER) is
		require last_pointer_is_null: null_pointer.is_null
		external "C use <glib-object.h>"
		alias "g_object_get"
		end

	g_object_get_three_properties (object, first_property_name, first_address,second_property_name, second_address, third_property_name, third_address, null_pointer: POINTER) is
		require last_pointer_is_null: null_pointer.is_null
		external "C use <glib-object.h>"
		alias "g_object_get"
		end

	-- Gets properties of an object.

	-- In general, a copy is made of the property contents and the caller is responsible for freeing the memory in the appropriate manner for the type, for instance by calling g_free() or g_object_unref().

		-- external "C use <glib-object.h>"
		-- end
	-- Example 2. Using g_object_get()

	-- An example of using g_object_get() to get the contents of three properties - one of type G_TYPE_INT, one of type G_TYPE_STRING, and one of type G_TYPE_OBJECT:

	--  gint intval;
	--  gchar *strval;
	--  GObject *objval; 

	--  g_object_get (my_object,
	--                "intproperty", &intval,
	--                "strproperty", &strval,
	--                "objproperty", &objval,
	--                NULL);

	--  /* Do something with intval, strval, objval */

	--  g_free (strval);
	--  g_object_unref (objval);

	-- object : 	a GObject
	-- first_property_name : 	name of the first property to get
	-- ... : 	return location for the first property, followed optionally by more name/return location pairs, followed by NULL
	-- g_object_notify ()

	g_object_notify (object,property_name: POINTER) is
			-- Emits a "notify" signal for the property property_name on object.
			-- object : 	a GObject
			-- property_name : 	the name of a property installed on the class of object.
		external "C use <glib-object.h>"
		end
	
	g_object_freeze_notify (object: POINTER) is
			-- Stops emission of "notify" signals on object. The signals are queued
			-- until g_object_thaw_notify() is called on object.

			-- This is necessary for accessors that modify multiple properties to
			-- prevent premature notification while the object is still being
			-- modified.  -- object : a GObject
		external "C use <glib-object.h>"
		end

	g_object_thaw_notify (object: POINTER) is
			-- Reverts the effect of a previous call to g_object_freeze_notify(). This causes all queued "notify" signals on object to be emitted.
			-- object : 	a GObject
		external "C use <glib-object.h>"
		end
	
	g_object_get_data (object,const_gchar_key: POINTER): POINTER is
			-- Gets a named field from the objects table of associations (see g_object_set_data()).
			-- object : 	GObject containing the associations
			-- key : 	name of the key for that association
			-- Returns : 	the data if found, or NULL if no such data exists.
		external "C use <glib-object.h>"
		end
	
	g_object_set_data (object,const_gchar_key, data: POINTER) is
			-- Each object carries around a table of associations from strings to pointers. This function lets you set an association.
		
			-- If the object already had an association with that name, the old association will be destroyed.
			-- object : 	GObject containing the associations.
			-- key : 	name of the key
			-- data : 	data to associate with that key
		external "C use <glib-object.h>"
		end
	
	-- g_object_set_data_full ()

	-- void        g_object_set_data_full          (GObject *object,
	--                                              const gchar *key,
	--                                              gpointer data,
	--                                              GDestroyNotify destroy);

	-- Like g_object_set_data() except it adds notification for when the association is destroyed, either by setting it to a different value or when the object is destroyed.
	-- object : 	GObject containing the associations
	-- key : 	name of the key
	-- data : 	data to associate with that key
	-- destroy : 	function to call when the association is destroyed
		-- external "C use <glib-object.h>"
		-- end
	-- g_object_steal_data ()
	
	g_object_steal_data (object, const_gchar_key: POINTER): POINTER is
			-- Remove a specified datum from the object's data associations, without invoking the association's destroy handler.
			-- object : 	GObject containing the associations
			-- key : 	name of the key
			-- Returns : 	the data if found, or NULL if no such data exists.
		external "C use <glib-object.h>"
		end

	g_object_get_qdata (a_object: POINTER; a_quark: INTEGER_32): POINTER is
			-- This function gets back user data pointers stored via g_object_set_qdata().
			-- object : 	The GObject to get a stored user data pointer from
			-- quark : 	A GQuark, naming the user data pointer
			-- Returns : 	The user data pointer set, or NULL
		external "C use <glib-object.h>"
		end

	g_object_set_qdata (an_object: POINTER; a_quark: INTEGER_32; some_data: POINTER) is
			-- This sets an opaque, named pointer on an object. The name
			-- is specified through a GQuark (retrived e.g. via
			-- g_quark_from_static_string()), and the pointer can be
			-- gotten back from the object with g_object_get_qdata()
			-- until the object is finalized. Setting a previously set
			-- user data pointer, overrides (frees) the old pointer set,
			-- using NULL as pointer essentially removes the data stored.
			
			-- object : 	The GObject to set store a user data pointer
			-- quark : 	A GQuark, naming the user data pointer
			-- data : 	An opaque user data pointer
		external "C use <glib-object.h>"
		end

	-- g_object_set_qdata_full ()

	-- void        g_object_set_qdata_full         (GObject *object,
	--                                              GQuark quark,
	--                                              gpointer data,
	--                                              GDestroyNotify destroy);

	-- This function works like g_object_set_qdata(), but in addition, a void (*destroy) (gpointer) function may be specified which is called with data as argument when the object is finalized, or the data is being overwritten by a call to g_object_set_qdata() with the same quark.
	-- object : 	The GObject to set store a user data pointer
	-- quark : 	A GQuark, naming the user data pointer
	-- data : 	An opaque user data pointer
	-- destroy : 	Function to invoke with data as argument, when data needs to be freed
		-- external "C use <glib-object.h>"
		-- end
	-- g_object_steal_qdata ()

	-- gpointer    g_object_steal_qdata            (GObject *object,
	--                                              GQuark quark);

	-- This function gets back user data pointers stored via g_object_set_qdata() and removes the data from object without invoking it's destroy() function (if any was set). Usually, calling this function is only required to update user data pointers with a destroy notifier, for example:

	-- void
	-- object_add_to_user_list (GObject     *object,
	--                          const gchar *new_string)
	-- {
	--   /* the quark, naming the object data */
	--   GQuark quark_string_list = g_quark_from_static_string ("my-string-list");
	--   /* retrive the old string list */
	--   GList *list = g_object_steal_qdata (object, quark_string_list);

	--   /* prepend new string */
	--   list = g_list_prepend (list, g_strdup (new_string));
	--   /* this changed 'list', so we need to set it again */
	--   g_object_set_qdata_full (object, quark_string_list, list, free_string_list);
	-- }
	-- static void
	-- free_string_list (gpointer data)
	-- {
	--   GList *node, *list = data;

	--   for (node = list; node; node = node->next)
	--     g_free (node->data);
	--   g_list_free (list);
	-- }

	-- Using g_object_get_qdata() in the above example, instead of g_object_steal_qdata() would have left the destroy function set, and thus the partial string list would have been freed upon g_object_set_qdata_full().
	-- object : 	The GObject to get a stored user data pointer from
	-- quark : 	A GQuark, naming the user data pointer
	-- Returns : 	The user data pointer set, or NULL
		-- external "C use <glib-object.h>"
		-- end


	g_object_set_property (object, property_name,value: POINTER) is
			-- Sets a property on an object.
			-- object : 	a GObject
			-- property_name : 	the name of the property to set
			-- value : 	the value
		external "C use <glib-object.h>"
		end
	
	g_object_set_int_property (object, property_name: POINTER; value: INTEGER) is
			-- see g_object_set_property
		external "C use <glib-object.h>"
			alias "g_object_set_property"
		end

	g_object_set_int32_property (object, property_name: POINTER; value: INTEGER_32) is
			-- see g_object_set_property
		external "C use <glib-object.h>"
			alias "g_object_set_property"
		end

	g_object_set_int16_property (object, property_name: POINTER; value: INTEGER_16) is
			-- see g_object_set_property
		external "C use <glib-object.h>"
			alias "g_object_set_property"
		end

	g_object_set_int64_property (object, property_name: POINTER; value: INTEGER_64) is
			-- see g_object_set_property
		external "C use <glib-object.h>"
			alias "g_object_set_property"
		end

	g_object_set_double_property (object, property_name: POINTER; value: REAL) is
			-- see g_object_set_property
		external "C use <glib-object.h>"
			alias "g_object_set_property"
		end

	g_object_set_float_property (object, property_name: POINTER; value: REAL_32) is
			-- see g_object_set_property
		external "C use <glib-object.h>"
		alias "g_object_set_property"
		end
			
	g_object_set_real64_property (object, property_name: POINTER; value: REAL_64) is
			-- see g_object_set_property
		external "C use <glib-object.h>"
			alias "g_object_set_property"
		end
	
	g_object_get_property (object,property_name,value: POINTER) is
			-- Gets a property of an object.

			-- In general, a copy is made of the property contents and the caller
			-- is responsible for freeing the memory by calling g_value_unset().

			-- Note that g_object_get_property() is really intended for language
			-- bindings, g_object_get() is much more convenient for C programming.
			-- (hey! It is just our case! Paolo 2005-12-28)
		
			-- object : 	a GObject
			-- property_name : 	(const gchar *) the name of the property to get
			-- value : 	(GValue *) return location for the property value
			 external "C use <glib-object.h>"
			 end
	-- g_object_new_valist ()

	-- GObject*    g_object_new_valist             (GType object_type,
	--                                              const gchar *first_property_name,
	--                                              va_list var_args);

	-- Creates a new instance of a GObject subtype and sets its properties.

	-- Construction parameters (see G_PARAM_CONSTRUCT, G_PARAM_CONSTRUCT_ONLY) which are not explicitly specified are set to their default values.
	-- object_type : 	the type id of the GObject subtype to instantiate
	-- first_property_name : 	the name of the first property
	-- var_args : 	the value of the first property, followed optionally by more name/value pairs, followed by NULL
	-- Returns : 	a new instance of object_type
		-- external "C use <glib-object.h>"
		-- end
	-- g_object_set_valist ()

	-- void        g_object_set_valist             (GObject *object,
	--                                              const gchar *first_property_name,
	--                                              va_list var_args);

	-- Sets properties on an object.
	-- object : 	a GObject
	-- first_property_name : 	name of the first property to set
	-- var_args : 	value for the first property, followed optionally by more name/value pairs, followed by NULL
		-- external "C use <glib-object.h>"
		-- end
	-- g_object_get_valist ()

	-- void        g_object_get_valist             (GObject *object,
	--                                              const gchar *first_property_name,
	--                                              va_list var_args);

	-- Gets properties of an object.

	-- In general, a copy is made of the property contents and the caller is responsible for freeing the memory in the appropriate manner for the type, for instance by calling g_free() or g_object_unref().

	-- See g_object_get().
	-- object : 	a GObject
	-- first_property_name : 	name of the first property to get
	-- var_args : 	return location for the first property, followed optionally by more name/return location pairs, followed by NULL
		-- external "C use <glib-object.h>"
		-- end
	-- g_object_watch_closure ()

	-- void        g_object_watch_closure          (GObject *object,
	--                                              GClosure *closure);

	-- This function essentially limits the life time of the closure to the life time of the object. That is, when the object is finalized, the closure is invalidated by calling g_closure_invalidate() on it, in order to prevent invocations of the closure with a finalized (nonexisting) object. Also, g_object_ref() and g_object_unref() are added as marshal guards to the closure, to ensure that an extra reference count is held on object during invocation of the closure. Usually, this function will be called on closures that use this object as closure data.
	-- object : 	GObject restricting lifetime of closure
	-- closure : 	GClosure to watch
		-- external "C use <glib-object.h>"
		-- end
	-- g_object_run_dispose ()

	-- void        g_object_run_dispose            (GObject *object);

	-- Releases all references to other objects. This can be used to break reference cycles.
	-- Note

	-- This functions should only be called from object system implementations.
	-- object : 	a GObject
		-- external "C use <glib-object.h>"
		-- end
	-- G_OBJECT_WARN_INVALID_PROPERTY_ID()

	-- #define     G_OBJECT_WARN_INVALID_PROPERTY_ID(object, property_id, pspec)

	-- This macros should be used to emit a standard warning about unexpected properties in set_property() and get_property() implementations.
	-- object : 	the GObject on which set_property() or get_property() was called
	-- property_id : 	the numeric id of the property
	-- pspec : 	the GParamSpec of the property

		-- external "C use <glib-object.h>"
		-- end

	-- Signal Details
	-- The "notify" signal

	-- void        user_function                  (GObject *gobject,
	--                                             GParamSpec *arg1,
	--                                             gpointer user_data);

	-- The notify signal is emitted on an object when one of its properties has been changed. Note that getting this signal doesn't guarantee that the value of the property has actually changed, it may also be emitted when the setter for the property is called to reinstate the previous value.
	-- gobject : 	the object which received the signal.
	-- pspec : 	the GParamSpec of the property which changed
	-- user_data : 	user data set when the signal handler was connected.
	-- See Also

	-- GParamSpecObject, g_param_spec_object()
feature {} -- GObjectConstructParam struct

	-- typedef struct {
	--   GParamSpec *pspec;
	--   GValue     *value;
	-- } GObjectConstructParam;

	-- The GObjectConstructParam struct is an auxiliary structure used
	-- to hand GParamSpec/GValue pairs to the constructor of a
	-- GObjectClass.

	-- GParamSpec *pspec; 	the GParamSpec of the construct parameter

	-- GValue *value; 	the value to set the parameter to
feature {} -- GObjectClass structure

	-- typedef struct {
	-- GTypeClass g_type_class;

	-- /* overridable methods */
	-- GObject* (*constructor) (GType type, guint n_construct_properties, GObjectConstructParam *construct_properties);
	-- void (*set_property) (GObject *object, guint property_id, const GValue *value, GParamSpec *pspec);
	-- void (*get_property) (GObject *object, guint property_id, GValue *value, GParamSpec *pspec);
	-- void (*dispose) (GObject *object);
	-- void (*finalize) (GObject *object);
 
	-- /* seldomly overidden */
	-- void (*dispatch_properties_changed) (GObject *object, guint n_pspecs, GParamSpec **pspecs);

	-- /* signals */
	-- void (*notify) (GObject	*object, GParamSpec	*pspec);
	-- } GObjectClass;

	g_object_class_get_set_property (a_class: POINTER): POINTER is
		external "C struct GObjectClass get set_property use <glib-object.h>"
		end

feature {} -- Invoking virtual calls defined in GObjectClass

	invoke_set_property (g_object_class, handle: POINTER; param_id: INTEGER; a_value, pspec: POINTER) is
		external "C inline"
		alias "(/* G_OBJECT.invoke_set_property*/(G_OBJECT_CLASS($g_object_class))->set_property($handle,$param_id, $a_value, $pspec))"
		end

	invoke_get_property (g_object_class, handle: POINTER; param_id: INTEGER; a_value, pspec: POINTER) is
		external "C inline"
		alias "(/* G_OBJECT.invoke_get_property*/(G_OBJECT_CLASS($g_object_class))->get_property($handle,$param_id, $a_value, $pspec))"
		end

end

