class EMPLOYEE

inherit
   EDC_TYPED_RECORD[EMPLOYEE_DESCRIPTOR, TUPLE[STRING]]

create {ANY}
   default_create, with_id

feature {ANY}
   id: STRING
      do
         Result := descriptor.id.item(Current)
      end

   name: STRING
      do
         Result := descriptor.name.item(Current)
      end

   set_name (a_name: like name)
      do
         descriptor.name.set(Current, a_name)
      end

   phone_number: STRING
      do
         Result := descriptor.phone_number.item(Current)
      end

   set_phone_number (a_phone_number: like phone_number)
      do
         descriptor.phone_number.set(Current, a_phone_number)
      end

   salary: INTEGER_64
      do
         Result := descriptor.salary.item(Current)
      end

   set_salary (a_salary: like salary)
      do
         descriptor.salary.set(Current, a_salary)
      end

   department: DEPARTMENT
      do
         Result := descriptor.department.item(Current)
      end

   set_department (a_department: like department)
      do
         descriptor.department.set(Current, a_department)
      end

feature {}
   with_id (a_session: like session; a_id: like id)
      require
         a_session /= Void
      do
         a_session.add(Current)
         descriptor.id.set(Current, a_id)
      ensure
         added: session = a_session
      end

end -- class EMPLOYEE
