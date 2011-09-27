-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class RUNNER_STRUCTURED_OBJECT

inherit
   RUNNER_OBJECT

create {RUNNER_MEMORY}
   make

create {RUNNER_STRUCTURED_OBJECT}
   copy_expanded

feature {ANY}
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
         create fields.make
      ensure
         processor = a_processor
         type = a_type
      end

feature {RUNNER_STRUCTURED_OBJECT}
   fields: HASHED_DICTIONARY[RUNNER_OBJECT, FIXED_STRING]

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
