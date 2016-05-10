-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class FMTMSG_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	addseverity (a_severity: INTEGER; a_string: POINTER): INTEGER 

		-- function addseverity (in `/usr/include/fmtmsg.h')
               -- addseverity
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "addseverity"
               }"
               end

	fmtmsg (a_classification: like long; a_label: POINTER; a_severity: INTEGER; a_text: POINTER; an_action: POINTER; a_tag: POINTER): INTEGER 

		-- function fmtmsg (in `/usr/include/fmtmsg.h')
               -- fmtmsg
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "fmtmsg"
               }"
               end


end -- class FMTMSG_EXTERNALS
