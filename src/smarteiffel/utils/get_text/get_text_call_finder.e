deferred class GET_TEXT_CALL_FINDER

inherit
   IN_OUT_VISITOR
      redefine visit_class_text, visit_call_support, exit_precursor_expression
      end

insert
   X_GET_TEXT_GLOBALS

feature {CLASS_TEXT}
   visit_class_text (visited: CLASS_TEXT)
      local
         i: INTEGER; feature_dictionary: DICTIONARY[ANONYMOUS_FEATURE, FEATURE_NAME]; class_invariant: ASSERTION_LIST
      do
         if current_type = Void then
            current_type := visited.declaration_type_of_like_current
            echo.put_string(once "Looking for (number_)get_text calls in ")
            echo.put_string(visited.name.to_string)
            echo.put_new_line
            feature_dictionary := visited.feature_dictionary
            from
               i := feature_dictionary.lower
            until
               i > feature_dictionary.upper
            loop
               current_routine_stamp := current_type.lookup(feature_dictionary.key(i))
               feature_dictionary.item(i).accept(Current)
               i := i + 1
            end
            class_invariant := visited.class_invariant
            if class_invariant /= Void then
               class_invariant.accept(Current)
            end
            current_type := Void
         end
      end

feature {PRECURSOR_EXPRESSION}
   exit_precursor_expression (visited: PRECURSOR_EXPRESSION)
      local
         arguments: EFFECTIVE_ARG_LIST
         declaration: ABSTRACT_GET_TEXT_DECLARATION
         start_position: POSITION
      do
         arguments := visited.arguments
         start_position := visited.start_position
         declaration := get_text_declarations.reference_at(current_routine_stamp)
         if declaration /= Void then
            declaration.called(start_position, arguments, current_type)
         end
      end

feature {}
   current_type: TYPE

   current_routine_stamp: FEATURE_STAMP

   visit_call_support (visited: FEATURE_CALL)
      local
         arguments: EFFECTIVE_ARG_LIST
         start_position: POSITION
         fs: FEATURE_STAMP
         declaration: ABSTRACT_GET_TEXT_DECLARATION
      do
         Precursor (visited)
         arguments := visited.arguments
         start_position := visited.start_position
         fs := visited.feature_stamp
         if fs = Void then
            sedb_breakpoint
            --|*** Seems to be related to agent creations
         else
            declaration := get_text_declarations.reference_at(fs)
            if declaration /= Void then
               declaration.called(start_position, arguments, current_type)
            end
         end
      end

   get_text_declarations: DICTIONARY[ABSTRACT_GET_TEXT_DECLARATION, FEATURE_STAMP]

end -- class GET_TEXT_CALL_FINDER
