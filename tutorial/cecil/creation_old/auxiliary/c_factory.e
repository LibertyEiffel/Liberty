class C_FACTORY

feature {ANY}
   string_make (c_string: NATIVE_ARRAY[CHARACTER]): STRING
         -- Creates a new Eiffel STRING using `c_string' contents as
         -- a model (for the contents of the new STRING).
      require
         c_string.is_not_null
      do
         create Result.from_external_copy(c_string.to_external)
      end

end -- class C_FACTORY
