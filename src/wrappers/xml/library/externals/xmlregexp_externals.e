-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class XMLREGEXP_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	forbidden_exp: POINTER is
 		-- forbidden_exp (node at line 147)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "forbiddenExp"
		}"
		end

	address_of_forbidden_exp: POINTER is
 		-- Address of forbidden_exp (node at line 147)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&forbiddenExp"
		}"
		end

	empty_exp: POINTER is
 		-- empty_exp (node at line 148)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "emptyExp"
		}"
		end

	address_of_empty_exp: POINTER is
 		-- Address of empty_exp (node at line 148)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&emptyExp"
		}"
		end

	xml_exp_free (a_ctxt: POINTER; an_expr: POINTER) is
 		-- xmlExpFree (node at line 177)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlExpFree"
		}"
		end

	xml_exp_new_or (a_ctxt: POINTER; a_left: POINTER; a_right: POINTER): POINTER is
 		-- xmlExpNewOr (node at line 201)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlExpNewOr"
		}"
		end

	xml_reg_exec_push_string2 (an_exec: POINTER; a_value: POINTER; a_value2: POINTER; a_data: POINTER): INTEGER_32 is
 		-- xmlRegExecPushString2 (node at line 418)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlRegExecPushString2"
		}"
		end

	xml_exp_subsume (a_ctxt: POINTER; an_expr: POINTER; a_sub: POINTER): INTEGER_32 is
 		-- xmlExpSubsume (node at line 450)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlExpSubsume"
		}"
		end

	xml_exp_dump (a_buf: POINTER; an_expr: POINTER) is
 		-- xmlExpDump (node at line 1783)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlExpDump"
		}"
		end

	xml_exp_new_ctxt (a_max_nodes: INTEGER_32; a_dict: POINTER): POINTER is
 		-- xmlExpNewCtxt (node at line 1802)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlExpNewCtxt"
		}"
		end

	xml_regexp_exec (a_comp: POINTER; a_value: POINTER): INTEGER_32 is
 		-- xmlRegexpExec (node at line 2098)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlRegexpExec"
		}"
		end

	xml_exp_string_derive (a_ctxt: POINTER; an_expr: POINTER; a_str: POINTER; a_len: INTEGER_32): POINTER is
 		-- xmlExpStringDerive (node at line 2144)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlExpStringDerive"
		}"
		end

	xml_exp_parse (a_ctxt: POINTER; an_expr: POINTER): POINTER is
 		-- xmlExpParse (node at line 2157)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlExpParse"
		}"
		end

	xml_exp_exp_derive (a_ctxt: POINTER; an_expr: POINTER; a_sub: POINTER): POINTER is
 		-- xmlExpExpDerive (node at line 2211)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlExpExpDerive"
		}"
		end

	xml_regexp_is_determinist (a_comp: POINTER): INTEGER_32 is
 		-- xmlRegexpIsDeterminist (node at line 2411)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlRegexpIsDeterminist"
		}"
		end

	xml_exp_get_language (a_ctxt: POINTER; an_expr: POINTER; a_lang_list: POINTER; a_len: INTEGER_32): INTEGER_32 is
 		-- xmlExpGetLanguage (node at line 2773)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlExpGetLanguage"
		}"
		end

	xml_reg_free_exec_ctxt (an_exec: POINTER) is
 		-- xmlRegFreeExecCtxt (node at line 3121)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlRegFreeExecCtxt"
		}"
		end

	xml_exp_new_atom (a_ctxt: POINTER; a_name: POINTER; a_len: INTEGER_32): POINTER is
 		-- xmlExpNewAtom (node at line 3140)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlExpNewAtom"
		}"
		end

	xml_reg_new_exec_ctxt (a_comp: POINTER; a_callback: POINTER; a_data: POINTER): POINTER is
 		-- xmlRegNewExecCtxt (node at line 3173)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlRegNewExecCtxt"
		}"
		end

	xml_exp_ctxt_nb_cons (a_ctxt: POINTER): INTEGER_32 is
 		-- xmlExpCtxtNbCons (node at line 3248)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlExpCtxtNbCons"
		}"
		end

	xml_exp_get_start (a_ctxt: POINTER; an_expr: POINTER; a_tok_list: POINTER; a_len: INTEGER_32): INTEGER_32 is
 		-- xmlExpGetStart (node at line 3252)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlExpGetStart"
		}"
		end

	xml_regexp_compile (a_regexp: POINTER): POINTER is
 		-- xmlRegexpCompile (node at line 3357)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlRegexpCompile"
		}"
		end

	xml_reg_free_regexp (a_regexp: POINTER) is
 		-- xmlRegFreeRegexp (node at line 3394)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlRegFreeRegexp"
		}"
		end

	xml_exp_max_token (an_expr: POINTER): INTEGER_32 is
 		-- xmlExpMaxToken (node at line 4091)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlExpMaxToken"
		}"
		end

	xml_exp_new_seq (a_ctxt: POINTER; a_left: POINTER; a_right: POINTER): POINTER is
 		-- xmlExpNewSeq (node at line 4099)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlExpNewSeq"
		}"
		end

	xml_exp_is_nillable (an_expr: POINTER): INTEGER_32 is
 		-- xmlExpIsNillable (node at line 4757)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlExpIsNillable"
		}"
		end

	xml_exp_ref (an_expr: POINTER) is
 		-- xmlExpRef (node at line 5093)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlExpRef"
		}"
		end

	xml_reg_exec_next_values (an_exec: POINTER; a_nbval: POINTER; a_nbneg: POINTER; a_values: POINTER; a_terminal: POINTER): INTEGER_32 is
 		-- xmlRegExecNextValues (node at line 5267)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlRegExecNextValues"
		}"
		end

	xml_reg_exec_err_info (an_exec: POINTER; a_string: POINTER; a_nbval: POINTER; a_nbneg: POINTER; a_values: POINTER; a_terminal: POINTER): INTEGER_32 is
 		-- xmlRegExecErrInfo (node at line 5304)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlRegExecErrInfo"
		}"
		end

	xml_regexp_print (an_output: POINTER; a_regexp: POINTER) is
 		-- xmlRegexpPrint (node at line 5393)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlRegexpPrint"
		}"
		end

	xml_reg_exec_push_string (an_exec: POINTER; a_value: POINTER; a_data: POINTER): INTEGER_32 is
 		-- xmlRegExecPushString (node at line 5793)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlRegExecPushString"
		}"
		end

	xml_exp_ctxt_nb_nodes (a_ctxt: POINTER): INTEGER_32 is
 		-- xmlExpCtxtNbNodes (node at line 5803)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlExpCtxtNbNodes"
		}"
		end

	xml_exp_free_ctxt (a_ctxt: POINTER) is
 		-- xmlExpFreeCtxt (node at line 5870)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlExpFreeCtxt"
		}"
		end

	xml_exp_new_range (a_ctxt: POINTER; a_subset: POINTER; a_min: INTEGER_32; a_max: INTEGER_32): POINTER is
 		-- xmlExpNewRange (node at line 6023)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlExpNewRange"
		}"
		end


end -- class XMLREGEXP_EXTERNALS
