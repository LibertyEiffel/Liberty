-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class XMLVERSION_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	xml_check_version (a_version: INTEGER) 

		-- function xmlCheckVersion (in `/usr/include/libxml2/libxml/xmlversion.h')
               -- xmlCheckVersion
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlCheckVersion"
               }"
               end


end -- class XMLVERSION_EXTERNALS
