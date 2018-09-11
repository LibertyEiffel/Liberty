-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class XMLAUTOMATA_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	xml_automata_compile (an_am: POINTER): POINTER 

		-- function xmlAutomataCompile (in `/usr/include/libxml2/libxml/xmlautomata.h')
               -- xmlAutomataCompile
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlAutomataCompile"
               }"
               end

	xml_automata_get_init_state (an_am: POINTER): POINTER 

		-- function xmlAutomataGetInitState (in `/usr/include/libxml2/libxml/xmlautomata.h')
               -- xmlAutomataGetInitState
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlAutomataGetInitState"
               }"
               end

	xml_automata_is_determinist (an_am: POINTER): INTEGER 

		-- function xmlAutomataIsDeterminist (in `/usr/include/libxml2/libxml/xmlautomata.h')
               -- xmlAutomataIsDeterminist
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlAutomataIsDeterminist"
               }"
               end

	xml_automata_new_all_trans (an_am: POINTER; a_from_external: POINTER; a_to: POINTER; a_lax: INTEGER): POINTER 

		-- function xmlAutomataNewAllTrans (in `/usr/include/libxml2/libxml/xmlautomata.h')
               -- xmlAutomataNewAllTrans
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlAutomataNewAllTrans"
               }"
               end

	xml_automata_new_count_trans (an_am: POINTER; a_from_external: POINTER; a_to: POINTER; a_token: POINTER; a_min: INTEGER; a_max: INTEGER; a_data: POINTER): POINTER 

		-- function xmlAutomataNewCountTrans (in `/usr/include/libxml2/libxml/xmlautomata.h')
               -- xmlAutomataNewCountTrans
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlAutomataNewCountTrans"
               }"
               end

	xml_automata_new_count_trans2 (an_am: POINTER; a_from_external: POINTER; a_to: POINTER; a_token: POINTER; a_token2: POINTER; a_min: INTEGER; a_max: INTEGER; a_data: POINTER): POINTER 

		-- function xmlAutomataNewCountTrans2 (in `/usr/include/libxml2/libxml/xmlautomata.h')
               -- xmlAutomataNewCountTrans2
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlAutomataNewCountTrans2"
               }"
               end

	xml_automata_new_counted_trans (an_am: POINTER; a_from_external: POINTER; a_to: POINTER; a_counter: INTEGER): POINTER 

		-- function xmlAutomataNewCountedTrans (in `/usr/include/libxml2/libxml/xmlautomata.h')
               -- xmlAutomataNewCountedTrans
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlAutomataNewCountedTrans"
               }"
               end

	xml_automata_new_counter (an_am: POINTER; a_min: INTEGER; a_max: INTEGER): INTEGER 

		-- function xmlAutomataNewCounter (in `/usr/include/libxml2/libxml/xmlautomata.h')
               -- xmlAutomataNewCounter
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlAutomataNewCounter"
               }"
               end

	xml_automata_new_counter_trans (an_am: POINTER; a_from_external: POINTER; a_to: POINTER; a_counter: INTEGER): POINTER 

		-- function xmlAutomataNewCounterTrans (in `/usr/include/libxml2/libxml/xmlautomata.h')
               -- xmlAutomataNewCounterTrans
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlAutomataNewCounterTrans"
               }"
               end

	xml_automata_new_epsilon (an_am: POINTER; a_from_external: POINTER; a_to: POINTER): POINTER 

		-- function xmlAutomataNewEpsilon (in `/usr/include/libxml2/libxml/xmlautomata.h')
               -- xmlAutomataNewEpsilon
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlAutomataNewEpsilon"
               }"
               end

	xml_automata_new_neg_trans (an_am: POINTER; a_from_external: POINTER; a_to: POINTER; a_token: POINTER; a_token2: POINTER; a_data: POINTER): POINTER 

		-- function xmlAutomataNewNegTrans (in `/usr/include/libxml2/libxml/xmlautomata.h')
               -- xmlAutomataNewNegTrans
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlAutomataNewNegTrans"
               }"
               end

	xml_automata_new_once_trans (an_am: POINTER; a_from_external: POINTER; a_to: POINTER; a_token: POINTER; a_min: INTEGER; a_max: INTEGER; a_data: POINTER): POINTER 

		-- function xmlAutomataNewOnceTrans (in `/usr/include/libxml2/libxml/xmlautomata.h')
               -- xmlAutomataNewOnceTrans
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlAutomataNewOnceTrans"
               }"
               end

	xml_automata_new_once_trans2 (an_am: POINTER; a_from_external: POINTER; a_to: POINTER; a_token: POINTER; a_token2: POINTER; a_min: INTEGER; a_max: INTEGER; a_data: POINTER): POINTER 

		-- function xmlAutomataNewOnceTrans2 (in `/usr/include/libxml2/libxml/xmlautomata.h')
               -- xmlAutomataNewOnceTrans2
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlAutomataNewOnceTrans2"
               }"
               end

	xml_automata_new_state (an_am: POINTER): POINTER 

		-- function xmlAutomataNewState (in `/usr/include/libxml2/libxml/xmlautomata.h')
               -- xmlAutomataNewState
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlAutomataNewState"
               }"
               end

	xml_automata_new_transition (an_am: POINTER; a_from_external: POINTER; a_to: POINTER; a_token: POINTER; a_data: POINTER): POINTER 

		-- function xmlAutomataNewTransition (in `/usr/include/libxml2/libxml/xmlautomata.h')
               -- xmlAutomataNewTransition
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlAutomataNewTransition"
               }"
               end

	xml_automata_new_transition2 (an_am: POINTER; a_from_external: POINTER; a_to: POINTER; a_token: POINTER; a_token2: POINTER; a_data: POINTER): POINTER 

		-- function xmlAutomataNewTransition2 (in `/usr/include/libxml2/libxml/xmlautomata.h')
               -- xmlAutomataNewTransition2
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlAutomataNewTransition2"
               }"
               end

	xml_automata_set_final_state (an_am: POINTER; a_state: POINTER): INTEGER 

		-- function xmlAutomataSetFinalState (in `/usr/include/libxml2/libxml/xmlautomata.h')
               -- xmlAutomataSetFinalState
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlAutomataSetFinalState"
               }"
               end

	xml_free_automata (an_am: POINTER) 

		-- function xmlFreeAutomata (in `/usr/include/libxml2/libxml/xmlautomata.h')
               -- xmlFreeAutomata
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlFreeAutomata"
               }"
               end

	xml_new_automata: POINTER 

		-- function xmlNewAutomata (in `/usr/include/libxml2/libxml/xmlautomata.h')
               -- xmlNewAutomata
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlNewAutomata()"
               }"
               end


end -- class XMLAUTOMATA_EXTERNALS
