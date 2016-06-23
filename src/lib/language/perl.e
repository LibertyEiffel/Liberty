-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
class PERL
   -- This class allows to have an embedded Perl interpreter in your program.
   -- With this interpreter, you can "execute" any line as you would
   -- do in a Perl script, even lines such as "use strict;" or
   -- "use somepackage", lines with "require" (in perlfunc) and "do"
   -- (in perlfunc to include external Perl files). See tutorial/perl for examples.
   --
   -- The compilation process needs perl developpement to be installed
   -- (libperl-dev package on Debian). Compile options for the C
   -- compiler are determined with command 'perl -MExtUtils::Embed -e ccopts'
   -- and linker option with command 'perl -MExtUtils::Embed -e ldopts'
   -- Perl 5.6.0 or above is required.
   --
   -- Note that current release does not allow to have multiple
   -- interpreters running, so this class is a singleton. If you need
   -- multiple interpreters, documentation is available in manual
   -- perlembed (provided in standard Perl documentation and
   -- available on the net). Please contribute and send your changes!

insert
   SINGLETON

create {ANY}
   make

feature {}
   make
      require
         not interpreter_started
      do
         start_perl_interpreter
         interpreter_started := True
      ensure
         interpreter_started
      end

feature {ANY}
   interpreter_started: BOOLEAN

   destroy
      require
         interpreter_started
      do
         perl_interpreter_destroy
         interpreter_started := False
      ensure
         not interpreter_started
      end

feature {ANY} -- Perl code execution
   instruction (command: STRING)
         -- `command' is evaluated as an instruction (no result).
         --
         -- See also `expression'.
      require
         interpreter_started
         command /= Void
      do
         eval_command(command.to_external, True)
      end

   expression (command: STRING)
         -- `command' is evaluated and the result is reachable with last_* functions.
         --
         -- See also `read_variable', `instruction', `last_integer', `last_real', `last_string'...
      require
         interpreter_started
         command /= Void
      do
         last_result := eval_expression(command.to_external, True)
      end

feature {ANY} -- Reading values from Perl
   existant_variable (variable_name: STRING): BOOLEAN
         -- Check if some Perl variable with the name `variable_name' does
         -- exist. It's not related to the `undef' Perl value.
         --
         -- See also `defined_variable', `read_variable'.
      require
         interpreter_started
         not variable_name.is_empty
      do
         Result := get_sv(variable_name.to_external, False).is_not_null
      end

   defined_variable (variable_name: STRING): BOOLEAN
         -- Returns `True' if the Perl variable with the name `variable_name' does
         -- not have the Perl `undef' value.
         --
         -- See also `existant_variable', `read_variable'.
      require
         interpreter_started
         not variable_name.is_empty
         existant_variable(variable_name)
      do
         Result := sv_ok(get_sv(variable_name.to_external, False)) /= 0
      end

   read_variable (variable_name: STRING)
         -- Read the Perl variable with name `variable_name'. The
         -- result is available with last_* functions.
         --
         -- See also: `last_integer', `last_real', `last_string'...
      require
         interpreter_started
         not variable_name.is_empty
         defined_variable(variable_name)
      do
         last_result := get_sv(variable_name.to_external, False)
      end

   last_result_is_integer: BOOLEAN
         -- True if the result of the last interpreted expression or read variable is of integer type.
         --
         -- See also `last_integer', `expression'.
      require
         last_result.is_not_null
      do
         Result := sv_is_int(last_result) /= 0
      end

   last_integer: INTEGER
         -- Access to the result of the last interpreted expression or read variable when it is of integer type.
         --
         -- See also `last_result_is_integer', `expression'.
      require
         last_result_is_integer
      do
         Result := sv_to_int(last_result)
      end

feature {}
   last_result: POINTER

   start_perl_interpreter
      external "plug_in"
      alias "{
         location: "${sys}/plugins/language"
         module_name: "perl"
         feature_name: "perl_interpreter_init"
         }"
      end

   eval_command (string: POINTER; boolean: BOOLEAN)
      external "plug_in"
      alias "{
         location: "${sys}/plugins/language"
         module_name: "perl"
         feature_name: "eval_pv"
         }"
      end

   eval_expression (string: POINTER; boolean: BOOLEAN): POINTER
         -- return type is SV*
      external "plug_in"
      alias "{
         location: "${sys}/plugins/language"
         module_name: "perl"
         feature_name: "eval_pv"
         }"
      end

   sv_ok (sv_star: POINTER): INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins/language"
         module_name: "perl"
         feature_name: "SvOK"
         }"
      end

   get_sv (string: POINTER; boolean: BOOLEAN): POINTER
         -- return type is SV*
      external "plug_in"
      alias "{
         location: "${sys}/plugins/language"
         module_name: "perl"
         feature_name: "get_sv"
         }"
      end

   sv_is_int (sv_star: POINTER): INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins/language"
         module_name: "perl"
         feature_name: "se_SvIOK"
         }"
      end

   sv_to_int (sv_star: POINTER): INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins/language"
         module_name: "perl"
         feature_name: "se_SvIVX"
         }"
      end

   perl_interpreter_destroy
      external "plug_in"
      alias "{
         location: "${sys}/plugins/language"
         module_name: "perl"
         feature_name: "perl_interpreter_destroy"
         }"
      end

end -- class PERL
--
-- Copyright (C) 2009-2016: by all the people cited in the AUTHORS file.
--
-- Permission is hereby granted, free of charge, to any person obtaining a copy
-- of this software and associated documentation files (the "Software"), to deal
-- in the Software without restriction, including without limitation the rights
-- to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
-- copies of the Software, and to permit persons to whom the Software is
-- furnished to do so, subject to the following conditions:
--
-- The above copyright notice and this permission notice shall be included in
-- all copies or substantial portions of the Software.
--
-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
-- IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
-- FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
-- AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
-- LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
-- OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
-- THE SOFTWARE.
