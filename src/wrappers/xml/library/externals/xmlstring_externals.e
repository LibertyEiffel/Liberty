-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class XMLSTRING_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	xml_utf8strsub (an_utf: POINTER; a_start: INTEGER_32; a_len: INTEGER_32): POINTER is
 		-- xmlUTF8Strsub (node at line 254)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlUTF8Strsub"
		}"
		end

	xml_utf8strndup (an_utf: POINTER; a_len: INTEGER_32): POINTER is
 		-- xmlUTF8Strndup (node at line 315)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlUTF8Strndup"
		}"
		end

	xml_utf8strloc (an_utf: POINTER; an_utfchar: POINTER): INTEGER_32 is
 		-- xmlUTF8Strloc (node at line 682)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlUTF8Strloc"
		}"
		end

	xml_strdup (a_cur: POINTER): POINTER is
 		-- xmlStrdup (node at line 1799)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlStrdup"
		}"
		end

	xml_str_equal (a_str1: POINTER; a_str2: POINTER): INTEGER_32 is
 		-- xmlStrEqual (node at line 1839)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlStrEqual"
		}"
		end

	xml_utf8strpos (an_utf: POINTER; a_pos: INTEGER_32): POINTER is
 		-- xmlUTF8Strpos (node at line 1933)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlUTF8Strpos"
		}"
		end

	xml_strncasecmp (a_str1: POINTER; a_str2: POINTER; a_len: INTEGER_32): INTEGER_32 is
 		-- xmlStrncasecmp (node at line 2102)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlStrncasecmp"
		}"
		end

	xml_utf8strlen (an_utf: POINTER): INTEGER_32 is
 		-- xmlUTF8Strlen (node at line 2170)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlUTF8Strlen"
		}"
		end

	xml_utf8strsize (an_utf: POINTER; a_len: INTEGER_32): INTEGER_32 is
 		-- xmlUTF8Strsize (node at line 2312)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlUTF8Strsize"
		}"
		end

	xml_strstr (a_str: POINTER; a_val: POINTER): POINTER is
 		-- xmlStrstr (node at line 2414)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlStrstr"
		}"
		end

	xml_strsub (a_str: POINTER; a_start: INTEGER_32; a_len: INTEGER_32): POINTER is
 		-- xmlStrsub (node at line 2440)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlStrsub"
		}"
		end

	xml_strlen (a_str: POINTER): INTEGER_32 is
 		-- xmlStrlen (node at line 2520)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlStrlen"
		}"
		end

	xml_strncat (a_cur: POINTER; an_add: POINTER; a_len: INTEGER_32): POINTER is
 		-- xmlStrncat (node at line 3668)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlStrncat"
		}"
		end

	xml_strcasecmp (a_str1: POINTER; a_str2: POINTER): INTEGER_32 is
 		-- xmlStrcasecmp (node at line 3712)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlStrcasecmp"
		}"
		end

	xml_get_utf8char (an_utf: POINTER; a_len: POINTER): INTEGER_32 is
 		-- xmlGetUTF8Char (node at line 3892)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlGetUTF8Char"
		}"
		end

	xml_strncmp (a_str1: POINTER; a_str2: POINTER; a_len: INTEGER_32): INTEGER_32 is
 		-- xmlStrncmp (node at line 3944)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlStrncmp"
		}"
		end

	xml_check_utf8 (an_utf: POINTER): INTEGER_32 is
 		-- xmlCheckUTF8 (node at line 3951)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlCheckUTF8"
		}"
		end

	xml_utf8charcmp (an_utf1: POINTER; an_utf2: POINTER): INTEGER_32 is
 		-- xmlUTF8Charcmp (node at line 4656)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlUTF8Charcmp"
		}"
		end

	xml_str_printf (a_buf: POINTER; a_len: INTEGER_32; a_msg: POINTER): INTEGER_32 is
 		-- xmlStrPrintf (variadic call)  (node at line 4804)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlStrPrintf"
		}"
		end

	xml_char_strdup (a_cur: POINTER): POINTER is
 		-- xmlCharStrdup (node at line 4966)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlCharStrdup"
		}"
		end

	xml_char_strndup (a_cur: POINTER; a_len: INTEGER_32): POINTER is
 		-- xmlCharStrndup (node at line 4973)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlCharStrndup"
		}"
		end

	xml_strchr (a_str: POINTER; a_val: CHARACTER): POINTER is
 		-- xmlStrchr (node at line 5064)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlStrchr"
		}"
		end

	xml_strcat (a_cur: POINTER; an_add: POINTER): POINTER is
 		-- xmlStrcat (node at line 5146)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlStrcat"
		}"
		end

	xml_str_qequal (a_pref: POINTER; a_name: POINTER; a_str: POINTER): INTEGER_32 is
 		-- xmlStrQEqual (node at line 5259)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlStrQEqual"
		}"
		end

	xml_strcmp (a_str1: POINTER; a_str2: POINTER): INTEGER_32 is
 		-- xmlStrcmp (node at line 5445)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlStrcmp"
		}"
		end

	xml_strndup (a_cur: POINTER; a_len: INTEGER_32): POINTER is
 		-- xmlStrndup (node at line 5457)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlStrndup"
		}"
		end

	xml_utf8size (an_utf: POINTER): INTEGER_32 is
 		-- xmlUTF8Size (node at line 5789)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlUTF8Size"
		}"
		end

	xml_strcasestr (a_str: POINTER; a_val: POINTER): POINTER is
 		-- xmlStrcasestr (node at line 5798)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlStrcasestr"
		}"
		end

	xml_str_vprintf (a_buf: POINTER; a_len: INTEGER_32; a_msg: POINTER; an_ap: POINTER): INTEGER_32 is
 		-- xmlStrVPrintf (node at line 5896)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlStrVPrintf"
		}"
		end

	xml_strncat_new (a_str1: POINTER; a_str2: POINTER; a_len: INTEGER_32): POINTER is
 		-- xmlStrncatNew (node at line 6042)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlStrncatNew"
		}"
		end


end -- class XMLSTRING_EXTERNALS
