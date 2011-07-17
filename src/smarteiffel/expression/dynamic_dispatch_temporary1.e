-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class DYNAMIC_DISPATCH_TEMPORARY1
	--
	-- Simple wrapper or add automatically an extra internal local in order to implement dynamic 
	-- dispatch with an `inspect' statement. DYNAMIC_DISPATCH_TEMPORARY1 is used outside of the 
	-- `inspect' instruction to wrap the target.
	--
	-- See also DYNAMIC_DISPATCH_TEMPORARY1_ID and DYNAMIC_DISPATCH_TEMPORARY2.
	--
	
inherit
	NON_WRITTEN_EXPRESSION

creation {FEATURE_CALL}
	make

feature {ANY}
	start_position: POSITION is
		do
			Result := target.start_position
		end
	
	is_static: BOOLEAN is
		do
			Result := target.is_static
		end
	
	is_writable: BOOLEAN is
		do
			Result := target.is_writable
		end
	
	is_result: BOOLEAN is
		do
			Result := target.is_result
		end
	
   non_void_no_dispatch_type (type: TYPE): TYPE is
		do
			check
				False
			end
		end
	
	side_effect_free (type: TYPE): BOOLEAN is
		do
			Result := True
		end

	resolve_in (type: TYPE): TYPE is
		do
			Result := target_type
		ensure then
			Result.can_be_assigned_to(target.resolve_in(type))
		end
	
	collect (type: TYPE): TYPE is
		do
			Result := target.collect(type)
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
			target.safety_check(type)
		end
	
	simplify (type: TYPE): EXPRESSION is
		do
			Result := Current
		end

	adapt_for (type: TYPE): like Current is
		local
			t: like target
		do
			t := target.adapt_for(type)
			if t = target then
				Result := Current
			else
				Result := twin
				Result.set_target(t)
			end
		end

	use_current (type: TYPE): BOOLEAN is
		do
			Result := target.use_current(type)
		end

	mapping_c_target (type, target_formal_type: TYPE) is
		do
			not_yet_implemented
			check
				False -- By very nature, not used in target position.
			end
		end
	
	mapping_c_arg (type: TYPE) is
		do
			compile_to_c(type)
		end
	
	compile_to_c (type: TYPE) is
		do
			if target.is_stored_in_some_local_variable or else target.side_effect_free(type) then
				-- No need to use an extra INTERNAL_C_LOCAL:
				target.compile_to_c(type)
			else
				if internal_c_local = Void	or else pending_c_function_counter /= cpp.pending_c_function_counter then
					internal_c_local := cpp.pending_c_function_lock_local(resolve_in(type), once "ddt1")
					pending_c_function_counter := cpp.pending_c_function_counter
					cpp.pending_c_function_body.append(once "(")
					internal_c_local.append_in(cpp.pending_c_function_body)
					cpp.pending_c_function_body.append(once "=(")
					target.compile_to_c(type)
					cpp.pending_c_function_body.append(once "))")
				else
					internal_c_local.append_in(cpp.pending_c_function_body)
				end
			end
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
	
	accept (visitor: DYNAMIC_DISPATCH_TEMPORARY1_VISITOR) is
		do
			visitor.visit_dynamic_dispatch_temporary1(Current)
		end

feature {CODE, EFFECTIVE_ARG_LIST}
	inline_dynamic_dispatch_ (code_accumulator: CODE_ACCUMULATOR; type: TYPE) is
		do
			code_accumulator.current_context.add_last(Current)
		end
	
feature {INSPECT_STATEMENT}
	unlock is
		do
			if internal_c_local /= Void then
				internal_c_local.unlock
				internal_c_local := Void
			end
		end
	
feature {DYNAMIC_DISPATCH_TEMPORARY1}
	set_target (t: like target) is
		require
			t /= Void
		do
			target := t
		ensure
			target = t
		end

feature {}
	target: EXPRESSION

	target_type: TYPE
	
	pending_c_function_counter: INTEGER
	
	internal_c_local: INTERNAL_C_LOCAL
	
	make (t: like target; tt: like target_type) is
		require
			t /= Void
			tt /= Void
		do
			target := t
			target_type := tt
		ensure
			target = t
			target_type = tt
		end

invariant
	target /= Void
	
	target_type /= Void
	
end -- DYNAMIC_DISPATCH_TEMPORARY1
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
