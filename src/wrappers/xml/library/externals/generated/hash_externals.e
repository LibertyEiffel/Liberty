-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class HASH_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	xml_hash_add_entry (a_table: POINTER; a_name: POINTER; an_userdata: POINTER): INTEGER 

		-- function xmlHashAddEntry (in 119 at line /usr/include/libxml2/libxml/hash.h)
               -- xmlHashAddEntry
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlHashAddEntry"
               }"
               end

	xml_hash_add_entry2 (a_table: POINTER; a_name: POINTER; a_name2: POINTER; an_userdata: POINTER): INTEGER 

		-- function xmlHashAddEntry2 (in 128 at line /usr/include/libxml2/libxml/hash.h)
               -- xmlHashAddEntry2
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlHashAddEntry2"
               }"
               end

	xml_hash_add_entry3 (a_table: POINTER; a_name: POINTER; a_name2: POINTER; a_name3: POINTER; an_userdata: POINTER): INTEGER 

		-- function xmlHashAddEntry3 (in 139 at line /usr/include/libxml2/libxml/hash.h)
               -- xmlHashAddEntry3
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlHashAddEntry3"
               }"
               end

	xml_hash_copy (a_table: POINTER; a_f: POINTER): POINTER 

		-- function xmlHashCopy (in 204 at line /usr/include/libxml2/libxml/hash.h)
               -- xmlHashCopy
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlHashCopy"
               }"
               end

	xml_hash_create (a_size: INTEGER): POINTER 

		-- function xmlHashCreate (in 107 at line /usr/include/libxml2/libxml/hash.h)
               -- xmlHashCreate
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlHashCreate"
               }"
               end

	xml_hash_create_dict (a_size: INTEGER; a_dict: POINTER): POINTER 

		-- function xmlHashCreateDict (in 109 at line /usr/include/libxml2/libxml/hash.h)
               -- xmlHashCreateDict
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlHashCreateDict"
               }"
               end

	xml_hash_free (a_table: POINTER; a_f: POINTER) 

		-- function xmlHashFree (in 112 at line /usr/include/libxml2/libxml/hash.h)
               -- xmlHashFree
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlHashFree"
               }"
               end

	xml_hash_lookup (a_table: POINTER; a_name: POINTER): POINTER 

		-- function xmlHashLookup (in 170 at line /usr/include/libxml2/libxml/hash.h)
               -- xmlHashLookup
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlHashLookup"
               }"
               end

	xml_hash_lookup2 (a_table: POINTER; a_name: POINTER; a_name2: POINTER): POINTER 

		-- function xmlHashLookup2 (in 173 at line /usr/include/libxml2/libxml/hash.h)
               -- xmlHashLookup2
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlHashLookup2"
               }"
               end

	xml_hash_lookup3 (a_table: POINTER; a_name: POINTER; a_name2: POINTER; a_name3: POINTER): POINTER 

		-- function xmlHashLookup3 (in 177 at line /usr/include/libxml2/libxml/hash.h)
               -- xmlHashLookup3
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlHashLookup3"
               }"
               end

	xml_hash_qlookup (a_table: POINTER; a_name: POINTER; a_prefix: POINTER): POINTER 

		-- function xmlHashQLookup (in 182 at line /usr/include/libxml2/libxml/hash.h)
               -- xmlHashQLookup
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlHashQLookup"
               }"
               end

	xml_hash_qlookup2 (a_table: POINTER; a_name: POINTER; a_prefix: POINTER; a_name2: POINTER; a_prefix2: POINTER): POINTER 

		-- function xmlHashQLookup2 (in 186 at line /usr/include/libxml2/libxml/hash.h)
               -- xmlHashQLookup2
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlHashQLookup2"
               }"
               end

	xml_hash_qlookup3 (a_table: POINTER; a_name: POINTER; a_prefix: POINTER; a_name2: POINTER; a_prefix2: POINTER; a_name3: POINTER; a_prefix3: POINTER): POINTER 

		-- function xmlHashQLookup3 (in 192 at line /usr/include/libxml2/libxml/hash.h)
               -- xmlHashQLookup3
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlHashQLookup3"
               }"
               end

	xml_hash_remove_entry (a_table: POINTER; a_name: POINTER; a_f: POINTER): INTEGER 

		-- function xmlHashRemoveEntry (in 156 at line /usr/include/libxml2/libxml/hash.h)
               -- xmlHashRemoveEntry
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlHashRemoveEntry"
               }"
               end

	xml_hash_remove_entry2 (a_table: POINTER; a_name: POINTER; a_name2: POINTER; a_f: POINTER): INTEGER 

		-- function xmlHashRemoveEntry2 (in 159 at line /usr/include/libxml2/libxml/hash.h)
               -- xmlHashRemoveEntry2
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlHashRemoveEntry2"
               }"
               end

	xml_hash_remove_entry3 (a_table: POINTER; a_name: POINTER; a_name2: POINTER; a_name3: POINTER; a_f: POINTER): INTEGER 

		-- function xmlHashRemoveEntry3 (in 162 at line /usr/include/libxml2/libxml/hash.h)
               -- xmlHashRemoveEntry3
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlHashRemoveEntry3"
               }"
               end

	xml_hash_scan (a_table: POINTER; a_f: POINTER; a_data: POINTER) 

		-- function xmlHashScan (in 209 at line /usr/include/libxml2/libxml/hash.h)
               -- xmlHashScan
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlHashScan"
               }"
               end

	xml_hash_scan3 (a_table: POINTER; a_name: POINTER; a_name2: POINTER; a_name3: POINTER; a_f: POINTER; a_data: POINTER) 

		-- function xmlHashScan3 (in 213 at line /usr/include/libxml2/libxml/hash.h)
               -- xmlHashScan3
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlHashScan3"
               }"
               end

	xml_hash_scan_full (a_table: POINTER; a_f: POINTER; a_data: POINTER) 

		-- function xmlHashScanFull (in 220 at line /usr/include/libxml2/libxml/hash.h)
               -- xmlHashScanFull
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlHashScanFull"
               }"
               end

	xml_hash_scan_full3 (a_table: POINTER; a_name: POINTER; a_name2: POINTER; a_name3: POINTER; a_f: POINTER; a_data: POINTER) 

		-- function xmlHashScanFull3 (in 224 at line /usr/include/libxml2/libxml/hash.h)
               -- xmlHashScanFull3
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlHashScanFull3"
               }"
               end

	xml_hash_size (a_table: POINTER): INTEGER 

		-- function xmlHashSize (in 207 at line /usr/include/libxml2/libxml/hash.h)
               -- xmlHashSize
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlHashSize"
               }"
               end

	xml_hash_update_entry (a_table: POINTER; a_name: POINTER; an_userdata: POINTER; a_f: POINTER): INTEGER 

		-- function xmlHashUpdateEntry (in 123 at line /usr/include/libxml2/libxml/hash.h)
               -- xmlHashUpdateEntry
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlHashUpdateEntry"
               }"
               end

	xml_hash_update_entry2 (a_table: POINTER; a_name: POINTER; a_name2: POINTER; an_userdata: POINTER; a_f: POINTER): INTEGER 

		-- function xmlHashUpdateEntry2 (in 133 at line /usr/include/libxml2/libxml/hash.h)
               -- xmlHashUpdateEntry2
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlHashUpdateEntry2"
               }"
               end

	xml_hash_update_entry3 (a_table: POINTER; a_name: POINTER; a_name2: POINTER; a_name3: POINTER; an_userdata: POINTER; a_f: POINTER): INTEGER 

		-- function xmlHashUpdateEntry3 (in 145 at line /usr/include/libxml2/libxml/hash.h)
               -- xmlHashUpdateEntry3
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlHashUpdateEntry3"
               }"
               end


end -- class HASH_EXTERNALS
