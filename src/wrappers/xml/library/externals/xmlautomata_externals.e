-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class XMLAUTOMATA_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	xml_automata_new_transition2 (an_am: POINTER; a_from_external: POINTER; a_to: POINTER; a_token: POINTER; a_token2: POINTER; a_data: POINTER): POINTER is
 		-- xmlAutomataNewTransition2 (node at line 5)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlAutomataNewTransition2"
		}"
		end

	xml_new_automata: POINTER is
 		-- xmlNewAutomata (node at line 61)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlNewAutomata()"
		}"
		end

	xml_automata_new_state (an_am: POINTER): POINTER is
 		-- xmlAutomataNewState (node at line 342)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlAutomataNewState"
		}"
		end

	xml_automata_new_count_trans (an_am: POINTER; a_from_external: POINTER; a_to: POINTER; a_token: POINTER; a_min: INTEGER_32; a_max: INTEGER_32; a_data: POINTER): POINTER is
 		-- xmlAutomataNewCountTrans (node at line 431)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlAutomataNewCountTrans"
		}"
		end

	xml_automata_compile (an_am: POINTER): POINTER is
 		-- xmlAutomataCompile (node at line 1721)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlAutomataCompile"
		}"
		end

	xml_automata_new_neg_trans (an_am: POINTER; a_from_external: POINTER; a_to: POINTER; a_token: POINTER; a_token2: POINTER; a_data: POINTER): POINTER is
 		-- xmlAutomataNewNegTrans (node at line 2745)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlAutomataNewNegTrans"
		}"
		end

	xml_automata_new_counted_trans (an_am: POINTER; a_from_external: POINTER; a_to: POINTER; a_counter: INTEGER_32): POINTER is
 		-- xmlAutomataNewCountedTrans (node at line 2791)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlAutomataNewCountedTrans"
		}"
		end

	xml_automata_new_counter_trans (an_am: POINTER; a_from_external: POINTER; a_to: POINTER; a_counter: INTEGER_32): POINTER is
 		-- xmlAutomataNewCounterTrans (node at line 3184)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlAutomataNewCounterTrans"
		}"
		end

	xml_automata_new_once_trans2 (an_am: POINTER; a_from_external: POINTER; a_to: POINTER; a_token: POINTER; a_token2: POINTER; a_min: INTEGER_32; a_max: INTEGER_32; a_data: POINTER): POINTER is
 		-- xmlAutomataNewOnceTrans2 (node at line 3219)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlAutomataNewOnceTrans2"
		}"
		end

	xml_automata_get_init_state (an_am: POINTER): POINTER is
 		-- xmlAutomataGetInitState (node at line 3450)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlAutomataGetInitState"
		}"
		end

	xml_automata_new_count_trans2 (an_am: POINTER; a_from_external: POINTER; a_to: POINTER; a_token: POINTER; a_token2: POINTER; a_min: INTEGER_32; a_max: INTEGER_32; a_data: POINTER): POINTER is
 		-- xmlAutomataNewCountTrans2 (node at line 3737)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlAutomataNewCountTrans2"
		}"
		end

	xml_automata_new_all_trans (an_am: POINTER; a_from_external: POINTER; a_to: POINTER; a_lax: INTEGER_32): POINTER is
 		-- xmlAutomataNewAllTrans (node at line 3768)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlAutomataNewAllTrans"
		}"
		end

	xml_automata_new_epsilon (an_am: POINTER; a_from_external: POINTER; a_to: POINTER): POINTER is
 		-- xmlAutomataNewEpsilon (node at line 4449)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlAutomataNewEpsilon"
		}"
		end

	xml_automata_new_transition (an_am: POINTER; a_from_external: POINTER; a_to: POINTER; a_token: POINTER; a_data: POINTER): POINTER is
 		-- xmlAutomataNewTransition (node at line 4646)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlAutomataNewTransition"
		}"
		end

	xml_free_automata (an_am: POINTER) is
 		-- xmlFreeAutomata (node at line 4712)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlFreeAutomata"
		}"
		end

	xml_automata_set_final_state (an_am: POINTER; a_state: POINTER): INTEGER_32 is
 		-- xmlAutomataSetFinalState (node at line 4800)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlAutomataSetFinalState"
		}"
		end

	xml_automata_is_determinist (an_am: POINTER): INTEGER_32 is
 		-- xmlAutomataIsDeterminist (node at line 5072)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlAutomataIsDeterminist"
		}"
		end

	xml_automata_new_counter (an_am: POINTER; a_min: INTEGER_32; a_max: INTEGER_32): INTEGER_32 is
 		-- xmlAutomataNewCounter (node at line 5388)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlAutomataNewCounter"
		}"
		end

	xml_automata_new_once_trans (an_am: POINTER; a_from_external: POINTER; a_to: POINTER; a_token: POINTER; a_min: INTEGER_32; a_max: INTEGER_32; a_data: POINTER): POINTER is
 		-- xmlAutomataNewOnceTrans (node at line 5887)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlAutomataNewOnceTrans"
		}"
		end


end -- class XMLAUTOMATA_EXTERNALS
