class EDC_FIELD_OPTION_MANDATORY

inherit
   EDC_FIELD_OPTION
      undefine
         is_equal
      end

insert
   SINGLETON

create {EDC_CONSTANTS}
   make

feature {}
   make
      do
      end

end -- class EDC_FIELD_OPTION_MANDATORY
