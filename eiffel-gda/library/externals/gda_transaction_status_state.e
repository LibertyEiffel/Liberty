indexing
	description: "Enum GdaTransactionStatusState"
	status: "[
                  AUTOMATICALLY GENERATED FILE. 

                  ANY CHANGE TO THIS WILL BE OVERWRITTEN BY NEXT
                  EXECUTION OF GENERATING SCRIPT!  You can put your
                  changes in the patch file gda_transaction_status_state.e.patch;
                  those changes will be applied to the newly generated
                  file.
                  ]"

expanded class GDA_TRANSACTION_STATUS_STATE
       -- Enum GdaTransactionStatusState

insert ENUM

creation set_ok

feature -- Setters

    set_ok is 
       do
          value := gda_transaction_status_state_ok 
       ensure is_ok 
       end

    set_failed is 
       do
          value := gda_transaction_status_state_failed 
       ensure is_failed 
       end

feature -- Queries

    is_ok: BOOLEAN is do Result:=(value=gda_transaction_status_state_ok) end

    is_failed: BOOLEAN is do Result:=(value=gda_transaction_status_state_failed) end


    is_valid_value (a_value: INTEGER): BOOLEAN is 
        do 
           Result:=(
                    (a_value=gda_transaction_status_state_ok) or else
                    (a_value=gda_transaction_status_state_failed) or else
                    False -- A little hack to simplifies the generating script.
                    )
        end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values

    gda_transaction_status_state_ok: INTEGER is
         external "C macro use /usr/include/libgda-3.0/libgda/gda-transaction-status.h"
         alias "GDA_TRANSACTION_STATUS_STATE_OK"
         end

    gda_transaction_status_state_failed: INTEGER is
         external "C macro use /usr/include/libgda-3.0/libgda/gda-transaction-status.h"
         alias "GDA_TRANSACTION_STATUS_STATE_FAILED"
         end

end -- class GDA_TRANSACTION_STATUS_STATE
