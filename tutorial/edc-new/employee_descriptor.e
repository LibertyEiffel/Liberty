expanded class EMPLOYEE_DESCRIPTOR

insert
   EDC_TYPED_DESCRIPTOR[EMPLOYEE, STRING]

feature {ANY}
   employee: EDC_TABLE[EMPLOYEE] is
      once
         create Result.make(agent: EMPLOYEE is do create Result end, "EMPLOYEE_TABLE")
      end

   id: EDC_TYPED_FIELD[EMPLOYEE, STRING] is
      once
         create {EDC_STRING_FIELD[EMPLOYEE]} Result.with_options(employee, "ID", 20, Edc_primary_key)
      end

   name: EDC_TYPED_FIELD[EMPLOYEE, STRING] is
      once
         create {EDC_VARSTRING_FIELD[EMPLOYEE]} Result.with_options(employee, "NAME", Edc_mandatory)
      end

   phone_number: EDC_TYPED_FIELD[EMPLOYEE, STRING] is
      once
         create {EDC_STRING_FIELD[EMPLOYEE]} Result.make(employee, "PHONE_NR", 30)
      end

   salary: EDC_TYPED_FIELD[EMPLOYEE, INTEGER_64] is
      once
         create {EDC_INTEGER_64_FIELD[EMPLOYEE]} Result.make(employee, "SALARY")
         Result.add_validator(agent (i: INTEGER_64): BOOLEAN is do Result := i >= 0 end)
      end

   department: EDC_TYPED_FIELD[EMPLOYEE, DEPARTMENT] is
      local
         dpt: DEPARTMENT_DESCRIPTOR
      once
         create {EDC_REFERENCE_FIELD[EMPLOYEE, DEPARTMENT]} Result.make(employee, dpt.department, "DEPT_ID")
      end

end -- class EMPLOYEE_DESCRIPTOR
