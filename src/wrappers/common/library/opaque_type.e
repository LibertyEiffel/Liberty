deferred class OPAQUE_TYPE
   -- An wrapper that is not is completely defined in its underlying C interface so that it cannot be allocated by the Eiffel.
   -- See also http://en.wikipedia.org/wiki/Opaque_data_type

inherit
   WRAPPER

feature {ANY}
   copy (another: like Current) is
      do
         handle := another.handle
      end

   is_equal (another: like Current): BOOLEAN is
      do
         Result := handle = another.handle
      end

feature {WRAPPER, WRAPPER_HANDLER}
   struct_size: like size_t is
      do
         breakpoint
         std_error.put_string("Trying to access the structure size of the opaque type '")
         std_error.put_string(generating_type)
         std_error.put_string(".%N%N")
         crash
      end

end -- class OPAQUE_TYPE
