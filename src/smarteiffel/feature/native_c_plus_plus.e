-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class NATIVE_C_PLUS_PLUS

inherit
   NATIVE

create {ANY}
   make

feature {ANY}
   accept (visitor: NATIVE_C_PLUS_PLUS_VISITOR)
      do
         visitor.visit_native_c_plus_plus(Current)
      end

   use_current (er: EXTERNAL_ROUTINE): BOOLEAN
      do
      end

feature {EXTERNAL_ROUTINE}
   collect (type: TYPE; external_routine: EXTERNAL_ROUTINE)
      do
         notify_external_assignments(type, external_routine)
      end

feature {EXTERNAL_TYPE}
   parse_external_type (alias_string: MANIFEST_STRING; target: EXTERNAL_TYPE)
      do
         not_yet_implemented
      end

feature {ANY}
   parse_external_in (body: STRING; args_count: INTEGER; tag: STRING; er: EXTERNAL_ROUTINE)
         -- Lazy parsing (hope the tag is correct) of this syntax :
         --
         -- External -> "%"C++" [ "[" C++_feature "]" ]
         --                     [ "(" {Type "," ...} ")" [ ":" Type ] ]
         --                     [ "|" {include "," ...} ]
         --             "%""
         -- C++_feature -> "static" C++_Class |
         --                "new" C++_Class |
         --                "delete" C++_Class |
         --                "data_member" C++_Class |
         --                C++_Class
         -- include -> "%"" Manifest string "%"" |
         --            "<" Manifest_string ">"
         -- C++_Class -> Identifier include
      local
         i, state, args, parenthesis: INTEGER; c: CHARACTER
      do
         from
            check
               tag.has_prefix(once "C++")
            end
            i := 4
         until
            i > tag.count
         loop
            c := tag.item(i)
            inspect
               state
            when 0 then
               -- Looks like : "C++"
               inspect
                  c
               when ' ', '%T', '%N' then
                  i := i + 1
               when '[' then
                  i := i + 1
                  state := 1
               else
                  i := error_at(i, tag, state)
               end
            when 1 then
               -- Looks like : "C++ [" :
               if c = ' ' or else c = '%T' or else c = '%N' then
                  i := i + 1
               elseif i = tag.substring_index(once "static ", i) then
                  i := i + 7
                  i := parse_cpp_class_in(body, i, tag)
                  body.append(once "::")
                  body.append(er.c_plus_plus_name)
                  state := 2
               elseif i = tag.substring_index(once "new ", i) then
                  i := i + 4
                  body.append(once "new ")
                  i := parse_cpp_class_in(body, i, tag)
                  state := 3
               elseif i = tag.substring_index(once "delete ", i) then
                  i := i + 7
                  body.append(once "delete((")
                  i := parse_cpp_class_in(body, i, tag)
                  body.append(once "*)a1)")
                  if args /= 0 or else args_count /= 1 then
                     i := error_at(i, tag, state)
                  else
                     state := 4
                  end
               elseif i = tag.substring_index(once "data_member ", i) then
                  i := error_at(i, tag, state) -- really necessary ?
               else
                  args := args + 1
                  body.append(once "((")
                  i := parse_cpp_class_in(body, i, tag)
                  body.append(once "*)a1)->")
                  body.append(er.c_plus_plus_name)
                  state := 5
               end
            when 2 then
               -- Looks like : "C++ [ static C++_Class " :
               inspect
                  c
               when ' ', '%T', '%N' then
                  i := i + 1
               when ']' then
                  i := i + 1
                  state := 8
               else
                  i := error_at(i, tag, state)
               end
            when 3 then
               -- Looks like : "C++ [ new C++_Class" :
               inspect
                  c
               when ' ', '%T', '%N' then
                  i := i + 1
               when ']' then
                  i := i + 1
                  state := 6
               else
                  i := error_at(i, tag, state)
               end
            when 4 then
               -- Looks like : "C++ [ delete C++_Class " :
               inspect
                  c
               when ' ', '%T', '%N' then
                  i := i + 1
               when ']' then
                  i := i + 1
                  state := 10
               else
                  i := error_at(i, tag, state)
               end
            when 5 then
               -- Looks like : "C++ [C++_Class" :
               inspect
                  c
               when ' ', '%T', '%N' then
                  i := i + 1
               when ']' then
                  i := i + 1
                  state := 7
               else
                  i := error_at(i, tag, state)
               end
            when 6 then
               -- Looks like : "C++ [ new C++_CLASS ]" :
               inspect
                  c
               when ' ', '%T', '%N' then
                  i := i + 1
               when '(' then
                  i := parse_args_in(body, i, tag, args, args_count)
                  state := 13
               else
                  i := error_at(i, tag, state)
               end
            when 7 then
               -- Looks like : "C++ [ C++_Class ] :
               inspect
                  c
               when ' ', '%T', '%N' then
                  i := i + 1
               when '(' then
                  i := parse_args_in(body, i, tag, args, args_count)
                  state := 11
               else
                  i := error_at(i, tag, state)
               end
            when 8 then
               -- Looks like : "C++ [ static C++_Class ]" :
               inspect
                  c
               when ' ', '%T', '%N' then
                  i := i + 1
               when '(' then
                  i := parse_args_in(body, i, tag, args, args_count)
                  state := 9
               else
                  i := error_at(i, tag, state)
               end
            when 9 then
               -- Looks like : "C++ [ static C++_Class ] ({type, ...})" :
               i := i + 1
            when 10 then
               -- Looks like : "C++ [ delete C++_Class ]" :
               inspect
                  c
               when ' ', '%T', '%N' then
                  i := i + 1
               when '(' then
                  parenthesis := parenthesis + 1
                  i := i + 1
               when ')' then
                  if parenthesis > 1 then
                     i := error_at(i, tag, state)
                  else
                     i := i + 1
                  end
               else
                  i := error_at(i, tag, state)
               end
            when 11 then
               -- Looks like : "C++ * ( { type , ... } )" :
               inspect
                  c
               when ':' then
                  state := 12
               when '|' then
                  state := 13
               else
               end
               i := i + 1
            when 12 then
               -- Looks like : "C++ * ( { type , ... } ) : " :
               inspect
                  c
               when '|' then
                  state := 13
               else
               end
               i := i + 1
            when 13 then
               -- Looks like : "C++ * |" :
               inspect
                  c
               when ' ', '%T', '%N' then
                  i := i + 1
               when '<', '%"' then
                  i := parse_include(i, tag)
               when ',' then
                  i := i + 1
               else
                  i := error_at(i, tag, state)
               end
            end
         end
      end

feature {}
   extra_c_prototype_dumped: BOOLEAN

   rf7_memory: RUN_FEATURE_7

   rf8_memory: RUN_FEATURE_8

   parse_args_in (body: STRING; s: INTEGER; tag: STRING; args, args_count: INTEGER): INTEGER
      require
         tag.item(s) = '('
      local
         i, parenthesis, a, state: INTEGER; c: CHARACTER
      do
         from
            a := args
            state := 40
            body.extend('(')
            i := s + 1
         until
            i > tag.count or else Result > i
         loop
            c := tag.item(i)
            inspect
               state
            when 40 then
               -- Before arg type :
               inspect
                  c
               when ' ', '%T', '%N' then
                  i := i + 1
               when ')' then
                  Result := i + 1
               else
                  body.extend('(')
                  state := 41
               end
            when 41 then
               -- Inside some type :
               inspect
                  c
               when ',' then
                  i := i + 1
                  body.extend(')')
                  a := a + 1
                  body.extend('a')
                  a.append_in(body)
                  if a < args_count then
                     body.extend(',')
                  end
                  state := 40
               when '(' then
                  body.extend(c)
                  parenthesis := parenthesis + 1
                  i := i + 1
               when ')' then
                  if parenthesis = 0 then
                     body.extend(')')
                     a := a + 1
                     body.extend('a')
                     a.append_in(body)
                     Result := i + 1
                  else
                     body.extend(c)
                     parenthesis := parenthesis - 1
                     i := i + 1
                  end
               else
                  body.extend(c)
                  i := i + 1
               end
            end
         end
         body.extend(')')
         if Result = 0 or else a /= args_count then
            Result := error_at(i, tag, state)
         end
      end

   parse_include (s: INTEGER; tag: STRING): INTEGER
      require
         (once "%"<").has(tag.item(s))
      local
         include, buffer: STRING; i: INTEGER; c: CHARACTER
      do
         from
            buffer := once "... unique local buffer ..."
            buffer.clear_count
            buffer.extend(tag.item(s))
            i := s + 1
         until
            i > tag.count or else Result > i
         loop
            c := tag.item(i)
            inspect
               c
            when '%"', '>' then
               buffer.extend(c)
               include := buffer.twin
               if not include_memory.has(include) then
                  include_memory.add_last(include)
                  cpp.add_include(include)
               end
               Result := i + 1
            else
               buffer.extend(c)
               i := i + 1
            end
         end
         if Result = 0 then
            Result := error_at(i, tag, 20)
         end
      end

   parse_cpp_class_in (body: STRING; s: INTEGER; tag: STRING): INTEGER
      local
         i, state: INTEGER; c: CHARACTER
      do
         from
            state := 30
            i := s
         until
            i > tag.count or else state > 32
         loop
            c := tag.item(i)
            inspect
               state
            when 30 then
               -- Nothing :
               inspect
                  c
               when ' ', '%T', '%N' then
                  i := i + 1
               when '<', '>', '%"', '(', ')' then
                  i := error_at(i, tag, state)
               else
                  state := 31
               end
            when 31 then
               -- Inside Identifier :
               inspect
                  c
               when ' ', '%T', '%N' then
                  state := 32
               when '<', '%"' then
                  i := parse_include(i, tag)
                  state := 33
               else
                  body.extend(c)
                  i := i + 1
               end
            when 32 then
               -- After Identifier :
               inspect
                  c
               when ' ', '%T', '%N' then
                  i := i + 1
               when '<', '%"' then
                  i := parse_include(i, tag)
                  state := 33
               else
                  i := error_at(i, tag, state)
               end
            end
         end
         Result := i
      end

   error_at (error_index: INTEGER; tag: STRING; state: INTEGER): INTEGER
      do
         if rf7_memory /= Void then
            error_handler.add_position(rf7_memory.base_feature.start_position)
         else
            error_handler.add_position(rf8_memory.base_feature.start_position)
         end
         error_handler.append(once "Bad external %"C++%" definition.%Nexternal %"")
         error_handler.append(tag)
         error_handler.append(once "%"%N_________")
         from
            Result := 1
         until
            Result > error_index
         loop
            error_handler.extend('_')
            Result := Result + 1
         end
         error_handler.extend('^')
         error_handler.append(once "%NSee tutorial/external/C++ directory %
         %for more information.%N (Internal state = ")
         error_handler.append(state.to_string)
         error_handler.extend(')')
         error_handler.print_as_error
         Result := tag.count + 1
      end

   include_memory: FAST_ARRAY[STRING]
      once
         create Result.with_capacity(4)
      end

end -- class NATIVE_C_PLUS_PLUS
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
