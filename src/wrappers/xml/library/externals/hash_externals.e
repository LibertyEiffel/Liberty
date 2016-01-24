-- This file has been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.
deferred class HASH_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	xml_hash_add_entry (a_table: POINTER; a_name: POINTER; an_userdata: POINTER): INTEGER 
               -- xmlHashAddEntry
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlHashAddEntry"
               }"
               end

	xml_hash_add_entry2 (a_table: POINTER; a_name: POINTER; a_name2: POINTER; an_userdata: POINTER): INTEGER 
               -- xmlHashAddEntry2
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlHashAddEntry2"
               }"
               end

	xml_hash_add_entry3 (a_table: POINTER; a_name: POINTER; a_name2: POINTER; a_name3: POINTER; an_userdata: POINTER): INTEGER 
               -- xmlHashAddEntry3
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlHashAddEntry3"
               }"
               end

	xml_hash_copy (a_table: POINTER; a_f: POINTER): POINTER 
               -- xmlHashCopy
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlHashCopy"
               }"
               end

	xml_hash_create (a_size: INTEGER): POINTER 
               -- xmlHashCreate
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlHashCreate"
               }"
               end

	xml_hash_create_dict (a_size: INTEGER; a_dict: POINTER): POINTER 
               -- xmlHashCreateDict
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlHashCreateDict"
               }"
               end

	xml_hash_free (a_table: POINTER; a_f: POINTER) 
               -- xmlHashFree
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlHashFree"
               }"
               end

	xml_hash_lookup (a_table: POINTER; a_name: POINTER): POINTER 
               -- xmlHashLookup
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlHashLookup"
               }"
               end

	xml_hash_lookup2 (a_table: POINTER; a_name: POINTER; a_name2: POINTER): POINTER 
               -- xmlHashLookup2
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlHashLookup2"
               }"
               end

	xml_hash_lookup3 (a_table: POINTER; a_name: POINTER; a_name2: POINTER; a_name3: POINTER): POINTER 
               -- xmlHashLookup3
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlHashLookup3"
               }"
               end

	xml_hash_qlookup (a_table: POINTER; a_name: POINTER; a_prefix: POINTER): POINTER 
               -- xmlHashQLookup
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlHashQLookup"
               }"
               end

	xml_hash_qlookup2 (a_table: POINTER; a_name: POINTER; a_prefix: POINTER; a_name2: POINTER; a_prefix2: POINTER): POINTER 
               -- xmlHashQLookup2
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlHashQLookup2"
               }"
               end

	xml_hash_qlookup3 (a_table: POINTER; a_name: POINTER; a_prefix: POINTER; a_name2: POINTER; a_prefix2: POINTER; a_name3: POINTER; a_prefix3: POINTER): POINTER 
               -- xmlHashQLookup3
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlHashQLookup3"
               }"
               end

	xml_hash_remove_entry (a_table: POINTER; a_name: POINTER; a_f: POINTER): INTEGER 
               -- xmlHashRemoveEntry
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlHashRemoveEntry"
               }"
               end

	xml_hash_remove_entry2 (a_table: POINTER; a_name: POINTER; a_name2: POINTER; a_f: POINTER): INTEGER 
               -- xmlHashRemoveEntry2
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlHashRemoveEntry2"
               }"
               end

	xml_hash_remove_entry3 (a_table: POINTER; a_name: POINTER; a_name2: POINTER; a_name3: POINTER; a_f: POINTER): INTEGER 
               -- xmlHashRemoveEntry3
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlHashRemoveEntry3"
               }"
               end

	xml_hash_scan (a_table: POINTER; a_f: POINTER; a_data: POINTER) 
               -- xmlHashScan
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlHashScan"
               }"
               end

	xml_hash_scan3 (a_table: POINTER; a_name: POINTER; a_name2: POINTER; a_name3: POINTER; a_f: POINTER; a_data: POINTER) 
               -- xmlHashScan3
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlHashScan3"
               }"
               end

	xml_hash_scan_full (a_table: POINTER; a_f: POINTER; a_data: POINTER) 
               -- xmlHashScanFull
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlHashScanFull"
               }"
               end

	xml_hash_scan_full3 (a_table: POINTER; a_name: POINTER; a_name2: POINTER; a_name3: POINTER; a_f: POINTER; a_data: POINTER) 
               -- xmlHashScanFull3
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlHashScanFull3"
               }"
               end

	xml_hash_size (a_table: POINTER): INTEGER 
               -- xmlHashSize
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlHashSize"
               }"
               end

	xml_hash_update_entry (a_table: POINTER; a_name: POINTER; an_userdata: POINTER; a_f: POINTER): INTEGER 
               -- xmlHashUpdateEntry
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlHashUpdateEntry"
               }"
               end

	xml_hash_update_entry2 (a_table: POINTER; a_name: POINTER; a_name2: POINTER; an_userdata: POINTER; a_f: POINTER): INTEGER 
               -- xmlHashUpdateEntry2
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlHashUpdateEntry2"
               }"
               end

	xml_hash_update_entry3 (a_table: POINTER; a_name: POINTER; a_name2: POINTER; a_name3: POINTER; an_userdata: POINTER; a_f: POINTER): INTEGER 
               -- xmlHashUpdateEntry3
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlHashUpdateEntry3"
               }"
               end


end -- class HASH_EXTERNALS
