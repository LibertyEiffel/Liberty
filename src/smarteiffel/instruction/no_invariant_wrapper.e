class NO_INVARIANT_WRAPPER

inherit
   INSTRUCTION
      redefine
         specialize_without_checks
      end

create {ANY}
   make

feature {ANY}
   accept (visitor: NO_INVARIANT_WRAPPER_VISITOR)
      do
         visitor.visit_no_invariant_wrapper(Current)
      end

   start_position: POSITION
      do
         Result := compound.start_position
      end

   specialize_in (type: TYPE): like Current
      local
         new_compound: like compound
      do
         new_compound := compound.specialize_in(type)
         Result := current_or_twin_init(new_compound)
      end

   has_been_specialized: BOOLEAN
      do
         Result := compound.has_been_specialized
      end

   specialize_thru (parent_type: TYPE; parent_edge: PARENT_EDGE; new_type: TYPE): like Current
      local
         new_compound: like compound
      do
         new_compound := compound.specialize_thru(parent_type, parent_edge, new_type)
         Result := current_or_twin_init(new_compound)
      end

   specialize_and_check (type: TYPE): INSTRUCTION
      local
         new_compound: like compound
      do
         new_compound := compound.specialize_and_check(type)
         Result := current_or_twin_init(new_compound)
      end

   specialize_without_checks (type: TYPE): INSTRUCTION
      local
         new_compound: like compound
         ci: CREATE_INSTRUCTION
      do
         if ci ?:= compound then
            ci ::= compound
            new_compound := ci.specialize_without_checks(type)
         else
            new_compound := compound.specialize_and_check(type)
         end
         Result := current_or_twin_init(new_compound)
      end

   side_effect_free (type: TYPE): BOOLEAN
      do
         Result := compound.side_effect_free(type)
      end

   use_current (type: TYPE): BOOLEAN
      do
         Result := compound.use_current(type)
      end

   safety_check (type: TYPE)
      do
         compound.safety_check(type)
      end

   pretty (indent_level: INTEGER)
      do
         -- Non-written code
         check
            False
         end
      end

   collect (t: TYPE): TYPE
      local
         dummy: TYPE
      do
         dummy := compound.collect(t)
      end

   adapt_for (t: TYPE): like Current
      local
         new_compound: like compound
      do
         new_compound := compound.adapt_for(t)
         Result := current_or_twin_init(new_compound)
      end

   end_mark_comment: BOOLEAN
      local
         instruction: INSTRUCTION
      do
         if {INSTRUCTION} ?:= compound then
            instruction ::= compound
            Result := instruction.end_mark_comment
         end
      end

feature {ANONYMOUS_FEATURE, CODE, INTROSPECTION_HANDLER}
   simplify (type: TYPE): INSTRUCTION
      local
         new_compound: like compound
      do
         new_compound := compound.simplify(type)
         Result := current_or_twin_init(new_compound)
      end

feature {NO_INVARIANT_WRAPPER}
   make, init (compound_: like compound)
      require
         compound_ /= Void
      do
         compound := compound_
      ensure
         compound = compound_
      end

feature {NO_INVARIANT_WRAPPER, NO_INVARIANT_WRAPPER_VISITOR}
   compound: CODE

feature {CODE, EFFECTIVE_ARG_LIST}
   inline_dynamic_dispatch_ (code_accumulator: CODE_ACCUMULATOR; type: TYPE)
      do
         compound.inline_dynamic_dispatch_(code_accumulator, type)
      end

feature {}
   current_or_twin_init (compound_: like compound): like Current
      do
         if compound_ /= Void then
            if compound = compound_ then
               Result := Current
            else
               Result := twin
               Result.init(compound_)
            end
         end
      ensure
         (Result = Void) = (compound_ = Void)
         Result /= Void implies Result.compound = compound_
      end

invariant
   compound /= Void

end
