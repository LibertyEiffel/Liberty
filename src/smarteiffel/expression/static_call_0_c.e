class STATIC_CALL_0_C
--
-- *** A comment for this class would be welcome ! *** DOM 5-4-2008 ***
--
inherit
   CALL_0

insert
   FUNCTION_CALL_0
      rename
         accept as c0c_accept
      redefine
         c0c_accept
      end

create {INTROSPECTION_HANDLER}
   make

feature {ANY}
   accept (visitor: STATIC_CALL_0_C_VISITOR)
      do
         visitor.visit_static_call_0_c(Current)
      end

feature {}
   c0c_accept (visitor: FUNCTION_CALL_0_VISITOR)
      do
         check
            False
         end
      end

end -- class STATIC_CALL_0_C
