class EMPLOYEE

insert
   EDC_TYPED_RECORD[EMPLOYEE_DESCRIPTOR, STRING]

create {ANY}
   default_create, with_id

feature {ANY}
   id: STRING is
      do
         Result := descriptor.id.item(Current)
      end

   name: STRING is
      do
         Result := descriptor.name.item(Current)
      end

   set_name (a_name: like name) is
      do
         descriptor.name.set(Current, a_name)
      end

   phone_number: STRING is
      do
         Result := descriptor.phone_number.item(Current)
      end

   set_phone_number (a_phone_number: like phone_number) is
      do
         descriptor.phone_number.set(Current, a_phone_number)
      end

   salary: INTEGER_64 is
      do
         Result := descriptor.salary.item(Current)
      end

   set_salary (a_salary: like salary) is
      do
         descriptor.salary.set(Current, a_salary)
      end

   department: DEPARTMENT is
      do
         Result := descriptor.department.item(Current)
      end

   set_department (a_department: like department) is
      do
         descriptor.department.set(Current, a_department)
      end

feature {}
   with_id (a_id: like id) is
      do
         descriptor.id.set(Current, a_id)
      end

end -- class EMPLOYEE
