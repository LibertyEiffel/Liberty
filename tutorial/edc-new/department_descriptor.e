expanded class DEPARTMENT_DESCRIPTOR

insert
   EDC_TYPED_DESCRIPTOR[DEPARTMENT, STRING]

feature {ANY}
   department: EDC_TABLE[DEPARTMENT] is
      once
         create Result.make(agent: DEPARTMENT is do create Result end, "DEPARTMENT_TABLE")
      end

   id: EDC_TYPED_FIELD[DEPARTMENT, STRING] is
      once
         create {EDC_STRING_FIELD[DEPARTMENT]} Result.with_options(department, "ID", 20, Edc_primary_key)
      end

   name: EDC_TYPED_FIELD[DEPARTMENT, STRING] is
      once
         create {EDC_VARSTRING_FIELD[DEPARTMENT]} Result.with_options(department, "NAME", Edc_mandatory)
      end

end -- class DEPARTMENT_DESCRIPTOR
