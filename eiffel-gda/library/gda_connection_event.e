indexing
	description: "GdaConnectionEvent - Any event which has occurred on a GdaConnection."
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

class GDA_CONNECTION_EVENT
	-- Events occuring on a connection are each represented as a
	-- GDA_CONNECTION_EVENT object. Each GDA_CONNECTION is responsible
	-- for keeping a list of past events in the `events' feature.

inherit 
	G_OBJECT
		redefine 
			dispose 
		end

insert 
	GDA_CONNECTION_EVENT_TYPE
	GDA_CONNECTION_EVENT_CODE

creation make, from_external_pointer

feature {} -- Creation
	make (a_type: INTEGER) is
			require is_valid_connection_event_type(a_type)
		do
			from_external_pointer(gda_connection_event_new(a_type))
		end

feature
	dispose is
			--   Frees the memory allocated by the event object.
		do
			gda_connection_event_free(handle)
		end

feature 
	--  gda_connection_event_list_copy ()
	--
	-- GList*              gda_connection_event_list_copy      (const GList *events);
	--
	--   Creates a new list which contains the same events as events and adds a
	--   reference for each event in the list.
	--
	--   You must free the list using gda_connection_event_list_free.
	--
	--   events :  a GList holding event objects.
	--   Returns : a list of events.

	--	list_free is
	-- do
	-- gda_connection_event_list_free      (GList *events);
	--
	--   Frees all event objects in the list and the list itself. After this
	--   function has been called, the events parameter doesn't point to valid
	--   storage any more.
	--
	--   events : a GList holding event objects.

	set_event_type (a_type: INTEGER) is
			--   Sets event's severity (from a simple notice to a fatal event)
		require is_valid_connection_event_type(a_type)
		do
			gda_connection_event_set_event_type (handle, a_type)
		end

	event_type: INTEGER is
			-- event's severity (from a simple notice to a fatal event)
		do
			Result:=gda_connection_event_get_event_type(handle)
		ensure  is_valid_connection_event_type(Result)
		end

	description: CONST_STRING is
		do
			create Result.from_external(gda_connection_event_get_description(handle))
		ensure not_void: Result/=Void
		end

	set_description (a_description: STRING) is
			--   Sets event's description.
		require description_not_void: a_description/=Void
		do	
			gda_connection_event_set_description(handle,a_description.to_external)	--
		end

	code: like glong is
		do
			Result := gda_connection_event_get_code(handle)
		end

	set_code (a_code: like glong) is
			-- Sets event's code: the code is specific to the provider
			-- being used. If you want to have a common understanding of
			-- the event codes, use gda_connection_event_get_gda_code()
			-- instead.
		do
			gda_connection_event_set_code(handle, a_code)
		end

	gda_code: like glong is
			-- the code associated to event.
		do
			Result:=gda_connection_event_get_gda_code(handle)
		end

	set_gda_code (a_code: INTEGER) is
			-- Sets event's gda code: that code is standardized by the
			-- libgda library. If you want to specify the corresponding
			-- provider specific code, use `code' instead.
		require is_valid_connection_event_code(a_code)
		do
			gda_connection_event_set_gda_code(handle,a_code)
		end

	source: CONST_STRING is
		do
			create Result.from_external(gda_connection_event_get_source(handle))
		end

	set_source (a_source: STRING) is
			--   Sets event's source.
		require source_not_void: a_source/=Void
		do
			gda_connection_event_set_source (handle, a_source.to_external)
		end

	--  gda_connection_event_get_sqlstate ()
	--
	-- const gchar*        gda_connection_event_get_sqlstate   (GdaConnectionEvent *event);
	--
	--   event :   a GdaConnectionEvent.
	--   Returns : event's SQL state.
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_connection_event_set_sqlstate ()
	--
	-- void                gda_connection_event_set_sqlstate   (GdaConnectionEvent *event,
	--                                                          const gchar *sqlstate);
	--
	--   Sets event's SQL state.
	--
	--   event :    a GdaConnectionEvent.
	--   sqlstate : SQL state.
	--
	--Properties
	--
	--
	--   "type"                     gint                  : Read / Write
	--
	--Property Details
	--
	--  The "type" property
	--
	--   "type"                     gint                  : Read / Write
	--
	--   Connection event type.
	--
	--   Allowed values: [0,2]
	--
	--   Default value: 2

feature -- size
	struct_size: INTEGER is
		external "C inline use <libgda/libgda.h>"
		alias "sizeof(GdaConnectionEvent)"
		end
	--                     GdaConnectionEventPrivate;
	-- enum                GdaConnectionEventType;
	-- enum                GdaConnectionEventCode;

feature {} -- External calls
	gda_connection_event_new (a_type: INTEGER): POINTER is
			--	GdaConnectionEvent* gda_connection_event_new (GdaConnectionEventType type);
		external "C  use <libgda/libgda.h>"
		end

	gda_connection_event_free (an_event: POINTER) is
			-- void gda_connection_event_free (GdaaaConnectionEvent
			-- *event);
		external "C  use <libgda/libgda.h>"
		end

	gda_connection_event_list_copy (some_events: POINTER): POINTER is
			-- 	GList* gda_connection_event_list_copy (const GList *events);
		external "C  use <libgda/libgda.h>"
		end

	gda_connection_event_list_free (some_events: POINTER) is
			-- 	void gda_connection_event_list_free (GList *events);
		external "C  use <libgda/libgda.h>"
		end

	gda_connection_event_set_event_type (an_event: POINTER; a_type: INTEGER) is
			-- void gda_connection_event_set_event_type
			-- (GdaConnectionEvent *event, GdaConnectionEventType type);
		external "C  use <libgda/libgda.h>"
		end

	gda_connection_event_get_event_type (an_event: POINTER): INTEGER is
			--	GdaConnectionEventType gda_connection_event_get_event_type
			--	(GdaConnectionEvent *event);
		external "C  use <libgda/libgda.h>"
		end

	gda_connection_event_get_description (an_event: POINTER): POINTER is
			-- const gchar* gda_connection_event_get_description
			-- (GdaConnectionEvent *event);
		external "C  use <libgda/libgda.h>"
		end

	gda_connection_event_set_description (an_event: POINTER; a_description: POINTER) is
			--	void gda_connection_event_set_description
			--	(GdaConnectionEvent *event, const gchar *description);
		external "C  use <libgda/libgda.h>"
		end
	
	gda_connection_event_get_code (an_event: POINTER): like glong is
			-- 	glong gda_connection_event_get_code (GdaConnectionEvent *event);
		external "C  use <libgda/libgda.h>"
		end

	gda_connection_event_set_code (an_event: POINTER; a_code: like glong) is
			-- 	void gda_connection_event_set_code (GdaConnectionEvent *event, glong code);
		external "C  use <libgda/libgda.h>"
		end

	gda_connection_event_get_gda_code (an_event: POINTER): INTEGER is
			--	GdaConnectionEventCode gda_connection_event_get_gda_code (GdaConnectionEvent *event);
		external "C  use <libgda/libgda.h>"
		end

	gda_connection_event_set_gda_code (an_event: POINTER; a_connection_event_code: INTEGER) is
			--	void gda_connection_event_set_gda_code (GdaConnectionEvent *event, GdaConnectionEventCode code);
		external "C  use <libgda/libgda.h>"
		end
	
	gda_connection_event_get_source (an_event: POINTER): POINTER is
			-- const gchar* gda_connection_event_get_source
			-- (GdaConnectionEvent *event);
		external "C  use <libgda/libgda.h>"
		end
	
	gda_connection_event_set_source (an_event: POINTER; a_source: POINTER) is
			-- 	void gda_connection_event_set_source (GdaConnectionEvent *event, const gchar *source);
		external "C  use <libgda/libgda.h>"
		end
	
	gda_connection_event_get_sqlstate (an_event: POINTER): POINTER is
			-- 	const gchar* gda_connection_event_get_sqlstate (GdaConnectionEvent *event);
		external "C  use <libgda/libgda.h>"
		end

	gda_connection_event_set_sqlstate (an_event: POINTER; an_sql_state: POINTER) is
			--	void gda_connection_event_set_sqlstate (GdaConnectionEvent
			--	*event, const gchar *sqlstate);
		external "C  use <libgda/libgda.h>"
		end
end -- class GDA_CONNECTION_EVENT
