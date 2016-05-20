class EDC_DUMMY_SESSION_DATA

inherit
   EDC_SESSION_DATA
      redefine
         default_create
      end

create {EDC_DUMMY_SESSION}
   default_create

feature {EDC_DUMMY_SESSION, EDC_DUMMY_SESSION_FETCH}
   internal_id: INTEGER_64

feature {}
   default_create
      do
         internal_id := id_counter.item + 1
         id_counter.set_item(internal_id)
      end

   id_counter: REFERENCE[INTEGER_64]
      once
         create Result
      end

end -- class EDC_DUMMY_SESSION_DATA
