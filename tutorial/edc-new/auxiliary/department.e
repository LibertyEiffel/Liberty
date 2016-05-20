class DEPARTMENT

inherit
   EDC_TYPED_RECORD[DEPARTMENT_DESCRIPTOR, TUPLE[STRING]]

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

end -- class DEPARTMENT
