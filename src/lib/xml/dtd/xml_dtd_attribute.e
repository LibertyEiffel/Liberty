class XML_DTD_ATTRIBUTE

insert
   RECYCLABLE
      rename default as any_default
      end

creation {XML_DTD_ELEMENT}
   make

feature {XML_DTD_ELEMENT} -- validation
   is_valid (attributes: DICTIONARY[UNICODE_STRING, UNICODE_STRING]): BOOLEAN is
      local
         value: UNICODE_STRING
      do
         value := attributes.reference_at(name)
         if value = Void then
            Result := is_implied
         else
            Result := list = Void or else list.is_empty or else list.has(value)
         end
      end

   default: UNICODE_STRING

feature {XML_DTD_ELEMENT} -- building
   name: UNICODE_STRING

   list_value (value: UNICODE_STRING) is
      do
         if list = Void then
            create {HASHED_SET[UNICODE_STRING]} list.make
         end
         list.add(value)
      end

   cdata is
      do
         check
            list /= Void implies list.is_empty
         end
      end

   id is
      do
         check
            list /= Void implies list.is_empty
         end
      end

   idref is
      do
         check
            list /= Void implies list.is_empty
         end
      end

   idrefs is
      do
         check
            list /= Void implies list.is_empty
         end
      end

   nmtoken is
      do
         check
            list /= Void implies list.is_empty
         end
      end

   nmtokens is
      do
         check
            list /= Void implies list.is_empty
         end
      end

   entity is
      do
         check
            list /= Void implies list.is_empty
         end
      end

   entities is
      do
         check
            list /= Void implies list.is_empty
         end
      end

   notation is
      do
         check
            list /= Void implies list.is_empty
         end
      end

   required is
      do
         is_required := True
      end

   implied is
      do
         is_required := False
      end

   valid_fixed_value (value: like default): BOOLEAN is
      do
         Result := list = Void or else list.is_empty or else list.has(value)
      end

   fixed (value: like default) is
      require
         valid_fixed_value(value)
      do
         is_required := True
         if list = Void then
            create {HASHED_SET[UNICODE_STRING]} list.make
         end
         list.add(value)
         default := value
      end

   default_value (value: like default) is
      do
         is_required := False
         check
            list /= Void implies list.has(value)
         end
         default := value
      end

feature {}
   list: SET[UNICODE_STRING]

   is_required: BOOLEAN

   is_implied: BOOLEAN is
      do
         Result := not is_required
      end

feature {XML_DTD_ELEMENT}
   make (a_name: like name) is
      require
         not a_name.is_empty
      do
         name := a_name
         implied
      ensure
         name = a_name
         is_implied
      end

feature {RECYCLING_POOL}
   recycle is
      do
         if list /= Void then
            list.clear_count
         end
         is_required := False
      ensure
         list = Void or else list.is_empty
         not is_required
      end

invariant
   not name.is_empty

end -- class XML_DTD_ATTRIBUTE
