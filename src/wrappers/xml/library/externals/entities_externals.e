-- This file has been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.
deferred class ENTITIES_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	xml_add_doc_entity (a_doc: POINTER; a_name: POINTER; a_type: INTEGER; an_external_id: POINTER; a_system_id: POINTER; a_content: POINTER): POINTER 
               -- xmlAddDocEntity
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlAddDocEntity"
               }"
               end

	xml_add_dtd_entity (a_doc: POINTER; a_name: POINTER; a_type: INTEGER; an_external_id: POINTER; a_system_id: POINTER; a_content: POINTER): POINTER 
               -- xmlAddDtdEntity
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlAddDtdEntity"
               }"
               end

	xml_cleanup_predefined_entities 
               -- xmlCleanupPredefinedEntities
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlCleanupPredefinedEntities"
               }"
               end

	xml_copy_entities_table (a_table: POINTER): POINTER 
               -- xmlCopyEntitiesTable
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlCopyEntitiesTable"
               }"
               end

	xml_create_entities_table: POINTER 
               -- xmlCreateEntitiesTable
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlCreateEntitiesTable"
               }"
               end

	xml_dump_entities_table (a_buf: POINTER; a_table: POINTER) 
               -- xmlDumpEntitiesTable
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlDumpEntitiesTable"
               }"
               end

	xml_dump_entity_decl (a_buf: POINTER; an_ent: POINTER) 
               -- xmlDumpEntityDecl
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlDumpEntityDecl"
               }"
               end

	xml_encode_entities (a_doc: POINTER; an_input: POINTER): POINTER 
               -- xmlEncodeEntities
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlEncodeEntities"
               }"
               end

	xml_encode_entities_reentrant (a_doc: POINTER; an_input: POINTER): POINTER 
               -- xmlEncodeEntitiesReentrant
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlEncodeEntitiesReentrant"
               }"
               end

	xml_encode_special_chars (a_doc: POINTER; an_input: POINTER): POINTER 
               -- xmlEncodeSpecialChars
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlEncodeSpecialChars"
               }"
               end

	xml_free_entities_table (a_table: POINTER) 
               -- xmlFreeEntitiesTable
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlFreeEntitiesTable"
               }"
               end

	xml_get_doc_entity (a_doc: POINTER; a_name: POINTER): POINTER 
               -- xmlGetDocEntity
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlGetDocEntity"
               }"
               end

	xml_get_dtd_entity (a_doc: POINTER; a_name: POINTER): POINTER 
               -- xmlGetDtdEntity
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlGetDtdEntity"
               }"
               end

	xml_get_parameter_entity (a_doc: POINTER; a_name: POINTER): POINTER 
               -- xmlGetParameterEntity
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlGetParameterEntity"
               }"
               end

	xml_get_predefined_entity (a_name: POINTER): POINTER 
               -- xmlGetPredefinedEntity
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlGetPredefinedEntity"
               }"
               end

	xml_initialize_predefined_entities 
               -- xmlInitializePredefinedEntities
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlInitializePredefinedEntities"
               }"
               end

	xml_new_entity (a_doc: POINTER; a_name: POINTER; a_type: INTEGER; an_external_id: POINTER; a_system_id: POINTER; a_content: POINTER): POINTER 
               -- xmlNewEntity
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlNewEntity"
               }"
               end


end -- class ENTITIES_EXTERNALS
