class EDC_AND_CRITERION

inherit
   EDC_BINARY_CRITERION
      redefine
         infix "and"
      end

create {EDC_CRITERION}
   make

feature {ANY}
   infix "and" (other: EDC_CRITERION): EDC_CRITERION
      do
         list.add_last(other)
         Result := Current
      end

end -- class EDC_AND_CRITERION
