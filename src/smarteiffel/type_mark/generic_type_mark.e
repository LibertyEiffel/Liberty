-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
deferred class GENERIC_TYPE_MARK
   --
   -- Common parent of all generic types (USER_GENERIC_TYPE_MARK, TYPE_ARRAY, TYPE_NATIVE_ARRAY,
   -- NON_EMPTY_TUPLE_TYPE_MARK and AGENT_TYPE_MARK as well).
   --

inherit
   TYPE_MARK
      redefine pretty_in
      end

feature {ANY}
   frozen is_generic: BOOLEAN True

   class_text_name: CLASS_NAME
         -- It can be "ARRAY", "NATIVE_ARRAY", "TUPLE", "DICTIONARY", "PROCEDURE", etc. with the correct
         -- `start_position'.
      require else
         True
      attribute
      end

   generic_list: ARRAY[TYPE_MARK]
         --|*** (Should be turned one day into a FAST_ARRAY in order to save a little bit memory.) ***

   frozen type: TYPE
      do
         if type_memory = Void then
            type_memory := smart_eiffel.get_type(Current, False)
         end
         Result := type_memory
      end

   pretty_in (buffer: STRING)
      local
         i: INTEGER
      do
         buffer.append(class_text_name.to_string)
         buffer.extend('[')
         from
            i := generic_list.lower
         until
            i > generic_list.upper
         loop
            generic_list.item(i).pretty_in(buffer)
            i := i + 1
            if i <= generic_list.upper then
               buffer.append(once ", ")
            end
         end
         buffer.extend(']')
      end

   frozen start_position: POSITION
      do
         Result := class_text_name.start_position
      end

   frozen is_static: BOOLEAN
      local
         i: INTEGER
      do
         if type_memory /= Void then
            Result := True -- Cool ;-)
         else
            from
               Result := True
               i := generic_list.lower
            until
               not Result or else i > generic_list.upper
            loop
               Result := generic_list.item(i).is_static
               i := i + 1
            end
         end
      end

   specialize_in (new_type: TYPE)
      local
         i: INTEGER
      do
         from
            i := generic_list.lower
         until
            i > generic_list.upper
         loop
            generic_list.item(i).specialize_in(new_type)
            i := i + 1
         end
         Current.update_static_memory(new_type)
      end

   specialize_thru (parent_type: TYPE; parent_edge: PARENT_EDGE; new_type: TYPE): GENERIC_TYPE_MARK
      local
         tm1, tm2: TYPE_MARK; i: INTEGER; gl: like generic_list
      do
         from
            i := generic_list.lower
         until
            tm1 /= tm2 or else i > generic_list.upper
         loop
            tm1 := generic_list.item(i)
            tm2 := tm1.specialize_thru(parent_type, parent_edge, new_type)
            i := i + 1
         end
         if tm1 = tm2 then
            Result := Current
         else
            from
               gl := generic_list.twin
               gl.put(tm2, i - 1)
            until
               i > gl.upper
            loop
               tm1 := gl.item(i)
               tm2 := tm1.specialize_thru(parent_type, parent_edge, new_type)
               gl.put(tm2, i)
               i := i + 1
            end
            Result := twin
            Result.set_generic_list(gl)
         end
         Result.update_static_memory(new_type)
      end

   frozen has_been_specialized: BOOLEAN
      do
         Result := is_static or else not static_memory.is_empty
      end

   frozen declaration_type: TYPE_MARK
       local
          tm1, tm2: TYPE_MARK; i: INTEGER; gl: like generic_list
         static_generic_type_mark: like Current
      do
         if declaration_type_memory = Void then
            from
               i := generic_list.lower
            until
               tm1 /= tm2 or else i > generic_list.upper
            loop
               tm1 := generic_list.item(i)
               tm2 := tm1.declaration_type
               i := i + 1
            end
            if tm1 /= tm2 then
               from
                  gl := generic_list.twin
                  gl.put(tm2, i - 1)
               until
                  i > gl.upper
               loop
                  gl.put(gl.item(i).declaration_type, i)
                  i := i + 1
               end
               static_generic_type_mark := twin
               static_generic_type_mark.set_static_generic_list(gl)
               declaration_type_memory := static_generic_type_mark
            else
               declaration_type_memory := Current
            end
         end
         Result := declaration_type_memory
      ensure then
         Result.generic_list.count = generic_list.count
      end

   frozen written_name: HASHED_STRING
      local
         i: INTEGER; gl: like generic_list; buffer: STRING
      do
         Result := written_name_memory
         if Result = Void then
            gl := generic_list -- To force first the computation of `generic_list' items:
            from
               i := gl.lower
            until
               i > gl.upper
            loop
               if gl.item(i).written_name = Void then
                  check
                     False
                  end
               end
               i := i + 1
            end
            -- Now prepare the `buffer':
            buffer := once ".....         local unique buffer          ....."
            buffer.copy(class_text_name.to_string)
            if buffer.has_prefix(as_tuple) then
               -- To check that this is a True TUPLE or the empty TUPLE type mark:
               --|*** IS IT POSSIBLE ?? *** (Dom. april 14th 2004) ***
               i := buffer.index_of(' ', 5)
               if i /= 0 then
                  buffer.keep_head(5)
               end
            end
            from
               buffer.extend('[')
               i := gl.lower
            until
               i > gl.upper
            loop
               buffer.append(gl.item(i).written_mark)
               i := i + 1
               if i <= gl.upper then
                  buffer.extend(',')
               end
            end
            buffer.extend(']')
            Result := string_aliaser.hashed_string(buffer)
            written_name_memory := Result
         end
      end

   frozen to_static (new_type: TYPE; allow_raw_class_name: BOOLEAN): TYPE_MARK
      local
         static_tuple: TUPLE[TYPE, TYPE]
      do
         if is_static then
            Result := Current
         else
            if allow_raw_class_name then --| **** TODO find a way to remove that HACK
               update_static_memory(new_type)
            end
            static_tuple := static_memory.fast_reference_at(new_type)
            if static_tuple = Void then
               sedb_breakpoint
            elseif allow_raw_class_name then
               Result := static_tuple.second.canonical_type_mark
            else
               Result := static_tuple.first.canonical_type_mark
            end
         end
      end

   frozen signature_resolve_in (new_type: TYPE): TYPE
      local
         i: INTEGER; gl: like generic_list; static_generic_type_mark: like Current
      do
         if signature_resolved_memory = Void then
            create signature_resolved_memory.make
         else
            Result := signature_resolved_memory.reference_at(new_type)
         end
         if Result = Void then
            from
               gl := generic_list.twin
               i := gl.lower
            until
               i > gl.upper
            loop
               gl.put(generic_list.item(i).signature_resolve_in(new_type).canonical_type_mark, i)
               i := i + 1
            end
            static_generic_type_mark := twin
            static_generic_type_mark.set_static_generic_list(gl)
            Result := smart_eiffel.get_type(static_generic_type_mark, False)
            signature_resolved_memory.put(Result, new_type)
         end
      end

feature {TYPE, TYPE_MARK, SMART_EIFFEL}
   long_name: HASHED_STRING
      local
         ln: STRING; i: INTEGER
      do
         Result := long_name_memory
         if Result = Void then
            ln := strings.new_twin(canonical_long_name.to_string)
            ln.extend('[')
            from
               i := generic_list.lower
            until
               i > generic_list.upper
            loop
               if i > generic_list.lower then
                  ln.extend(',')
               end
               ln.append(generic_list.item(i).long_name.to_string)
               i := i + 1
            end
            ln.extend(']')
            Result := string_aliaser.hashed_string(ln)
            strings.recycle(ln)
            long_name_memory := Result
         end
      end

feature {}
   written_name_memory: HASHED_STRING
         -- To cache `written_name'.

   declaration_type_memory: like Current
         -- To cache `declaration_type'.

feature {GENERIC_TYPE_MARK}
   frozen set_generic_list(gl: like generic_list)
      do
         written_name_memory := Void
         signature_resolved_memory := Void
         generic_list := gl
         recompute_declaration_type
      ensure
         generic_list = gl
      end

   frozen set_static_generic_list (gl: like generic_list)
         -- Where `gl' is completely static.
      require
         generic_list.count = gl.count
      do
         generic_list := gl
         declaration_type_memory := Current
         written_name_memory := Void
         --|*** do not reset static_memory
         static_memory := Void
         signature_resolved_memory := Void
      ensure
         generic_list = gl
      end

   frozen recompute_declaration_type
       local
          tm1, tm2, tm3 : TYPE_MARK; i, current_ok, memory_ok: INTEGER; gl: like generic_list
         static_generic_type_mark: like Current
      do
         if declaration_type_memory /= Void then
            gl := declaration_type_memory.generic_list
            from
               i := generic_list.lower
               current_ok := i
               memory_ok := i
            until
               (current_ok < i and then memory_ok < i) or else i > generic_list.upper
            loop
               tm1 := generic_list.item(i)
               tm2 := tm1.declaration_type
               tm3 := gl.item(i)
               if current_ok = i and then tm1 = tm2 then
                  current_ok := current_ok + 1
               end
               if memory_ok = i and then tm3 = tm2 then
                  memory_ok := memory_ok + 1
               end
               i := i + 1
            end
            if current_ok = i then
               declaration_type_memory := Current
            elseif memory_ok /= i then
               if current_ok >= memory_ok then
                  gl := generic_list.twin
               else
                  gl := gl.twin
               end
               from
                  gl.put(tm2, i - 1)
               until
                  i > gl.upper
               loop
                  gl.put(generic_list.item(i).declaration_type, i)
                  i := i + 1
               end
               static_generic_type_mark := twin
               static_generic_type_mark.set_static_generic_list(gl)
               declaration_type_memory := static_generic_type_mark
            end
         end
      end

feature {GENERIC_TYPE_MARK, TYPE_MARK_LIST}
   update_static_memory (new_type: TYPE)
      local
         static: TUPLE[TYPE, TYPE]; t1, t2: TYPE
      do
         if static_memory = Void then
            create static_memory.make
         else
            static := static_memory.fast_reference_at(new_type)
         end
         if static = Void then
            t1 := new_static_type_in(new_type, False)
            if t1 /= Void then
               t2 := new_static_type_in(new_type, True)
               if t2 /= Void then
                  static := [t1, t2]
                  static_memory.fast_put(static, new_type)
               end
            end
         end
      end

feature {}
   new_static_type_in (new_type: TYPE; allow_raw_class_name: BOOLEAN): TYPE
      local
         old_generic_count, generic_count, i: INTEGER; gl: like generic_list; tm1, tm2: TYPE_MARK
         static_generic_type_mark: like Current
      do
         from
            gl := generic_list
            old_generic_count := -1
         invariant
            gl.count = generic_list.count
         variant
            gl.count - generic_count
         until
            generic_count = gl.count or else generic_count = old_generic_count
         loop
            old_generic_count := generic_count
            generic_count := 0

            from
               i := gl.lower
            until
               tm1 /= tm2 or else i > gl.upper
            loop
               tm1 := gl.item(i)
               tm2 := tm1.to_static(new_type, allow_raw_class_name)
               if tm2 = Void then
                  sedb_breakpoint
                  tm2 := tm1
               else
                  generic_count := generic_count + 1
               end
               i := i + 1
            end

            if tm1 /= tm2 then
               from
                  if gl = generic_list then
                     gl := gl.twin
                  end
                  gl.put(tm2, i - 1)
               until
                  i > gl.upper
               loop
                  tm1 := gl.item(i)
                  tm2 := tm1.to_static(new_type, allow_raw_class_name)
                  if tm2 = Void then
                     sedb_breakpoint
                  else
                     gl.put(tm2, i)
                     generic_count := generic_count + 1
                  end
                  i := i + 1
               end
            end

            if generic_count <= old_generic_count then
               sedb_breakpoint
            end
         end

         if generic_count < gl.count then
            Result := Void
         elseif gl = generic_list then
            -- Was a True static `generic_list':
            Result := smart_eiffel.get_type(Current, allow_raw_class_name)
         else
            static_generic_type_mark := twin
            static_generic_type_mark.set_static_generic_list(gl)
            Result := smart_eiffel.get_type(static_generic_type_mark, allow_raw_class_name)
         end
      end

feature {TYPE_MARK}
   set_start_position (sp: like start_position)
      local
         i: INTEGER
         tm1, tm2: TYPE_MARK
      do
         if start_position /= sp then
            class_text_name := class_text_name.twin
            class_text_name.set_accurate_position(sp)
            from
               i := generic_list.lower
            until
               i > generic_list.upper or else tm1 /= tm2
            loop
               tm1 := generic_list.item(i)
               tm2 := tm1.at(sp)
               i := i + 1
            end
            if tm1 /= tm2 then
               declaration_type_memory := Void
               generic_list := generic_list.twin
               generic_list.put(tm2, i - 1)
               from
               until
                  i > generic_list.upper
               loop
                  tm1 := generic_list.item(i)
                  tm2 := tm1.at(sp)
                  generic_list.put(tm2, i)
                  i := i + 1
               end
            end
         end
      end

feature {}
   type_memory: like type

   frozen short_generic (shorted_type: TYPE; ctn: like class_text_name)
         -- To implement all `short_' in subclasses.
      local
         i: INTEGER
      do
         short_printer.put_class_name(ctn)
         short_printer.hook_or("open_sb", "[")
         from
            i := 1
         until
            i > generic_list.count
         loop
            generic_list.item(i).short_(shorted_type)
            if i < generic_list.count then
               short_printer.hook_or("tm_sep", ", ")
            end
            i := i + 1
         end
         short_printer.hook_or("close_sb", "]")
      end

   static_memory: HASHED_DICTIONARY[TUPLE[TYPE, TYPE], TYPE]
         -- Where the key is the context and where the value is the corresponding `to_static' TYPE.

   signature_resolved_memory: HASHED_DICTIONARY[TYPE, TYPE]
         -- Where the key is the context and where the value is the corresponding resolved TYPE.

invariant
   class_text_name /= Void

   generic_list /= Void

end -- class GENERIC_TYPE_MARK
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
-- Copyright (C) 2011-2016: Cyril ADRIAN, Paolo REDAELLI, Raphael MACK
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
