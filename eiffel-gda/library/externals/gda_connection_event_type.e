indexing
	description: "Enum GdaConnectionEventType"
	status: "[
                  AUTOMATICALLY GENERATED FILE. 

                  ANY CHANGE TO THIS WILL BE OVERWRITTEN BY NEXT
                  EXECUTION OF GENERATING SCRIPT!  You can put your
                  changes in the patch file gda_connection_event_type.e.patch;
                  those changes will be applied to the newly generated
                  file.
                  ]"

expanded class GDA_CONNECTION_EVENT_TYPE
       -- Enum GdaConnectionEventType

insert ENUM

creation set_notice

feature -- Setters

    set_notice is 
       do
          value := gda_connection_event_notice 
       ensure is_notice 
       end

    set_warning is 
       do
          value := gda_connection_event_warning 
       ensure is_warning 
       end

    set_error is 
       do
          value := gda_connection_event_error 
       ensure is_error 
       end

feature -- Queries

    is_notice: BOOLEAN is do Result:=(value=gda_connection_event_notice) end

    is_warning: BOOLEAN is do Result:=(value=gda_connection_event_warning) end

    is_error: BOOLEAN is do Result:=(value=gda_connection_event_error) end


    is_valid_value (a_value: INTEGER): BOOLEAN is 
        do 
           Result:=(
                    (a_value=gda_connection_event_notice) or else
                    (a_value=gda_connection_event_warning) or else
                    (a_value=gda_connection_event_error) or else
                    False -- A little hack to simplifies the generating script.
                    )
        end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values

    gda_connection_event_notice: INTEGER is
         external "C macro use /usr/include/libgda-3.0/libgda/gda-connection-event.h"
         alias "GDA_CONNECTION_EVENT_NOTICE"
         end

    gda_connection_event_warning: INTEGER is
         external "C macro use /usr/include/libgda-3.0/libgda/gda-connection-event.h"
         alias "GDA_CONNECTION_EVENT_WARNING"
         end

    gda_connection_event_error: INTEGER is
         external "C macro use /usr/include/libgda-3.0/libgda/gda-connection-event.h"
         alias "GDA_CONNECTION_EVENT_ERROR"
         end

end -- class GDA_CONNECTION_EVENT_TYPE
