-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class STATUS
   --
   -- Management of the SmartEiffel's status: the different phases of the compilation process.
   --

insert
   GLOBALS
      undefine is_equal
      end
   SINGLETON

create {SMART_EIFFEL}
   make

feature {} -- Visitable attributes:
   phase: INTEGER
         -- The compilation process reaches different phases which are described below.

   safety_check_state: INTEGER
         -- Either `safety_check_not_done', `safety_check_failed', `safety_check_ok'

   specializing_type_memory: like specializing_type

   phase_stack: like internal_phase_stack
         -- Stacked phases. Changing this array will not change the internal saved phases (hence, don't do
         -- it, it's useless).
         -- The top of the stack is the last element. RETURNS A ONCE OBJECT.
      do
         Result := visitable_phase_stack
         Result.from_collection(internal_phase_stack)
      end

feature {}
   -- Numbering of following constants is important, see documentation below:
   getting_started:            INTEGER 1
   specializing_one_type:      INTEGER 2
   specializing_and_checking:  INTEGER 3
   collecting_features:        INTEGER 4
   simplifying:                INTEGER 5
   inlining_dynamic_dispatch:  INTEGER 6
   adapting_features:          INTEGER 7
   safety_checking:            INTEGER 8
   generating:                 INTEGER 9
   done:                       INTEGER 10
   safety_check_not_done:      INTEGER 11
   safety_check_ok:            INTEGER 12
   safety_check_failed:        INTEGER 13

feature {}
   -- The known phases (in somewhat chronological order)
   --
   -- `getting_started'
   -- The root class, and the classes it directly uses are being loaded.
   --
   -- `specializing_one_type'
   -- Particular phase when one type is being created (and specialized). This include `specialize_in' and
   -- `specialize_thru' but not `specialize_and_check'.
   --
   -- `specializing_and_checking'
   -- Particular phase when `specialize_and_check' is being performed on one type. After this phase, `resolve_in'
   -- can be used on the `type'.
   --
   -- `collecting_features'
   -- The collect process has just started. During this process, all call sites are considered again in
   -- order to know more about effective definitions of deferred features or redefinitions. During this
   -- phase, because new code may be considered, we are not aware of all types which may be created at
   -- run-time.
   -- During this phase, each type and each feature have their own agenda.
   -- Type agenda:
   --     1. create it by importing all its known features. That's what we call "specialization". See the
   --     `specializing' phase.
   --     2. collecting
   -- Feature agenda:
   --     1. get specialized via the type agenda
   --     2. register all the call sites, creation sites and so on which denote live types; at this time,
   --     more types and more features will be considered.
   -- At the end of this phase, all the live types must be known. Then, and only then, does the compiler
   -- start the next phase: adaptation and code generation.
   --
   -- `simplifying`
   -- Trying to simplify the code, in boost more
   --
   -- `inlining_dynamic_dispatch'
   -- All feature calls are replaced by monomorphic calls and dynamic
   -- dispatch is implemented with ordinary inspect instruction.
   --
   -- `adapting_features'
   -- The adapt process has just started. The goal of this step is to create the RUN_FEATUREs with
   -- tailored semantic trees (adapted against each possible type of `Current').
   --
   -- `safety_checking'
   -- The whole system analysis for the final safety check has just started but is not yet finished.
   --
   -- `generating'
   -- The system is generating the code.
   --
   -- `done'
   -- The system has finished the compilation
   --
   -- `safety_check_not_done'
   -- The safety check test has not been performed (because of the compilation mode for example, or
   -- not yet); so, we do not know if the system is safe or not.
   --
   -- `safety_check_ok'
   -- The whole system analysis is finished and the system is type safe!  Great!
   --
   -- `safety_check_failed'
   -- The system is _not_ type safe (i.e. some dangerous covariant redefinitions are used and the user
   -- has got warnings).
   --


feature {} -- State change support
   visitable_phase_stack: FAST_ARRAY[INTEGER]
         -- Used by visitors getting the `phase_stack': security trick not to let the visitor modify the stack.
         --|*** Not used internally: will not be compiled in the normal tools
      once
         create Result.with_capacity(2)
      end

   internal_phase_stack: FAST_ARRAY[INTEGER]
         -- Keeps the previous phases in a stack. Required by the special "specializing" phases.
      once
         create Result.with_capacity(2)
      end

   set_phase (p: like phase)
      require
         p > getting_started and then p <= done
         internal_phase_stack.is_empty
      do
         set_phase_(p)
      end

   push_phase (p: like phase)
      require
         p > getting_started and then p <= done
      do
         internal_phase_stack.add_last(phase)
         set_phase_(p)
      end

   pop_phase
      require
         not internal_phase_stack.is_empty
      do
         set_phase_(internal_phase_stack.last)
         internal_phase_stack.remove_last
      end

feature {}
   set_phase_ (p: like phase)
      require
         p > 0
      local
         end_time: MICROSECOND_TIME; time: INTEGER_64
      do
         end_time.update
         time := times.item(phase)
         times.force(time + (end_time.timestamp - phase_time.timestamp), phase)
         phase := p
         phase_time.update
      end

feature {FEATURE_ACCUMULATOR}
   start_specializing (t: TYPE)
      require
         is_collecting
      do
         specializing_type_memory := t
         push_phase(specializing_one_type)
      ensure
         specializing_type = t
         is_specializing
      end

   end_specializing (t: TYPE)
      require
         is_specializing
         specializing_type = t
      do
         pop_phase
      ensure
         is_collecting
      end

   start_specializing_and_checking (t: TYPE)
      require
         is_specializing
         specializing_type = t
      do
         push_phase(specializing_and_checking)
      ensure
         is_specializing_and_checking
      end

   end_specializing_and_checking (t: TYPE)
      require
         is_specializing_and_checking
         specializing_type = t
      do
         pop_phase
      ensure
         is_specializing
      end

feature {CODE_PRINTER}
   set_generating
      require
         is_safety_checking
      do
         set_phase(generating)
      ensure
         is_generating
      end

feature {SMART_EIFFEL}
   set_collecting
      require
         is_getting_started or else collecting_done and not is_adapting
      do
         set_phase(collecting_features)
         collecting_done := False
      ensure
         is_collecting
      end

   set_collecting_done
      require
         not collecting_done
      do
         collecting_done := True
      ensure
         collecting_done
      end

   start_simplifying
      require
         collecting_done and not is_adapting
         not is_inlining_dynamic_dispatch
      do
         push_phase(simplifying)
      ensure
         is_simplifying
      end

   end_simplifying
      require
         is_simplifying
      do
         pop_phase
      ensure
         not is_simplifying
         collecting_done and not is_adapting
      end

   set_inlining_dynamic_dispatch
      require
         collecting_done and not is_adapting
         not is_simplifying
      do
         set_phase(inlining_dynamic_dispatch)
         inlining_dynamic_dispatch_done := False
      ensure
         is_inlining_dynamic_dispatch
      end

   set_inlining_dynamic_dispatch_done
      require
         not inlining_dynamic_dispatch_done
      do
         inlining_dynamic_dispatch_done := True
      ensure
         inlining_dynamic_dispatch_done
      end

   set_adapting
      require
         is_collecting
      do
         set_phase(adapting_features)
      ensure
         is_adapting
      end

   set_safety_checking
      require
         is_adapting
      do
         set_phase(safety_checking)
      ensure
         is_safety_checking
      end

   set_safety_check_ok
      require
         is_safety_checking
      do
         check
            safety_check_state = safety_check_not_done
         end
         safety_check_state := safety_check_ok
      end

   set_safety_check_failed
      require
         is_safety_checking
      do
         check
            safety_check_state = safety_check_not_done
         end
         safety_check_state := safety_check_failed
      end

feature {SMART_EIFFEL}
   echo_information
      do
         echo_phase_information(once "getting started", getting_started)
         echo_phase_information(once "specializing one type", specializing_one_type)
         echo_phase_information(once "specializing and checking", specializing_and_checking)
         echo_phase_information(once "collecting features", collecting_features)
         echo_phase_information(once "inlining dynamic dispatch", inlining_dynamic_dispatch)
         echo_phase_information(once "simplifying", simplifying)
         echo_phase_information(once "adapting features", adapting_features)
         echo_phase_information(once "safety checking", safety_checking)
         echo_phase_information(once "generating", generating)
         inspect
            safety_check_state
         when safety_check_failed then
            error_handler.append(once "The system is not type safe (read previous warnings carefully).")
            error_handler.print_as_warning
         when safety_check_not_done then
            echo.put_string(once "Type-system safety check not performed in this mode%N(use the -safety_check flag).%N")
         when safety_check_ok then
            echo.put_string(once "The system is type safe.%N")
         end
      end

feature {}
   echo_phase_information (phase_tag: STRING; p: INTEGER)
      local
         time: INTEGER_64
      do
         time := times.item(p)
         if time > 0 then
            echo.put_string(once "Total time spent ")
            echo.put_string(phase_tag)
            echo.put_string(once ": ")
            echo.put_time(time)
            echo.put_new_line
         end
      end

feature {ANY} -- State checking
   specializing_type: TYPE
      require
         is_specializing or else is_specializing_and_checking
      do
         Result := specializing_type_memory
      end

   is_getting_started: BOOLEAN
         -- True if the system has just started gathering the first types from the given root
      do
         Result := phase = getting_started
      end

   is_analyzing: BOOLEAN
         -- True if the system is being analyzed (making live types, run features and so on)
      do
         Result := phase <= adapting_features
      end

   is_collecting: BOOLEAN
         -- True if the system is being collected
      do
         Result := phase < adapting_features
      end

   is_simplifying: BOOLEAN
      do
         Result := phase = simplifying
      end

   is_inlining_dynamic_dispatch: BOOLEAN
      do
         Result := phase = inlining_dynamic_dispatch
      end

   is_adapting: BOOLEAN
         -- True if the system is being tailored (before code production)
      do
         Result := phase = adapting_features
      end

   is_specializing: BOOLEAN
         -- True if the system is creating one new type
      do
         Result := phase = specializing_one_type
      end

   is_specializing_and_checking: BOOLEAN
         -- True if the system is calling `specialize_and_check' on the newly created type
      do
         Result := phase = specializing_and_checking
      end

   is_safety_checking: BOOLEAN
         -- True if the system is currently being safety-checked
      do
         Result := phase = safety_checking
      end

   collecting_done: BOOLEAN
         -- Indicates that we have performed all `collect' cycles (i.e. we have gathered a super-set
         -- of the live code).

   inlining_dynamic_dispatch_done: BOOLEAN
         -- Indicates that all calls are now monomorphic (i.e. dynamic dispatch is implemented with
         -- inspect instructions).

   safety_check_done: BOOLEAN
      do
         Result := safety_check_state /= safety_check_not_done
      end

   is_generating: BOOLEAN
         -- True if the system is generating the code.
      do
         Result := phase = generating
      end

   is_done: BOOLEAN
         -- True if the system has finished the compilation.
      do
         Result := phase = done
      end

feature {} -- The constructor
   make
      do
         create times.make(13)
         set_phase_(getting_started)
         safety_check_state := safety_check_not_done
      end

   phase_time: MICROSECOND_TIME
   times: FAST_ARRAY[INTEGER_64]

invariant
   valid_phase: phase.in_range(getting_started, done)
   valid_safety_check_state: safety_check_state.in_range(safety_check_not_done, safety_check_failed)
   valid_state_stack: (not is_specializing and then not is_specializing_and_checking) = internal_phase_stack.is_empty

   times.count >= phase

end -- class STATUS
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
