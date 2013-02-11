-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class JVM_TOOLS
   --
   -- Singleton object to handle system dependant information.
   -- This singleton is shared via the GLOBALS.`system_tools' once function.
   --
   -- Only this object is supposed to handle contents of the `SmartEiffel'
   -- system environment variable.
   --
   -- You may also want to customize this class in order to support a
   -- new operating system (please let us know).
   --

insert
   GLOBALS
      undefine is_equal
      end
   DIRECTORY_NOTATION_HANDLER
      undefine is_equal
      end
   SINGLETON

creation {ANY}
   make

feature {INSTALL}
   javac: STRING is "javac"

   gcj: STRING is "gcj"

   kjc: STRING is "kjc"

   jikes: STRING is "jikes"

   jar: STRING is "jar"

   fastjar: STRING is "fastjar"

   java: STRING is "java"

   kaffe: STRING is "kaffe"

   sablevm: STRING is "sablevm"

   jamvm: STRING is "jamvm"

   compiler_list: FAST_ARRAY[STRING] is
      once
         Result := {FAST_ARRAY[STRING]   <<javac, gcj, kjc, jikes>> }
      end

   jar_list: FAST_ARRAY[STRING] is
      once
         Result := {FAST_ARRAY[STRING] << jar, fastjar >> }
      end

   jvm_list: FAST_ARRAY[STRING] is
      once
         Result := {FAST_ARRAY[STRING] << java, kaffe, sablevm, jamvm>> }
      end

   make is
      do
      end

feature{ANY}
   get_compiler_flags(which: STRING): STRING is
      do
         Result := once ""
         if not ace.boost then
            Result.extend(' ')
            Result.append(g_flag)
         end
      end
   
   get_jvm_flags(which: STRING): STRING is
      do
         Result := once ""
         if ace.ss /= Void then
            Result.extend(' ')
            Result.append(ss_flag)
            Result.extend(' ')
            Result.append(ace.ss)
         end
         if ace.mx /= Void then
            Result.extend(' ')
            Result.append(mx_flag)
            Result.extend(' ')
            Result.append(ace.mx)
         end
         if ace.ms /= Void then
            Result.extend(' ')
            Result.append(ms_flag)
            Result.extend(' ')
            Result.append(ace.ms)
         end
         if ace.classpath /= Void then
            Result.extend(' ')
            Result.append(classpath_flag)
            Result.extend(' ')
            Result.append(ace.classpath)
         end
      end

   get_jar_flags(which, jar_file, mf_file, directory: STRING): STRING is
      do
         Result := " "
         Result.append(jar_create_flag)
         Result.extend(' ')
         Result.append(jar_file)
         Result.extend(' ')
         Result.append(mf_file)
         Result.extend(' ')
         Result.append(jar_change_directory_flag)
         Result.extend(' ')
         Result.append(directory)
         Result.extend(' ')
         Result.append(jar_current_directory_flag)
      end
   
feature {}
   g_flag: STRING is "-g"

   ss_flag: STRING is "-ss"

   mx_flag: STRING is "-mx"

   ms_flag: STRING is "-ms"

   classpath_flag: STRING is "-classpath"

   jar_create_flag: STRING is "cfm"

   jar_change_directory_flag: STRING is "-C"

   jar_current_directory_flag: STRING is "."

end -- class JVM_TOOLS
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
-- Copyright(C) 2011-2012: Cyril ADRIAN, Paolo REDAELLI
--
-- http://liberty-eiffel.blogspot.com - https://github.com/LibertyEiffel/Liberty
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
