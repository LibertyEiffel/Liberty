deferred class ABSTRACT_GET_TEXT_DECLARATION

inherit
   VISITOR

insert
   X_GET_TEXT_GLOBALS
   CST_ATT_STRING_VISITOR

feature {ANY}
   called (position: POSITION; arguments: EFFECTIVE_ARG_LIST; current_type: TYPE)
      deferred
      end

   declaration_type: TYPE
         -- The type where this declaration was written

feature {}
   track_manifest_string (message: EXPRESSION; current_type: TYPE): STRING
      local
         manifest_string: MANIFEST_STRING; call_0: CALL_0; target: EXPRESSION; fs: FEATURE_STAMP
         af: ANONYMOUS_FEATURE; constant_string: CST_ATT_STRING
      do
         if manifest_string ?:= message then
            manifest_string ::= message
         elseif call_0 ?:= message then
            call_0 ::= message
            target := call_0.target
            fs := call_0.feature_stamp
            af := fs.anonymous_feature(target.resolve_in(current_type))
            if constant_string ?:= af then
               constant_string ::= af
               manifest_string := constant_string.value_memory
            end
         end
         if manifest_string /= Void then
            Result := manifest_string.to_string
         end
      end

feature {CST_ATT_STRING}
   visit_cst_att_string (visited: CST_ATT_STRING)
      do
      end

end -- class ABSTRACT_GET_TEXT_DECLARATION
