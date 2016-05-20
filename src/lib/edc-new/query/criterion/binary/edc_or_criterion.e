class EDC_OR_CRITERION

inherit
   EDC_BINARY_CRITERION
      redefine
         infix "or"
      end

create {EDC_CRITERION}
   make

feature {ANY}
   infix "or" (other: EDC_CRITERION): EDC_CRITERION
      do
         list.add_last(other)
         Result := Current
      end

end -- class EDC_OR_CRITERION
