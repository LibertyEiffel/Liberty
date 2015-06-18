-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.
deferred class XMLSTRING_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	xml_char_strdup (a_cur: POINTER): POINTER 
               -- xmlCharStrdup
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	xml_char_strndup (a_cur: POINTER; a_len: INTEGER): POINTER 
               -- xmlCharStrndup
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	xml_check_utf8 (an_utf: POINTER): INTEGER 
               -- xmlCheckUTF8
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	xml_get_utf8char (an_utf: POINTER; a_len: POINTER): INTEGER 
               -- xmlGetUTF8Char
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	xml_str_equal (a_str1: POINTER; a_str2: POINTER): INTEGER 
               -- xmlStrEqual
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	xml_str_printf (a_buf: POINTER; a_len: INTEGER; a_msg: POINTER): INTEGER 
               -- xmlStrPrintf (variadic call) 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	xml_str_qequal (a_pref: POINTER; a_name: POINTER; a_str: POINTER): INTEGER 
               -- xmlStrQEqual
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	xml_str_vprintf (a_buf: POINTER; a_len: INTEGER; a_msg: POINTER; an_ap: POINTER): INTEGER 
               -- xmlStrVPrintf
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	xml_strcasecmp (a_str1: POINTER; a_str2: POINTER): INTEGER 
               -- xmlStrcasecmp
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	xml_strcasestr (a_str: POINTER; a_val: POINTER): POINTER 
               -- xmlStrcasestr
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	xml_strcat (a_cur: POINTER; an_add: POINTER): POINTER 
               -- xmlStrcat
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	xml_strchr (a_str: POINTER; a_val: CHARACTER): POINTER 
               -- xmlStrchr
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	xml_strcmp (a_str1: POINTER; a_str2: POINTER): INTEGER 
               -- xmlStrcmp
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	xml_strdup (a_cur: POINTER): POINTER 
               -- xmlStrdup
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	xml_strlen (a_str: POINTER): INTEGER 
               -- xmlStrlen
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	xml_strncasecmp (a_str1: POINTER; a_str2: POINTER; a_len: INTEGER): INTEGER 
               -- xmlStrncasecmp
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	xml_strncat (a_cur: POINTER; an_add: POINTER; a_len: INTEGER): POINTER 
               -- xmlStrncat
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	xml_strncat_new (a_str1: POINTER; a_str2: POINTER; a_len: INTEGER): POINTER 
               -- xmlStrncatNew
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	xml_strncmp (a_str1: POINTER; a_str2: POINTER; a_len: INTEGER): INTEGER 
               -- xmlStrncmp
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	xml_strndup (a_cur: POINTER; a_len: INTEGER): POINTER 
               -- xmlStrndup
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	xml_strstr (a_str: POINTER; a_val: POINTER): POINTER 
               -- xmlStrstr
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	xml_strsub (a_str: POINTER; a_start: INTEGER; a_len: INTEGER): POINTER 
               -- xmlStrsub
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	xml_utf8charcmp (an_utf1: POINTER; an_utf2: POINTER): INTEGER 
               -- xmlUTF8Charcmp
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	xml_utf8size (an_utf: POINTER): INTEGER 
               -- xmlUTF8Size
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	xml_utf8strlen (an_utf: POINTER): INTEGER 
               -- xmlUTF8Strlen
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	xml_utf8strloc (an_utf: POINTER; an_utfchar: POINTER): INTEGER 
               -- xmlUTF8Strloc
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	xml_utf8strndup (an_utf: POINTER; a_len: INTEGER): POINTER 
               -- xmlUTF8Strndup
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	xml_utf8strpos (an_utf: POINTER; a_pos: INTEGER): POINTER 
               -- xmlUTF8Strpos
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	xml_utf8strsize (an_utf: POINTER; a_len: INTEGER): INTEGER 
               -- xmlUTF8Strsize
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	xml_utf8strsub (an_utf: POINTER; a_start: INTEGER; a_len: INTEGER): POINTER 
               -- xmlUTF8Strsub
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end


end -- class XMLSTRING_EXTERNALS
