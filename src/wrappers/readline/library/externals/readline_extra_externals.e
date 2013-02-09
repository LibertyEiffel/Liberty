deferred class READLINE_EXTRA_EXTERNALS
--
-- More externals, not generated
--

insert
   ANY
      undefine
         is_equal, copy
      end

feature {} -- External calls
   set_rl_attempted_completion_function (c: READLINE_CECIL) is
         -- To be called once to initialize the completion function
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "set_rl_attempted_completion_function"
         }"
      end

end
