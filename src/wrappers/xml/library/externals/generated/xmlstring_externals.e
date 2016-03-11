-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class XMLSTRING_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	xml_char_strdup (a_cur: POINTER): POINTER 

		-- function xmlCharStrdup (in 49 at line /usr/include/libxml2/libxml/xmlstring.h)
               -- xmlCharStrdup
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlCharStrdup"
               }"
               end

	xml_char_strndup (a_cur: POINTER; a_len: INTEGER): POINTER 

		-- function xmlCharStrndup (in 46 at line /usr/include/libxml2/libxml/xmlstring.h)
               -- xmlCharStrndup
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlCharStrndup"
               }"
               end

	xml_check_utf8 (an_utf: POINTER): INTEGER 

		-- function xmlCheckUTF8 (in 112 at line /usr/include/libxml2/libxml/xmlstring.h)
               -- xmlCheckUTF8
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlCheckUTF8"
               }"
               end

	xml_get_utf8char (an_utf: POINTER; a_len: POINTER): INTEGER 

		-- function xmlGetUTF8Char (in 109 at line /usr/include/libxml2/libxml/xmlstring.h)
               -- xmlGetUTF8Char
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlGetUTF8Char"
               }"
               end

	xml_str_equal (a_str1: POINTER; a_str2: POINTER): INTEGER 

		-- function xmlStrEqual (in 78 at line /usr/include/libxml2/libxml/xmlstring.h)
               -- xmlStrEqual
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlStrEqual"
               }"
               end

	xml_str_printf (a_buf: POINTER; a_len: INTEGER; a_msg: POINTER): INTEGER 

		-- function xmlStrPrintf (in 98 at line /usr/include/libxml2/libxml/xmlstring.h)
               -- xmlStrPrintf (variadic call) 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlStrPrintf"
               }"
               end

	xml_str_qequal (a_pref: POINTER; a_name: POINTER; a_str: POINTER): INTEGER 

		-- function xmlStrQEqual (in 81 at line /usr/include/libxml2/libxml/xmlstring.h)
               -- xmlStrQEqual
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlStrQEqual"
               }"
               end

	xml_str_vprintf (a_buf: POINTER; a_len: INTEGER; a_msg: POINTER; an_ap: POINTER): INTEGER 

		-- function xmlStrVPrintf (in 103 at line /usr/include/libxml2/libxml/xmlstring.h)
               -- xmlStrVPrintf
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlStrVPrintf"
               }"
               end

	xml_strcasecmp (a_str1: POINTER; a_str2: POINTER): INTEGER 

		-- function xmlStrcasecmp (in 71 at line /usr/include/libxml2/libxml/xmlstring.h)
               -- xmlStrcasecmp
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlStrcasecmp"
               }"
               end

	xml_strcasestr (a_str: POINTER; a_val: POINTER): POINTER 

		-- function xmlStrcasestr (in 61 at line /usr/include/libxml2/libxml/xmlstring.h)
               -- xmlStrcasestr
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlStrcasestr"
               }"
               end

	xml_strcat (a_cur: POINTER; an_add: POINTER): POINTER 

		-- function xmlStrcat (in 87 at line /usr/include/libxml2/libxml/xmlstring.h)
               -- xmlStrcat
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlStrcat"
               }"
               end

	xml_strchr (a_str: POINTER; a_val: CHARACTER): POINTER 

		-- function xmlStrchr (in 55 at line /usr/include/libxml2/libxml/xmlstring.h)
               -- xmlStrchr
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlStrchr"
               }"
               end

	xml_strcmp (a_str1: POINTER; a_str2: POINTER): INTEGER 

		-- function xmlStrcmp (in 64 at line /usr/include/libxml2/libxml/xmlstring.h)
               -- xmlStrcmp
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlStrcmp"
               }"
               end

	xml_strdup (a_cur: POINTER): POINTER 

		-- function xmlStrdup (in 41 at line /usr/include/libxml2/libxml/xmlstring.h)
               -- xmlStrdup
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlStrdup"
               }"
               end

	xml_strlen (a_str: POINTER): INTEGER 

		-- function xmlStrlen (in 85 at line /usr/include/libxml2/libxml/xmlstring.h)
               -- xmlStrlen
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlStrlen"
               }"
               end

	xml_strncasecmp (a_str1: POINTER; a_str2: POINTER; a_len: INTEGER): INTEGER 

		-- function xmlStrncasecmp (in 74 at line /usr/include/libxml2/libxml/xmlstring.h)
               -- xmlStrncasecmp
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlStrncasecmp"
               }"
               end

	xml_strncat (a_cur: POINTER; an_add: POINTER; a_len: INTEGER): POINTER 

		-- function xmlStrncat (in 90 at line /usr/include/libxml2/libxml/xmlstring.h)
               -- xmlStrncat
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlStrncat"
               }"
               end

	xml_strncat_new (a_str1: POINTER; a_str2: POINTER; a_len: INTEGER): POINTER 

		-- function xmlStrncatNew (in 94 at line /usr/include/libxml2/libxml/xmlstring.h)
               -- xmlStrncatNew
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlStrncatNew"
               }"
               end

	xml_strncmp (a_str1: POINTER; a_str2: POINTER; a_len: INTEGER): INTEGER 

		-- function xmlStrncmp (in 67 at line /usr/include/libxml2/libxml/xmlstring.h)
               -- xmlStrncmp
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlStrncmp"
               }"
               end

	xml_strndup (a_cur: POINTER; a_len: INTEGER): POINTER 

		-- function xmlStrndup (in 43 at line /usr/include/libxml2/libxml/xmlstring.h)
               -- xmlStrndup
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlStrndup"
               }"
               end

	xml_strstr (a_str: POINTER; a_val: POINTER): POINTER 

		-- function xmlStrstr (in 58 at line /usr/include/libxml2/libxml/xmlstring.h)
               -- xmlStrstr
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlStrstr"
               }"
               end

	xml_strsub (a_str: POINTER; a_start: INTEGER; a_len: INTEGER): POINTER 

		-- function xmlStrsub (in 51 at line /usr/include/libxml2/libxml/xmlstring.h)
               -- xmlStrsub
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlStrsub"
               }"
               end

	xml_utf8charcmp (an_utf1: POINTER; an_utf2: POINTER): INTEGER 

		-- function xmlUTF8Charcmp (in 134 at line /usr/include/libxml2/libxml/xmlstring.h)
               -- xmlUTF8Charcmp
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlUTF8Charcmp"
               }"
               end

	xml_utf8size (an_utf: POINTER): INTEGER 

		-- function xmlUTF8Size (in 132 at line /usr/include/libxml2/libxml/xmlstring.h)
               -- xmlUTF8Size
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlUTF8Size"
               }"
               end

	xml_utf8strlen (an_utf: POINTER): INTEGER 

		-- function xmlUTF8Strlen (in 130 at line /usr/include/libxml2/libxml/xmlstring.h)
               -- xmlUTF8Strlen
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlUTF8Strlen"
               }"
               end

	xml_utf8strloc (an_utf: POINTER; an_utfchar: POINTER): INTEGER 

		-- function xmlUTF8Strloc (in 123 at line /usr/include/libxml2/libxml/xmlstring.h)
               -- xmlUTF8Strloc
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlUTF8Strloc"
               }"
               end

	xml_utf8strndup (an_utf: POINTER; a_len: INTEGER): POINTER 

		-- function xmlUTF8Strndup (in 117 at line /usr/include/libxml2/libxml/xmlstring.h)
               -- xmlUTF8Strndup
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlUTF8Strndup"
               }"
               end

	xml_utf8strpos (an_utf: POINTER; a_pos: INTEGER): POINTER 

		-- function xmlUTF8Strpos (in 120 at line /usr/include/libxml2/libxml/xmlstring.h)
               -- xmlUTF8Strpos
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlUTF8Strpos"
               }"
               end

	xml_utf8strsize (an_utf: POINTER; a_len: INTEGER): INTEGER 

		-- function xmlUTF8Strsize (in 114 at line /usr/include/libxml2/libxml/xmlstring.h)
               -- xmlUTF8Strsize
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlUTF8Strsize"
               }"
               end

	xml_utf8strsub (an_utf: POINTER; a_start: INTEGER; a_len: INTEGER): POINTER 

		-- function xmlUTF8Strsub (in 126 at line /usr/include/libxml2/libxml/xmlstring.h)
               -- xmlUTF8Strsub
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlUTF8Strsub"
               }"
               end


end -- class XMLSTRING_EXTERNALS
