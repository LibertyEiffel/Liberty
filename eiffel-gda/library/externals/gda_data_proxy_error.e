indexing
	description: "Enum GdaDataProxyError"
	status: "[
                  AUTOMATICALLY GENERATED FILE. 

                  ANY CHANGE TO THIS WILL BE OVERWRITTEN BY NEXT
                  EXECUTION OF GENERATING SCRIPT!  You can put your
                  changes in the patch file gda_data_proxy_error.e.patch;
                  those changes will be applied to the newly generated
                  file.
                  ]"

expanded class GDA_DATA_PROXY_ERROR
       -- Enum GdaDataProxyError

insert ENUM

creation set_error

feature -- Setters

    set_error is 
       do
          value := gda_data_proxy_commit_error 
       ensure is_error 
       end

    set_cancelled is 
       do
          value := gda_data_proxy_commit_cancelled 
       ensure is_cancelled 
       end

feature -- Queries

    is_error: BOOLEAN is do Result:=(value=gda_data_proxy_commit_error) end

    is_cancelled: BOOLEAN is do Result:=(value=gda_data_proxy_commit_cancelled) end


    is_valid_value (a_value: INTEGER): BOOLEAN is 
        do 
           Result:=(
                    (a_value=gda_data_proxy_commit_error) or else
                    (a_value=gda_data_proxy_commit_cancelled) or else
                    False -- A little hack to simplifies the generating script.
                    )
        end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values

    gda_data_proxy_commit_error: INTEGER is
         external "C macro use /usr/include/libgda-3.0/libgda/gda-data-proxy.h"
         alias "GDA_DATA_PROXY_COMMIT_ERROR"
         end

    gda_data_proxy_commit_cancelled: INTEGER is
         external "C macro use /usr/include/libgda-3.0/libgda/gda-data-proxy.h"
         alias "GDA_DATA_PROXY_COMMIT_CANCELLED"
         end

end -- class GDA_DATA_PROXY_ERROR
