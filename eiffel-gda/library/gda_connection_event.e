indexing
	description: "."
	copyright: "[
					Copyright (C) 2006 Paolo Redaelli, GDA team
					
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

class FOO

inherit
	(SHARED_?)C_STRUCT

insert
	FOO_EXTERNALS

creation make, from_external_pointer

feature {} -- Creation
-- GdaConnectionEvent — Any event which has occurred on a GdaConnection
	
-- Synopsis



--             GdaConnectionEvent;
--             GdaConnectionEventPrivate;
-- enum        GdaConnectionEventType;
-- enum        GdaConnectionEventCode;
-- GdaConnectionEvent* gda_connection_event_new
--                                             (GdaConnectionEventType type);
-- void        gda_connection_event_free       (GdaConnectionEvent *event);
-- GList*      gda_connection_event_list_copy  (const GList *events);
-- void        gda_connection_event_list_free  (GList *events);
-- void        gda_connection_event_set_event_type
--                                             (GdaConnectionEvent *event,
--                                              GdaConnectionEventType type);
-- GdaConnectionEventType gda_connection_event_get_event_type
--                                             (GdaConnectionEvent *event);
-- const gchar* gda_connection_event_get_description
--                                             (GdaConnectionEvent *event);
-- void        gda_connection_event_set_description
--                                             (GdaConnectionEvent *event,
--                                              const gchar *description);
-- glong       gda_connection_event_get_code   (GdaConnectionEvent *event);
-- void        gda_connection_event_set_code   (GdaConnectionEvent *event,
--                                              glong code);
-- GdaConnectionEventCode gda_connection_event_get_gda_code
--                                             (GdaConnectionEvent *event);
-- void        gda_connection_event_set_gda_code
--                                             (GdaConnectionEvent *event,
--                                              GdaConnectionEventCode code);
-- const gchar* gda_connection_event_get_source
--                                             (GdaConnectionEvent *event);
-- void        gda_connection_event_set_source (GdaConnectionEvent *event,
--                                              const gchar *source);
-- const gchar* gda_connection_event_get_sqlstate
--                                             (GdaConnectionEvent *event);
-- void        gda_connection_event_set_sqlstate
--                                             (GdaConnectionEvent *event,
--                                              const gchar *sqlstate);


-- Object Hierarchy

--   GObject
--    +----GdaConnectionEvent

-- Description

-- Events occuring on a connection are each represented as a GdaConnectionEvent object. Each GdaConnection is responsible for keeping a list of past events; that list can be consulted using the gda_connection_get_events() function.
-- Details
-- GdaConnectionEvent

-- typedef struct _GdaConnectionEvent GdaConnectionEvent;

-- GdaConnectionEventPrivate

-- typedef struct _GdaConnectionEventPrivate GdaConnectionEventPrivate;

-- enum GdaConnectionEventType

-- typedef enum {
-- 	GDA_CONNECTION_EVENT_NOTICE,
-- 	GDA_CONNECTION_EVENT_WARNING,
-- 	GDA_CONNECTION_EVENT_ERROR
-- } GdaConnectionEventType;

-- enum GdaConnectionEventCode

-- typedef enum
-- {
--        GDA_CONNECTION_EVENT_CODE_CONSTRAINT_VIOLATION,
--        GDA_CONNECTION_EVENT_CODE_RESTRICT_VIOLATION,
--        GDA_CONNECTION_EVENT_CODE_NOT_NULL_VIOLATION,
--        GDA_CONNECTION_EVENT_CODE_FOREIGN_KEY_VIOLATION,
--        GDA_CONNECTION_EVENT_CODE_UNIQUE_VIOLATION,
--        GDA_CONNECTION_EVENT_CODE_CHECK_VIOLATION,
--        GDA_CONNECTION_EVENT_CODE_INSUFFICIENT_PRIVILEGES,
--        GDA_CONNECTION_EVENT_CODE_UNDEFINED_COLUMN,
--        GDA_CONNECTION_EVENT_CODE_UNDEFINED_FUNCTION,
--        GDA_CONNECTION_EVENT_CODE_UNDEFINED_TABLE,
--        GDA_CONNECTION_EVENT_CODE_DUPLICATE_COLUMN,
--        GDA_CONNECTION_EVENT_CODE_DUPLICATE_DATABASE,
--        GDA_CONNECTION_EVENT_CODE_DUPLICATE_FUNCTION,
--        GDA_CONNECTION_EVENT_CODE_DUPLICATE_SCHEMA,
--        GDA_CONNECTION_EVENT_CODE_DUPLICATE_TABLE,
--        GDA_CONNECTION_EVENT_CODE_DUPLICATE_ALIAS,
--        GDA_CONNECTION_EVENT_CODE_DUPLICATE_OBJECT,
--        GDA_CONNECTION_EVENT_CODE_SYNTAX_ERROR,
--        GDA_CONNECTION_EVENT_CODE_UNKNOWN
-- } GdaConnectionEventCode;

-- gda_connection_event_new ()

-- GdaConnectionEvent* gda_connection_event_new
--                                             (GdaConnectionEventType type);

-- type : 	
-- Returns : 	
-- gda_connection_event_free ()

-- void        gda_connection_event_free       (GdaConnectionEvent *event);

-- Frees the memory allocated by the event object.

-- event : 	the event object.
-- gda_connection_event_list_copy ()

-- GList*      gda_connection_event_list_copy  (const GList *events);

-- Creates a new list which contains the same events as events and adds a reference for each event in the list.

-- You must free the list using gda_connection_event_list_free.

-- events : 	a GList holding event objects.
-- Returns : 	a list of events.
-- gda_connection_event_list_free ()

-- void        gda_connection_event_list_free  (GList *events);

-- Frees all event objects in the list and the list itself. After this function has been called, the events parameter doesn't point to valid storage any more.

-- events : 	a GList holding event objects.
-- gda_connection_event_set_event_type ()

-- void        gda_connection_event_set_event_type
--                                             (GdaConnectionEvent *event,
--                                              GdaConnectionEventType type);

-- Sets event's severity (from a simple notice to a fatal event)

-- event : 	a GdaConnectionEvent object
-- type : 	the severity of the event
-- gda_connection_event_get_event_type ()

-- GdaConnectionEventType gda_connection_event_get_event_type
--                                             (GdaConnectionEvent *event);

-- Get event's severity (from a simple notice to a fatal event)

-- event : 	a GdaConnectionEvent object
-- Returns : 	the event type
-- gda_connection_event_get_description ()

-- const gchar* gda_connection_event_get_description
--                                             (GdaConnectionEvent *event);

-- event : 	a GdaConnectionEvent.
-- Returns : 	event's description.
-- gda_connection_event_set_description ()

-- void        gda_connection_event_set_description
--                                             (GdaConnectionEvent *event,
--                                              const gchar *description);

-- Sets event's description.

-- event : 	a GdaConnectionEvent.
-- description : 	a description.
-- gda_connection_event_get_code ()

-- glong       gda_connection_event_get_code   (GdaConnectionEvent *event);

-- event : 	a GdaConnectionEvent.
-- Returns : 	event's code (the code is specific to the provider being used)
-- gda_connection_event_set_code ()

-- void        gda_connection_event_set_code   (GdaConnectionEvent *event,
--                                              glong code);

-- Sets event's code: the code is specific to the provider being used. If you want to have a common understanding of the event codes, use gda_connection_event_get_gda_code() instead.

-- event : 	a GdaConnectionEvent.
-- code : 	a code.
-- gda_connection_event_get_gda_code ()

-- GdaConnectionEventCode gda_connection_event_get_gda_code
--                                             (GdaConnectionEvent *event);

-- Retreive the code associated to event.

-- event : 	a GdaConnectionEvent
-- Returns : 	the GdaConnectionEventCode event's code
-- gda_connection_event_set_gda_code ()

-- void        gda_connection_event_set_gda_code
--                                             (GdaConnectionEvent *event,
--                                              GdaConnectionEventCode code);

-- Sets event's gda code: that code is standardized by the libgda library. If you want to specify the corresponding provider specific code, use gda_connection_event_get_code() instead.

-- event : 	a GdaConnectionEvent
-- code : 	a code
-- gda_connection_event_get_source ()

-- const gchar* gda_connection_event_get_source
--                                             (GdaConnectionEvent *event);

-- event : 	a GdaConnectionEvent.
-- Returns : 	event's source.
-- gda_connection_event_set_source ()

-- void        gda_connection_event_set_source (GdaConnectionEvent *event,
--                                              const gchar *source);

-- Sets event's source.

-- event : 	a GdaConnectionEvent.
-- source : 	a source.
-- gda_connection_event_get_sqlstate ()

-- const gchar* gda_connection_event_get_sqlstate
--                                             (GdaConnectionEvent *event);

-- event : 	a GdaConnectionEvent.
-- Returns : 	event's SQL state.
-- gda_connection_event_set_sqlstate ()

-- void        gda_connection_event_set_sqlstate
--                                             (GdaConnectionEvent *event,
--                                              const gchar *sqlstate);

-- Sets event's SQL state.

-- event : 	a GdaConnectionEvent.
-- sqlstate : 	SQL state.

end -- class FOO
