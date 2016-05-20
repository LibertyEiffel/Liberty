expanded class DEPARTMENT_DESCRIPTOR

insert
   EDC_TYPED_DESCRIPTOR[DEPARTMENT, TUPLE[STRING]]

feature {ANY}
   table: EDC_TABLE[DEPARTMENT]
      once
         create Result.make("DEPARTMENT_TABLE")
      end

   id: EDC_TYPED_FIELD[DEPARTMENT, STRING]
      once
         create {EDC_STRING_FIELD[DEPARTMENT]} Result.with_options(table, "ID", 20, Edc_primary_key)
      end

   name: EDC_TYPED_FIELD[DEPARTMENT, STRING]
      once
         create {EDC_VARSTRING_FIELD[DEPARTMENT]} Result.with_options(table, "NAME", Edc_mandatory)
      end

end -- class DEPARTMENT_DESCRIPTOR
