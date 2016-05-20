class TEST

insert
   EDC_CONSTANTS

create {}
   main

feature {}
   session: EDC_SESSION

   main
      local
         d_employee: EMPLOYEE_DESCRIPTOR
         employees: TRAVERSABLE[EMPLOYEE]
         employee: EMPLOYEE
         id, name, phone_nr: STRING
      do
         create {EDC_DUMMY_SESSION} session.open
         if session.is_open then
            session.begin
            if session.in_transaction then
               employees := d_employee.find(Edc_for_update, "007").list(session)
               if employees.is_empty then
                  create employee.with_id(session, "007")
                  employee.set_name("James Bond")
               else
                  employee := employees.first
               end
               id := employee.id
               employee.set_phone_number("+33123456789")
               session.commit
            end

            -- another method: use fetch/where instead of find
            employee := d_employee.fetch(Edc_default).where(d_employee.id == id).list(session).first
            name := employee.name
            phone_nr := employee.phone_number
            -- check the phone_number, should be the one committed above

            employee.delete

            session.close
         end
      end

end -- class TEST
