-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class XMLREGEXP_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	empty_exp: POINTER
               -- empty_exp
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "emptyExp"
               }"
               end

       address_of_empty_exp: POINTER
               -- Address of empty_exp
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "&emptyExp"
               }"
               end

       set_empty_exp (a_value: POINTER)
               -- Set variable empty_exp value
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "set_emptyExp"
               }"
               end

	forbidden_exp: POINTER
               -- forbidden_exp
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "forbiddenExp"
               }"
               end

       address_of_forbidden_exp: POINTER
               -- Address of forbidden_exp
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "&forbiddenExp"
               }"
               end

       set_forbidden_exp (a_value: POINTER)
               -- Set variable forbidden_exp value
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "set_forbiddenExp"
               }"
               end

	xml_exp_ctxt_nb_cons (a_ctxt: POINTER): INTEGER 

		-- function xmlExpCtxtNbCons (in `/usr/include/libxml2/libxml/xmlregexp.h')
               -- xmlExpCtxtNbCons
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlExpCtxtNbCons"
               }"
               end

	xml_exp_ctxt_nb_nodes (a_ctxt: POINTER): INTEGER 

		-- function xmlExpCtxtNbNodes (in `/usr/include/libxml2/libxml/xmlregexp.h')
               -- xmlExpCtxtNbNodes
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlExpCtxtNbNodes"
               }"
               end

	xml_exp_dump (a_buf: POINTER; an_expr: POINTER) 

		-- function xmlExpDump (in `/usr/include/libxml2/libxml/xmlregexp.h')
               -- xmlExpDump
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlExpDump"
               }"
               end

	xml_exp_exp_derive (a_ctxt: POINTER; an_expr: POINTER; a_sub: POINTER): POINTER 

		-- function xmlExpExpDerive (in `/usr/include/libxml2/libxml/xmlregexp.h')
               -- xmlExpExpDerive
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlExpExpDerive"
               }"
               end

	xml_exp_free (a_ctxt: POINTER; an_expr: POINTER) 

		-- function xmlExpFree (in `/usr/include/libxml2/libxml/xmlregexp.h')
               -- xmlExpFree
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlExpFree"
               }"
               end

	xml_exp_free_ctxt (a_ctxt: POINTER) 

		-- function xmlExpFreeCtxt (in `/usr/include/libxml2/libxml/xmlregexp.h')
               -- xmlExpFreeCtxt
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlExpFreeCtxt"
               }"
               end

	xml_exp_get_language (a_ctxt: POINTER; an_expr: POINTER; a_lang_list: POINTER; a_len: INTEGER): INTEGER 

		-- function xmlExpGetLanguage (in `/usr/include/libxml2/libxml/xmlregexp.h')
               -- xmlExpGetLanguage
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlExpGetLanguage"
               }"
               end

	xml_exp_get_start (a_ctxt: POINTER; an_expr: POINTER; a_tok_list: POINTER; a_len: INTEGER): INTEGER 

		-- function xmlExpGetStart (in `/usr/include/libxml2/libxml/xmlregexp.h')
               -- xmlExpGetStart
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlExpGetStart"
               }"
               end

	xml_exp_is_nillable (an_expr: POINTER): INTEGER 

		-- function xmlExpIsNillable (in `/usr/include/libxml2/libxml/xmlregexp.h')
               -- xmlExpIsNillable
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlExpIsNillable"
               }"
               end

	xml_exp_max_token (an_expr: POINTER): INTEGER 

		-- function xmlExpMaxToken (in `/usr/include/libxml2/libxml/xmlregexp.h')
               -- xmlExpMaxToken
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlExpMaxToken"
               }"
               end

	xml_exp_new_atom (a_ctxt: POINTER; a_name: POINTER; a_len: INTEGER): POINTER 

		-- function xmlExpNewAtom (in `/usr/include/libxml2/libxml/xmlregexp.h')
               -- xmlExpNewAtom
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlExpNewAtom"
               }"
               end

	xml_exp_new_ctxt (a_max_nodes: INTEGER; a_dict: POINTER): POINTER 

		-- function xmlExpNewCtxt (in `/usr/include/libxml2/libxml/xmlregexp.h')
               -- xmlExpNewCtxt
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlExpNewCtxt"
               }"
               end

	xml_exp_new_or (a_ctxt: POINTER; a_left: POINTER; a_right: POINTER): POINTER 

		-- function xmlExpNewOr (in `/usr/include/libxml2/libxml/xmlregexp.h')
               -- xmlExpNewOr
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlExpNewOr"
               }"
               end

	xml_exp_new_range (a_ctxt: POINTER; a_subset: POINTER; a_min: INTEGER; a_max: INTEGER): POINTER 

		-- function xmlExpNewRange (in `/usr/include/libxml2/libxml/xmlregexp.h')
               -- xmlExpNewRange
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlExpNewRange"
               }"
               end

	xml_exp_new_seq (a_ctxt: POINTER; a_left: POINTER; a_right: POINTER): POINTER 

		-- function xmlExpNewSeq (in `/usr/include/libxml2/libxml/xmlregexp.h')
               -- xmlExpNewSeq
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlExpNewSeq"
               }"
               end

	xml_exp_parse (a_ctxt: POINTER; an_expr: POINTER): POINTER 

		-- function xmlExpParse (in `/usr/include/libxml2/libxml/xmlregexp.h')
               -- xmlExpParse
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlExpParse"
               }"
               end

	xml_exp_ref (an_expr: POINTER) 

		-- function xmlExpRef (in `/usr/include/libxml2/libxml/xmlregexp.h')
               -- xmlExpRef
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlExpRef"
               }"
               end

	xml_exp_string_derive (a_ctxt: POINTER; an_expr: POINTER; a_str: POINTER; a_len: INTEGER): POINTER 

		-- function xmlExpStringDerive (in `/usr/include/libxml2/libxml/xmlregexp.h')
               -- xmlExpStringDerive
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlExpStringDerive"
               }"
               end

	xml_exp_subsume (a_ctxt: POINTER; an_expr: POINTER; a_sub: POINTER): INTEGER 

		-- function xmlExpSubsume (in `/usr/include/libxml2/libxml/xmlregexp.h')
               -- xmlExpSubsume
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlExpSubsume"
               }"
               end

	xml_reg_exec_err_info (an_exec: POINTER; a_string: POINTER; a_nbval: POINTER; a_nbneg: POINTER; a_values: POINTER; a_terminal: POINTER): INTEGER 

		-- function xmlRegExecErrInfo (in `/usr/include/libxml2/libxml/xmlregexp.h')
               -- xmlRegExecErrInfo
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlRegExecErrInfo"
               }"
               end

	xml_reg_exec_next_values (an_exec: POINTER; a_nbval: POINTER; a_nbneg: POINTER; a_values: POINTER; a_terminal: POINTER): INTEGER 

		-- function xmlRegExecNextValues (in `/usr/include/libxml2/libxml/xmlregexp.h')
               -- xmlRegExecNextValues
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlRegExecNextValues"
               }"
               end

	xml_reg_exec_push_string (an_exec: POINTER; a_value: POINTER; a_data: POINTER): INTEGER 

		-- function xmlRegExecPushString (in `/usr/include/libxml2/libxml/xmlregexp.h')
               -- xmlRegExecPushString
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlRegExecPushString"
               }"
               end

	xml_reg_exec_push_string2 (an_exec: POINTER; a_value: POINTER; a_value2: POINTER; a_data: POINTER): INTEGER 

		-- function xmlRegExecPushString2 (in `/usr/include/libxml2/libxml/xmlregexp.h')
               -- xmlRegExecPushString2
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlRegExecPushString2"
               }"
               end

	xml_reg_free_exec_ctxt (an_exec: POINTER) 

		-- function xmlRegFreeExecCtxt (in `/usr/include/libxml2/libxml/xmlregexp.h')
               -- xmlRegFreeExecCtxt
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlRegFreeExecCtxt"
               }"
               end

	xml_reg_free_regexp (a_regexp: POINTER) 

		-- function xmlRegFreeRegexp (in `/usr/include/libxml2/libxml/xmlregexp.h')
               -- xmlRegFreeRegexp
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlRegFreeRegexp"
               }"
               end

	xml_reg_new_exec_ctxt (a_comp: POINTER; a_callback: POINTER; a_data: POINTER): POINTER 

		-- function xmlRegNewExecCtxt (in `/usr/include/libxml2/libxml/xmlregexp.h')
               -- xmlRegNewExecCtxt
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlRegNewExecCtxt"
               }"
               end

	xml_regexp_compile (a_regexp: POINTER): POINTER 

		-- function xmlRegexpCompile (in `/usr/include/libxml2/libxml/xmlregexp.h')
               -- xmlRegexpCompile
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlRegexpCompile"
               }"
               end

	xml_regexp_exec (a_comp: POINTER; a_value: POINTER): INTEGER 

		-- function xmlRegexpExec (in `/usr/include/libxml2/libxml/xmlregexp.h')
               -- xmlRegexpExec
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlRegexpExec"
               }"
               end

	xml_regexp_is_determinist (a_comp: POINTER): INTEGER 

		-- function xmlRegexpIsDeterminist (in `/usr/include/libxml2/libxml/xmlregexp.h')
               -- xmlRegexpIsDeterminist
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlRegexpIsDeterminist"
               }"
               end

	xml_regexp_print (an_output: POINTER; a_regexp: POINTER) 

		-- function xmlRegexpPrint (in `/usr/include/libxml2/libxml/xmlregexp.h')
               -- xmlRegexpPrint
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlRegexpPrint"
               }"
               end


end -- class XMLREGEXP_EXTERNALS
