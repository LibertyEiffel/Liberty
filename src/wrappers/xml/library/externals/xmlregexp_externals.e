-- This file has been created by wrapper-generator.
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
               -- xmlExpCtxtNbCons
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlExpCtxtNbCons"
               }"
               end

	xml_exp_ctxt_nb_nodes (a_ctxt: POINTER): INTEGER 
               -- xmlExpCtxtNbNodes
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlExpCtxtNbNodes"
               }"
               end

	xml_exp_dump (a_buf: POINTER; an_expr: POINTER) 
               -- xmlExpDump
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlExpDump"
               }"
               end

	xml_exp_exp_derive (a_ctxt: POINTER; an_expr: POINTER; a_sub: POINTER): POINTER 
               -- xmlExpExpDerive
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlExpExpDerive"
               }"
               end

	xml_exp_free (a_ctxt: POINTER; an_expr: POINTER) 
               -- xmlExpFree
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlExpFree"
               }"
               end

	xml_exp_free_ctxt (a_ctxt: POINTER) 
               -- xmlExpFreeCtxt
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlExpFreeCtxt"
               }"
               end

	xml_exp_get_language (a_ctxt: POINTER; an_expr: POINTER; a_lang_list: POINTER; a_len: INTEGER): INTEGER 
               -- xmlExpGetLanguage
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlExpGetLanguage"
               }"
               end

	xml_exp_get_start (a_ctxt: POINTER; an_expr: POINTER; a_tok_list: POINTER; a_len: INTEGER): INTEGER 
               -- xmlExpGetStart
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlExpGetStart"
               }"
               end

	xml_exp_is_nillable (an_expr: POINTER): INTEGER 
               -- xmlExpIsNillable
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlExpIsNillable"
               }"
               end

	xml_exp_max_token (an_expr: POINTER): INTEGER 
               -- xmlExpMaxToken
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlExpMaxToken"
               }"
               end

	xml_exp_new_atom (a_ctxt: POINTER; a_name: POINTER; a_len: INTEGER): POINTER 
               -- xmlExpNewAtom
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlExpNewAtom"
               }"
               end

	xml_exp_new_ctxt (a_max_nodes: INTEGER; a_dict: POINTER): POINTER 
               -- xmlExpNewCtxt
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlExpNewCtxt"
               }"
               end

	xml_exp_new_or (a_ctxt: POINTER; a_left: POINTER; a_right: POINTER): POINTER 
               -- xmlExpNewOr
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlExpNewOr"
               }"
               end

	xml_exp_new_range (a_ctxt: POINTER; a_subset: POINTER; a_min: INTEGER; a_max: INTEGER): POINTER 
               -- xmlExpNewRange
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlExpNewRange"
               }"
               end

	xml_exp_new_seq (a_ctxt: POINTER; a_left: POINTER; a_right: POINTER): POINTER 
               -- xmlExpNewSeq
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlExpNewSeq"
               }"
               end

	xml_exp_parse (a_ctxt: POINTER; an_expr: POINTER): POINTER 
               -- xmlExpParse
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlExpParse"
               }"
               end

	xml_exp_ref (an_expr: POINTER) 
               -- xmlExpRef
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlExpRef"
               }"
               end

	xml_exp_string_derive (a_ctxt: POINTER; an_expr: POINTER; a_str: POINTER; a_len: INTEGER): POINTER 
               -- xmlExpStringDerive
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlExpStringDerive"
               }"
               end

	xml_exp_subsume (a_ctxt: POINTER; an_expr: POINTER; a_sub: POINTER): INTEGER 
               -- xmlExpSubsume
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlExpSubsume"
               }"
               end

	xml_reg_exec_err_info (an_exec: POINTER; a_string: POINTER; a_nbval: POINTER; a_nbneg: POINTER; a_values: POINTER; a_terminal: POINTER): INTEGER 
               -- xmlRegExecErrInfo
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlRegExecErrInfo"
               }"
               end

	xml_reg_exec_next_values (an_exec: POINTER; a_nbval: POINTER; a_nbneg: POINTER; a_values: POINTER; a_terminal: POINTER): INTEGER 
               -- xmlRegExecNextValues
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlRegExecNextValues"
               }"
               end

	xml_reg_exec_push_string (an_exec: POINTER; a_value: POINTER; a_data: POINTER): INTEGER 
               -- xmlRegExecPushString
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlRegExecPushString"
               }"
               end

	xml_reg_exec_push_string2 (an_exec: POINTER; a_value: POINTER; a_value2: POINTER; a_data: POINTER): INTEGER 
               -- xmlRegExecPushString2
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlRegExecPushString2"
               }"
               end

	xml_reg_free_exec_ctxt (an_exec: POINTER) 
               -- xmlRegFreeExecCtxt
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlRegFreeExecCtxt"
               }"
               end

	xml_reg_free_regexp (a_regexp: POINTER) 
               -- xmlRegFreeRegexp
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlRegFreeRegexp"
               }"
               end

	xml_reg_new_exec_ctxt (a_comp: POINTER; a_callback: POINTER; a_data: POINTER): POINTER 
               -- xmlRegNewExecCtxt
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlRegNewExecCtxt"
               }"
               end

	xml_regexp_compile (a_regexp: POINTER): POINTER 
               -- xmlRegexpCompile
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlRegexpCompile"
               }"
               end

	xml_regexp_exec (a_comp: POINTER; a_value: POINTER): INTEGER 
               -- xmlRegexpExec
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlRegexpExec"
               }"
               end

	xml_regexp_is_determinist (a_comp: POINTER): INTEGER 
               -- xmlRegexpIsDeterminist
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlRegexpIsDeterminist"
               }"
               end

	xml_regexp_print (an_output: POINTER; a_regexp: POINTER) 
               -- xmlRegexpPrint
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xmlRegexpPrint"
               }"
               end


end -- class XMLREGEXP_EXTERNALS
