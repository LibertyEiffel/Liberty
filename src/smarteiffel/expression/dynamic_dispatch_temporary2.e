-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class DYNAMIC_DISPATCH_TEMPORARY2
	--
	-- Following DYNAMIC_DISPATCH_TEMPORARY1 and DYNAMIC_DISPATCH_TEMPORARY1_ID, 
	-- DYNAMIC_DISPATCH_TEMPORARY2 is the 3rd and last wrapper to implement dynamic dispatch with an 
	-- `inspect' statement. A DYNAMIC_DISPATCH_TEMPORARY2 is used for example inside some `when' clause 
	-- of the `inspect' instruction which implements dynamic dispatch. Thus, for a 
	-- DYNAMIC_DISPATCH_TEMPORARY2, we are sure that the corresponding expression is never Void and has 
	-- only one and exactly one LIVE_TYPE. Keep in mind that the dispatch is done.
	--
	
inherit
	NON_WRITTEN_EXPRESSION

creation
	make

feature {ANY}
	dynamic_dispatch_temporary1: DYNAMIC_DISPATCH_TEMPORARY1
			-- The corresponding target which is not Void.
	
	live_type: LIVE_TYPE
			-- The unique `live_type' of the non-Void target.
	
	is_static: BOOLEAN is
		do
			Result := dynamic_dispatch_temporary1.is_static
		end
	
	is_writable: BOOLEAN is
		do
			Result := dynamic_dispatch_temporary1.is_writable
		end
	
	is_result: BOOLEAN is
		do
			Result := dynamic_dispatch_temporary1.is_result
		end
	
	start_position: POSITION is
		do
			Result := dynamic_dispatch_temporary1.start_position
		end
	
	non_void_no_dispatch_type (type: TYPE): TYPE is
		do
			Result := live_type.type
		end
	
	simplify (type: TYPE): EXPRESSION is
		do
			Result := Current
		end

	resolve_in (type: TYPE): TYPE is
		do
			Result := live_type.type
		end
	
	collect (type: TYPE): TYPE is
		do
			Result := resolve_in(type)
		end

	declaration_type: TYPE is
		do
			check
				False
				-- Because `Current' is created after `status.collecting_done', this information is 
				-- not available.
			end
		end
	
	safety_check (type: TYPE) is
		do
		end
	
	adapt_for (type: TYPE): like Current is
		do
			Result := Current
		end
	
	side_effect_free (type: TYPE): BOOLEAN is
		do
			Result := True
		end
	
	use_current (type: TYPE): BOOLEAN is
		do
		end
	
	mapping_c_target (type, target_formal_type: TYPE) is
		do
			check
				live_type.type = target_formal_type
			end
			if live_type.is_reference then
				cpp.pending_c_function_body.append(once "((T")
				live_type.id.append_in(cpp.pending_c_function_body)
				cpp.pending_c_function_body.append(once "*)")
				dynamic_dispatch_temporary1.compile_to_c(type)
				cpp.pending_c_function_body.extend(')')
			else
				dynamic_dispatch_temporary1.mapping_c_target(type, target_formal_type)
			end
		end

	mapping_c_arg (type: TYPE) is
		do
			dynamic_dispatch_temporary1.mapping_c_arg(type)
		end
	
	compile_to_c (type: TYPE) is
		do
			dynamic_dispatch_temporary1.compile_to_c(type)
		end
	
	accept (visitor: DYNAMIC_DISPATCH_TEMPORARY2_VISITOR) is
		do
			visitor.visit_dynamic_dispatch_temporary2(Current)
		end

	compile_to_jvm (type: TYPE) is
		do
			not_yet_implemented
		end
	
	compile_target_to_jvm (type: TYPE) is
		do
			not_yet_implemented
		end
	
	jvm_assign_creation (type: TYPE) is
		do
			not_yet_implemented
		end
	
	jvm_assign (type: TYPE) is
		do
			not_yet_implemented
		end
	
	jvm_branch_if_false (type: TYPE): INTEGER is
		do
			not_yet_implemented
		end
	
	jvm_branch_if_true (type: TYPE): INTEGER is
		do
			not_yet_implemented
		end
	
feature {CODE, EFFECTIVE_ARG_LIST}
	inline_dynamic_dispatch_ (code_accumulator: CODE_ACCUMULATOR; type: TYPE) is
		do
			code_accumulator.current_context.add_last(Current)
		end
	
feature {}
	make (t: like dynamic_dispatch_temporary1; c: like live_type) is
		require
			t /= Void
			c /= Void
		do
			dynamic_dispatch_temporary1 := t
			live_type := c
		ensure
			dynamic_dispatch_temporary1 = t
			live_type = c
		end

invariant
	dynamic_dispatch_temporary1 /= Void
	
	live_type /= Void
	
end -- DYNAMIC_DISPATCH_TEMPORARY2
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
