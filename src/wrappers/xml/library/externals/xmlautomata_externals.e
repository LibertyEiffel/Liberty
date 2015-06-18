-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.
deferred class XMLAUTOMATA_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	xml_automata_compile (an_am: POINTER): POINTER 
               -- xmlAutomataCompile
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	xml_automata_get_init_state (an_am: POINTER): POINTER 
               -- xmlAutomataGetInitState
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	xml_automata_is_determinist (an_am: POINTER): INTEGER 
               -- xmlAutomataIsDeterminist
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	xml_automata_new_all_trans (an_am: POINTER; a_from_external: POINTER; a_to: POINTER; a_lax: INTEGER): POINTER 
               -- xmlAutomataNewAllTrans
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	xml_automata_new_count_trans (an_am: POINTER; a_from_external: POINTER; a_to: POINTER; a_token: POINTER; a_min: INTEGER; a_max: INTEGER; a_data: POINTER): POINTER 
               -- xmlAutomataNewCountTrans
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	xml_automata_new_count_trans2 (an_am: POINTER; a_from_external: POINTER; a_to: POINTER; a_token: POINTER; a_token2: POINTER; a_min: INTEGER; a_max: INTEGER; a_data: POINTER): POINTER 
               -- xmlAutomataNewCountTrans2
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	xml_automata_new_counted_trans (an_am: POINTER; a_from_external: POINTER; a_to: POINTER; a_counter: INTEGER): POINTER 
               -- xmlAutomataNewCountedTrans
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	xml_automata_new_counter (an_am: POINTER; a_min: INTEGER; a_max: INTEGER): INTEGER 
               -- xmlAutomataNewCounter
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	xml_automata_new_counter_trans (an_am: POINTER; a_from_external: POINTER; a_to: POINTER; a_counter: INTEGER): POINTER 
               -- xmlAutomataNewCounterTrans
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	xml_automata_new_epsilon (an_am: POINTER; a_from_external: POINTER; a_to: POINTER): POINTER 
               -- xmlAutomataNewEpsilon
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	xml_automata_new_neg_trans (an_am: POINTER; a_from_external: POINTER; a_to: POINTER; a_token: POINTER; a_token2: POINTER; a_data: POINTER): POINTER 
               -- xmlAutomataNewNegTrans
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	xml_automata_new_once_trans (an_am: POINTER; a_from_external: POINTER; a_to: POINTER; a_token: POINTER; a_min: INTEGER; a_max: INTEGER; a_data: POINTER): POINTER 
               -- xmlAutomataNewOnceTrans
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	xml_automata_new_once_trans2 (an_am: POINTER; a_from_external: POINTER; a_to: POINTER; a_token: POINTER; a_token2: POINTER; a_min: INTEGER; a_max: INTEGER; a_data: POINTER): POINTER 
               -- xmlAutomataNewOnceTrans2
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	xml_automata_new_state (an_am: POINTER): POINTER 
               -- xmlAutomataNewState
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	xml_automata_new_transition (an_am: POINTER; a_from_external: POINTER; a_to: POINTER; a_token: POINTER; a_data: POINTER): POINTER 
               -- xmlAutomataNewTransition
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	xml_automata_new_transition2 (an_am: POINTER; a_from_external: POINTER; a_to: POINTER; a_token: POINTER; a_token2: POINTER; a_data: POINTER): POINTER 
               -- xmlAutomataNewTransition2
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	xml_automata_set_final_state (an_am: POINTER; a_state: POINTER): INTEGER 
               -- xmlAutomataSetFinalState
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	xml_free_automata (an_am: POINTER) 
               -- xmlFreeAutomata
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	xml_new_automata (): POINTER 
               -- xmlNewAutomata
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end


end -- class XMLAUTOMATA_EXTERNALS
