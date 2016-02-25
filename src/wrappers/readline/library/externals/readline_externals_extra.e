-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class READLINE_EXTERNALS_EXTRA

insert
   ANY
      undefine
         is_equal, copy
      end

feature {} -- External calls
   rl_attempted_completion_object: READ_LINE_COMPLETION
         -- rl_attempted_completion_function
      external "plug_in"
      alias "{
         location: "."
         module_name: "generated/plugin"
         feature_name: "get_rl_attempted_completion_object()"
      }"
      end

   set_rl_attempted_completion_object (a_value: READ_LINE_COMPLETION)
         -- Set variable rl_attempted_completion_function value
      external "plug_in"
      alias "{
         location: "."
         module_name: "generated/plugin"
         feature_name: "set_rl_attempted_completion_object"
      }"
      end

   rl_handler: POINTER
         -- An external handler function
      external "plug_in"
      alias "{
         location: "."
         module_name: "generated/plugin"
         feature_name: "rl_handler"
      }"
      end

   rl_register_job (job: READ_LINE_JOB)
      -- Register the job for callback handling
      external "plug_in"
      alias "{
         location: "."
         module_name: "generated/plugin"
         feature_name: "rl_register_job"
      }"
      end

end -- class READLINE_EXTERNALS_EXTRA
