class EXTERNAL_TYPE

create {EIFFEL_PARSER}
   make

feature {ANY}
   type_name: STRING

   default_value: STRING

   start_position: POSITION

feature {TYPE}
   collect
      do
         if type_name = Void then
            check
               default_value = Void
            end
            native.parse_external_type(alias_tag, Current)
         end
      ensure
         type_name /= Void
         default_value /= Void
      end

feature {NATIVE}
   set (type_name_: like type_name; default_value_: like default_value)
      require
         type_name = Void
         type_name_ /= Void
         default_value = Void
         default_value_ /= Void
      do
         type_name := type_name_
         default_value := default_value_
      ensure
         type_name = type_name_
         default_value = default_value_
      end

feature {}
   native: NATIVE

   alias_tag: MANIFEST_STRING

   make (native_: like native; alias_tag_: like alias_tag; start_position_: like start_position)
      require
         native_ /= Void
         alias_tag_ /= Void
      do
         native := native_
         alias_tag := alias_tag_
         start_position := start_position_
      ensure
         native = native_
         alias_tag = alias_tag_
         start_position = start_position_
      end

end
