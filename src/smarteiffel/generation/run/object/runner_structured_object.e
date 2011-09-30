-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
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

create {RUNNER_MEMORY}
   make

create {RUNNER_STRUCTURED_OBJECT}
   copy_expanded

feature {ANY}
   builtins: RUNNER_ANY_BUILTINS is
      do
      end

   processor: RUNNER_PROCESSOR
   type: TYPE

   set_field (a_name: ABSTRACT_STRING; a_value: RUNNER_OBJECT) is
      do
         fields.fast_put(expand(a_value), a_name.intern)
      end

   field (a_name: ABSTRACT_STRING): RUNNER_OBJECT is
      do
         Result := expand(fields.fast_at(a_name.intern))
      end

   out_in_tagged_out_memory is
      do
         type.long_name.out_in_tagged_out_memory
         tagged_out_memory.extend('[')
         fields.do_all(agent (o: RUNNER_OBJECT; f: FIXED_STRING) is
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

   is_equal (other: like Current): BOOLEAN is
      do
         if type.is_reference then
            Result := Current = other
         else
            Result := other.fields.count = fields.count
               and then other.fields.for_all(agent (o: RUNNER_OBJECT; f: FIXED_STRING): BOOLEAN is
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

feature {RUNNER_FACET}
   copy_if_expanded: like Current is
      do
         if type.is_reference then
            Result := Current
         else
            create Result.copy_expanded(Current)
         end
      end

feature {}
   copy_expanded (model: like Current) is
      require
         model.type.is_expanded
      do
         make(model.processor, model.type)
         model.fields.do_all(agent (field_value: RUNNER_OBJECT; field_name: FIXED_STRING) is
                             do
                                fields.add(expand(field_value), field_name)
                             end)
      end

feature {}
   make (a_processor: like processor; a_type: like type) is
      require
         a_processor /= Void
         a_type.live_type /= Void
      do
         processor := a_processor
         type := a_type
         initialize_fields
      ensure
         processor = a_processor
         type = a_type
      end

   initialize_fields is
      do
         create fields.make
         type.writable_attributes.do_all(agent (stamp: FEATURE_STAMP) is
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
   visit_type (visited: TYPE) is
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
-- SmartEiffel is free software; you can redistribute it and/or modify it under the terms of the GNU General Public License,
-- as published by the Free Software Foundation; either version 2, or (at your option) any later version.
-- SmartEiffel is distributed in the hope that it will be useful but WITHOUT ANY WARRANTY; without even the implied warranty
-- of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details. You should have
-- received a copy of the GNU General Public License along with SmartEiffel; see the file COPYING. If not, write to the Free
-- Software Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301, USA.
--
-- Copyright(C) 1994-2002: INRIA - LORIA (INRIA Lorraine) - ESIAL U.H.P.       - University of Nancy 1 - FRANCE
-- Copyright(C) 2003-2004: INRIA - LORIA (INRIA Lorraine) - I.U.T. Charlemagne - University of Nancy 2 - FRANCE
--
-- Authors: Dominique COLNET, Philippe RIBET, Cyril ADRIAN, Vincent CROIZIER, Frederic MERIZEN
--
-- http://SmartEiffel.loria.fr - SmartEiffel@loria.fr
-- ------------------------------------------------------------------------------------------------------------------------------
