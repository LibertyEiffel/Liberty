class EDC_QUERY_OPTION_DEFAULT

inherit
   EDC_QUERY_OPTION
      undefine
         is_equal
      end

insert
   SINGLETON

create {EDC_CONSTANTS}
   make

feature {ANY}
   valid_session (session: EDC_SESSION): BOOLEAN
      do
         Result := True
      end

feature {}
   make
      do
      end

end -- class EDC_QUERY_OPTION_DEFAULT
