-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class ENTITIES_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	xml_get_doc_entity (a_doc: POINTER; a_name: POINTER): POINTER is
 		-- xmlGetDocEntity (node at line 92)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlGetDocEntity"
		}"
		end

	xml_initialize_predefined_entities is
 		-- xmlInitializePredefinedEntities (node at line 184)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlInitializePredefinedEntities()"
		}"
		end

	xml_dump_entity_decl (a_buf: POINTER; an_ent: POINTER) is
 		-- xmlDumpEntityDecl (node at line 348)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlDumpEntityDecl"
		}"
		end

	xml_add_dtd_entity (a_doc: POINTER; a_name: POINTER; a_type: INTEGER_32; an_external_id: POINTER; a_system_id: POINTER; a_content: POINTER): POINTER is
 		-- xmlAddDtdEntity (node at line 1598)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlAddDtdEntity"
		}"
		end

	xml_create_entities_table: POINTER is
 		-- xmlCreateEntitiesTable (node at line 1672)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlCreateEntitiesTable()"
		}"
		end

	xml_new_entity (a_doc: POINTER; a_name: POINTER; a_type: INTEGER_32; an_external_id: POINTER; a_system_id: POINTER; a_content: POINTER): POINTER is
 		-- xmlNewEntity (node at line 1975)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlNewEntity"
		}"
		end

	xml_encode_entities_reentrant (a_doc: POINTER; an_input: POINTER): POINTER is
 		-- xmlEncodeEntitiesReentrant (node at line 2048)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlEncodeEntitiesReentrant"
		}"
		end

	xml_dump_entities_table (a_buf: POINTER; a_table: POINTER) is
 		-- xmlDumpEntitiesTable (node at line 2903)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlDumpEntitiesTable"
		}"
		end

	xml_get_parameter_entity (a_doc: POINTER; a_name: POINTER): POINTER is
 		-- xmlGetParameterEntity (node at line 3585)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlGetParameterEntity"
		}"
		end

	xml_free_entities_table (a_table: POINTER) is
 		-- xmlFreeEntitiesTable (node at line 3800)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlFreeEntitiesTable"
		}"
		end

	xml_add_doc_entity (a_doc: POINTER; a_name: POINTER; a_type: INTEGER_32; an_external_id: POINTER; a_system_id: POINTER; a_content: POINTER): POINTER is
 		-- xmlAddDocEntity (node at line 3956)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlAddDocEntity"
		}"
		end

	xml_get_dtd_entity (a_doc: POINTER; a_name: POINTER): POINTER is
 		-- xmlGetDtdEntity (node at line 4078)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlGetDtdEntity"
		}"
		end

	xml_encode_special_chars (a_doc: POINTER; an_input: POINTER): POINTER is
 		-- xmlEncodeSpecialChars (node at line 4204)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlEncodeSpecialChars"
		}"
		end

	xml_copy_entities_table (a_table: POINTER): POINTER is
 		-- xmlCopyEntitiesTable (node at line 4374)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlCopyEntitiesTable"
		}"
		end

	xml_encode_entities (a_doc: POINTER; an_input: POINTER): POINTER is
 		-- xmlEncodeEntities (node at line 4634)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlEncodeEntities"
		}"
		end

	xml_cleanup_predefined_entities is
 		-- xmlCleanupPredefinedEntities (node at line 5212)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlCleanupPredefinedEntities()"
		}"
		end

	xml_get_predefined_entity (a_name: POINTER): POINTER is
 		-- xmlGetPredefinedEntity (node at line 5437)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlGetPredefinedEntity"
		}"
		end


end -- class ENTITIES_EXTERNALS
