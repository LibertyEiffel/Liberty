-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
deferred class C_HEADER_PASS

inherit
   TYPE_MARK_VISITOR
      undefine
         is_equal
      end

insert
   GLOBALS
      undefine
         is_equal
      end
   SINGLETON

feature {C_PRETTY_PRINTER}
   compile is
      do
         cpp.out_h_buffer.copy(header_comment)
         cpp.write_out_h_buffer
         pre_compile
         smart_eiffel.live_type_map.do_all(agent compile_header)
      end

feature {}
   compile_header (live_type: LIVE_TYPE) is
      require
         live_type /= Void
      do
         if live_type.at_run_time and then not is_compiled(live_type) then
            do_compile(live_type)
            set_compiled(live_type)
         end
      end

   header_comment: STRING is
      deferred
      end

   pre_compile is
      deferred
      end

   do_compile (live_type: LIVE_TYPE) is
      require
         live_type /= Void
      deferred
      end

feature {}
   is_compiled (live_type: LIVE_TYPE): BOOLEAN is
      require
         live_type /= Void
      do
         Result := compiled.fast_has(live_type)
      end

   set_compiled (live_type: LIVE_TYPE) is
      require
         live_type /= Void
         not is_compiled(live_type)
      do
         compiled.fast_add(live_type)
      ensure
         is_compiled(live_type)
      end

   compiled: HASHED_SET[LIVE_TYPE]

   make is
      do
         create compiled.make
      end

feature {}
   frozen standard_c_struct (type_mark: TYPE_MARK) is
         -- Produce C code for the standard C struct (for user's
         -- expanded or reference as well).
      require
         type_mark.is_static
         type_mark.need_c_struct
      local
         wa: ARRAY[RUN_FEATURE_2]; i, mem_id: INTEGER; a: RUN_FEATURE_2; t: TYPE_MARK
      do
         mem_id := type_mark.id
         wa := type_mark.type.live_type.writable_attributes
         cpp.out_h_buffer.copy(once "struct S")
         mem_id.append_in(cpp.out_h_buffer)
         cpp.out_h_buffer.extend('{')
         if type_mark.is_reference then
            if type_mark.type.live_type.is_tagged then
               cpp.out_h_buffer.append(once "Tid id;")
            end
         end
         if wa /= Void then
            from
               i := wa.upper
            until
               i = 0
            loop
               a := wa.item(i)
               t := a.result_type
               t.c_type_for_result_in(cpp.out_h_buffer)
               cpp.out_h_buffer.append(once " _")
               cpp.out_h_buffer.append(a.name.to_string)
               cpp.out_h_buffer.extend(';')
               i := i - 1
            end
         end
         cpp.out_h_buffer.append(once "};%N")
         cpp.write_out_h_buffer
         if type_mark.is_expanded then
            -- For expanded comparison:
            cpp.prepare_c_function
            cpp.pending_c_function_signature.append(once "int se_cmpT")
            mem_id.append_in(cpp.pending_c_function_signature)
            cpp.pending_c_function_signature.append(once "(T")
            mem_id.append_in(cpp.pending_c_function_signature)
            cpp.pending_c_function_signature.append(once "* o1,T")
            mem_id.append_in(cpp.pending_c_function_signature)
            cpp.pending_c_function_signature.append(once "* o2)")
            cpp.pending_c_function_body.append(once "int R=0;%N")
            if wa /= Void then
               from
                  i := wa.upper
               until
                  i = 0
               loop
                  a := wa.item(i)
                  if not a.result_type.is_empty_expanded then
                     if a.result_type.is_expanded and then not a.result_type.is_kernel_expanded then
                        cpp.pending_c_function_body.append(once "R = R || se_cmpT")
                        a.result_type.id.append_in(cpp.pending_c_function_body)
                        cpp.pending_c_function_body.append(once "(&(o1->_")
                        cpp.pending_c_function_body.append(a.name.to_string)
                        cpp.pending_c_function_body.append(once "), &(o2->_")
                        cpp.pending_c_function_body.append(a.name.to_string)
                        cpp.pending_c_function_body.append(once "));%N")
                     else
                        cpp.pending_c_function_body.append(once "R = R || ((o1->_")
                        cpp.pending_c_function_body.append(a.name.to_string)
                        cpp.pending_c_function_body.append(once ") != (o2->_")
                        cpp.pending_c_function_body.append(a.name.to_string)
                        cpp.pending_c_function_body.append(once "));%N")
                     end
                  end
                  i := i - 1
               end
            end
            cpp.pending_c_function_body.append(once "return R;%N")
            cpp.dump_pending_c_function(True)
         end
      end

   frozen standard_c_object_model (type_mark: TYPE_MARK) is
         -- Produce C code to define the model object.
      require
         type_mark.is_static
      local
         mem_id: INTEGER; lt: LIVE_TYPE
      do
         lt := type_mark.type.live_type
         mem_id := lt.id
         cpp.out_h_buffer.clear_count
         cpp.out_h_buffer.extend('T')
         mem_id.append_in(cpp.out_h_buffer)
         cpp.out_h_buffer.append(once " M")
         mem_id.append_in(cpp.out_h_buffer)
         cpp.out_c_buffer.clear_count
         c_object_model_in(lt)
         cpp.write_extern_2(cpp.out_h_buffer, cpp.out_c_buffer)
      end

   c_object_model_in (live_type: LIVE_TYPE) is
      local
         wa: ARRAY[RUN_FEATURE_2]; i: INTEGER; rf2: RUN_FEATURE_2; t: TYPE_MARK
      do
         wa := live_type.writable_attributes
         if wa = Void then
            if live_type.is_tagged then
               cpp.out_c_buffer.extend('{')
               live_type.id.append_in(cpp.out_c_buffer)
               cpp.out_c_buffer.extend('}')
            else
               live_type.canonical_type_mark.c_initialize_in(cpp.out_c_buffer)
            end
         else
            cpp.out_c_buffer.extend('{')
            if live_type.is_tagged then
               live_type.id.append_in(cpp.out_c_buffer)
               cpp.out_c_buffer.extend(',')
            end
            from
               i := wa.upper
            until
               i < wa.lower
            loop
               rf2 := wa.item(i)
               t := rf2.result_type
               t.c_initialize_in(cpp.out_c_buffer)
               i := i - 1
               if i >= wa.lower then
                  cpp.out_c_buffer.extend(',')
               end
            end
            cpp.out_c_buffer.extend('}')
         end
      end

invariant
   compiled /= Void

end -- class C_HEADER_PASS
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
