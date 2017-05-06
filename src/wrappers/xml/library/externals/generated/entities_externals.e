-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class ENTITIES_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	xml_add_doc_entity (a_doc: POINTER; a_name: POINTER; a_type: INTEGER; an_external_id: POINTER; a_system_id: POINTER; a_content: POINTER): POINTER 

		-- function xmlAddDocEntity (in `/usr/include/libxml2/libxml/entities.h')
               -- xmlAddDocEntity
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlAddDocEntity"
               }"
               end

	xml_add_dtd_entity (a_doc: POINTER; a_name: POINTER; a_type: INTEGER; an_external_id: POINTER; a_system_id: POINTER; a_content: POINTER): POINTER 

		-- function xmlAddDtdEntity (in `/usr/include/libxml2/libxml/entities.h')
               -- xmlAddDtdEntity
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlAddDtdEntity"
               }"
               end

	xml_cleanup_predefined_entities 

		-- function xmlCleanupPredefinedEntities (in `/usr/include/libxml2/libxml/entities.h')
               -- xmlCleanupPredefinedEntities
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlCleanupPredefinedEntities()"
               }"
               end

	xml_copy_entities_table (a_table: POINTER): POINTER 

		-- function xmlCopyEntitiesTable (in `/usr/include/libxml2/libxml/entities.h')
               -- xmlCopyEntitiesTable
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlCopyEntitiesTable"
               }"
               end

	xml_create_entities_table: POINTER 

		-- function xmlCreateEntitiesTable (in `/usr/include/libxml2/libxml/entities.h')
               -- xmlCreateEntitiesTable
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlCreateEntitiesTable()"
               }"
               end

	xml_dump_entities_table (a_buf: POINTER; a_table: POINTER) 

		-- function xmlDumpEntitiesTable (in `/usr/include/libxml2/libxml/entities.h')
               -- xmlDumpEntitiesTable
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlDumpEntitiesTable"
               }"
               end

	xml_dump_entity_decl (a_buf: POINTER; an_ent: POINTER) 

		-- function xmlDumpEntityDecl (in `/usr/include/libxml2/libxml/entities.h')
               -- xmlDumpEntityDecl
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlDumpEntityDecl"
               }"
               end

	xml_encode_entities (a_doc: POINTER; an_input: POINTER): POINTER 

		-- function xmlEncodeEntities (in `/usr/include/libxml2/libxml/entities.h')
               -- xmlEncodeEntities
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlEncodeEntities"
               }"
               end

	xml_encode_entities_reentrant (a_doc: POINTER; an_input: POINTER): POINTER 

		-- function xmlEncodeEntitiesReentrant (in `/usr/include/libxml2/libxml/entities.h')
               -- xmlEncodeEntitiesReentrant
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlEncodeEntitiesReentrant"
               }"
               end

	xml_encode_special_chars (a_doc: POINTER; an_input: POINTER): POINTER 

		-- function xmlEncodeSpecialChars (in `/usr/include/libxml2/libxml/entities.h')
               -- xmlEncodeSpecialChars
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlEncodeSpecialChars"
               }"
               end

	xml_free_entities_table (a_table: POINTER) 

		-- function xmlFreeEntitiesTable (in `/usr/include/libxml2/libxml/entities.h')
               -- xmlFreeEntitiesTable
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlFreeEntitiesTable"
               }"
               end

	xml_get_doc_entity (a_doc: POINTER; a_name: POINTER): POINTER 

		-- function xmlGetDocEntity (in `/usr/include/libxml2/libxml/entities.h')
               -- xmlGetDocEntity
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlGetDocEntity"
               }"
               end

	xml_get_dtd_entity (a_doc: POINTER; a_name: POINTER): POINTER 

		-- function xmlGetDtdEntity (in `/usr/include/libxml2/libxml/entities.h')
               -- xmlGetDtdEntity
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlGetDtdEntity"
               }"
               end

	xml_get_parameter_entity (a_doc: POINTER; a_name: POINTER): POINTER 

		-- function xmlGetParameterEntity (in `/usr/include/libxml2/libxml/entities.h')
               -- xmlGetParameterEntity
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlGetParameterEntity"
               }"
               end

	xml_get_predefined_entity (a_name: POINTER): POINTER 

		-- function xmlGetPredefinedEntity (in `/usr/include/libxml2/libxml/entities.h')
               -- xmlGetPredefinedEntity
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlGetPredefinedEntity"
               }"
               end

	xml_initialize_predefined_entities 

		-- function xmlInitializePredefinedEntities (in `/usr/include/libxml2/libxml/entities.h')
               -- xmlInitializePredefinedEntities
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlInitializePredefinedEntities()"
               }"
               end

	xml_new_entity (a_doc: POINTER; a_name: POINTER; a_type: INTEGER; an_external_id: POINTER; a_system_id: POINTER; a_content: POINTER): POINTER 

		-- function xmlNewEntity (in `/usr/include/libxml2/libxml/entities.h')
               -- xmlNewEntity
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlNewEntity"
               }"
               end


end -- class ENTITIES_EXTERNALS
