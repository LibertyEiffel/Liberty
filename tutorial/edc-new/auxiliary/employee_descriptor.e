expanded class EMPLOYEE_DESCRIPTOR

insert
   EDC_TYPED_DESCRIPTOR[EMPLOYEE, TUPLE[STRING]]

feature {ANY}
   table: EDC_TABLE[EMPLOYEE]
      once
         create Result.make("EMPLOYEE_TABLE")
      end

   id: EDC_TYPED_FIELD[EMPLOYEE, STRING]
      once
         create {EDC_STRING_FIELD[EMPLOYEE]} Result.with_options(table, "ID", 20, Edc_primary_key)
      end

   name: EDC_TYPED_FIELD[EMPLOYEE, STRING]
      once
         create {EDC_VARSTRING_FIELD[EMPLOYEE]} Result.with_options(table, "NAME", Edc_mandatory)
      end

   phone_number: EDC_TYPED_FIELD[EMPLOYEE, STRING]
      once
         create {EDC_STRING_FIELD[EMPLOYEE]} Result.make(table, "PHONE_NR", 30)
      end

   salary: EDC_TYPED_FIELD[EMPLOYEE, INTEGER_64]
      once
         create {EDC_INTEGER_64_FIELD[EMPLOYEE]} Result.make(table, "SALARY")
         Result.add_validator(agent (i: INTEGER_64): BOOLEAN do Result := i >= 0 end)
      end

   department: EDC_TYPED_FIELD[EMPLOYEE, DEPARTMENT]
      local
         dpt: DEPARTMENT_DESCRIPTOR
      once
         create {EDC_REFERENCE_FIELD[EMPLOYEE, DEPARTMENT]} Result.make(table, dpt.table, "DEPT_ID")
      end

end -- class EMPLOYEE_DESCRIPTOR
