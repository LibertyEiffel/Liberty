indexing
	description: "Enum GdaConnectionError"
	status: "[
                  AUTOMATICALLY GENERATED FILE. 

                  ANY CHANGE TO THIS WILL BE OVERWRITTEN BY NEXT
                  EXECUTION OF GENERATING SCRIPT!  You can put your
                  changes in the patch file gda_connection_error.e.patch;
                  those changes will be applied to the newly generated
                  file.
                  ]"

expanded class GDA_CONNECTION_ERROR
       -- Enum GdaConnectionError

insert ENUM

creation set_conn_open_error

feature -- Setters

    set_conn_open_error is 
       do
          value := gda_connection_conn_open_error 
       ensure is_conn_open_error 
       end

    set_do_query_error is 
       do
          value := gda_connection_do_query_error 
       ensure is_do_query_error 
       end

    set_nonexist_dsn_error is 
       do
          value := gda_connection_nonexist_dsn_error 
       ensure is_nonexist_dsn_error 
       end

    set_no_cnc_spec_error is 
       do
          value := gda_connection_no_cnc_spec_error 
       ensure is_no_cnc_spec_error 
       end

    set_no_provider_spec_error is 
       do
          value := gda_connection_no_provider_spec_error 
       ensure is_no_provider_spec_error 
       end

    set_open_error is 
       do
          value := gda_connection_open_error 
       ensure is_open_error 
       end

    set_execute_command_error is 
       do
          value := gda_connection_execute_command_error 
       ensure is_execute_command_error 
       end

feature -- Queries

    is_conn_open_error: BOOLEAN is do Result:=(value=gda_connection_conn_open_error) end

    is_do_query_error: BOOLEAN is do Result:=(value=gda_connection_do_query_error) end

    is_nonexist_dsn_error: BOOLEAN is do Result:=(value=gda_connection_nonexist_dsn_error) end

    is_no_cnc_spec_error: BOOLEAN is do Result:=(value=gda_connection_no_cnc_spec_error) end

    is_no_provider_spec_error: BOOLEAN is do Result:=(value=gda_connection_no_provider_spec_error) end

    is_open_error: BOOLEAN is do Result:=(value=gda_connection_open_error) end

    is_execute_command_error: BOOLEAN is do Result:=(value=gda_connection_execute_command_error) end


    is_valid_value (a_value: INTEGER): BOOLEAN is 
        do 
           Result:=(
                    (a_value=gda_connection_conn_open_error) or else
                    (a_value=gda_connection_do_query_error) or else
                    (a_value=gda_connection_nonexist_dsn_error) or else
                    (a_value=gda_connection_no_cnc_spec_error) or else
                    (a_value=gda_connection_no_provider_spec_error) or else
                    (a_value=gda_connection_open_error) or else
                    (a_value=gda_connection_execute_command_error) or else
                    False -- A little hack to simplifies the generating script.
                    )
        end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values

    gda_connection_conn_open_error: INTEGER is
         external "C macro use /usr/include/libgda-3.0/libgda/gda-connection.h"
         alias "GDA_CONNECTION_CONN_OPEN_ERROR"
         end

    gda_connection_do_query_error: INTEGER is
         external "C macro use /usr/include/libgda-3.0/libgda/gda-connection.h"
         alias "GDA_CONNECTION_DO_QUERY_ERROR"
         end

    gda_connection_nonexist_dsn_error: INTEGER is
         external "C macro use /usr/include/libgda-3.0/libgda/gda-connection.h"
         alias "GDA_CONNECTION_NONEXIST_DSN_ERROR"
         end

    gda_connection_no_cnc_spec_error: INTEGER is
         external "C macro use /usr/include/libgda-3.0/libgda/gda-connection.h"
         alias "GDA_CONNECTION_NO_CNC_SPEC_ERROR"
         end

    gda_connection_no_provider_spec_error: INTEGER is
         external "C macro use /usr/include/libgda-3.0/libgda/gda-connection.h"
         alias "GDA_CONNECTION_NO_PROVIDER_SPEC_ERROR"
         end

    gda_connection_open_error: INTEGER is
         external "C macro use /usr/include/libgda-3.0/libgda/gda-connection.h"
         alias "GDA_CONNECTION_OPEN_ERROR"
         end

    gda_connection_execute_command_error: INTEGER is
         external "C macro use /usr/include/libgda-3.0/libgda/gda-connection.h"
         alias "GDA_CONNECTION_EXECUTE_COMMAND_ERROR"
         end

end -- class GDA_CONNECTION_ERROR
