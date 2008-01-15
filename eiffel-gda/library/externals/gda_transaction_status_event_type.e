indexing
	description: "Enum GdaTransactionStatusEventType"
	status: "[
                  AUTOMATICALLY GENERATED FILE. 

                  ANY CHANGE TO THIS WILL BE OVERWRITTEN BY NEXT
                  EXECUTION OF GENERATING SCRIPT!  You can put your
                  changes in the patch file gda_transaction_status_event_type.e.patch;
                  those changes will be applied to the newly generated
                  file.
                  ]"

expanded class GDA_TRANSACTION_STATUS_EVENT_TYPE
       -- Enum GdaTransactionStatusEventType

insert ENUM

creation set_avepoint

feature -- Setters

    set_avepoint is 
       do
          value := gda_transaction_status_event_savepoint 
       ensure is_avepoint 
       end

    set_ql is 
       do
          value := gda_transaction_status_event_sql 
       ensure is_ql 
       end

    set_ub_transaction is 
       do
          value := gda_transaction_status_event_sub_transaction 
       ensure is_ub_transaction 
       end

feature -- Queries

    is_avepoint: BOOLEAN is do Result:=(value=gda_transaction_status_event_savepoint) end

    is_ql: BOOLEAN is do Result:=(value=gda_transaction_status_event_sql) end

    is_ub_transaction: BOOLEAN is do Result:=(value=gda_transaction_status_event_sub_transaction) end


    is_valid_value (a_value: INTEGER): BOOLEAN is 
        do 
           Result:=(
                    (a_value=gda_transaction_status_event_savepoint) or else
                    (a_value=gda_transaction_status_event_sql) or else
                    (a_value=gda_transaction_status_event_sub_transaction) or else
                    False -- A little hack to simplifies the generating script.
                    )
        end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values

    gda_transaction_status_event_savepoint: INTEGER is
         external "C macro use /usr/include/libgda-3.0/libgda/gda-transaction-status.h"
         alias "GDA_TRANSACTION_STATUS_EVENT_SAVEPOINT"
         end

    gda_transaction_status_event_sql: INTEGER is
         external "C macro use /usr/include/libgda-3.0/libgda/gda-transaction-status.h"
         alias "GDA_TRANSACTION_STATUS_EVENT_SQL"
         end

    gda_transaction_status_event_sub_transaction: INTEGER is
         external "C macro use /usr/include/libgda-3.0/libgda/gda-transaction-status.h"
         alias "GDA_TRANSACTION_STATUS_EVENT_SUB_TRANSACTION"
         end

end -- class GDA_TRANSACTION_STATUS_EVENT_TYPE
