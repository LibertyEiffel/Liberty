-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
deferred class MEMORY_HANDLER

   --|**** TODO: renamings

feature {C_PRETTY_PRINTER} -- C code phases
   pre_customize_c_runtime is
         -- Code customization: #defines
      deferred
      end

   customize_c_runtime is
         -- Code customization
      deferred
      end

   define1 is
         -- GC definitions code (just after customize)
      deferred
      end

   define2 is
         -- Most GC code is generated here
      deferred
      end

   pre_initialize_runtime is
         -- Code for runtime customization before calling "initialize_eiffel_runtime". Used to set the stack
         -- bottom.
      deferred
      end

   initialize_runtime is
         -- Code for runtime startup in the "initialize_eiffel_runtime" C function
      deferred
      end

   post_initialize_runtime is
         -- Code for runtime customization in the "initialize_eiffel_runtime" C function, after precomputable
         -- objects (manifest strings, precomputable once objects) have been created
      deferred
      end

   gc_info_before_exit is
         -- Code for runtime cleanup in the "atexit" C function
      deferred
      end

   pre_cecil_define is
         -- Code for cecil calls
      deferred
      end

   cecil_define is
         -- Code for cecil calls
      deferred
      end

   post_cecil_define is
         -- Code for cecil calls
      deferred
      end

feature {C_PRETTY_PRINTER} -- specific objects
   manifest_string_in (c_code: STRING; string_at_run_time: BOOLEAN) is
         -- Code to create a new Manifest STRING and assign it in the "s" local C variable.
      deferred
      end

   native9_in (c_code: STRING; string_at_run_time: BOOLEAN) is
         -- Code to create a new native array as expression
      deferred
      end

feature {C_PRETTY_PRINTER} -- memory-specific handling aspects
   add_extra_collectors is
         -- Add memory-related extra LIVE_TYPE collectors
      deferred
      end

   need_size_table: BOOLEAN
      deferred
      end

feature {C_COMPILATION_MIXIN} -- allocators
   malloc (lt: LIVE_TYPE) is
         -- Code to create an object of the given live type
      deferred
      end

   calloc (lt: LIVE_TYPE; n: PROCEDURE[TUPLE]) is
         -- Code to create many objects of the given live type
         -- `n' represents the code that gives the number of objects to create, and will be called at the
         -- right time.
      deferred
      end

feature {C_COMPILATION_MIXIN} -- GC switches (see MEMORY)
   gc_disable is
         -- Code to disable garbage collection
      deferred
      end

   gc_enable is
         -- Code to enable garbage collection
      deferred
      end

   gc_collect is
         -- Code to start a full GC collect
      deferred
      end

   gc_is_collecting is
         -- Code to check if the gc is collecting as an expression
      deferred
      end

   gc_counter is
         -- Code that gives the number of GC cycles as an expression
      deferred
      end

   gc_allocated_bytes is
         -- Code that gives the currently allocated bytes as an expression
      deferred
      end

feature {C_COMPILATION_MIXIN} -- agents
   assign_agent_data (mold_id: STRING) is
         -- At agent creation time: specific memory handling data may be assigned
         -- See also `define_agent_data' for the struct fields to define
      require
         mold_id /= Void
      deferred
      end

   generate_agent_data (mold_id: STRING) is
         -- Code (usually functions) that handle agents memory, assigned above, called below
      require
         mold_id /= Void
      deferred
      end

   define_agent_data (mold_id: STRING) is
         -- At agent structure definition: specific memory handles may be added to the struct
      require
         mold_id /= Void
      deferred
      end

   define_agent_data_is_equal is
         -- See C_LIVE_TYPE_COMPILER.is_equal_agent_creation_define_type_for
      deferred
      end

   define_agent_data_0 is
         -- See C_PRETTY_PRINTER.customize_agent_pool_runtime_1
      deferred
      end

feature {ANY}
   allocation_of (internal_c_local: INTERNAL_C_LOCAL; created_live_type: LIVE_TYPE) is
      require
         cpp.pending_c_function
         created_live_type.at_run_time
         created_live_type.is_reference
      deferred
      end

end -- class MEMORY_HANDLER
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
