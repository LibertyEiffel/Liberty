note
   description:
      "Dummy wrapper factory."
   copyright:
      "(C) 2007 Paolo Redaelli"
   license:
      "LGPL v2 or later"
   date:
      "$Date:$"
   revision:
      "$Revision:$"
class DUMMY_FACTORY[ITEM_ -> SHARED_C_STRUCT]
   -- A dummy factory.
   -- Sometimes a wrapper needs to convert an Eiffel COLLECTION into
   -- an array to be passed to the underlying C library; it is useful
   -- for such an array to be implemented using C_ARRAY or
   -- NULL_TERMINATED_C_ARRAY, so that memory is handled by the
   -- Garbage Collector. They expect to be provided a wrapper factory
   -- to use to create new wrappers from the pointers retrieved from
   -- the underlying array.
   -- Note: when the called function take property of the array it
   -- wrond to use this design. The Eiffel GC will soon free the array
   -- robbing it from function it belongs to and causing horrible
   -- crashes. Paolo 2007-09-02

inherit
   WRAPPER_FACTORY[ITEM_]

create {ANY}
   default_create

feature {WRAPPER, WRAPPER_HANDLER} -- Implementation
   wrapper (a_pointer: POINTER): ITEM_
         -- A wrapper for the structure at address `a_pointer'. The
         -- default implementation in WRAPPER_FACTORY "creates" a new
         -- wrapper every time, while their heirs are allowed to
         -- provide implementations that fits better to peculiar
         -- memory handling schemes.
      do
         raise(do_not_use_me)
      end

feature {} --
   do_not_use_me: STRING "DUMMY_FACTORY.wrapper invoked. This is clearly a bug; please inform the developers of the application, since another implementation of WRAPPER_FACTORY should be used."

end -- class DUMMY_FACTORY
