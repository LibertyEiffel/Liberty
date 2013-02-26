-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class HASH_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	xml_hash_scan_full (a_table: POINTER; a_f: POINTER; a_data: POINTER) is
 		-- xmlHashScanFull (node at line 242)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlHashScanFull"
		}"
		end

	xml_hash_add_entry2 (a_table: POINTER; a_name: POINTER; a_name2: POINTER; an_userdata: POINTER): INTEGER_32 is
 		-- xmlHashAddEntry2 (node at line 676)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlHashAddEntry2"
		}"
		end

	xml_hash_remove_entry3 (a_table: POINTER; a_name: POINTER; a_name2: POINTER; a_name3: POINTER; a_f: POINTER): INTEGER_32 is
 		-- xmlHashRemoveEntry3 (node at line 1902)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlHashRemoveEntry3"
		}"
		end

	xml_hash_remove_entry (a_table: POINTER; a_name: POINTER; a_f: POINTER): INTEGER_32 is
 		-- xmlHashRemoveEntry (node at line 2034)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlHashRemoveEntry"
		}"
		end

	xml_hash_lookup (a_table: POINTER; a_name: POINTER): POINTER is
 		-- xmlHashLookup (node at line 2070)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlHashLookup"
		}"
		end

	xml_hash_qlookup (a_table: POINTER; a_name: POINTER; a_prefix: POINTER): POINTER is
 		-- xmlHashQLookup (node at line 2093)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlHashQLookup"
		}"
		end

	xml_hash_free (a_table: POINTER; a_f: POINTER) is
 		-- xmlHashFree (node at line 2267)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlHashFree"
		}"
		end

	xml_hash_scan_full3 (a_table: POINTER; a_name: POINTER; a_name2: POINTER; a_name3: POINTER; a_f: POINTER; a_data: POINTER) is
 		-- xmlHashScanFull3 (node at line 2418)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlHashScanFull3"
		}"
		end

	xml_hash_update_entry2 (a_table: POINTER; a_name: POINTER; a_name2: POINTER; an_userdata: POINTER; a_f: POINTER): INTEGER_32 is
 		-- xmlHashUpdateEntry2 (node at line 2471)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlHashUpdateEntry2"
		}"
		end

	xml_hash_update_entry3 (a_table: POINTER; a_name: POINTER; a_name2: POINTER; a_name3: POINTER; an_userdata: POINTER; a_f: POINTER): INTEGER_32 is
 		-- xmlHashUpdateEntry3 (node at line 2478)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlHashUpdateEntry3"
		}"
		end

	xml_hash_update_entry (a_table: POINTER; a_name: POINTER; an_userdata: POINTER; a_f: POINTER): INTEGER_32 is
 		-- xmlHashUpdateEntry (node at line 2570)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlHashUpdateEntry"
		}"
		end

	xml_hash_scan3 (a_table: POINTER; a_name: POINTER; a_name2: POINTER; a_name3: POINTER; a_f: POINTER; a_data: POINTER) is
 		-- xmlHashScan3 (node at line 2930)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlHashScan3"
		}"
		end

	xml_hash_copy (a_table: POINTER; a_f: POINTER): POINTER is
 		-- xmlHashCopy (node at line 3079)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlHashCopy"
		}"
		end

	xml_hash_lookup2 (a_table: POINTER; a_name: POINTER; a_name2: POINTER): POINTER is
 		-- xmlHashLookup2 (node at line 3338)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlHashLookup2"
		}"
		end

	xml_hash_lookup3 (a_table: POINTER; a_name: POINTER; a_name2: POINTER; a_name3: POINTER): POINTER is
 		-- xmlHashLookup3 (node at line 3343)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlHashLookup3"
		}"
		end

	xml_hash_create_dict (a_size: INTEGER_32; a_dict: POINTER): POINTER is
 		-- xmlHashCreateDict (node at line 3678)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlHashCreateDict"
		}"
		end

	xml_hash_size (a_table: POINTER): INTEGER_32 is
 		-- xmlHashSize (node at line 3716)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlHashSize"
		}"
		end

	xml_hash_remove_entry2 (a_table: POINTER; a_name: POINTER; a_name2: POINTER; a_f: POINTER): INTEGER_32 is
 		-- xmlHashRemoveEntry2 (node at line 3864)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlHashRemoveEntry2"
		}"
		end

	xml_hash_add_entry3 (a_table: POINTER; a_name: POINTER; a_name2: POINTER; a_name3: POINTER; an_userdata: POINTER): INTEGER_32 is
 		-- xmlHashAddEntry3 (node at line 4177)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlHashAddEntry3"
		}"
		end

	xml_hash_qlookup2 (a_table: POINTER; a_name: POINTER; a_prefix: POINTER; a_name2: POINTER; a_prefix2: POINTER): POINTER is
 		-- xmlHashQLookup2 (node at line 4399)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlHashQLookup2"
		}"
		end

	xml_hash_qlookup3 (a_table: POINTER; a_name: POINTER; a_prefix: POINTER; a_name2: POINTER; a_prefix2: POINTER; a_name3: POINTER; a_prefix3: POINTER): POINTER is
 		-- xmlHashQLookup3 (node at line 4406)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlHashQLookup3"
		}"
		end

	xml_hash_scan (a_table: POINTER; a_f: POINTER; a_data: POINTER) is
 		-- xmlHashScan (node at line 4580)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlHashScan"
		}"
		end

	xml_hash_create (a_size: INTEGER_32): POINTER is
 		-- xmlHashCreate (node at line 5151)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlHashCreate"
		}"
		end

	xml_hash_add_entry (a_table: POINTER; a_name: POINTER; an_userdata: POINTER): INTEGER_32 is
 		-- xmlHashAddEntry (node at line 5423)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlHashAddEntry"
		}"
		end


end -- class HASH_EXTERNALS
