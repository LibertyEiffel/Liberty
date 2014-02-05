class DEPARTMENT

insert
   EDC_TYPED_RECORD[DEPARTMENT_DESCRIPTOR, STRING]

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

feature {}
   with_id (a_id: like id) is
      do
         descriptor.id.set(Current, a_id)
      end

end -- class DEPARTMENT
