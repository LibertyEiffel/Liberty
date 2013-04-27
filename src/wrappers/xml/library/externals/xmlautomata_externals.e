-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class XMLAUTOMATA_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	xml_automata_compile (an_am: POINTER): POINTER is
 		-- xmlAutomataCompile
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlAutomataCompile"
		}"
		end

	xml_automata_get_init_state (an_am: POINTER): POINTER is
 		-- xmlAutomataGetInitState
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlAutomataGetInitState"
		}"
		end

	xml_automata_is_determinist (an_am: POINTER): INTEGER is
 		-- xmlAutomataIsDeterminist
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlAutomataIsDeterminist"
		}"
		end

	xml_automata_new_all_trans (an_am: POINTER; a_from_external: POINTER; a_to: POINTER; a_lax: INTEGER): POINTER is
 		-- xmlAutomataNewAllTrans
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlAutomataNewAllTrans"
		}"
		end

	xml_automata_new_count_trans (an_am: POINTER; a_from_external: POINTER; a_to: POINTER; a_token: POINTER; a_min: INTEGER; a_max: INTEGER; a_data: POINTER): POINTER is
 		-- xmlAutomataNewCountTrans
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlAutomataNewCountTrans"
		}"
		end

	xml_automata_new_count_trans2 (an_am: POINTER; a_from_external: POINTER; a_to: POINTER; a_token: POINTER; a_token2: POINTER; a_min: INTEGER; a_max: INTEGER; a_data: POINTER): POINTER is
 		-- xmlAutomataNewCountTrans2
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlAutomataNewCountTrans2"
		}"
		end

	xml_automata_new_counted_trans (an_am: POINTER; a_from_external: POINTER; a_to: POINTER; a_counter: INTEGER): POINTER is
 		-- xmlAutomataNewCountedTrans
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlAutomataNewCountedTrans"
		}"
		end

	xml_automata_new_counter (an_am: POINTER; a_min: INTEGER; a_max: INTEGER): INTEGER is
 		-- xmlAutomataNewCounter
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlAutomataNewCounter"
		}"
		end

	xml_automata_new_counter_trans (an_am: POINTER; a_from_external: POINTER; a_to: POINTER; a_counter: INTEGER): POINTER is
 		-- xmlAutomataNewCounterTrans
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlAutomataNewCounterTrans"
		}"
		end

	xml_automata_new_epsilon (an_am: POINTER; a_from_external: POINTER; a_to: POINTER): POINTER is
 		-- xmlAutomataNewEpsilon
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlAutomataNewEpsilon"
		}"
		end

	xml_automata_new_neg_trans (an_am: POINTER; a_from_external: POINTER; a_to: POINTER; a_token: POINTER; a_token2: POINTER; a_data: POINTER): POINTER is
 		-- xmlAutomataNewNegTrans
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlAutomataNewNegTrans"
		}"
		end

	xml_automata_new_once_trans (an_am: POINTER; a_from_external: POINTER; a_to: POINTER; a_token: POINTER; a_min: INTEGER; a_max: INTEGER; a_data: POINTER): POINTER is
 		-- xmlAutomataNewOnceTrans
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlAutomataNewOnceTrans"
		}"
		end

	xml_automata_new_once_trans2 (an_am: POINTER; a_from_external: POINTER; a_to: POINTER; a_token: POINTER; a_token2: POINTER; a_min: INTEGER; a_max: INTEGER; a_data: POINTER): POINTER is
 		-- xmlAutomataNewOnceTrans2
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlAutomataNewOnceTrans2"
		}"
		end

	xml_automata_new_state (an_am: POINTER): POINTER is
 		-- xmlAutomataNewState
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlAutomataNewState"
		}"
		end

	xml_automata_new_transition (an_am: POINTER; a_from_external: POINTER; a_to: POINTER; a_token: POINTER; a_data: POINTER): POINTER is
 		-- xmlAutomataNewTransition
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlAutomataNewTransition"
		}"
		end

	xml_automata_new_transition2 (an_am: POINTER; a_from_external: POINTER; a_to: POINTER; a_token: POINTER; a_token2: POINTER; a_data: POINTER): POINTER is
 		-- xmlAutomataNewTransition2
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlAutomataNewTransition2"
		}"
		end

	xml_automata_set_final_state (an_am: POINTER; a_state: POINTER): INTEGER is
 		-- xmlAutomataSetFinalState
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlAutomataSetFinalState"
		}"
		end

	xml_free_automata (an_am: POINTER) is
 		-- xmlFreeAutomata
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlFreeAutomata"
		}"
		end

	xml_new_automata: POINTER is
 		-- xmlNewAutomata
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlNewAutomata()"
		}"
		end


end -- class XMLAUTOMATA_EXTERNALS
