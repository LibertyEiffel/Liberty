-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class MANIFEST_GENERIC_POOL
   --
   -- Unique global object in charge of MANIFEST_GENERIC used.
   --

insert
   GLOBALS

feature {}
   collected_manifest_generic: HASHED_SET[MANIFEST_GENERIC] is
      once
         create Result.make
      end

feature {MANIFEST_GENERIC}
   collect (manifest_generic: MANIFEST_GENERIC) is
      require
         manifest_generic /= Void
      do
         collected_manifest_generic.add(manifest_generic)
      end

feature {SMART_EIFFEL}
   reset is
         -- Called before a re-collect cycle.
      do
         collected_manifest_generic.clear_count
      end

feature {C_PRETTY_PRINTER}
   c_define is
      require
         smart_eiffel.is_ready
      local
         i: INTEGER; manifest_generic: MANIFEST_GENERIC
      do
         cpp.split_c_file_padding_here
         from
            i := collected_manifest_generic.lower
         until
            i > collected_manifest_generic.upper
         loop
            manifest_generic := collected_manifest_generic.item(i)
            if manifest_generic.created_type.is_native_array then
               c_define_for_native_array(manifest_generic.created_type)
            else
               c_define_for_user_generic(manifest_generic)
            end
            i := i + 1
         end
      end

feature {}
   c_define_for_user_generic (manifest_generic: MANIFEST_GENERIC) is
      require
         not manifest_generic.created_type.is_native_array
      local
         created_type: TYPE; created_type_id, i: INTEGER;
         af: ANONYMOUS_FEATURE; fal: FORMAL_ARG_LIST; va_type: TYPE_MARK
      do
         created_type := manifest_generic.created_type
         created_type_id := created_type.id
         cpp.prepare_c_function
         cpp.pending_c_function_signature.append(once "T0* se_manifest")
         created_type_id.append_in(cpp.pending_c_function_signature)
         cpp.pending_c_function_signature.append(once "(")
         if not ace.boost then
            cpp.pending_c_function_signature.append(once "se_dump_stack*caller,")
         end
         if ace.profile then
            cpp.pending_c_function_signature.append(once "se_local_profile_t*parent_profile,")
         end
         af := manifest_generic.manifest_make_feature_stamp.anonymous_feature(created_type)
         from
            i := 2
            fal := af.arguments
         until
            i > fal.count
         loop
            fal.type_mark(i).resolve_in(created_type).canonical_type_mark.c_type_for_argument_in(cpp.pending_c_function_signature)
            cpp.pending_c_function_signature.extend(' ')
            cpp.pending_c_function_signature.append(fal.name(i).to_string)
            cpp.pending_c_function_signature.extend(',')
            i := i + 1
         end
         cpp.pending_c_function_signature.append(once "int argc,...)")
         -- Prepare body:
         cpp.pending_c_function_body.append(once "/*")
         cpp.pending_c_function_body.append(created_type.name.to_string)
         cpp.pending_c_function_body.append(once "*/%NT")
         created_type_id.append_in(cpp.pending_c_function_body)
         cpp.pending_c_function_body.append(once "*C;%Nva_list pa;%Nint i=0;%Nint imax;%Nva_start(pa,argc);%NC=")
         if cpp.gc_handler.is_off then
            cpp.pending_c_function_body.append(once "se_malloc(sizeof(*C));%N*C=M")
            created_type_id.append_in(cpp.pending_c_function_body)
            cpp.pending_c_function_body.append(once ";%N")
         else
            cpp.pending_c_function_body.append(once "new")
            created_type_id.append_in(cpp.pending_c_function_body)
            cpp.pending_c_function_body.append(once "();%N")
         end
         cpp.pending_c_function_body.extend('r')
         created_type_id.append_in(cpp.pending_c_function_body)
         cpp.pending_c_function_body.append(once "manifest_make(")
         if not ace.boost then
            cpp.pending_c_function_body.append(once "caller,")
         end
         if ace.profile then
            cpp.pending_c_function_body.append(once "parent_profile,")
         end
         if af.use_current(created_type) or else not ace.boost then
            cpp.pending_c_function_body.append(once "C,")
         end
         cpp.pending_c_function_body.append(once "argc")
         from
            i := 2
            fal := af.arguments
         until
            i > fal.count
         loop
            cpp.pending_c_function_body.extend(',')
            cpp.pending_c_function_body.append(fal.name(i).to_string)
            i := i + 1
         end
         cpp.pending_c_function_body.append(once ");%Nimax=argc")
         af := manifest_generic.manifest_put_feature_stamp.anonymous_feature(created_type)
         fal := af.arguments
         if fal.count > 2 then
            cpp.pending_c_function_body.append(once "/")
            (fal.count - 1).append_in(cpp.pending_c_function_body)
         end
         cpp.pending_c_function_body.append(once ";%Nwhile (i < imax) {%N")
         from
            i := 2
            fal := af.arguments
         until
            i > fal.count
         loop
            va_type := fal.type_mark(i).resolve_in(created_type).canonical_type_mark
            va_type.c_type_for_argument_in(cpp.pending_c_function_body)
            cpp.pending_c_function_body.extend(' ')
            cpp.pending_c_function_body.append(fal.name(i).to_string)
            cpp.pending_c_function_body.append(once "=((")
            va_type.c_type_for_argument_in(cpp.pending_c_function_body)
            cpp.pending_c_function_body.append(once ")(va_arg(pa,")
            va_type_in(cpp.pending_c_function_body, va_type)
            cpp.pending_c_function_body.append(once ")));%N")
            i := i + 1
         end
         cpp.pending_c_function_body.append(once "r")
         created_type_id.append_in(cpp.pending_c_function_body)
         cpp.pending_c_function_body.append(once "manifest_put(")
         if not ace.boost then
            cpp.pending_c_function_body.append(once "caller,")
         end
         if ace.profile then
            cpp.pending_c_function_body.append(once "parent_profile,")
         end
         if af.use_current(created_type) or else not ace.boost then
            cpp.pending_c_function_body.append(once "C,")
         end
         cpp.pending_c_function_body.append(once "i++")
         from
            i := 2
            fal := af.arguments
         until
            i > fal.count
         loop
            cpp.pending_c_function_body.extend(',')
            cpp.pending_c_function_body.append(fal.name(i).to_string)
            i := i + 1
         end
         cpp.pending_c_function_body.append(once ");%N}%Nva_end(pa);%Nreturn ((T0*)C);%N")
         cpp.dump_pending_c_function(True)
      end

   c_define_for_native_array (native_array: TYPE) is
      require
         native_array.is_native_array
      local
         native_array_id: INTEGER; va_type: TYPE_MARK
      do
         native_array_id := native_array.live_type.id
         va_type := native_array.private_generic_list.first.canonical_type_mark
         cpp.prepare_c_function
         cpp.pending_c_function_signature.extend('T')
         native_array_id.append_in(cpp.pending_c_function_signature)
         cpp.pending_c_function_signature.append(once " se_manifest")
         native_array_id.append_in(cpp.pending_c_function_signature)
         cpp.pending_c_function_signature.extend('(')
         if not ace.boost then
            cpp.pending_c_function_signature.append(once "se_dump_stack*caller,")
         end
         if ace.profile then
            cpp.pending_c_function_signature.append(once "se_local_profile_t*parent_profile,")
         end
         cpp.pending_c_function_signature.append(once "int argc,...)")
         -- Prepare body:
         cpp.pending_c_function_body.append(once "/*")
         cpp.pending_c_function_body.append(native_array.name.to_string)
         cpp.pending_c_function_body.append(once "*/%NT")
         native_array_id.append_in(cpp.pending_c_function_body)
         cpp.pending_c_function_body.append(once " C;%Nint i=0;%Nva_list pa;%Nva_start(pa,argc);%NC=")
         if cpp.gc_handler.is_off then
            cpp.pending_c_function_body.append(once "se_malloc(sizeof(*C)*")
         else
            cpp.pending_c_function_body.append(once "new")
            native_array_id.append_in(cpp.pending_c_function_body)
            cpp.pending_c_function_body.append(once "(")
         end
         cpp.pending_c_function_body.append(once "argc);%Nwhile (i < argc ) {%N")
         va_type.c_type_for_argument_in(cpp.pending_c_function_body)
         cpp.pending_c_function_body.append(once " element=((")
         va_type.c_type_for_argument_in(cpp.pending_c_function_body)
         cpp.pending_c_function_body.append(once ")(va_arg(pa,")
         va_type_in(cpp.pending_c_function_body, va_type)
         cpp.pending_c_function_body.append(once ")));%NC[i]=element;%Ni++;%N}%Nva_end(pa);%Nreturn C;%N")
         cpp.dump_pending_c_function(True)
      end

   va_type_in (buffer: STRING; va_type: TYPE_MARK) is
      local
         ketm: KERNEL_EXPANDED_TYPE_MARK
      do
         if va_type.is_reference then
            buffer.append(once "T0*")
         elseif va_type.is_kernel_expanded then
            ketm ::= va_type
            ketm.c_type_for_va_arg_in(buffer)
         else
            va_type.c_type_for_argument_in(buffer)
         end
      end

end -- class MANIFEST_GENERIC_POOL
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
