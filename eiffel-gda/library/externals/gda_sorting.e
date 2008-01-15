indexing
	description: "Enum GdaSorting"
	status: "[
                  AUTOMATICALLY GENERATED FILE. 

                  ANY CHANGE TO THIS WILL BE OVERWRITTEN BY NEXT
                  EXECUTION OF GENERATING SCRIPT!  You can put your
                  changes in the patch file gda_sorting.e.patch;
                  those changes will be applied to the newly generated
                  file.
                  ]"

expanded class GDA_SORTING
       -- Enum GdaSorting

insert ENUM

creation set_ascending

feature -- Setters

    set_ascending is 
       do
          value := gda_sorting_ascending 
       ensure is_ascending 
       end

    set_descending is 
       do
          value := gda_sorting_descending 
       ensure is_descending 
       end

feature -- Queries

    is_ascending: BOOLEAN is do Result:=(value=gda_sorting_ascending) end

    is_descending: BOOLEAN is do Result:=(value=gda_sorting_descending) end


    is_valid_value (a_value: INTEGER): BOOLEAN is 
        do 
           Result:=(
                    (a_value=gda_sorting_ascending) or else
                    (a_value=gda_sorting_descending) or else
                    False -- A little hack to simplifies the generating script.
                    )
        end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values

    gda_sorting_ascending: INTEGER is
         external "C macro use /usr/include/libgda-3.0/libgda/gda-column-index.h"
         alias "GDA_SORTING_ASCENDING"
         end

    gda_sorting_descending: INTEGER is
         external "C macro use /usr/include/libgda-3.0/libgda/gda-column-index.h"
         alias "GDA_SORTING_DESCENDING"
         end

end -- class GDA_SORTING
