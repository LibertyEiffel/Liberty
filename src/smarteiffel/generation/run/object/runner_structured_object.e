-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class RUNNER_STRUCTURED_OBJECT

inherit
   RUNNER_OBJECT

insert
   TYPE_VISITOR
      undefine
         is_equal, out_in_tagged_out_memory
      end

create {RUNNER_UNTYPED_BUILTINS}
   make

create {RUNNER_STRUCTURED_OBJECT}
   copy_expanded

feature {ANY}
   builtins: RUNNER_UNTYPED_BUILTINS

   processor: RUNNER_PROCESSOR
   type: TYPE

   is_initialized: BOOLEAN

   set_field (a_name: ABSTRACT_STRING; a_value: RUNNER_OBJECT)
      do
         debug ("run.data")
            std_output.put_line(once "    >>>> field #(1) := #(2)" # a_name # repr(a_value))
         end
         fields.fast_put(expand(a_value), a_name.intern)
      end

   field (a_name: ABSTRACT_STRING): RUNNER_OBJECT
      do
         Result := expand(fields.fast_at(a_name.intern))
         debug ("run.data")
            std_output.put_line(once "    >>>> field #(1) = #(2)" # a_name # repr(Result))
         end
      end

   out_in_tagged_out_memory
      do
         type.long_name.out_in_tagged_out_memory
         tagged_out_memory.extend('[')
         fields.for_each(agent (o: RUNNER_OBJECT; f: FIXED_STRING)
                       do
                          f.out_in_tagged_out_memory
                          tagged_out_memory.extend('=')
                          if o = Void then
                             tagged_out_memory.append(once "Void")
                          else
                             o.out_in_tagged_out_memory
                          end
                          tagged_out_memory.extend(',')
                       end)
         tagged_out_memory.put(']', tagged_out_memory.upper)
      end

   is_equal (other: like Current): BOOLEAN
      do
         if type.is_reference then
            Result := Current = other
         else
            Result := other.fields.count = fields.count
               and then other.fields.for_all(agent (o: RUNNER_OBJECT; f: FIXED_STRING): BOOLEAN
                                             local
                                                o0: RUNNER_OBJECT
                                             do
                                                if fields.fast_has(f) then
                                                   o0 := fields.fast_reference_at(f)
                                                   Result := o0 = o or else (o0 /= Void and then o /= Void and then o0.eq(o))
                                                end
                                             end)
         end
      end

feature {RUNNER_UNTYPED_BUILTINS}
   builtin_to_pointer: POINTER
      do
         Result := to_pointer
      end

   builtin_copy (other: RUNNER_OBJECT)
      local
         o: like Current
      do
         o ::= expand(other)
         o.fields.for_each(agent (object: RUNNER_OBJECT; name: FIXED_STRING)
                         do
                            fields.fast_put(expand(object), name)
                         end)
      end

   builtin_is_equal (other: RUNNER_OBJECT): BOOLEAN
      local
         o: like Current
      do
         if other.type = type then
            o ::= other
            if o.fields.count = fields.count then
               Result := o.fields.for_all(agent (object: RUNNER_OBJECT; name: FIXED_STRING): BOOLEAN
                                          local
                                             my_object: RUNNER_OBJECT
                                          do
                                             if fields.fast_has(name) then
                                                my_object := fields.fast_at(name)
                                                Result := my_object = object or else (my_object /= Void and then my_object.eq(object))
                                             end
                                          end)
            end
         end
      end

feature {RUNNER_FACET}
   copy_if_expanded: like Current
      do
         if type.is_reference then
            Result := Current
         else
            create Result.copy_expanded(Current)
         end
         if not Result.is_equal(Current) then
            break
         end
      end

   as_foreign_object: FOREIGN_OBJECT
      do
         not_yet_implemented
      end

   set_initialized
      require
         not is_initialized
      do
         is_initialized := True
      ensure
         is_initialized
      end

feature {}
   copy_expanded (model: like Current)
      require
         model.type.is_expanded
      do
         make(model.processor, model.type, model.builtins)
         model.fields.for_each(agent (field_value: RUNNER_OBJECT; field_name: FIXED_STRING)
                             do
                                fields.fast_put(expand(field_value), field_name)
                             end)
      end

feature {}
   make (a_processor: like processor; a_type: like type; a_builtins: like builtins)
      require
         a_processor /= Void
         a_type.live_type /= Void
      do
         processor := a_processor
         type := a_type
         builtins := a_builtins
         initialize_fields
         if a_type.is_expanded then
            is_initialized := True
         end
      ensure
         processor = a_processor
         type = a_type
         builtins = a_builtins
         is_initialized = a_type.is_expanded
      end

   initialize_fields
      do
         create fields.make
         type.writable_attributes.for_each(agent (stamp: FEATURE_STAMP)
                                         local
                                            rf: RUN_FEATURE; t: TYPE; o: RUNNER_OBJECT
                                         do
                                            if stamp.has_run_feature_for(type) then
                                               rf := stamp.run_feature_for(type)
                                               t := rf.result_type.resolve_in(type)
                                               if t.is_expanded then
                                                  o := processor.default_expanded(t)
                                               else
                                                  check
                                                     o = Void
                                                  end
                                               end
                                               fields.add(o, rf.name.to_string.intern)
                                            else
                                               -- that field is not used, forget it
                                            end
                                         end)
      end

feature {RUNNER_STRUCTURED_OBJECT}
   fields: HASHED_DICTIONARY[RUNNER_OBJECT, FIXED_STRING]

feature {TYPE}
   visit_type (visited: TYPE)
      do
         check False end -- I only need to insert TYPE_VISITOR to access some TYPE features
      end

invariant
   type.live_type /= Void
   fields /= Void

end -- class RUNNER_STRUCTURED_OBJECT
--
-- ------------------------------------------------------------------------------------------------------------------------------
-- Copyright notice below. Please read.
--
-- Liberty Eiffel is free software; you can redistribute it and/or modify it under the terms of the GNU General Public License,
-- as published by the Free Software Foundation; either version 2, or (at your option) any later version.
-- Liberty Eiffel is distributed in the hope that it will be useful but WITHOUT ANY WARRANTY; without even the implied warranty
-- of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details. You should have
-- received a copy of the GNU General Public License along with Liberty Eiffel; see the file COPYING. If not, write to the Free
-- Software Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301, USA.
--
-- Copyright (C) 2011-2022: Cyril ADRIAN, Paolo REDAELLI, Raphael MACK
--
-- http://www.gnu.org/software/liberty-eiffel/
--
--
-- Liberty Eiffel is based on SmartEiffel (Copyrights below)
--
-- Copyright(C) 1994-2002: INRIA - LORIA (INRIA Lorraine) - ESIAL U.H.P.       - University of Nancy 1 - FRANCE
-- Copyright(C) 2003-2006: INRIA - LORIA (INRIA Lorraine) - I.U.T. Charlemagne - University of Nancy 2 - FRANCE
--
-- Authors: Dominique COLNET, Philippe RIBET, Cyril ADRIAN, Vincent CROIZIER, Frederic MERIZEN
--
-- ------------------------------------------------------------------------------------------------------------------------------
