-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class HASH_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	xml_hash_add_entry (a_table: POINTER; a_name: POINTER; an_userdata: POINTER): INTEGER is
 		-- xmlHashAddEntry
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlHashAddEntry"
		}"
		end

	xml_hash_add_entry2 (a_table: POINTER; a_name: POINTER; a_name2: POINTER; an_userdata: POINTER): INTEGER is
 		-- xmlHashAddEntry2
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlHashAddEntry2"
		}"
		end

	xml_hash_add_entry3 (a_table: POINTER; a_name: POINTER; a_name2: POINTER; a_name3: POINTER; an_userdata: POINTER): INTEGER is
 		-- xmlHashAddEntry3
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlHashAddEntry3"
		}"
		end

	xml_hash_copy (a_table: POINTER; a_f: POINTER): POINTER is
 		-- xmlHashCopy
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlHashCopy"
		}"
		end

	xml_hash_create (a_size: INTEGER): POINTER is
 		-- xmlHashCreate
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlHashCreate"
		}"
		end

	xml_hash_create_dict (a_size: INTEGER; a_dict: POINTER): POINTER is
 		-- xmlHashCreateDict
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlHashCreateDict"
		}"
		end

	xml_hash_free (a_table: POINTER; a_f: POINTER) is
 		-- xmlHashFree
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlHashFree"
		}"
		end

	xml_hash_lookup (a_table: POINTER; a_name: POINTER): POINTER is
 		-- xmlHashLookup
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlHashLookup"
		}"
		end

	xml_hash_lookup2 (a_table: POINTER; a_name: POINTER; a_name2: POINTER): POINTER is
 		-- xmlHashLookup2
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlHashLookup2"
		}"
		end

	xml_hash_lookup3 (a_table: POINTER; a_name: POINTER; a_name2: POINTER; a_name3: POINTER): POINTER is
 		-- xmlHashLookup3
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlHashLookup3"
		}"
		end

	xml_hash_qlookup (a_table: POINTER; a_name: POINTER; a_prefix: POINTER): POINTER is
 		-- xmlHashQLookup
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlHashQLookup"
		}"
		end

	xml_hash_qlookup2 (a_table: POINTER; a_name: POINTER; a_prefix: POINTER; a_name2: POINTER; a_prefix2: POINTER): POINTER is
 		-- xmlHashQLookup2
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlHashQLookup2"
		}"
		end

	xml_hash_qlookup3 (a_table: POINTER; a_name: POINTER; a_prefix: POINTER; a_name2: POINTER; a_prefix2: POINTER; a_name3: POINTER; a_prefix3: POINTER): POINTER is
 		-- xmlHashQLookup3
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlHashQLookup3"
		}"
		end

	xml_hash_remove_entry (a_table: POINTER; a_name: POINTER; a_f: POINTER): INTEGER is
 		-- xmlHashRemoveEntry
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlHashRemoveEntry"
		}"
		end

	xml_hash_remove_entry2 (a_table: POINTER; a_name: POINTER; a_name2: POINTER; a_f: POINTER): INTEGER is
 		-- xmlHashRemoveEntry2
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlHashRemoveEntry2"
		}"
		end

	xml_hash_remove_entry3 (a_table: POINTER; a_name: POINTER; a_name2: POINTER; a_name3: POINTER; a_f: POINTER): INTEGER is
 		-- xmlHashRemoveEntry3
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlHashRemoveEntry3"
		}"
		end

	xml_hash_scan (a_table: POINTER; a_f: POINTER; a_data: POINTER) is
 		-- xmlHashScan
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlHashScan"
		}"
		end

	xml_hash_scan3 (a_table: POINTER; a_name: POINTER; a_name2: POINTER; a_name3: POINTER; a_f: POINTER; a_data: POINTER) is
 		-- xmlHashScan3
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlHashScan3"
		}"
		end

	xml_hash_scan_full (a_table: POINTER; a_f: POINTER; a_data: POINTER) is
 		-- xmlHashScanFull
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlHashScanFull"
		}"
		end

	xml_hash_scan_full3 (a_table: POINTER; a_name: POINTER; a_name2: POINTER; a_name3: POINTER; a_f: POINTER; a_data: POINTER) is
 		-- xmlHashScanFull3
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlHashScanFull3"
		}"
		end

	xml_hash_size (a_table: POINTER): INTEGER is
 		-- xmlHashSize
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlHashSize"
		}"
		end

	xml_hash_update_entry (a_table: POINTER; a_name: POINTER; an_userdata: POINTER; a_f: POINTER): INTEGER is
 		-- xmlHashUpdateEntry
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlHashUpdateEntry"
		}"
		end

	xml_hash_update_entry2 (a_table: POINTER; a_name: POINTER; a_name2: POINTER; an_userdata: POINTER; a_f: POINTER): INTEGER is
 		-- xmlHashUpdateEntry2
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlHashUpdateEntry2"
		}"
		end

	xml_hash_update_entry3 (a_table: POINTER; a_name: POINTER; a_name2: POINTER; a_name3: POINTER; an_userdata: POINTER; a_f: POINTER): INTEGER is
 		-- xmlHashUpdateEntry3
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlHashUpdateEntry3"
		}"
		end


end -- class HASH_EXTERNALS
