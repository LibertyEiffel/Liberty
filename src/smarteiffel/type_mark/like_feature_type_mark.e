-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class LIKE_FEATURE_TYPE_MARK
   --
   -- For an anchored declaration type mark using a feature name.
   --
   -- See also TYPE_LIKE_ARG and TYPE_LIKE_CURRENT.
   --

inherit
   ANCHORED_TYPE_MARK

create {EIFFEL_PARSER}
   make

feature {ANY}
   like_what: FEATURE_NAME
         -- The one written after the "like" keyword.

   written_name: HASHED_STRING

   declaration_type: TYPE_MARK

   specialize_in (new_type: TYPE)
      local
         result_tm: TYPE_MARK; fs: FEATURE_STAMP
      do
         fs := new_type.search(like_what)
         if fs = Void then
            error_handler.append(once "Bad anchor. Unknown feature name.")
            error_handler.add_position(like_what.start_position)
            error_handler.print_as_fatal_error
         end
         feature_stamp_memory.fast_put(fs, new_type)
         if declaration_type = Void then
            -- To avoid multiple computation in case of generic `new_type'.
            result_tm := feature_accumulator.find_type_for(fs)
            if result_tm = Void then
               error_handler.append(like_what.to_string)
               error_handler.append(once " is a procedure. Anchored type is not valid.")
               error_handler.add_position(start_position)
               error_handler.add_position(like_what.start_position)
               error_handler.print_as_fatal_error
            end
            declaration_type := result_tm.declaration_type
         end
      ensure then
         feature_stamp_memory.reference_at(new_type).has_type(new_type)
      end

   specialize_thru (parent_type: TYPE; parent_edge: PARENT_EDGE; new_type: TYPE): like Current
      local
         old_fs, new_fs: FEATURE_STAMP; result_tm, new_declaration_type: TYPE_MARK
      do
         new_fs := feature_stamp_memory.fast_reference_at(parent_type)
         new_fs := new_fs.specialize_thru(parent_type, parent_edge, new_type)

         -- Because of synonym declaration list as: x, y, z: like foo.
         -- (Keep in mind that {TYPE_MARK}.specialize_thru may be called more than once.)
         old_fs := feature_stamp_memory.fast_reference_at(new_type)
         if old_fs = Void then
            feature_stamp_memory.add(new_fs, new_type)
            Result := Current
         elseif new_fs = old_fs then
            Result := Current
         else
            Result := twin
            Result.twin_feature_stamp_memory(new_fs, new_type)
         end

         -- We must also recompute the `declaration_type' which may change (yes, it is a like feature type mark !):
         check
            declaration_type /= Void -- (Should be computed in `specialize_in'.)
         end
         result_tm := feature_accumulator.find_type_for(new_fs)
         new_declaration_type := result_tm.declaration_type
         if declaration_type.written_name /= new_declaration_type.written_name then
            if Result = Current then
               Result := twin
            end
            Result.set_declaration_type(new_declaration_type)
         end
      ensure then
         Result.feature_stamp_memory.reference_at(new_type).has_type(new_type)
      end

   has_been_specialized: BOOLEAN
      do
         Result := not feature_stamp_memory.is_empty
      end

   to_static (new_type: TYPE; allow_raw_class_name: BOOLEAN): TYPE_MARK
      local
         fs: FEATURE_STAMP
      do
         check
            not allow_raw_class_name
         end
         fs := feature_stamp_memory.fast_reference_at(new_type)
         if feature_accumulator.context_type /= new_type then
            Result := fs.anonymous_feature(new_type).result_type
         else
            Result := feature_accumulator.find_type_for(fs)
         end
         Result := Result.to_static(new_type, False)
      end

   signature_resolve_in (new_type: TYPE): TYPE
      local
         fs: FEATURE_STAMP
      do
         fs := feature_stamp_memory.fast_reference_at(new_type)
         if feature_accumulator.context_type /= new_type then
            Result := fs.anonymous_feature(new_type).result_type.signature_resolve_in(new_type)
         else
            Result := feature_accumulator.find_type_for(fs).signature_resolve_in(new_type)
         end
      end

   accept (visitor: LIKE_FEATURE_TYPE_MARK_VISITOR)
      do
         visitor.visit_like_feature_type_mark(Current)
      end

feature {TYPE_MARK}
   short_ (shorted_type: TYPE)
      local
         fs: FEATURE_STAMP; af: ANONYMOUS_FEATURE
      do
         fs := feature_stamp_memory.fast_reference_at(shorted_type)
         af := fs.anonymous_feature(shorted_type)
         af.result_type.short_(shorted_type)
      end

feature {LIKE_FEATURE_TYPE_MARK}
   twin_feature_stamp_memory (new_fs: FEATURE_STAMP; new_type: TYPE)
      require
         new_fs /= Void
         new_type /= Void
         feature_stamp_memory.reference_at(new_type) /= Void
         feature_stamp_memory.reference_at(new_type) /= new_fs
      do
         -- We creates a new `feature_stamp_memory' which keeps the
         -- old informations for other TYPEs:
         feature_stamp_memory := feature_stamp_memory.twin -- We change only the `new_type':
         feature_stamp_memory.fast_put(new_fs, new_type)
      end

   feature_stamp_memory: HASHED_DICTIONARY[FEATURE_STAMP, TYPE]

   set_declaration_type (dt: like declaration_type)
      require
         dt.written_name /= declaration_type.written_name
      do
         declaration_type := dt
      ensure
         declaration_type = dt
      end

feature {}
   debug_info: STRING

   make (sp: like start_position; lw: like like_what)
      require
         not sp.is_unknown
         lw /= Void
      do
         start_position := sp
         like_what := lw
         written_mark_buffer.copy(fz_like)
         written_mark_buffer.extend(' ')
         like_what.declaration_in(written_mark_buffer)
         written_name := string_aliaser.hashed_string(written_mark_buffer)
         create feature_stamp_memory.make
         debug
            debug_info := ""
         end
      ensure
         start_position = sp
      end

end -- class LIKE_FEATURE_TYPE_MARK
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
