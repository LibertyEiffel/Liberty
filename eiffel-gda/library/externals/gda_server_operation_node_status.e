indexing
	description: "Enum GdaServerOperationNodeStatus"
	status: "[
                  AUTOMATICALLY GENERATED FILE. 

                  ANY CHANGE TO THIS WILL BE OVERWRITTEN BY NEXT
                  EXECUTION OF GENERATING SCRIPT!  You can put your
                  changes in the patch file gda_server_operation_node_status.e.patch;
                  those changes will be applied to the newly generated
                  file.
                  ]"

expanded class GDA_SERVER_OPERATION_NODE_STATUS
       -- Enum GdaServerOperationNodeStatus

insert ENUM

creation set_optional

feature -- Setters

    set_optional is 
       do
          value := gda_server_operation_status_optional 
       ensure is_optional 
       end

    set_required is 
       do
          value := gda_server_operation_status_required 
       ensure is_required 
       end

    set_unknown is 
       do
          value := gda_server_operation_status_unknown 
       ensure is_unknown 
       end

feature -- Queries

    is_optional: BOOLEAN is do Result:=(value=gda_server_operation_status_optional) end

    is_required: BOOLEAN is do Result:=(value=gda_server_operation_status_required) end

    is_unknown: BOOLEAN is do Result:=(value=gda_server_operation_status_unknown) end


    is_valid_value (a_value: INTEGER): BOOLEAN is 
        do 
           Result:=(
                    (a_value=gda_server_operation_status_optional) or else
                    (a_value=gda_server_operation_status_required) or else
                    (a_value=gda_server_operation_status_unknown) or else
                    False -- A little hack to simplifies the generating script.
                    )
        end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values

    gda_server_operation_status_optional: INTEGER is
         external "C macro use /usr/include/libgda-3.0/libgda/gda-server-operation.h"
         alias "GDA_SERVER_OPERATION_STATUS_OPTIONAL"
         end

    gda_server_operation_status_required: INTEGER is
         external "C macro use /usr/include/libgda-3.0/libgda/gda-server-operation.h"
         alias "GDA_SERVER_OPERATION_STATUS_REQUIRED"
         end

    gda_server_operation_status_unknown: INTEGER is
         external "C macro use /usr/include/libgda-3.0/libgda/gda-server-operation.h"
         alias "GDA_SERVER_OPERATION_STATUS_UNKNOWN"
         end

end -- class GDA_SERVER_OPERATION_NODE_STATUS
