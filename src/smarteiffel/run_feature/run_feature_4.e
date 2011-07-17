-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class RUN_FEATURE_4

inherit
	RUN_FEATURE
		redefine base_feature
		end

creation {E_FUNCTION}
	for

feature {ANY}
	base_feature: E_FUNCTION

	arguments: FORMAL_ARG_LIST

	result_type: TYPE_MARK

	require_assertion: REQUIRE_ASSERTION

	local_vars: LOCAL_VAR_LIST

	routine_body: INSTRUCTION

	rescue_compound: INSTRUCTION

	ensure_assertion: ENSURE_ASSERTION

	is_deferred: BOOLEAN is False

	is_once_procedure: BOOLEAN is False

	is_once_function: BOOLEAN is False

	side_effect_free: BOOLEAN is
		do
			if side_effect_free_flag then
				Result := False
			else
				side_effect_free_flag := True
				Result := (routine_body = Void or else routine_body.side_effect_free(type_of_current)) and then (local_vars = Void or else local_vars.side_effect_free(type_of_current)) and then (rescue_compound = Void or else rescue_compound.side_effect_free(type_of_current)) and then (require_assertion = Void or else require_assertion.side_effect_free(type_of_current)) and then (ensure_assertion = Void or else ensure_assertion.side_effect_free(type_of_current))
				side_effect_free_flag := False
			end
		end

	mapping_c is
		do
			default_mapping_function
		end

	c_define is
		do
			if use_current then
				cpp.incr_function_count
			else
				cpp.incr_real_function_count
			end
			cpp.prepare_c_function
			define_c_signature
			c_define_opening
			if routine_body /= Void then
				routine_body.compile_to_c(type_of_current)
			end
			c_define_closing
			cpp.pending_c_function_body.append(once "return R;%N")
			cpp.dump_pending_c_function(True)
		end

feature {}
	do_adapt is
		local
			class_text: CLASS_TEXT
		do
			class_text := type_of_current.class_text
			-- Adapt the arguments --|*** CAD: need?
			arguments := base_feature.arguments
			if arguments /= Void then
				arguments := arguments.adapt_for(type_of_current)
			end
			-- Adapt the local variables --|*** CAD: need?
			local_vars := base_feature.local_vars
			if local_vars /= Void then
				local_vars := local_vars.adapt_for(type_of_current)
			end
			-- Adapt the routine body:
			routine_body := base_feature.routine_body
			if routine_body /= Void then
				routine_body := routine_body.adapt_for(type_of_current)
			end
			-- Adapt the assertions:
			if class_text.require_check and then base_feature.require_assertion /= Void then
				require_assertion := base_feature.require_assertion.adapt_for(type_of_current)
			end
			if class_text.ensure_check and then base_feature.ensure_assertion /= Void then
				smart_eiffel.old_list_stack_push
				ensure_assertion := base_feature.ensure_assertion.adapt_for(type_of_current)
				old_list := smart_eiffel.old_list_stack_pop
			end
			-- Adapt the rescue clause:
			rescue_compound := base_feature.rescue_compound_in(type_of_current)
			if rescue_compound /= Void then
				exceptions_handler.set_used
				rescue_compound := rescue_compound.adapt_for(type_of_current)
			end
		end

	set_result_type is
		do
			-- Adapt the result type:
			result_type := base_feature.result_type.resolve_in(type_of_current).canonical_type_mark --|*** CAD: need of resolve_in?
		ensure
			result_type /= Void
		end

feature {}
	is_empty_or_null_body: BOOLEAN is
			-- The body is empty or has only unreacheable code.
		local
			rb: like routine_body; rt: TYPE_MARK
		do
			rb := routine_body
			if rb = Void or else rb.side_effect_free(type_of_current) then
				if local_vars = Void then
					rt := result_type
					if rt.is_reference then
						Result := True
					end
				end
			end
		end

	compute_use_current is
		do
			if type_of_current.is_reference then
				if ace.no_check then
					use_current_state := True_state
				else
					std_compute_use_current
				end
			else
				std_compute_use_current
			end
		end

feature {LIVE_TYPE}
	jvm_field_or_method is
		do
			jvm.add_method(Current)
		end

feature {ANY}
	mapping_jvm is
		do
			routine_mapping_jvm
		end

feature {JVM}
	jvm_define is
		do
			method_info_start
			jvm_define_opening
			jvm_increment_invariant_flag
			if routine_body /= Void then
				routine_body.compile_to_jvm(type_of_current)
			end
			jvm_decrement_invariant_flag
			jvm_define_closing
			result_type.jvm_push_local(base_feature.jvm_result_offset(type_of_current))
			result_type.jvm_return_code
			method_info.finish
		end

feature {}
	update_tmp_jvm_descriptor is
		do
			routine_update_tmp_jvm_descriptor
		end

	side_effect_free_flag: BOOLEAN

end -- class RUN_FEATURE_4
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
