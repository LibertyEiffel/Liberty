indexing
	description: "Enum GdaTransactionIsolation"
	status: "[
                  AUTOMATICALLY GENERATED FILE. 

                  ANY CHANGE TO THIS WILL BE OVERWRITTEN BY NEXT
                  EXECUTION OF GENERATING SCRIPT!  You can put your
                  changes in the patch file gda_transaction_isolation.e.patch;
                  those changes will be applied to the newly generated
                  file.
                  ]"

expanded class GDA_TRANSACTION_ISOLATION
       -- Enum GdaTransactionIsolation

insert ENUM

creation set_unknown

feature -- Setters

    set_unknown is 
       do
          value := gda_transaction_isolation_unknown 
       ensure is_unknown 
       end

    set_read_committed is 
       do
          value := gda_transaction_isolation_read_committed 
       ensure is_read_committed 
       end

    set_read_uncommitted is 
       do
          value := gda_transaction_isolation_read_uncommitted 
       ensure is_read_uncommitted 
       end

    set_repeatable_read is 
       do
          value := gda_transaction_isolation_repeatable_read 
       ensure is_repeatable_read 
       end

    set_serializable is 
       do
          value := gda_transaction_isolation_serializable 
       ensure is_serializable 
       end

feature -- Queries

    is_unknown: BOOLEAN is do Result:=(value=gda_transaction_isolation_unknown) end

    is_read_committed: BOOLEAN is do Result:=(value=gda_transaction_isolation_read_committed) end

    is_read_uncommitted: BOOLEAN is do Result:=(value=gda_transaction_isolation_read_uncommitted) end

    is_repeatable_read: BOOLEAN is do Result:=(value=gda_transaction_isolation_repeatable_read) end

    is_serializable: BOOLEAN is do Result:=(value=gda_transaction_isolation_serializable) end


    is_valid_value (a_value: INTEGER): BOOLEAN is 
        do 
           Result:=(
                    (a_value=gda_transaction_isolation_unknown) or else
                    (a_value=gda_transaction_isolation_read_committed) or else
                    (a_value=gda_transaction_isolation_read_uncommitted) or else
                    (a_value=gda_transaction_isolation_repeatable_read) or else
                    (a_value=gda_transaction_isolation_serializable) or else
                    False -- A little hack to simplifies the generating script.
                    )
        end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values

    gda_transaction_isolation_unknown: INTEGER is
         external "C macro use /usr/include/libgda-3.0/libgda/gda-enums.h"
         alias "GDA_TRANSACTION_ISOLATION_UNKNOWN"
         end

    gda_transaction_isolation_read_committed: INTEGER is
         external "C macro use /usr/include/libgda-3.0/libgda/gda-enums.h"
         alias "GDA_TRANSACTION_ISOLATION_READ_COMMITTED"
         end

    gda_transaction_isolation_read_uncommitted: INTEGER is
         external "C macro use /usr/include/libgda-3.0/libgda/gda-enums.h"
         alias "GDA_TRANSACTION_ISOLATION_READ_UNCOMMITTED"
         end

    gda_transaction_isolation_repeatable_read: INTEGER is
         external "C macro use /usr/include/libgda-3.0/libgda/gda-enums.h"
         alias "GDA_TRANSACTION_ISOLATION_REPEATABLE_READ"
         end

    gda_transaction_isolation_serializable: INTEGER is
         external "C macro use /usr/include/libgda-3.0/libgda/gda-enums.h"
         alias "GDA_TRANSACTION_ISOLATION_SERIALIZABLE"
         end

end -- class GDA_TRANSACTION_ISOLATION
