class MANIFEST_GENERIC_SAMPLE_PRINTER

inherit
   DECLARATION_LIST_VISITOR
   DECLARATION_GROUP_VISITOR

insert
   GLOBALS

feature {CREATION_CLAUSE}
   display_manifest_generic_for (type: TYPE)
      local
         af_mm, af_mp, af_msc: ANONYMOUS_FEATURE
         formal_arg_list: FORMAL_ARG_LIST; hc: COMMENT
         dg: DECLARATION_GROUP; fgl: FORMAL_GENERIC_LIST; ct: CLASS_TEXT
         cst_att_integer: CST_ATT_INTEGER; integer_constant: INTEGER_CONSTANT
         i, arg_idx: INTEGER; j, bunch, arg_nb: INTEGER_64; comment_put: BOOLEAN
      do
         short_printer.hook_or(once "hook300", once "   ")
         short_printer.hook_or(once "open_curly_bracket", once "{")
         ct := type.class_text
         -- class name
         short_printer.put_class_name(ct.name)
         -- generic list (if present)
         fgl := ct.formal_generic_list
         if fgl /= Void then
            short_printer.hook_or(once "open_sb", once "[")
            from
               i := 1
            until
               i > fgl.count
            loop
               short_printer.put_class_name_without_link(fgl.item(i).name)
               if i < fgl.count then
                  short_printer.hook_or(once "fgl_sep", once ", ")
               end
               i := i + 1
            end
            short_printer.hook_or(once "close_sb", once "]")
         end
         short_printer.hook_or(once "blank_space", once " ")
         -- optional arguments
         af_mm := type.feature_stamp_of(manifest_make_name).anonymous_feature(type)
         formal_arg_list := af_mm.arguments
         if formal_arg_list.count > 1 then
            dg ?= formal_arg_list.list.first
            if dg /= Void then
               from
                  i := dg.name_list.lower + 1
                  dg.name_list.item(i).short(type)
                  i := i + 1
               until
                  i > dg.name_list.upper
               loop
                  short_printer.hook_or(once "hook304", once ", ")
                  dg.name_list.item(i).short(type)
                  i := i + 1
               end
               short_printer.hook_or(once "hook305", once ": ")
               dg.name_list.first.result_type.short(type)
               short_printer.hook_or(once "hook304", once ", ")
            end
            from
               i := formal_arg_list.list.lower + 1
            until
               i > formal_arg_list.list.upper
            loop
               formal_arg_list.list.item(i).short(type)
               short_printer.hook_or(once "hook304", once ", ")
               i := i + 1
            end
         end
         short_printer.hook_or(once "op_ma", once "<<")
         af_mp := type.feature_stamp_of(manifest_put_name).anonymous_feature(type)
         formal_arg_list := af_mp.arguments
         arg_nb := 3 * (formal_arg_list.count - 1)
         af_msc := type.feature_stamp_of(manifest_semicolon_check_name).anonymous_feature(type)
         if {CST_ATT_INTEGER} ?:= af_msc then
            cst_att_integer ::= af_msc
            integer_constant ::= cst_att_integer.value
            bunch := integer_constant.value_memory
            arg_nb := 3 * bunch
         else
            bunch := arg_nb + 1
         end
         from
            j := 0
         until
            j >= arg_nb
         loop
            arg_idx := (j \\ (formal_arg_list.count - 1) + 2).to_integer_32
            formal_arg_list.name(arg_idx).short(type)
            short_printer.hook_or(once "hook305", once ": ")
            formal_arg_list.type_mark(arg_idx).short(type)
            j := j + 1
            if j \\ bunch = 0 then
               short_printer.hook_or(once "hook303", once "; ")
            else
               short_printer.hook_or(once "hook304", once ", ")
            end
         end
         short_printer.hook_or(once "ellipses", once "...")
         short_printer.hook_or(once "cl_ma", once ">>")
         short_printer.hook_or(once "blank_space", once " ")
         short_printer.hook_or(once "close_curly_bracket", once "}")
         short_printer.hook_or(once "hook309", once "%N")
         hc := af_mm.header_comment
         if hc /= Void then
            short_printer.hook(once "hook310")
            hc.short(once "hook311", once "      --", once "hook312", once "%N")
            comment_put := True
         end
         hc := af_mp.header_comment
         if hc /= Void then
            if not comment_put then
               short_printer.hook(once "hook310")
            end
            hc.short(once "hook311", once "      --", once "hook312", once "%N")
            comment_put := True
         end
         hc := af_msc.header_comment
         if hc /= Void then
            if not comment_put then
               short_printer.hook(once "hook310")
            end
            hc.short(once "hook311", once "      --", once "hook312", once "%N")
            comment_put := True
         end
         if comment_put then
            short_printer.hook(once "hook313")
         else
            short_printer.hook(once "hook314")
         end
         short_printer.hook_or(once "hook599", once "")
      end

feature {DECLARATION_GROUP}
   visit_declaration_group (visited: DECLARATION_GROUP)
      do
      end

feature {EFFECTIVE_ARG_LIST_0}
   visit_effective_arg_list_0 (visited: EFFECTIVE_ARG_LIST_0)
      do
      end

feature {EFFECTIVE_ARG_LIST_N}
   visit_effective_arg_list_n (visited: EFFECTIVE_ARG_LIST_N)
      do
      end

feature {FORMAL_ARG_LIST}
   visit_formal_arg_list (visited: FORMAL_ARG_LIST)
      do
      end

feature {LOCAL_VAR_LIST}
   visit_local_var_list (visited: LOCAL_VAR_LIST)
      do
      end

end
