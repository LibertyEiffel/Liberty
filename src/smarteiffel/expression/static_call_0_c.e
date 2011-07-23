class STATIC_CALL_0_C
--
-- *** A comment for this class would be welcome ! *** DOM 5-4-2008 ***
--
inherit
   CALL_0
      undefine
         jvm_assign
      redefine
         compile_to_c
      end
   
insert
   FUNCTION_CALL_0
      rename
         accept as c0c_accept
      redefine
         compile_to_c, compile_to_jvm, c0c_accept
      end

creation {INTROSPECTION_HANDLER}
   make

feature {ANY}
   compile_to_c (type: TYPE) is
      local
         target_type: TYPE; dynamic_feature: RUN_FEATURE
      do
         target_type := target.resolve_in(type)
         dynamic_feature := target_type.live_type.dynamic_feature(feature_stamp.run_feature_for(target_type))
         cpp.put_direct(type, dynamic_feature, target, arguments)
      end

   compile_to_jvm (type: TYPE) is
      do
         not_yet_implemented
      end

feature {ANY}
   accept (visitor: STATIC_CALL_0_C_VISITOR) is
      do
         visitor.visit_static_call_0_c(Current)
      end

feature {}
   c0c_accept (visitor: FUNCTION_CALL_0_VISITOR) is
      do
         check
            False
         end
      end

end -- class STATIC_CALL_0_C
