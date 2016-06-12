class COMPILER_LIKE
   -- This example illustrates how to make a tool that works like compile_to_c or compile_to_jvm.
   -- It loads the root class and root feature, and all the dependencies they have.
   -- It then lists the types that the system uses.

inherit
   CODE_PRINTER

insert
   EXTERNAL_TOOL

create {ANY}
   make

feature {SMART_EIFFEL}
   compile
      local
         types: DICTIONARY[TYPE, HASHED_STRING]; i, upper: INTEGER
      do
         types := smart_eiffel.type_dictionary
         upper := types.upper
         from
            i := types.lower
         until
            i > upper
         loop
            io.put_string(types.key(i).to_string)
            io.put_new_line
            i := i + 1
         end
      end

feature {}
   make
      local
         plugin_factory: FAKE_PLUGIN_FACTORY
      do
         bootstrap
         create plugin_factory.make
         system_tools.set_plugin_factory(plugin_factory)
         smart_eiffel.compile(Current)
      end

   parse_arguments
      local
         argi: INTEGER; arg: STRING
      do
         -- Only called in non-ace mode
         search_for_verbose_flag
         from
            argi := 1
         until
            argi > argument_count
         loop
            arg := argument(argi)
            -- The `is_xxx_flag' functions have side effects (they are not pure queries)
            if is_help_flag(arg) then
            elseif is_version_flag(arg) then
            elseif is_verbose_flag(arg) then
            elseif is_style_warning_flag(arg) then
            elseif is_no_warning_flag(arg) then
            elseif is_a_compilation_level_flag(arg) then
            elseif is_flat_check_flag(arg) then
            elseif root_class_name = Void then
               root_class_name := arg
            elseif root_procedure_name = Void then
               root_procedure_name := arg
            else
               system_tools.bad_use_exit(command_name, usage)
            end

            argi := argi + 1
         end

         if root_class_name = Void then
            system_tools.bad_use_exit(command_name, usage)
         end
      end

   is_valid_argument_for_ace_mode (arg: STRING): BOOLEAN
      do
         -- This is called by smart_eiffel.ace from a loop similar to the one in parse_arguments
         Result := is_version_flag(arg) or else is_style_warning_flag(arg) or else is_no_warning_flag(arg) or else is_verbose_flag(arg)
      end

   valid_argument_for_ace_mode: STRING "Only the flags -verbose, -version and -help are allowed%Nin ACE file mode.%N"

   use_short_mode: BOOLEAN False

   usage: STRING "[
   Usage: compiler_like [options] <RootClass> <RootProcedure> ...
      or: compiler_like [options] <ACEfileName>.ace

    Option summary:

    Information:
      -help               Display this help information
      -version            Display Liberty Eiffel version information
      -verbose            Display detailed information about what
                           compiler_like is doing

    Optimization and debugging levels (specify at most one; default is -all_check):
      -boost              Enable all optimizations,
                           but disable all run-time checks
      -no_check           Enable Void target and system-level checking
      -require_check      Enable precondition checking (implies -no_check)
      -ensure_check       Enable postcondition checking (implies -require_check)
      -invariant_check    Enable class invariant checking (implies -ensure_check)
      -loop_check         Enable loop variant and invariant checking
                           (implies -invariant_check)
      -all_check          Enable 'check' blocks (implies -loop_check)
      -debug_check        Enable 'debug' blocks (implies -all_check)
      -flat_check         Each assertion will be executed in no_check mode
                           Use with any mode from require_check to debug_check

    Warning levels:
      -style_warning      Print warnings about style violations
      -no_warning         Don't print any warnings

   ]"

end -- class COMPILER_LIKE
