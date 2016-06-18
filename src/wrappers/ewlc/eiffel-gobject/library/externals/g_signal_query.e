note
	description: "A structure holding in-depth information for a specific signal. It is filled in by G_SIGNALS.query feature."
	copyright: "(C) 2005 Paolo Redaelli "
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision "$REvision:$"

class G_SIGNAL_QUERY

inherit G_STRUCT

insert G_SIGNAL_FLAGS

create {ANY} allocate

feature {ANY} -- getters
	id: INTEGER
			-- The signal id of the queried signal; 0 if the queried
			-- signal was unknown.
		do
			Result:=signal_id(handle)
		end

	name: STRING
			-- The signal name.
		do
			create Result.from_external_copy (signal_name(handle))
		end

	type: INTEGER
			-- Signal's G_TYPE number
		do
			Result:=itype(handle)
		end
	
	flags: INTEGER
			-- Signal flags, (see G_SIGNAL_FLAGS)
		do
			Result:=signal_flags(handle)
		ensure valid_flags: are_valid_signal_flags (Result)
		end

	struct_size: INTEGER
		external "C inline use <glib-object.h>"
		alias "sizeof(GSignalQuery)"
		end
	
feature {} -- Implementation

	signal_id (query:POINTER): INTEGER
			-- guint signal_id; The signal id of the signal being
			-- queried, or 0 if the signal to be queried was unknown.
		external "C struct GSignalQuery get signal_id use <glib-object.h>"
		end

	signal_name(query:POINTER): POINTER
			-- const gchar *signal_name; The signal name.
		external "C struct GSignalQuery get signal_name use <glib-object.h>"
		end

	itype (query:POINTER): INTEGER
			-- GType itype; The interface/instance type that this signal
			-- can be emitted for.
		external "C struct GSignalQuery get signal_itype use <glib-object.h>"
		end

	signal_flags (query:POINTER): INTEGER
			-- GSignalFlags signal_flags; The signal flags as passed in
			-- to g_signal_new().
		external "C struct GSignalQuery get signal_flags use <glib-object.h>"
		end

	return_type (query:POINTER): INTEGER
			-- TODO: wrap it GType return_type; The return type for user callbacks.
		external "C struct GSignalQuery get return_type use <glib-object.h>"
		end

	n_params (query:POINTER): INTEGER
			-- TODO: wrap it guint n_params; The number of parameters that user
			-- callbacks take.
		external "C struct GSignalQuery get n_params use <glib-object.h>"
		end

	param_types (query:POINTER): POINTER
			-- TODO: wrap it (is it wrappable? Paolo) const GType
			-- *param_types; The individual parameter types for user
			-- callbacks, note that the effective callback signature is:
			-- return_type callback (gpointer data1, [param_types
			-- param_names,] gpointer data2);
		external "C struct GSignalQuery get param_types use <glib-object.h>"
		end
	
	-- Note: this structure is filled up only by g_signal_query function
	-- and all members filled into the GSignalQuery structure should be
	-- considered constant and have to be left untouched. Therefore
	-- there's no setters for this structure
	
end
