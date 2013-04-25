class GENERATOR_GENERATING_TYPE
--
-- To represent `generator' and `generating_type' calls.
--

inherit
   EXPRESSION

create {INTROSPECTION_HANDLER}
   make_generating_type, make_generator

feature {ANY}
   start_position: POSITION

   target_type: TYPE

   array_name: CHARACTER

   is_writable: BOOLEAN is False

   is_static: BOOLEAN is True

   is_current: BOOLEAN is False

   is_implicit_current: BOOLEAN is False

   is_void: BOOLEAN is False

   is_result: BOOLEAN is False

   is_manifest_string: BOOLEAN is False

   precedence: INTEGER is
      do
         Result := atomic_precedence
      end

   specialize_in (type: TYPE): like Current is
      do
         Result := Current
      end

   has_been_specialized: BOOLEAN is
      do
         Result := True
      end

   specialize_thru (parent_type: TYPE; parent_edge: PARENT_EDGE; new_type: TYPE): like Current is
      do
         Result := Current
      end

   specialize_and_check (type: TYPE): like Current is
      do
         Result := Current
      end

   resolve_in (type: TYPE): TYPE is
      do
         Result := smart_eiffel.type_string
      end

   side_effect_free (type: TYPE): BOOLEAN is
      do
         Result := True
      end

   non_void_no_dispatch_type (type: TYPE): TYPE is
      do
         Result := smart_eiffel.type_string
      end

   use_current (type: TYPE): BOOLEAN is
      do
         Result := False
      end

   safety_check (type: TYPE) is
      do
      end

   collect (type: TYPE): TYPE is
      local
         live_type: LIVE_TYPE
      do
         live_type := target_type.live_type
         if live_type /= Void then
            smart_eiffel.set_generator_used
            if array_name = 't' then
               smart_eiffel.set_generating_type_used
               live_type.set_generating_type_used
            else
               live_type.set_generator_used
            end
         end
         Result := smart_eiffel.type_string
      end

   simplify (type: TYPE): EXPRESSION is
      do
         Result := Current
      end

   adapt_for (type: TYPE): like Current is
      do
         Result := Current
      end

   declaration_type: TYPE is
      do
         Result := smart_eiffel.type_string
      end

   accept (visitor: GENERATOR_GENERATING_TYPE_VISITOR) is
      do
         visitor.visit_generator_generating_type(Current)
      end

   extra_bracket_flag: BOOLEAN is False

   pretty (indent_level: INTEGER) is
      do
         check
            False
         end
      end

   pretty_target (indent_level: INTEGER) is
      do
         check
            False
         end
      end

   bracketed_pretty (indent_level: INTEGER) is
      do
         check
            False
         end
      end

   short (type: TYPE) is
      do
         check
            False
         end
      end

   short_target (type: TYPE) is
      do
         check
            False
         end
      end

feature {CODE, EFFECTIVE_ARG_LIST}
   inline_dynamic_dispatch_ (code_accumulator: CODE_ACCUMULATOR; type: TYPE) is
      do
         code_accumulator.current_context.add_last(Current)
      end

feature {}
   make_generating_type (sp: like start_position; tt: like target_type) is
      require
         not sp.is_unknown
         tt /= Void
      do
         start_position := sp
         target_type := tt
         array_name := 't'
      ensure
         start_position = sp
         target_type = tt
      end

   make_generator (sp: like start_position; tt: like target_type) is
      require
         not sp.is_unknown
         tt /= Void
      do
         start_position := sp
         target_type := tt
         array_name := 'g'
      ensure
         start_position = sp
         target_type = tt
      end

end -- class GENERATOR_GENERATING_TYPE
