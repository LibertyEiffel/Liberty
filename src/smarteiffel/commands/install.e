-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class INSTALL
   --
   -- The Liberty Eiffel installer (the `install' command).
   --
   -- The first goal of this installer is to be simple: a no-brainer
   -- installation can be summed up as "keep your finger on the <Enter> key".
   --

inherit
   COMMAND_LINE_TOOLS
      rename system_tools as dummy_system_tools
      end

insert
   INSTALL_GLOBALS

creation {}
   make

feature {ANY}
   command_line_name: STRING is "install"

   command_line_help_summary: STRING is
      do
         check
            False
         end
      end

   is_valid_argument_for_ace_mode (arg: STRING): BOOLEAN is
      do
         check
            False
         end
      end

   valid_argument_for_ace_mode: STRING is
      do
         check
            False
         end
      end

feature {} -- Creation:
   make is
      do
         -- That introduction text must fit on exactly 25 lines.
         io.put_string(once "{

Hello!

Thank you for choosing Liberty Eiffel.

I'm here to help you install your software. Many default options have been set
for you; the simplest way to install Liberty Eiffel is to keep pressing the
<Enter> key as long as I ask anything.

Of course you can change the options I set; it's just a matter of chosing items
in the menus, and you'll see you can greatly customize your Liberty Eiffel
installation. A golden rule is, just pressing <Enter> always works, and
inexorably leads towards the actual Liberty Eiffel installation. When no default
is provided (between brackets), the <Enter> key will just leave everything
unchanged and get you back to the previous menu.

As training, you'll be asked to press the <Enter> key to gain access to the
main menu ;-)

If you have problems, please contact the Liberty Eiffel team:
  - either by mail:  liberty-eiffel.blogspot.com
  - either by using the bugs database: http://SmartZilla.loria.fr


         }")
         init
         io.put_string(once "%NPress the <Enter> key: ")
         read_line
         io.put_string(once "{

Don't forget that rule: the <Enter> key ensures that Liberty Eiffel will eventually
get installed.

         }")
         main_menu
         exit
      end

feature {} -- Initialization:
   init is
         -- Initializes the installer
      local
         config_detected: BOOLEAN
      do
         create default_c_compiler_options.make(16)
         create default_cpp_compiler_options.make(16)
         init_globals
         config_detected := seconf /= fz_conf_undefined and   then
                            file_tools.is_readable(seconf) and then
                            not ini_parser.is_invalid and then
                            use_existing_config
         set_default_variables
         if not config_detected then
            set_directories
         end
         if create_default_c_modes then
            if config_detected then
               -- Some default C modes were missing in the provided configuration file
               default_main_action := main_action_display_config
            else
               -- Since there was no valid config, try and get at least some
               -- default values from the compiler template.
               read_compiler_template(True)
               check
                  default_main_action > 0
               end
            end
         else
            check
               config_detected
            end
            if default_main_action = 0 then
               default_main_action := main_action_install
            end
         end

         noenv_bin_directory := bin_directory.twin
         system_tools.environment_variable_substitution(Void, noenv_bin_directory)

         noenv_sys_directory := sys_directory.twin
         system_tools.environment_variable_substitution(Void, noenv_sys_directory)

         noenv_short_directory := short_directory.twin
         system_tools.environment_variable_substitution(Void, noenv_short_directory)

         system_tools.set_bin_directory(noenv_bin_directory)
         system_tools.set_sys_directory(noenv_sys_directory)
         system_tools.set_short_directory(noenv_short_directory)
         install_c_mode := fz_boost.twin

         init_defaults_for_java
      end

   use_existing_config: BOOLEAN is
         -- Read the data from the config file.
         -- True if some valid data could be read.
      require
         seconf /= Void
         file_tools.is_readable(seconf)
      local
         sections, se_tools, loadpaths, variables: ITERATOR[STRING]; section, cstr, cppstr, tmp: STRING; c_mode: C_MODE
         tag: STRING
      do
         if ini_parser.section_has(fz_conf_general, fz_conf_tag) then
            tag := ini_parser.section_item(fz_conf_general, fz_conf_tag)
         else
            tag := once "0" -- unknown version (prior to 1.1b4)
         end
         if not tag.is_equal(install_tag) then
            io.put_string("%N*** Warning: your installation file has an old format.%N    Some parts may be missing.%N")
         end
         if not ini_parser.section_has(fz_conf_general, fz_conf_bin)
            or else not ini_parser.section_has(fz_conf_general, fz_conf_sys)
            or else not ini_parser.section_has(fz_conf_general, fz_conf_short)
            or else not ini_parser.section_has(fz_conf_general, fz_conf_os)
            or else not ini_parser.section_has(fz_conf_general, fz_conf_flavor)
          then
            io.put_string(once "The configuration file is invalid; it will be ignored.%N")
         else
            bin_directory := ini_parser.section_item(fz_conf_general, fz_conf_bin)
            sys_directory := ini_parser.section_item(fz_conf_general, fz_conf_sys)
            short_directory := ini_parser.section_item(fz_conf_general, fz_conf_short)
            set_system_name(ini_parser.section_item(fz_conf_general, fz_conf_os))
            set_system_flavor(ini_parser.section_item(fz_conf_general, fz_conf_flavor))
            if ini_parser.section_has(fz_conf_general, fz_conf_jobs) then
               tmp := ini_parser.section_item(fz_conf_general, fz_conf_jobs)
               if tmp.is_integer then
                  set_jobs(tmp.to_integer)
               end
            end
            se_tools := ini_parser.section_key_iterator(fz_conf_se_tools)
            if se_tools /= Void then
               from
                  create tools_names.with_capacity(4)
                  create tools_commands.with_capacity(4)
               until
                  se_tools.is_off
               loop
                  tools_names.add_last(se_tools.item)
                  tools_commands.add_last(ini_parser.section_item(fz_conf_se_tools, se_tools.item))
                  se_tools.next
               end
            end
            loadpaths := ini_parser.section_key_iterator(fz_conf_loadpath)
            if loadpaths /= Void then
               from
                  create extra_loadpath_keys.with_capacity(4)
                  create extra_loadpath_items.with_capacity(4)
               until
                  loadpaths.is_off
               loop
                  extra_loadpath_keys.add_last(loadpaths.item)
                  extra_loadpath_items.add_last(ini_parser.section_item(fz_conf_loadpath, loadpaths.item))
                  loadpaths.next
               end
            end
            variables := ini_parser.section_key_iterator(fz_conf_environment)
            if variables /= Void then
               from
               until
                  variables.is_off
               loop
                  env_vars.add(ini_parser.section_item(fz_conf_environment, variables.item), variables.item)
                  variables.next
               end
            end
            sections := ini_parser.sections_iterator
            if sections /= Void then
               from
                  sections.start
                  create c_modes.with_capacity(8)
                  create unused_c_modes.with_capacity(8)
               until
                  sections.is_off
               loop
                  section := sections.item
                  if not section.is_equal(fz_conf_general) and then not section.is_equal(fz_conf_loadpath)
                     and then not section.is_equal(fz_conf_environment) and then ini_parser.section_has(section, fz_conf_compiler_type) then
                     cstr := ini_parser.section_item(section, fz_conf_compiler_type)
                     if ini_parser.section_has(section, fz_conf_cpp_compiler_type) then
                        cppstr := ini_parser.section_item(section, fz_conf_cpp_compiler_type)
                     else
                        cppstr := fz_conf_undefined
                     end
                     create c_mode.no_template(section, cstr, cppstr)
                     if ini_parser.section_has(section, fz_conf_compiler_path) then
                        tmp := ini_parser.section_item(section, fz_conf_compiler_path)
                        c_mode.set_c_compiler_path(tmp)
                     end
                     if ini_parser.section_has(section, fz_conf_compiler_options) then
                        tmp := ini_parser.section_item(section, fz_conf_compiler_options)
                        c_mode.set_c_compiler_options(tmp)
                     end
                     if ini_parser.section_has(section, fz_conf_linker_path) then
                        tmp := ini_parser.section_item(section, fz_conf_linker_path)
                        c_mode.set_c_linker_path(tmp)
                     end
                     if ini_parser.section_has(section, fz_conf_linker_options) then
                        tmp := ini_parser.section_item(section, fz_conf_linker_options)
                        c_mode.set_c_linker_options(tmp)
                     end
                     if ini_parser.section_has(section, fz_conf_smarteiffel_options) then
                        tmp := ini_parser.section_item(section, fz_conf_smarteiffel_options)
                        c_mode.set_smarteiffel_options(tmp)
                     end
                     if fz_conf_cpp_compiler_type /= Void then
                        if ini_parser.section_has(section, fz_conf_cpp_compiler_path) then
                           tmp := ini_parser.section_item(section, fz_conf_cpp_compiler_path)
                           c_mode.set_cpp_compiler_path(tmp)
                        end
                        if ini_parser.section_has(section, fz_conf_cpp_compiler_options) then
                           tmp := ini_parser.section_item(section, fz_conf_cpp_compiler_options)
                           c_mode.set_cpp_compiler_options(tmp)
                        end
                        if ini_parser.section_has(section, fz_conf_cpp_linker_path) then
                           tmp := ini_parser.section_item(section, fz_conf_cpp_linker_path)
                           c_mode.set_cpp_linker_path(tmp)
                        end
                        if ini_parser.section_has(section, fz_conf_cpp_linker_options) then
                           tmp := ini_parser.section_item(section, fz_conf_cpp_linker_options)
                           c_mode.set_cpp_linker_options(tmp)
                        end
                     end
                     c_modes.add_last(c_mode)
                  end
                  sections.next
               end
            end
            Result := True
         end
      end

   set_default_variables is
      do
         inspect
            system_name
         when "UNIX" then
            default_c_compiler := system_tools.gcc
            default_c_compiler_options.copy(once "-pipe")
            -- even though it's really "g++", gcc is indicated here since it's the name of the rc file.
            default_cpp_compiler := system_tools.gcc
            default_cpp_compiler_options.copy(once "-pipe")
         when "Windows" then
         when "Cygwin" then
            default_c_compiler := system_tools.gcc
            default_c_compiler_options.copy(once "-pipe -O2")
            default_cpp_compiler := system_tools.gcc
            default_cpp_compiler_options.copy(once "-pipe -O2")
         when "BeOS" then
         when "Macintosh" then
         when "Amiga" then
         when "DOS" then
         when "OS2" then
         when "OpenVMS" then
            default_c_compiler := system_tools.open_vms_cc
         when "Elate" then
            default_c_compiler := system_tools.vpcc
            default_cpp_compiler := system_tools.vpcc
         else
            system_name := fz_conf_undefined
         end
         if tools_names = Void then
            tools_names := standard_tools_names
            tools_commands := standard_tools_commands
         else
            ensure_standard_tools_are_set
         end
         if extra_loadpath_keys = Void then
            create extra_loadpath_keys.with_capacity(4)
            create extra_loadpath_items.with_capacity(4)
            add_default_loadpath(once "lib")
            add_default_loadpath(once "tools")
            add_default_loadpath(once "tutorial")
         end
         check
            seconf /= Void
         end
         if seconf = fz_conf_undefined then
            default_main_action := main_action_define_variables
         elseif default_c_compiler = Void then
            default_main_action := main_action_choose_c_compiler
         else
            default_main_action := main_action_install
         end
      end

   ensure_standard_tools_are_set is
      require
         tools_names.count = tools_commands.count
         tools_names /= standard_tools_names
         tools_commands /= standard_tools_commands
      local
         i: INTEGER; tool_name, tool_command: STRING
      do
         from
         until
            standard_tools_commands.is_empty
         loop
            tool_name := standard_tools_names.last
            tool_command := standard_tools_commands.last
            i := tools_commands.first_index_of(tool_command)
            if tools_commands.valid_index(i) then
               if not tool_name.is_equal(tools_names.item(i)) then
                  io.put_string(once "%N*** Warning: the standard tool named %"")
                  io.put_string(tool_name)
                  io.put_string(once "%" has been renamed as %"")
                  io.put_string(tools_names.item(i))
                  io.put_string(once "%".%N    I let it alone, but be careful because people might wonder why you don't%N    use standard names.%N")
                  default_main_action := main_action_display_config
               else
                  default_main_action := main_action_install
               end
            elseif tools_names.has(tool_name) then
               io.put_string(once "%N*** Warning: the standard tool %"")
               io.put_string(tool_command)
               io.put_string(once "%" is missing,%N    but another tool is named %"")
               io.put_string(tool_name)
               io.put_string(once "%" in its place.%N    I hope you know what you are doing because I will not add the standard tool.%N")
               default_main_action := main_action_display_config
            else
               io.put_string(once "%N*** Warning: the standard tool named %"")
               io.put_string(tool_name)
               io.put_string(once "%" is missing. I'll add it for you.%N")
               tools_names.add_last(tool_name)
               tools_commands.add_last(tool_command)
               default_main_action := main_action_display_config
            end
            standard_tools_names.remove_last
            standard_tools_commands.remove_last
         end
      end

   add_default_loadpath (key: STRING) is
      local
         loadpath, k, v, k2: STRING; i: INTEGER
      do
         k := once ""
         k.copy(once "path_")
         k.append(key)
         v := once ""
         basic_directory.connect_to_current_working_directory
         loadpath := basic_directory.last_entry.twin
         basic_directory.disconnect
         if not loadpath.is_empty then
            basic_directory.compute_subdirectory_with(loadpath, key)
            loadpath.copy(basic_directory.last_entry)
            v.copy(loadpath)
            if not loadpath.is_empty then
               basic_directory.compute_file_path_with(loadpath, once "loadpath.se")
               loadpath.copy(basic_directory.last_entry)
            end
         end
         if loadpath.is_empty then
            fatal_problem_description_start
            std_error.put_string(once "%NCould not compute the path to the ")
            std_error.put_string(key)
            std_error.put_string(once " loadpath.se%N%N")
            fatal_problem_description_end
         else
            k2 := once ""
            k2.copy(once "${")
            k2.append(k)
            k2.extend('}')
            i := loadpath.first_substring_index(v)
            loadpath.replace_substring(k2, i, i + v.count - 1)
            env_vars.add(v.twin, k.twin)
            extra_loadpath_keys.add_last(key)
            extra_loadpath_items.add_last(loadpath)
         end
      end

   set_directories is
      do
         directory.scan_current_working_directory
         if not directory.last_scan_status then
            fatal_problem_description_start
            std_error.put_string("Cannot connect to the current directory!%N")
            fatal_problem_description_end
         end
         if not directory.has(once "bin") then
            create bin_directory.copy(directory.path)
         else
            directory.scan_subdirectory(once "bin")
            if directory.last_scan_status then
               create bin_directory.copy(directory.path)
               directory.scan_parent_directory
            else
               directory.scan_current_working_directory
               create bin_directory.copy(directory.path)
            end
         end
         if not directory.has(once "sys") then
            create sys_directory.copy(directory.path)
         else
            directory.scan_subdirectory(once "sys")
            if directory.last_scan_status then
               create sys_directory.copy(directory.path)
               directory.scan_parent_directory
            else
               directory.scan_current_working_directory
               create sys_directory.copy(directory.path)
            end
         end
         if not directory.has(once "short") then
            create short_directory.copy(directory.path)
         else
            directory.scan_subdirectory(once "short")
            if directory.last_scan_status then
               create short_directory.copy(directory.path)
               directory.scan_parent_directory
            else
               directory.scan_current_working_directory
               create short_directory.copy(directory.path)
            end
         end
      end

   create_one_c_mode (a_c_mode: STRING; c_mode_parser, cpp_mode_parser: INI_PARSER): BOOLEAN is
      local
         c_mode: C_MODE
      do
         if not has_c_mode(a_c_mode) then
            if unused_c_modes.is_empty then
               create c_mode.from_template(a_c_mode, c_mode_parser, cpp_mode_parser)
            else
               c_mode := unused_c_modes.first
               unused_c_modes.remove_first
               c_mode.from_template(a_c_mode, c_mode_parser, cpp_mode_parser)
            end
            c_modes.add_last(c_mode)
            Result := True
         end
      end

   create_default_c_modes: BOOLEAN is
         -- Create the default C modes; or only the missing ones.
         -- Returns True if at least one mode was created.
      local
         level: INTEGER
         c_mode_parser, cpp_mode_parser: INI_PARSER
      do
         if c_modes = Void then
            Result := True
            create c_modes.with_capacity(8)
         end
         if unused_c_modes = Void then
            create unused_c_modes.with_capacity(8)
         end
         if default_c_compiler = Void then
            c_mode_parser := template(system_tools.gcc)
         else
            c_mode_parser := template(default_c_compiler)
         end
         if default_cpp_compiler = Void then
            cpp_mode_parser := template(system_tools.gcc)
         else
            cpp_mode_parser := template(default_cpp_compiler)
         end
         from
            level := levels.level_boost
         until
            level > levels.level_all
         loop
            tmp_buffer.copy(levels.level_name(level))
            if level /= levels.level_boost then
               tmp_buffer.append(once "_check")
            end
            Result := create_one_c_mode(tmp_buffer, c_mode_parser, cpp_mode_parser)
            level := level + 1
         end
         Result := create_one_c_mode(once "debug_check", c_mode_parser, cpp_mode_parser)
         if Result then
            default_main_action := main_action_display_config
         end
      ensure
         old c_modes = Void implies c_modes /= Void and then Result
         c_modes.count >= 8 -- there are 7 compilation levels + debug
      end

   has_c_mode (c_mode: STRING): BOOLEAN is
      local
         i: INTEGER
      do
         from
            i := c_modes.lower
         until
            Result or else i > c_modes.upper
         loop
            Result := c_modes.item(i).name.is_equal(c_mode)
            i := i + 1
         end
      end

feature {} -- Variables:
   main_action_exit: INTEGER is 0
         -- The menu proposes to exit the installer

   main_action_define_variables: INTEGER is 1
         -- The menu proposes to define the [General] and [Loadpath] sections

   main_action_choose_c_compiler: INTEGER is 2
         -- The menu proposes to manage the C mode sections (including
         -- choosing the default C compiler)

   main_action_configure_java: INTEGER is 3
         -- The menu proposes to manage the Java sections (options
         -- and used binaries)

   main_action_display_config: INTEGER is 4
         -- The menu proposes to display the configuration items (in order to
         -- verify them before writing the configuration file)

   main_action_create_config: INTEGER is 5
         -- The menu proposes to write the configuration file

   main_action_install: INTEGER is 6
         -- The menu proposes to install Liberty Eiffel

   main_action_redisplay: INTEGER is -1
         -- The menu is asked to redisplay itself (without any action
         -- performed)

   stop: BOOLEAN
         -- Tells the main menu to exit

   default_main_action: INTEGER
         -- Next action to be performed by the main menu: one of the
         -- `main_action_*' variables

   bin_directory: STRING
         -- The directory where the binaries are to be put

   sys_directory: STRING
         -- The directory containing the `runtime' directory

   short_directory: STRING
         -- The directory containing the `short' modes

   germ_directory: STRING
         -- The directory when the germ install is to be found

   noenv_bin_directory: STRING

   noenv_sys_directory: STRING

   noenv_short_directory: STRING

   default_c_compiler: STRING
         -- The default C compiler used to create initial C modes

   default_cpp_compiler: STRING
         -- The default C++ compiler used to create initial C modes

   c_compiler_name: STRING
         -- One element of SYSTEM_TOOLS `compiler_list'

   install_c_mode: STRING
         -- The chosen install mode; default is "boost"

   default_c_compiler_options: STRING
         -- Default options for the C compiler

   default_cpp_compiler_options: STRING
         -- Default options for the C compiler

   jobs: INTEGER
         -- Number of parallel C compiler processes

   c_modes: FAST_ARRAY[C_MODE]
         -- Currently configured C modes (those will be written in the
         -- configuration file)

   unused_c_modes: FAST_ARRAY[C_MODE]
         -- `Trop-plein' of C modes (unused created ones; to avoid too many
         -- memory leaks)

   extra_loadpath_keys: FAST_ARRAY[STRING]
         -- The keys of the loadpaths in the configuration file

   extra_loadpath_items: FAST_ARRAY[STRING]
         -- The loadpaths in the configuration file

   tools_names: FAST_ARRAY[STRING]
         -- The names of the tools managed by the `se' command

   tools_commands: FAST_ARRAY[STRING]
         -- The commands of the tools managed by the `se' command

   env_vars: DICTIONARY[STRING, STRING] is
         -- The known enviroment variables
      once
         create {HASHED_DICTIONARY[STRING, STRING]} Result.make
      end

   default_java_jar_binary: STRING is
         -- Default options for the archiver to use to produce Java ARchives
      once
         Result := jvm_tools.jar
      end

   default_java_jvm_binary: STRING is
         -- Default options for the name of the program providing the Java Virtual Machine
      once
         Result := jvm_tools.java
      end

   default_java_java_compiler: STRING is
         -- Default options forthe extern compiler used to compile Java plugins
      once
         Result := jvm_tools.javac
      end

   java_jar_binary: STRING
         -- The archiver to use to produce Java ARchives

   java_jvm_binary: STRING
         -- The name of the program providing the Java Virtual Machine

   java_java_compiler: STRING
         -- The extern compiler used to compile Java plugins


-- ==================================================================================================== --



feature {} -- Internally handled menu:
   main_menu is
         -- Displays the main menu
      local
         action: INTEGER
      do
         from
         until
            stop
         loop
            action := display_menu
            inspect
               action
            when main_action_define_variables then
               define_variables
               default_main_action := main_action_choose_c_compiler
            when main_action_choose_c_compiler then
               choose_c_compiler
               default_main_action := main_action_configure_java
            when main_action_configure_java then
               configure_java
               default_main_action := main_action_display_config
            when main_action_display_config then
               display_config
               default_main_action := main_action_create_config
            when main_action_create_config then
               write_config
               default_main_action := main_action_install
            when main_action_install then
               do_install
               default_main_action := main_action_exit
            when main_action_exit then
               confirm_exit
            when main_action_redisplay then
               -- Nothing: redisplay the menu
            end
         end
      end

   display_menu: INTEGER is
         -- Displays the menu, and lets the user choose one item
      local
         ok: BOOLEAN
      do
         from
         until
            ok
         loop
            put_dashed_line
            io.put_string(once "{
   Operating system:
}")
            if system_name = Void then
               io.put_string(fz_conf_undefined)
            else
               io.put_string(system_name)
            end
            io.put_string(once "{

   Operating system flavor:
}")
            if system_flavor = Void then
               io.put_string(once "generic")
            else
               io.put_string(system_flavor)
            end
            io.put_string(once "{

   Configuration file name:
}")
            if seconf = Void then
               io.put_string(fz_conf_undefined)
            else
               io.put_string(seconf)
            end
            io.put_string(once "{


1. Define the OS, the configuration file, the default directories and loadpaths
2. Choose the C compilers and options for each C mode
3. Configure Java compilation (currently broken)
4. Display the configuration information
5. Write the configuration file to disk
6. Install Liberty Eiffel

0. Exit
h. Help

Your choice [
            }")
            io.put_integer(default_main_action)
            io.put_string(once "]: ")
            read_line
            entry_buffer.to_lower
            if entry_buffer.is_empty then
               if io.end_of_input then
                  Result := main_action_exit
               else
                  Result := default_main_action
               end
               ok := True
            elseif entry_buffer.first = 'h' or else entry_buffer.first = 'H' then
               show_help
               Result := main_action_redisplay
               ok := True
            elseif entry_buffer.is_integer then
               Result := entry_buffer.to_integer
               ok := Result >= main_action_exit and then Result <= main_action_install
            end
            if not ok then
               io.put_string(once "%NYou typed %"")
               io.put_string(entry_buffer)
               io.put_string(once "%".%NPlease enter a valid number between ")
               io.put_integer(main_action_exit)
               io.put_string(once " and ")
               io.put_integer(main_action_install)
               io.put_string(once ".%N")
            end
         end
      end

feature {} -- Some help
   show_help is
      do
         page_line := 1
         page_string(smart_eiffel.copyright)
         page_string(once "{

This is the Liberty Eiffel installer.

This installer is here to help you. The options of the main menu are the six
steps that can be performed to install Liberty Eiffel. Once an action was perform-
ed, the menu proposes the next one.

You may have seen that, even starting the program, the menu already proposes
some option other than the first! Don't worry! It just means that the first
steps were automatically performed by the installer. You may always choose to
change them, by not choosing the default menu action.

The six steps are:

- First, tell the installer which system Liberty Eiffel is to be installed upon;
  also choose the directories Liberty Eiffel will be installed in, and the path
  to the configuration file to be created. You may also add default
  "loadpath" entries, meaning the files which describe where to find classes,
  by default (this facility is here to help you insert third-party libraries).
  At last, you may define some tools. Those tools must be defined in the
  binaries path defined in this very step.

  Note that this step may be automatically performed. In that case, the OS was
  automatically performed, the configuration file is given a default location,
  the directories too, the default loadpath files and tools are those provided
  by Liberty Eiffel.


- Second, you may want to tell Liberty Eiffel which "C modes" are to be recognized.
  Liberty Eiffel uses a C compiler as back-end; it means that you need a C compiler
  installed on your machine.

  The C modes are ways to tailor how the C compiler must behave; each C modes is
  a C compiler, its path, and its options, and extra options for Liberty Eiffel to
  use.

  Let me explain in more details:

  Liberty Eiffel disposes of many options to tailor how instrumented your execut-
  able will be; wich assertions to check, should Liberty Eiffel add a debugger,
  should Liberty Eiffel generate the "debug" statements, and so on.

  Each "assertion level": boost, require_check, and so on, is associated with
  a default C mode, named after the level. A typical configuration would associ-
  ate the "boost" level with a highly optimizing C compiler (such as "gcc -O3");
  it would, on the other hand, tell Liberty Eiffel to no strip the executable in
  debug mode (and why not adding the Liberty Eiffel Debugger) while asking the C
  compiler to generate the symbol tables.


- Third, you can verify what you entered in the two previous sections. If all is
  ok, then you are ready to install Liberty Eiffel.


- Fourth, the configuration file is to be written at its chosen location.


- Fifth, the Liberty Eiffel tools are installed! They use the configuration file to
  generate themselves; just before compiling the tools, you will be asked which
  C mode should be used for that very task; the default mode is "boost".


- Sixth, last but not least: you can now leave the installer; you are now ready
  to enjoy Liberty Eiffel!


        Happy SmartEiffelling :o)


Type <Enter> to go back to the menu:
         }")
         read_line
      end

feature {} -- Define the main variables and the [General] section:
   define_variables is
      local
         done, first, ok: BOOLEAN; entry: INTEGER
      do
         installed := False
         first := True
         from
         until
            done
         loop
            put_dashed_line
            show_valued_menu(once "1. Set the configuration file name", seconf)
            show_valued_menu(once "2. Set the operating system", system_name)
            show_valued_menu(once "3. Set the operating system flavor", system_flavor)
            show_valued_menu(once "4. Set the Bin directory", bin_directory)
            show_valued_menu(once "5. Set the Sys directory", sys_directory)
            show_valued_menu(once "6. Set the Short directory", short_directory)
            io.put_string(once "7. Manage the [")
            io.put_string(fz_conf_environment)
            io.put_string(once "] section%N")
            io.put_string(once "8. Manage the [")
            io.put_string(fz_conf_loadpath)
            io.put_string(once "] section%N")
            io.put_string(once "9. Manage the [")
            io.put_string(fz_conf_se_tools)
            io.put_string(once "] section%N")
            io.put_string(once "10. Set the number of C processes%N")
            io.put_string(once "{

0. Return to the main menu

Your choice [
}")
            if first then
               io.put_string(once "2]: ")
            else
               io.put_string(once "0]: ")
            end
            read_line
            if entry_buffer.is_empty then
               if first then
                  2.append_in(entry_buffer)
               else
                  0.append_in(entry_buffer)
               end
            end
            if entry_buffer.is_number then
               entry := entry_buffer.to_integer
               if entry < 0 or else entry > 10 then
                  io.put_string(once "Please enter a number between 0 and 10.%N")
               else
                  inspect
                     entry
                  when 1 then
                     ask(once "configuration file name")
                     if not entry_buffer.is_empty then
                        seconf_buffer.copy(entry_buffer)
                        if seconf = fz_conf_undefined then
                           io.put_string(once "*** Don't forget to set the %"SmartEiffel%" environment variable to%N*** ")
                           io.put_string(seconf_buffer)
                        end
                        seconf := seconf_buffer
                        ;(create {SYSTEM}).set_environment_variable("SmartEiffel", seconf)
                     end
                  when 2 then
                     set_system_name(choice_in(once "%NPlease enter the new value of the operating system", system_tools.system_list, system_name))
                  when 3 then
                     ask(once "operating system flavor")
                     if not entry_buffer.is_empty then
                        set_system_flavor(entry_buffer)
                     else
                        set_system_flavor(once "generic")
                     end
                  when 4 then
                     ask_directory(once "Bin directory", bin_directory, noenv_bin_directory, True)
                     system_tools.set_bin_directory(noenv_bin_directory)
                  when 5 then
                     ask_directory(once "Sys directory", sys_directory, noenv_sys_directory, False)
                     system_tools.set_sys_directory(noenv_sys_directory)
                  when 6 then
                     ask_directory(once "Short directory", short_directory, noenv_short_directory, False)
                     system_tools.set_short_directory(noenv_short_directory)
                  when 7 then
                     manage_environment
                  when 8 then
                     manage_extra_loadpaths
                  when 9 then
                     manage_tools
                  when 10 then
                     from
                        ok := False
                     until
                        ok
                     loop
                        ask(once "number of parallel C processes")
                        if entry_buffer.is_empty then
                           ok := True
                        else
                           if entry_buffer.is_integer then
                              entry := entry_buffer.to_integer
                           else
                              entry := 0
                           end
                           if entry <= 0 then
                              io.put_string(once "Please enter a positive non-null number.%N")
                           else
                              set_jobs(entry)
                              ok := True
                           end
                        end
                     end
                  when 0 then
                     done := True
                  end
                  first := False
               end
            else
               io.put_string(once "Please enter a number between 0 and 10.%N")
            end
         end
      ensure
         not installed
      end

   ask_directory (prompt, dir, noenv_dir: STRING; ask_create: BOOLEAN) is
      require
         prompt /= Void
         dir /= Void
         noenv_dir /= Void
      local
         noenv_buffer: STRING
      do
         noenv_buffer := once ""
         ask(prompt)
         noenv_buffer.copy(entry_buffer)
         system_tools.environment_variable_substitution(Void, noenv_buffer)
         directory.scan(noenv_buffer)
         if not entry_buffer.is_empty then
            if not directory.last_scan_status then
               directory.scan_current_working_directory
               if directory.has(noenv_buffer) then
                  directory.scan_subdirectory(noenv_buffer)
               else
                  directory.scan(noenv_buffer)
               end
            end
            if directory.last_scan_status then
               dir.copy(entry_buffer)
               noenv_dir.copy(noenv_buffer)
            elseif ask_create then
               io.put_string(once "This directory does not exist; should I %
                                  %create it? [Y|n] ")
               read_line
               if entry_buffer.first.to_lower = 'y' then
                  dir.copy(entry_buffer)
                  noenv_dir.copy(noenv_buffer)
               end
            else
               bad_directory(entry_buffer)
            end
         end
      end

   show_valued_menu (menu, value: STRING) is
      do
         show_default_valued_menu(menu, value, Void)
      end

   ask (what: STRING) is
      do
         io.put_string(once "%NPlease enter the new value of the ")
         io.put_string(what)
         io.put_string(once ":%N")
         read_line
      end

   choice_in (title: STRING; names: COLLECTION[STRING]; default_choice: STRING): STRING is
         -- Force some item to be selected interactively.
         -- A Void `default_choice' means that an explicit choice must be made.
      require
         default_choice = Void or else names.has(default_choice)
      local
         i: INTEGER; multiple: BOOLEAN; w, n: STRING
      do
         from
         until
            Result /= Void
         loop
            io.put_string(title)
            io.put_string(once ":%N  ")
            from
               i := names.lower
            until
               i > names.upper
            loop
               n := names.item(i)
               if default_choice /= Void and then n.same_as(default_choice) then
                  io.put_character('<')
                  io.put_string(n)
                  io.put_character('>')
               else
                  io.put_string(n)
               end
               i := i + 1
               if i <= names.upper then
                  io.put_string(once ", ")
               end
            end
            io.put_string(once "%N? ")
            read_line
            if entry_buffer.is_empty then
               Result := names.item(names.first_index_of(default_choice))
            else
               from
                  n := once "                "
                  multiple := False
                  i := names.lower
                  w := entry_buffer
                  w.to_lower
               until
                  i > names.upper
               loop
                  n.copy(names.item(i))
                  n.to_lower
                  if w.same_as(n) then
                     Result := names.item(i)
                     i := names.upper
                  elseif n.has_prefix(w) then
                     if Result /= Void then
                        Result := Void
                        multiple := True
                     else
                        Result := names.item(i)
                     end
                  end
                  i := i + 1
               end
               if Result = Void then
                  io.put_string(once "%"")
                  io.put_string(w)
                  if multiple then
                     io.put_string("%" is ambiguous.%N")
                  else
                     io.put_string(once "%" is not a valid choice.%N")
                  end
               end
            end
         end
      ensure
         Result /= Void
         names.fast_has(Result)
      end

   bad_directory (path: STRING) is
      do
         io.put_string(once "%N*** ")
         io.put_string(path)
         io.put_string(once " does not exist or is not a directory:%N%
                            %    this value is ignored.%N")
      end

   manage_environment is
      local
         i, entry: INTEGER; ok, done, first: BOOLEAN
      do
         first := True
         from
         until
            done
         loop
            put_dashed_line
            from
               i := env_vars.lower
            until
               i > env_vars.upper
            loop
               io.put_string(env_vars.key(i))
               io.put_string(once ": ")
               io.put_string(env_vars.item(i))
               io.put_new_line
               i := i + 1
            end
            io.put_new_line
            io.put_integer(1)
            io.put_string(once ". Add or modify an environment variable%N")
            io.put_integer(2)
            io.put_string(once ". Remove an environment variable%N%N")
            io.put_integer(0)
            io.put_string(once ". Return to the previous menu%N%NYour choice [")
            if first then
               io.put_integer(1)
            else
               io.put_integer(0)
            end
            io.put_string(once "]: ")
            read_line
            ok := False
            if entry_buffer.is_empty then
               if first then
                  1.append_in(entry_buffer)
               else
                  0.append_in(entry_buffer)
               end
            end
            if entry_buffer.is_integer then
               entry := entry_buffer.to_integer
               if entry >= 0 and then entry <= 2 then
                  ok := True
                  inspect
                     entry
                  when 0 then
                     done := True
                  when 2 then
                     unset_env_var
                  when 1 then
                     set_env_var
                  end
               end
            end
            if not ok then
               io.put_string(once "%N*** Please enter a nember between 0 and 2.%N")
            end
         end
      end

   set_env_var is
      local
         k, v: STRING
      do
         ask(once "environment variable name")
         if not entry_buffer.is_empty then
            k := once ""
            k.copy(entry_buffer)
            v := env_vars.reference_at(k)
            ask(once "environment variable value")
            system_tools.environment_variable_substitution(Void, entry_buffer)
            if v = Void then
               env_vars.add(entry_buffer.twin, k.twin)
            else
               v.copy(entry_buffer)
            end
         end
      end

   unset_env_var is
      local
         v: STRING
      do
         ask(once "environment variable name")
         if not entry_buffer.is_empty then
            v := env_vars.reference_at(entry_buffer)
            if v /= Void then
               v.clear_count
            end
         end
      end

   manage_tools is
      local
         i, entry: INTEGER; ok, done, first: BOOLEAN
      do
         first := True
         from
         until
            done
         loop
            put_dashed_line
            if tools_names /= Void then
               from
                  i := tools_names.lower
               until
                  i > tools_names.upper
               loop
                  io.put_integer(i + 1)
                  io.put_string(once ". ")
                  io.put_string(tools_names.item(i))
                  io.put_string(once ": ")
                  io.put_string(tools_commands.item(i))
                  io.put_new_line
                  i := i + 1
               end
            end
            io.put_new_line
            io.put_integer(i + 1)
            io.put_string(once ". Add a tool%N")
            io.put_integer(i + 2)
            io.put_string(once ". Remove a tool%N%N")
            io.put_integer(0)
            io.put_string(once ". Return to the previous menu%N%NYour choice [")
            if first then
               io.put_integer(i + 1)
            else
               io.put_integer(0)
            end
            io.put_string(once "]: ")
            read_line
            ok := False
            if entry_buffer.is_empty then
               if first then
                  (i + 1).append_in(entry_buffer)
               else
                  0.append_in(entry_buffer)
               end
            end
            if entry_buffer.is_integer then
               entry := entry_buffer.to_integer
               if entry >= 0 and then entry <= i + 2 then
                  ok := True
                  inspect
                     entry - i
                  when 2 then
                     remove_tool
                  when 1 then
                     add_tool
                  else
                     if entry = 0 then
                        done := True
                     else
                        modify_tool(entry - 1)
                     end
                  end
               end
            end
            if not ok then
               io.put_string(once "%N*** Please enter a nember between 0 and ")
               io.put_integer(i + 2)
               io.put_string(once ".%N")
            end
         end
      end

   add_tool is
      do
         ask(once "tool name (in the se command)")
         if not entry_buffer.is_empty then
            if tools_names = Void then
               create tools_names.with_capacity(4)
            end
            if tools_commands = Void then
               create tools_commands.with_capacity(4)
            end
            tools_names.add_last(strings.new_twin(entry_buffer))
            ask(once "tool command name (must be in ${bin})")
            tools_commands.add_last(strings.new_twin(entry_buffer))
         end
      end

   remove_tool is
      local
         ok: BOOLEAN; entry, max: INTEGER; lost_tool_name, lost_tool_command: STRING
      do
         from
            max := tools_names.upper + 1
         until
            ok
         loop
            ask(once "tool number")
            if entry_buffer.is_empty then
               io.put_string(once "(nothing removed)%N")
               ok := True
            else
               if entry_buffer.is_integer then
                  entry := entry_buffer.to_integer
                  if entry >= 1 and then entry <= max then
                     ok := True
                     lost_tool_name := tools_names.item(entry - 1)
                     lost_tool_command := tools_commands.item(entry - 1)
                     io.put_string(once "removing %"")
                     io.put_string(lost_tool_name)
                     io.put_string(once "%".%N")
                     tools_names.remove(entry - 1)
                     tools_commands.remove(entry - 1)
                     strings.recycle(lost_tool_name)
                     strings.recycle(lost_tool_command)
                  end
               end
               if not ok then
                  io.put_string(once "%N*** Please enter a valid number between 1 and ")
                  io.put_integer(max)
                  io.put_string(once " (or empty to abort).%N")
               end
            end
         end
      end

   modify_tool (i: INTEGER) is
      do
         io.put_string(once "This tool (")
         io.put_string(tools_names.item(i))
         io.put_string(once ") is currently defined as command ")
         io.put_string(tools_commands.item(i))
         io.put_character('.')
         ask(once "tool command")
         if not entry_buffer.is_empty then
            tools_commands.item(i).copy(entry_buffer)
         end
      end

   manage_extra_loadpaths is
      local
         i, entry: INTEGER; ok, done, first: BOOLEAN
      do
         first := True
         from
         until
            done
         loop
            put_dashed_line
            if extra_loadpath_keys /= Void then
               from
                  i := extra_loadpath_keys.lower
               until
                  i > extra_loadpath_keys.upper
               loop
                  io.put_integer(i + 1)
                  io.put_string(once ". ")
                  io.put_string(extra_loadpath_keys.item(i))
                  io.put_string(once ": ")
                  io.put_string(extra_loadpath_items.item(i))
                  io.put_new_line
                  i := i + 1
               end
            end
            io.put_new_line
            io.put_integer(i + 1)
            io.put_string(once ". Add an extra loadpath%N")
            io.put_integer(i + 2)
            io.put_string(once ". Remove an extra loadpath%N%N")
            io.put_integer(0)
            io.put_string(once ". Return to the previous menu%N%NYour choice [")
            if first then
               io.put_integer(i + 1)
            else
               io.put_integer(0)
            end
            io.put_string(once "]: ")
            read_line
            ok := False
            if entry_buffer.is_empty then
               if first then
                  (i + 1).append_in(entry_buffer)
               else
                  0.append_in(entry_buffer)
               end
            end
            if entry_buffer.is_integer then
               entry := entry_buffer.to_integer
               if entry >= 0 and then entry <= i + 2 then
                  ok := True
                  inspect
                     entry - i
                  when 2 then
                     remove_extra_loadpath
                  when 1 then
                     add_extra_loadpath
                  else
                     if entry = 0 then
                        done := True
                     else
                        modify_extra_loadpath(entry - 1)
                     end
                  end
               end
            end
            if not ok then
               io.put_string(once "%N*** Please enter a valid number between 0 and ")
               io.put_integer(i + 2)
               io.put_string(once ".%N")
            end
         end
      end

   add_extra_loadpath is
      do
         ask(once "loadpath key")
         if not entry_buffer.is_empty then
            if extra_loadpath_keys = Void then
               create extra_loadpath_keys.with_capacity(4)
            end
            if extra_loadpath_items = Void then
               create extra_loadpath_items.with_capacity(4)
            end
            extra_loadpath_keys.add_last(strings.new_twin(entry_buffer))
            ask(once "loadpath value")
            extra_loadpath_items.add_last(strings.new_twin(entry_buffer))
         end
      end

   remove_extra_loadpath is
      local
         ok: BOOLEAN; entry, max: INTEGER; lost_loadpath_key, lost_loadpath_item: STRING
      do
         from
            max := extra_loadpath_keys.upper + 1
         until
            ok
         loop
            ask(once "loadpath number")
            if entry_buffer.is_empty then
               io.put_string(once "(nothing removed)%N")
               ok := True
            else
               if entry_buffer.is_integer then
                  entry := entry_buffer.to_integer
                  if entry >= 1 and then entry <= max then
                     ok := True
                     lost_loadpath_key := extra_loadpath_keys.item(entry - 1)
                     lost_loadpath_item := extra_loadpath_items.item(entry - 1)
                     io.put_string(once "removing %"")
                     io.put_string(lost_loadpath_key)
                     io.put_string(once "%".%N")
                     extra_loadpath_keys.remove(entry - 1)
                     extra_loadpath_items.remove(entry - 1)
                     strings.recycle(lost_loadpath_key)
                     strings.recycle(lost_loadpath_item)
                  end
               end
               if not ok then
                  io.put_string(once "%N*** Please enter a valid number between 1 and ")
                  io.put_integer(max)
                  io.put_string(once " (or empty to abort).%N")
               end
            end
         end
      end

   modify_extra_loadpath (i: INTEGER) is
      do
         io.put_string(once "This extra loadpath (")
         io.put_string(extra_loadpath_keys.item(i))
         io.put_string(once ") is: ")
         io.put_string(extra_loadpath_items.item(i))
         io.put_character('.')
         ask(once "loadpath")
         if not entry_buffer.is_empty then
            extra_loadpath_items.item(i).copy(entry_buffer)
         end
      end

feature {} -- Define the C modes:
   choose_c_compiler is
      local
         done, first: BOOLEAN; def: STRING; i, entry: INTEGER
      do
         installed := False
         first := True
         from
         until
            done
         loop
            put_dashed_line
            io.put_string(once "Default compiler is ")
            if default_c_compiler = Void then
               io.put_string(fz_conf_undefined)
            else
               io.put_string(default_c_compiler)
            end
            io.put_new_line
            io.put_new_line
            from
               i := c_modes.lower
            until
               i > c_modes.upper
            loop
               io.put_integer(i + 1)
               io.put_string(once ". Modify the %"")
               io.put_string(c_modes.item(i).name)
               io.put_string(once "%" C mode%N")
               i := i + 1
            end
            i := i + 1
            io.put_new_line
            io.put_integer(i)
            io.put_string(once ". Create a new C mode%N%N")
            io.put_integer(i + 1)
            show_valued_menu(once ". Set the default compilers", default_c_compiler)
            io.put_integer(i + 2)
            show_valued_menu(once ". Set the default compilers options", default_c_compiler_options)
            io.put_new_line
            io.put_integer(0)
            io.put_string("{
. Return to the main menu

Your choice [
            }")
            if first then
               io.put_integer(i + 1)
            else
               io.put_integer(0)
            end
            io.put_string(once "]: ")
            read_line
            if entry_buffer.is_empty then
               if first then
                  -- Default action the first time you enter this menu, is to
                  -- choose the default compiler. It delays the "enter to
                  -- install" action, but just a bit.
                  (i + 1).append_in(entry_buffer)
               else
                  0.append_in(entry_buffer)
               end
            end
            if entry_buffer.is_integer then
               entry := entry_buffer.to_integer
               if entry < 0 or else entry > i + 2 then
                  io.put_string(once "Please enter a valid number between 0 and ")
                  io.put_integer(i + 2)
                  io.put_string(once ".%N")
               else
                  inspect
                     entry - i
                  when 2 then
                     ask(once "default C compiler options")
                     default_c_compiler_options.copy(entry_buffer)
                     from
                        i := c_modes.lower
                     until
                        i > c_modes.upper
                     loop
                        if c_modes.item(i).c_linker_path /= Void and then c_modes.item(i).c_linker_path.count > 0 then
                           c_modes.item(i).set_c_linker_options(default_c_compiler_options)
                        else
                           c_modes.item(i).set_c_linker_options(Void)
                        end
                        c_modes.item(i).set_c_compiler_options(default_c_compiler_options)
                        i := i + 1
                     end
                     default_cpp_compiler_options.copy(default_c_compiler_options)
                     if default_cpp_compiler /= Void and then default_cpp_compiler /= fz_none then
                        ask(once "default C++ compiler options")
                        default_cpp_compiler_options.copy(entry_buffer)
                        from
                           i := c_modes.lower
                        until
                           i > c_modes.upper
                        loop
                           if c_modes.item(i).cpp_linker_path /= Void and then c_modes.item(i).cpp_linker_path.count > 0 then
                              c_modes.item(i).set_cpp_linker_options(default_cpp_compiler_options)
                           else
                              c_modes.item(i).set_cpp_linker_options(Void)
                           end
                           c_modes.item(i).set_cpp_compiler_options(default_cpp_compiler_options)
                           i := i + 1
                        end
                     end
                  when 1 then
                     def := default_c_compiler
                     default_c_compiler := choice_in(once "%NPlease enter the new value of the default C compiler", c_compiler_list, def)
                     check
                        default_c_compiler /= Void
                     end
                     default_c_compiler_options.clear_count
                     if cpp_compiler_list.has(default_c_compiler) then
                        default_cpp_compiler := default_c_compiler
                        default_cpp_compiler_options.copy(default_c_compiler_options)
                     else
                        io.put_string(once "%NThis compiler has no known C++ capabilities.%N%
                                           % In order to compile C++ programs,%
                                           % please also pick a C++ compiler.%N%N%
                                           %Type <Enter> if you don't know what%
                                           % this is all about.%N")
                        def := default_cpp_compiler
                        if def = Void or else def = fz_conf_undefined then
                           def := fz_none
                        end
                        default_cpp_compiler := choice_in(once "%NPlease enter the new value of the default C++ compiler", cpp_compiler_list, def)
                        if default_cpp_compiler = fz_none then
                           default_cpp_compiler := fz_conf_undefined
                        end
                        check
                           default_cpp_compiler /= Void
                        end
                        default_cpp_compiler_options.clear_count
                     end
                     read_compiler_template(True)
                  when 0 then
                     new_c_mode
                  else
                     if entry = 0 then
                        done := True
                     else
                        modify_c_mode(entry - 1)
                     end
                  end
               end
               first := False
            else
               io.put_string(once "Please enter a valid number between 0 and")
               io.put_integer(i + 2)
               io.put_string(once ".%N")
            end
         end
      ensure
         not installed
      end

   read_compiler_template (clean: BOOLEAN) is
         -- if `clean' is True, then the known C_modes are removed first.
      local
         i: INTEGER; dummy: BOOLEAN; c_mode_parser, cpp_mode_parser: INI_PARSER; c_mode: C_MODE
         cmode: STRING; sections: ITERATOR[STRING]
      do
         if clean then
            from
               i := c_modes.lower
            until
               i > c_modes.upper
            loop
               unused_c_modes.add_last(c_modes.item(i))
               i := i + 1
            end
            c_modes.clear_count
         end
         c_mode_parser := template(default_c_compiler)
         cpp_mode_parser := template(default_cpp_compiler)
         if c_mode_parser = Void then
            dummy := create_default_c_modes
         else
            from
               sections := c_mode_parser.sections_iterator
            until
               sections.is_off
            loop
               cmode := sections.item
               c_mode := Void
               if not clean then
                  from
                     i := c_modes.lower
                  until
                     c_mode /= Void or else i > c_modes.upper
                  loop
                     c_mode := c_modes.item(i)
                     if not c_mode.name.is_equal(cmode) then
                        c_mode := Void
                     end
                     i := i + 1
                  end
               end
               if c_mode = Void then
                  if unused_c_modes.is_empty then
                     create c_mode.from_template(cmode, c_mode_parser, cpp_mode_parser)
                  else
                     c_mode := unused_c_modes.first
                     unused_c_modes.remove_first
                     c_mode.from_template(cmode, c_mode_parser, cpp_mode_parser)
                  end
                  c_modes.add_last(c_mode)
               end
               check
                  c_mode /= Void
               end
               sections.next
            end
         end
      end

   new_c_mode is
      local
         i: INTEGER; ok: BOOLEAN
      do
         ask(once "new C mode name")
         if entry_buffer.is_equal(fz_conf_general)
            or else entry_buffer.is_equal(fz_conf_loadpath)
            or else entry_buffer.is_equal(fz_conf_environment)
          then
            io.put_string(once "%N*** This section name is reserved. Please choose another.%N")
         else
            from
               i := c_modes.lower
               ok := True
            until
               not ok or else i > c_modes.upper
            loop
               if c_modes.item(i).name.is_equal(entry_buffer) then
                  ok := False
                  io.put_string(once "%N*** This C mode already exists. Please choose another.%N")
               end
               i := i + 1
            end
            if ok then
               c_modes.add_last(create {C_MODE}.from_template(entry_buffer, template(default_c_compiler), template(default_cpp_compiler)))
               modify_c_mode(c_modes.upper)
            end
         end
      end

   modify_c_mode (index: INTEGER) is
      require
         c_modes.valid_index(index)
      local
         c_mode: C_MODE; default_c_linker, default_cpp_linker: STRING; done, first, has_cpp: BOOLEAN
         max, i, entry: INTEGER
      do
         first := True
         from
         until
            done
         loop
            c_mode := c_modes.item(index)
            has_cpp := c_mode.cpp_compiler_type /= Void
            if has_cpp then
               max := 11
            else
               max := 7
            end
            put_dashed_line
            io.put_string(once "C mode: ")
            io.put_string(c_mode.name)
            io.put_new_line
            io.put_new_line
            if c_mode.c_linker_path = Void then
               default_c_linker := c_mode.c_compiler_path
               if default_c_linker = Void then
                  default_c_linker := c_mode.c_compiler_type
               end
            end
            if c_mode.cpp_linker_path = Void then
               default_cpp_linker := c_mode.cpp_compiler_path
               if default_cpp_linker = Void then
                  default_cpp_linker := c_mode.cpp_compiler_type
               end
            end
            show_default_valued_menu(once "1.  Change the C compiler type", c_mode.c_compiler_type, Void)
            show_default_valued_menu(once "2.  Change the C compiler executable name", c_mode.c_compiler_path, c_mode.c_compiler_type)
            show_default_valued_menu(once "3.  Change the C compiler options", c_mode.c_compiler_options, Void)
            show_default_valued_menu(once "4.  Change the C linker executable name", c_mode.c_linker_path, default_c_linker)
            show_default_valued_menu(once "5.  Change the C linker options", c_mode.c_linker_options, Void)
            show_default_valued_menu(once "6.  Change the C++ compiler type", c_mode.cpp_compiler_type, Void)
            if has_cpp then
               show_default_valued_menu(once "7.  Change the C++ compiler executable name", c_mode.cpp_compiler_path, c_mode.cpp_compiler_type)
               show_default_valued_menu(once "8.  Change the C++ compiler options", c_mode.cpp_compiler_options, Void)
               show_default_valued_menu(once "9.  Change the C++ linker executable name", c_mode.cpp_linker_path, default_cpp_linker)
               show_default_valued_menu(once "10. Change the C++ linker options", c_mode.cpp_linker_options, Void)
               show_default_valued_menu(once "11. Change the Liberty Eiffel extra options", c_mode.smarteiffel_options, Void)
               io.put_string(once "{

0.  Return to the previous menu

Your choice [
            }")
            else
               show_default_valued_menu(once "7. Change the Liberty Eiffel extra options", c_mode.smarteiffel_options, Void)
               io.put_string(once "{

0.  Return to the previous menu

Your choice [
            }")
            end
            if first then
               io.put_string(once "1]: ")
            else
               io.put_string(once "0]: ")
            end
            read_line
            if entry_buffer.is_empty then
               if first then
                  1.append_in(entry_buffer)
               else
                  0.append_in(entry_buffer)
               end
            end
            if entry_buffer.is_number then
               entry := entry_buffer.to_integer
               if entry >= 0 and then entry <= max then
                  inspect
                     entry
                  when 0 then
                     done := True
                  when 1 then
                     io.put_string(once "Known C compilers: ")
                     from
                        i := c_compiler_list.lower
                     until
                        i > c_compiler_list.upper
                     loop
                        if i > c_compiler_list.lower then
                           io.put_string(once ", ")
                        end
                        io.put_string(c_compiler_list.item(i))
                        i := i + 1
                     end
                     io.put_new_line
                     ask(once "C compiler type")
                     if not entry_buffer.is_empty then
                        if c_compiler_list.has(entry_buffer) then
                           c_mode.from_template(c_mode.name, rc_template(entry_buffer, Void), c_mode.cpp_file)
                        else
                           io.put_string(once "%N*** Unknown C compiler.%N")
                        end
                     end
                  when 2 then
                     ask(once "C compiler executable name")
                     if not entry_buffer.is_empty then
                        c_mode.set_c_compiler_path(entry_buffer)
                        if not file_tools.is_readable(entry_buffer) then
                           io.put_string(once "*** Warning: unable to check the validity of the compiler executable name%N    (porbably because it is not fully specified.%N")
                        end
                     end
                  when 3 then
                     ask(once "C compiler options")
                     c_mode.set_c_compiler_options(entry_buffer)
                  when 4 then
                     ask(once "C linker executable name")
                     if not entry_buffer.is_empty then
                        c_mode.set_c_linker_path(entry_buffer)
                        c_mode.set_c_linker_options(Void) --|*** PR (10/11/2004) why?
                        if not file_tools.is_readable(entry_buffer) then
                           io.put_string(once "*** Warning: unable to check the validity of the linker executable name%N    (porbably because it is not fully specified.%N")
                        end
                     end
                  when 5 then
                     ask(once "C linker options")
                     c_mode.set_c_linker_options(entry_buffer)
                  when 6 then
                     io.put_string(once "Known C++ compilers: ")
                     from
                        i := cpp_compiler_list.lower
                     until
                        i > cpp_compiler_list.upper
                     loop
                        if i > cpp_compiler_list.lower then
                           io.put_string(once ", ")
                        end
                        io.put_string(cpp_compiler_list.item(i))
                        i := i + 1
                     end
                     io.put_new_line
                     ask(once "C++ compiler type")
                     if not entry_buffer.is_empty then
                        if entry_buffer.is_equal(fz_none) then
                           c_mode.from_template(c_mode.name, c_mode.c_file, Void)
                        elseif cpp_compiler_list.has(entry_buffer) then
                           c_mode.from_template(c_mode.name, c_mode.c_file, rc_template(entry_buffer, Void))
                        else
                           io.put_string(once "%N*** Unknown C++ compiler.%N")
                        end
                     end
                  when 7 then
                     if has_cpp then
                        ask(once "C++ compiler executable name")
                        if not entry_buffer.is_empty then
                           c_mode.set_cpp_compiler_path(entry_buffer)
                           if not file_tools.is_readable(entry_buffer) then
                              io.put_string(once "*** Warning: unable to check the validity of the compiler executable name%N    (porbably because it is not fully specified.%N")
                           end
                        end
                     else
                        ask(once "Liberty Eiffel options")
                        c_mode.set_smarteiffel_options(entry_buffer)
                     end
                  when 8 then
                     ask(once "C++ compiler options")
                     c_mode.set_cpp_compiler_options(entry_buffer)
                  when 9 then
                     ask(once "C++ linker executable name")
                     if not entry_buffer.is_empty then
                        c_mode.set_cpp_linker_path(entry_buffer)
                        c_mode.set_cpp_linker_options(Void) --|*** PR (10/11/2004) why?
                        if not file_tools.is_readable(entry_buffer) then
                           io.put_string(once "*** Warning: unable to check the validity of the linker executable name%N    (porbably because it is not fully specified.%N")
                        end
                     end
                  when 10 then
                     ask(once "C++ linker options")
                     c_mode.set_cpp_linker_options(entry_buffer)
                  when 11 then
                     ask(once "Liberty Eiffel options")
                     c_mode.set_smarteiffel_options(entry_buffer)
                  end
                  first := False
               else
                  io.put_string(once "%N*** Please enter a number between 1 and ")
                  io.put_integer(max)
                  io.put_string(once ".%N")
               end
            else
               io.put_string(once "%N*** Please enter a number between 1 and ")
               io.put_integer(max)
               io.put_string(once ".%N")
            end
         end
      end

   show_default_valued_menu (menu, value, default_value: STRING) is
      do
         io.put_string(menu)
         io.put_string(once " (")
         if value = Void or else value.is_empty then
            if default_value = Void then
               io.put_string(once "undefined")
            else
               io.put_string(once "default: ")
               io.put_string(default_value)
            end
         else
            io.put_string(value)
         end
         io.put_string(once ")%N")
      end

feature {} -- Define the Java parameters:
   init_defaults_for_java is
      do
         java_jar_binary := default_java_jar_binary
         java_jvm_binary := default_java_jvm_binary
         java_java_compiler := default_java_java_compiler
      end

   configure_java is
      local
         done: BOOLEAN
         entry : INTEGER
      do
         from
         until
            done
         loop
            put_dashed_line
            show_default_valued_menu(once "1.  Change the Java ARchiver executable name", java_jar_binary, default_java_jar_binary)
            show_default_valued_menu(once "2.  Change the Java Virtual Machine", java_jvm_binary, default_java_jvm_binary)
            show_default_valued_menu(once "3.  Change the extern Java compiler", java_java_compiler, default_java_java_compiler)
            io.put_string(once "{

0. Return to the main menu

Your choice [0]:
}")
            read_line
            if entry_buffer.is_empty then
               0.append_in(entry_buffer)
            end
            if entry_buffer.is_number then
               entry := entry_buffer.to_integer
               if entry < 0 or else entry > 9 then
                  io.put_string(once "Please enter a number between 0 and 3.%N")
               else
                  inspect
                     entry
                  when 1 then
                     java_jar_binary := choice_in(once "%NPlease enter the name of the new Java Archiver program", jvm_tools.jar_list, default_java_jar_binary)
                  when 2 then
                     java_jvm_binary := choice_in(once "%NPlease enter the name of the new Java Archiver program", jvm_tools.jvm_list, default_java_jvm_binary)
                  when 3 then
                     java_java_compiler := choice_in(once "%NPlease enter the name of the new Java Archiver program", jvm_tools.compiler_list, default_java_java_compiler)
                  when 0 then
                     done := True
                  end
               end
            else
               io.put_string(once "Please enter a number between 0 and 3.%N")
            end
         end
      end


-- ==================================================================================================== --



feature {} -- The installation itself:
   installed: BOOLEAN

   do_install is
      local
         must_install: BOOLEAN
      do
         must_install := not installed
         if installed then
            io.put_string(once "%NLiberty Eiffel is already installed with the current options. Do you want to%N%
                               %install Liberty Eiffel again? [no] ")
            read_line
            if not entry_buffer.is_empty then
               entry_buffer.to_lower
               must_install := entry_buffer.first = 'y'
            else
               io.put_string(once "OK, aborting.%N")
            end
         end
         if must_install then
            io.put_new_line
            set_seconf
            compile_all
         end
      ensure
         installed
      end

   display_config is
         -- Displays a short summary of the current installer state and
         -- options
      local
         i: INTEGER; c_mode: C_MODE; j: STRING
      do
         page_line := 1
         put_dashed_line

         page_parameter(1, once "Configuration file name", seconf)
         page_parameter(1, once "Operating system", system_name)
         page_parameter(1, once "OS flavor", system_flavor)
         if jobs > 0 then
            j := once ""
            j.clear_count
            jobs.append_in(j)
         end
         page_parameter(1, once "Number of parallel C processes", j)
         page_parameter(1, once "Bin directory", bin_directory)
         page_parameter(1, once "Sys directory", sys_directory)
         page_parameter(1, once "Short directory", short_directory)

         from
            i := c_modes.lower
         until
            i > c_modes.upper
         loop
            c_mode := c_modes.item(i)
            page_char('%N')
            page_parameter(1, once "C mode", c_mode.name)
            page_parameter(2, once "C compiler type", c_mode.c_compiler_type)
            if c_mode.c_compiler_path /= Void then
               page_parameter(2, once "C compiler executable name", c_mode.c_compiler_path)
            end
            if c_mode.c_compiler_options /= Void then
               page_parameter(2, once "C compiler options", c_mode.c_compiler_options)
            end
            if c_mode.c_linker_path /= Void then
               page_parameter(2, once "C linker executable name", c_mode.c_linker_path)
            end
            if c_mode.c_linker_options /= Void then
            page_parameter(2, once "C linker options", c_mode.c_linker_options)
            end
            if c_mode.cpp_compiler_type /= Void and then c_mode.cpp_compiler_type /= fz_none then
               page_parameter(2, once "C++ compiler type", c_mode.cpp_compiler_type)
               if c_mode.cpp_compiler_path /= Void then
                  page_parameter(2, once "C++ compiler executable name", c_mode.cpp_compiler_path)
               end
               if c_mode.cpp_compiler_options /= Void then
                  page_parameter(2, once "C++ compiler options", c_mode.cpp_compiler_options)
               end
               if c_mode.cpp_linker_path /= Void then
                  page_parameter(2, once "C++ linker executable name", c_mode.cpp_linker_path)
               end
               if c_mode.cpp_linker_options /= Void then
                  page_parameter(2, once "C++ linker options", c_mode.cpp_linker_options)
               end
            end
            if c_mode.smarteiffel_options /= Void then
               page_parameter(2, once "Liberty Eiffel options", c_mode.smarteiffel_options)
            end
            i := i + 1
         end
         from
            i := env_vars.lower
            page_char('%N')
         until
            i > env_vars.upper
         loop
            page_env_variable(env_vars.key(i), env_vars.item(i))
            i := i + 1
         end
         if extra_loadpath_keys /= Void then
            page_section_title(fz_conf_loadpath)
            from
               i := extra_loadpath_keys.lower
            until
               i > extra_loadpath_keys.upper or else extra_loadpath_keys.item(i).is_empty
            loop
               page_parameter(1, extra_loadpath_keys.item(i), extra_loadpath_items.item(i))
               i := i + 1
            end
         end
         if tools_names /= Void then
            page_section_title(fz_conf_se_tools)
            from
               i := tools_names.lower
            until
               i > tools_names.upper or else tools_names.item(i).is_empty
            loop
               page_parameter(1, tools_names.item(i), tools_commands.item(i))
               i := i + 1
            end
         end
         if default_c_compiler /= Void then
            page_string(once "%N   Default C compiler: ")
            page_string(default_c_compiler)
            page_char('%N')
         else
            page_string(once "%N   The default C compiler could not be determined.%N")
         end
         page_section_title(fz_conf_java)
         page_parameter(1, once "Java ARchiver", java_jar_binary)
         page_parameter(1, once "Java Virtual Machine", java_jvm_binary)
         page_parameter(1, once "Extern Java compiler", java_java_compiler)
         page_char('%N')
         io.put_string(once "Type <Enter> to go back to the menu: ")
         read_line
      end

   page_line: INTEGER

   page_section_title (title: STRING) is
      require
         title /= Void
      do
         page_char('%N')
         page_string(title)
         page_string(":%N%N")
      end

   page_parameter (indent: INTEGER; key, value: STRING) is
      require
         indent > 0
         key /= Void
      local
         i : INTEGER
      do
         from
            i := 0
         until
            i = indent
         loop
            page_string(once "   ")
            i := i + 1
         end
         page_string(key)
         page_string(once ": ")
         if value = Void then
            page_string(fz_conf_undefined)
         else
            page_string(value)
         end
         page_char('%N')
      end

   page_env_variable (key, value: STRING) is
      require
         key /= Void
         value /= Void
      do
         page_string(once "   env %"")
         page_string(key)
         page_string(once "%" = ")
         page_string(value)
         page_char('%N')
      end

   page_string (s: STRING) is
      local
         i: INTEGER; s0: STRING
      do
         if s = Void then
            s0 := fz_conf_undefined
         else
            s0 := s
         end
         from
            i := 1
         until
            i > s0.count
         loop
            page_char(s0.item(i))
            i := i + 1
         end
      end

   page_char (c: CHARACTER) is
      do
         io.put_character(c)
         if c = '%N' then
            page_line := page_line + 1
            if page_line = 25 then
               io.put_string(once "--press <Enter> for more--")
               read_line
               page_line := 1
            end
         end
      end

   write_config is
      local
         i: INTEGER; new_name: STRING; c_mode: C_MODE
      do
         if file_tools.is_readable(seconf) then
            new_name := seconf + "~"
            io.put_string("Renaming %"" + seconf + "%" as %"" + new_name + "%N")
            file_tools.rename_to(seconf, new_name)
         end
         open_seconf
         if not tfw.is_connected then
            io.put_string(once "%N*** There was an error while trying to %
                               %write the configuration file. Please verify %
                               %its name.%N%N")
            default_main_action := main_action_define_variables
         else
            tfw.put_string(once "{
-- This is the configuration file of Liberty Eiffel, generated by the
-- Liberty Eiffel installer.
-- If you have any problems or questions, please:
--   - either look at the Liberty Eiffel site (http://liberty-eiffel.blogspot.com)
--   - or contact the Liberty Eiffel team (liberty-eiffel.blogspot.com)
-- ======================================================================= --

            }")
            tfw.put_character('[')
            tfw.put_string(fz_conf_general)
            tfw.put_string(once "]%N")
            tfw.put_string(once "{

-- This section contains some general-purpose keys. They describe how is the
-- Liberty Eiffel distribution arranged, and on which operating system it was
-- installed.

-- The 'bin' key is the path to the directory that contains the Liberty Eiffel
-- directory. It is used by 'compile' to find 'compile_to_c'.

-- The 'sys' directory is used to find the C and Java files used by the
-- compilers.

-- The 'short' directory is used by the 'short' utility to format the output.

-- The 'os' key tells on which system Liberty Eiffel is installed on.

-- The 'flavor' key gives additional hints on the system Liberty Eiffel runs on.

-- At last, 'tag' gives the version of install configuration (used only by the
-- installer)


            }")
            tfw.put_string(once "bin: ")
            tfw.put_string(bin_directory)
            tfw.put_new_line
            tfw.put_string(once "sys: ")
            tfw.put_string(sys_directory)
            tfw.put_new_line
            tfw.put_string(once "short: ")
            tfw.put_string(short_directory)
            tfw.put_new_line
            tfw.put_string(once "os: ")
            tfw.put_string(system_name)
            tfw.put_new_line
            tfw.put_string(once "flavor: ")
            tfw.put_string(system_flavor)
            tfw.put_new_line
            tfw.put_string(once "jobs: ")
            tfw.put_integer(jobs)
            tfw.put_new_line
            tfw.put_string(once "tag: ")
            tfw.put_string(install_tag)
            tfw.put_new_line
            if not env_vars.is_empty then
               tfw.put_new_line
               tfw.put_character('[')
               tfw.put_string(fz_conf_environment)
               tfw.put_string(once "]%N")
               tfw.put_string("{

-- This section contains keys that can be used environment variables. They may
-- be used by other sections (typically [Loadpath]) or Ace files.


                               }")
               from
                  i := env_vars.lower
               until
                  i > env_vars.upper
               loop
                  tfw.put_string(env_vars.key(i))
                  tfw.put_string(once ": ")
                  tfw.put_string(env_vars.item(i))
                  tfw.put_new_line
                  i := i + 1
               end
            end
            if extra_loadpath_keys /= Void then
               tfw.put_new_line
               tfw.put_character('[')
               tfw.put_string(fz_conf_loadpath)
               tfw.put_string(once "]%N")
               tfw.put_string(once "{

-- This section contains the default loadpaths used by this Liberty Eiffel
-- installation.

-- The key is used when naming clusters (Liberty Eiffel output when a
-- class is not found, or external tools like eiffeldoc)

-- The value of the key is the path to a loadpath file.

-- Note that the loadpath files are read in the order given below.


               }")
               from
                  i := extra_loadpath_keys.lower
               until
                  i > extra_loadpath_keys.upper or else extra_loadpath_keys.item(i).is_empty
               loop
                  tfw.put_string(extra_loadpath_keys.item(i))
                  tfw.put_string(once ": ")
                  tfw.put_string(extra_loadpath_items.item(i))
                  tfw.put_new_line
                  i := i + 1
               end
            end
            if tools_names /= Void then
               tfw.put_new_line
               tfw.put_character('[')
               tfw.put_string(fz_conf_se_tools)
               tfw.put_string(once "]%N")
               tfw.put_string(once "{

-- This section contains the tools used by the `se' command.

-- The key is the name of the command used by `se'

-- The value of the command to launch, which must be in ${bin} (bin
-- is a key defined above in the [General] section).


               }")
               from
                  i := tools_names.lower
               until
                  i > tools_names.upper or else tools_names.item(i).is_empty
               loop
                  tfw.put_string(tools_names.item(i))
                  tfw.put_string(once ": ")
                  tfw.put_string(tools_commands.item(i))
                  tfw.put_new_line
                  i := i + 1
               end
            end
            tfw.put_string(once "{


-- ======================================================================= --

-- Below are the "C mode" sections. Each C mode describes which C compiler must
-- be called, with which options, which linker, and so on. The keys are
-- described below.

-- The first sections (boost, ..., debug_check) are by default used in
-- conjunction with the corresponding Liberty Eiffel check level. This behavior
-- may be changed by using the -c_mode flag.

-- The recognized keys in each section are:

-- 'c_compiler_type', which tells which is the compiler type to use

-- 'c_compiler_path', which gives the path to the compiler executable

-- 'c_compiler_options', which gives some options to the compiler

-- 'c_linker_path', which gives the path to the linker executable (not used
--  in -no_split mode)

-- 'c_linker_options', which gives some options for the linker (not used in
--  -no_split mode)

-- 'smarteiffel_options', which gives some extra Liberty Eiffel options to take
--  into account


            }")
            from
               i := c_modes.lower
            until
               i > c_modes.upper
            loop
               c_mode := c_modes.item(i)
               tfw.put_new_line
               tfw.put_character('[')
               tfw.put_string(c_mode.name)
               tfw.put_string(once "]%N")
               write_optional_key(fz_conf_compiler_type, c_mode.c_compiler_type)
               write_optional_key(fz_conf_compiler_path, c_mode.c_compiler_path)
               write_optional_key(fz_conf_compiler_options, c_mode.c_compiler_options)
               write_optional_key(fz_conf_linker_path, c_mode.c_linker_path)
               write_optional_key(fz_conf_linker_options, c_mode.c_linker_options)
               write_optional_key(fz_conf_cpp_compiler_type, c_mode.cpp_compiler_type)
               write_optional_key(fz_conf_cpp_compiler_path, c_mode.cpp_compiler_path)
               write_optional_key(fz_conf_cpp_compiler_options, c_mode.cpp_compiler_options)
               write_optional_key(fz_conf_cpp_linker_path, c_mode.cpp_linker_path)
               write_optional_key(fz_conf_cpp_linker_options, c_mode.cpp_linker_options)
               write_optional_key(fz_conf_smarteiffel_options, c_mode.smarteiffel_options)
               i := i + 1
            end
            tfw.put_string(once "{


-- ======================================================================= --

-- Below is the "Java" section which describes which program must
-- be called by default, with which options, and so on. The keys are
-- described below.

-- The recognized keys in this section are:

-- 'jar', which tells which is the archiver to use to produce Java ARchives.

-- 'jvm', which gives the name of the program providing the Java Virtual Machine.

-- 'javac', which gives the extern compiler used to compile Java plugins.


            }")
            tfw.put_character('[')
            tfw.put_string(fz_conf_java)
            tfw.put_string(once "]%N")
            write_optional_key(fz_conf_java_jar_binary, java_jar_binary)
            write_optional_key(fz_conf_java_jvm_binary, java_jvm_binary)
            write_optional_key(fz_conf_java_java_compiler, java_java_compiler)
            tfw.disconnect
         end
      end

   write_optional_key (key, value: STRING) is
      do
         if value /= Void then
            tfw.put_string(key)
            tfw.put_string(once ": ")
            tfw.put_string(value)
            tfw.put_new_line
         end
      end

   open_seconf is
         -- Opens tfw on the seconf file. Creates all the necessary directories.
      do
         if seconf /= fz_conf_undefined then
            basic_directory.compute_parent_directory_of(seconf)
            if not basic_directory.last_entry.is_empty then
               create_parent_directories_of(basic_directory.last_entry)
            end
            tfw.connect_to(seconf)
            if not tfw.is_connected then
               fatal_problem_description_start
               std_error.put_string(once "Could not open ")
               std_error.put_string(seconf)
               std_error.put_string(".%N")
               fatal_problem_description_end
            end
         end
      end

   create_parent_directories_of (path: STRING) is
      require
         not path.is_empty
      local
         p: STRING
      do
         create p.copy(path)
         --|*** memory leak
         directory.scan(p)
         if not directory.last_scan_status then
            basic_directory.compute_parent_directory_of(path)
            if basic_directory.last_entry.count > 0 then
               create_parent_directories_of(basic_directory.last_entry)
            else
               -- could not compute the parent directory
               fatal_problem_description_start
               std_error.put_string(once "Could not compute the parent directory of ")
               std_error.put_string(path)
               std_error.put_string(once ".%N")
               fatal_problem_description_end
            end
         end
         directory.scan(p)
         check
            directory.last_scan_status
         end
      end

   set_seconf is
         -- Set the environment variable SECONF
      do
         (create {SYSTEM}).set_environment_variable(fz_seconf, seconf)
      end

   compile_all is
         -- Put the program in the same conditions as with the old installer,
         -- in order to use its features.
      local
         install_dir, germ_dir, install_compiler, compiler_options, linker_options, obj
         s: STRING; i: INTEGER; has_germ_dir, found, ok_bin_dir: BOOLEAN
      do
         install_dir := once "install"
         germ_dir := once "germ"
         has_germ_dir := True
         directory.scan_current_working_directory
         if not directory.has(install_dir) then
            has_germ_dir := False
         else
            directory.scan_subdirectory(install_dir)
            if not directory.has(germ_dir) then
               has_germ_dir := False
            else
               directory.scan_subdirectory(germ_dir)
            end
         end
         if not has_germ_dir then
            fatal_problem_description_start
            std_error.put_string(once "The install/germ directory does not exist!%N%
                                      %Did you use a Liberty Eiffel archive from Loria?%N%
                                      %If not, you can download it at http://liberty-eiffel.blogspot.com%N%
                                      %and start the installation again.")
            fatal_problem_description_end
         end
         tmp_buffer.copy(directory.path)
         create germ_directory.copy(tmp_buffer)
         if basic_directory.is_connected then
            basic_directory.disconnect
         end
         put_dashed_line
         io.put_string(once "You are about to start the Liberty Eiffel installation.%N%
                            %Just one last thing, though...%N")
         from
         until
            found
         loop
            io.put_string(once "%NThe default installation C mode is ")
            io.put_string(install_c_mode)
            io.put_string(once ".%NPlease either type <Enter> to go on, or choose a new C mode now.%N")
            read_line
            if entry_buffer.is_empty then
               from
                  i := c_modes.lower
                  found := False
               variant
                  c_modes.upper - i
               until
                  found
               loop
                  if c_modes.item(i).name.is_equal(install_c_mode) then
                     install_compiler := c_modes.item(i).c_compiler_type
                     found := True
                  else
                     i := i + 1
                  end
               end
            else
               from
                  i := c_modes.lower
                  found := False
               until
                  found or else i > c_modes.upper
               loop
                  found := c_modes.item(i).name.is_equal(entry_buffer)
                  if found then
                     install_c_mode.copy(entry_buffer)
                     install_compiler := c_modes.item(i).c_compiler_type
                  else
                     i := i + 1
                  end
               end
               if not found then
                  io.put_string(once "%N*** Please choose an existing C mode.%N")
               end
            end
         end
         c_compiler_name := install_compiler
         compiler_options := c_modes.item(i).c_compiler_options
         if compiler_options = Void then
            compiler_options := once ""
         end
         linker_options := c_modes.item(i).c_linker_options
         if linker_options = Void then
            linker_options := once ""
         end
         -- Verify the bin directory...
         ok_bin_dir := True
         basic_directory.change_current_working_directory(noenv_bin_directory)
         if basic_directory.last_entry.is_empty then
            -- The `bin' directory does not exist; let's create it.
            if not basic_directory.create_new_directory(noenv_bin_directory) then
               std_error.put_string(once "*** Could not create the bin directory: aborting.%N")
               ok_bin_dir := False
            else
               basic_directory.change_current_working_directory(noenv_bin_directory)
            end
         end
         if ok_bin_dir then
            io.put_string(once "%NSummary of gathered options:%
                               %%N  - C mode:     ")
            io.put_string(install_c_mode)
            io.put_string(once "%N  - C compiler: ")
            io.put_string(install_compiler)
            io.put_string(once "%N  - C options:  (compiler) ")
            io.put_string(compiler_options)
            io.put_string(once "%N                (linker)   ")
            io.put_string(linker_options)
            io.put_string(once "%N%NHere we go!%N%N")
            -- Prepare system_tools to install Liberty Eiffel
            system_tools.set_install_compiler(install_compiler, c_modes.item(i).c_compiler_path, c_modes.item(i).c_linker_path)
            system_tools.c_compiler_options.copy(compiler_options)
            system_tools.c_linker_options.copy(linker_options)
            -- Now we will install Liberty Eiffel. The process has been
            -- rightfully described by Philippe on SmartZilla, BUG106
            -- (http://smartzilla.loria.fr/show_bug.cgi?id=106)

            installed := True -- will become False if a problem occurs

            -- Compile compile_to_c given with the distrib...
            basic_directory.change_current_working_directory(germ_directory)
            system_tools.add_lib_math_do_it_again
            installed := split_mode_c_compile("compile_to_c")
            if installed then
               if not move_executable_for("compile_to_c") then
                  io.put_string(once "***** Could not move compile_to_c! Installation failed.%N")
                  installed := False
               else
                  basic_directory.connect_to(germ_directory)
                  if basic_directory.is_connected then
                     from
                        obj := system_tools.object_suffix
                        basic_directory.read_entry
                     until
                        basic_directory.end_of_input
                     loop
                        s := basic_directory.last_entry.twin
                        if s.has_suffix(obj) then
                           basic_directory.compute_file_path_with(germ_directory, s)
                           if not basic_directory.last_entry.is_empty then
                              s.copy(basic_directory.last_entry)
                              file_tools.delete(s)
                           end
                        end
                        basic_directory.read_entry
                     end
                  end
                  basic_directory.disconnect

                  -- Now go to the bin directory...
                  basic_directory.change_current_working_directory(noenv_bin_directory)
                  -- Compile compile_to_c again (this one is for us developpers),
                  -- then "compile" and "clean" in order to compile all the tools,
                  -- and clean "compile" and "clean"...
                  first_pass_compile
                  -- And compile all the remaining tools.
                  if installed then
                     second_pass_compile
                  end
                  if not installed then
                     io.put_string(once "%N*** There have been errors during the install of Liberty Eiffel. Sorry :-(%N%N")
                     io.put_string(once "Press a <Enter> to return to the menu. ")
                     read_line
                  else
                     io.put_string(once "Done.%N")
                  end
               end
            end
         end
         restore_current_working_directory
      end

   compile_arguments (extra_args: STRING; with_gc: BOOLEAN): STRING is
      do
         Result := once "                        "
         if with_gc or else system_tools.lcc_win32.same_as(c_compiler_name) then
            Result.copy(once "-boost")
            -- See (*).
         else
            Result.copy(once "-boost -no_gc")
         end
         if not install_c_mode.is_equal(fz_boost) then
            Result.append(once " -c_mode ")
            Result.append(install_c_mode)
         end
         if extra_args /= Void then
            Result.extend(' ')
            Result.append(extra_args)
         end
         -- (*): because the bad/slow Microsoft malloc is used, we
         -- get better results when the GC is on (thus the -no_gc
         -- flag is not used).
      end

   first_pass_compile is
      local
         i: INTEGER; args, item: STRING
      do
         from
            i := first_pass_command_list.lower
         until
            not installed or else i > first_pass_command_list.upper
         loop
            item := first_pass_command_list.item(i)
            if no_split_command_list.has(item) then
               args := compile_arguments(once "-relax -no_split", item.same_as(once "eiffeldoc"))
               installed := call_compile_to_c(args, item)
               installed := no_split_mode_c_compile(item)
            else
               check
                  split_command_list.has(item)
               end
               args := compile_arguments(once "-relax", item.same_as(once "eiffeldoc"))
               installed := call_compile_to_c(args, item)
               installed := split_mode_c_compile(item)
            end
            i := i + 1
         end
         from
            i := first_pass_command_list.lower
         until
            i > first_pass_command_list.upper
         loop
            item := first_pass_command_list.item(i)
            installed := call_clean(item)
            i := i + 1
         end
      end

   second_pass_compile is
      local
         i: INTEGER; args, item: STRING
      do
         from
            i := no_split_command_list.lower
         until
            not installed or else i > no_split_command_list.upper
         loop
            item := no_split_command_list.item(i)
            args := compile_arguments(once "-relax -clean -no_split", item.same_as(once "eiffeldoc"))
            if not first_pass_command_list.has(item) then
               installed := call_compile(args, item)
            end
            i := i + 1
         end
         from
            i := split_command_list.lower
         until
            i > split_command_list.upper
         loop
            item := split_command_list.item(i)
            args := compile_arguments(once "-relax -clean", item.same_as(once "eiffeldoc"))
            if not first_pass_command_list.has(item) then
               installed := call_compile(args, item)
            end
            i := i + 1
         end
      end

   move_executable_for (name: STRING): BOOLEAN is
         -- Move the executable for command `name' from `germ_directory'
         -- to in `bin_directory'.
      local
         executable, old_path, new_path, command: STRING; status: INTEGER
      do
         executable := name.twin
         system_tools.add_x_suffix(executable)
         basic_directory.compute_file_path_with(germ_directory, executable)
         old_path := basic_directory.last_entry.twin
         basic_directory.compute_file_path_with(noenv_bin_directory, executable)
         new_path := basic_directory.last_entry.twin
         if not file_tools.is_readable(old_path) then
            fatal_problem_description_start
            std_error.put_string(once "Unable to find executable %"")
            std_error.put_string(old_path)
            std_error.put_string(once "%".%N")
            fatal_problem_description_end
         end
         if not system_tools.elate_system.same_as(system_name) then
            echo.file_renaming(old_path, new_path)
            Result := True
         else
            -- Use the `cpt' command to copy the command from the old to the
            -- new location.  we can't copy tools in Elate with a normal copy
            -- in the filesystem:
            command := "cpt " + old_path + " " + new_path
            status := echo.system_call(command)
            if status /= 0 then
               std_error.put_string(once "***** Could not move ")
               std_error.put_string(name)
               std_error.put_string(once "!%N")
            else
               Result := True
            end
         end
      end

   fatal_problem_description_start is
      do
         std_error.put_string("%N*** Fatal problem during installation of Liberty Eiffel.%N%
           %    Read carefully the following information before starting%N%
           %    again the installation.%N%
           %***************************************************************%N")
      end

   fatal_problem_description_end is
      do
         std_error.put_string("***************************************************************%N%
         %Fix the previously described problem and launch again the,%N%
         %installation, or contact the Liberty Eiffel team:%N%
         %liberty-eiffel.blogspot.com%N")
         restore_current_working_directory
         install_exit(exit_failure_code)
      end

   install_exit (exit_code: INTEGER) is
         -- To exit properly from the `install' program.
      do
         if system_name = Void or else "Windows".same_as(system_name) then
            -- To avoid the terminal window closing before the user has read
            -- the last messages.
            io.put_string("Type <Enter> to exit.%N")
            io.read_line
         end
         die_with_code(exit_code)
      end

feature {} -- Exit:
   confirm_exit is
      do
         if installed or else io.end_of_input then
            stop := True
         else
            put_dashed_line
            io.put_string("You did not install Liberty Eiffel. Are you sure you want to exit? [y|N] ")
            read_line
            entry_buffer.to_lower
            stop := entry_buffer.count > 0 and then entry_buffer.first = 'y'
         end
      end

   exit is
      do
         put_dashed_line
         if installed then
            io.put_string("Thank you for installing Liberty Eiffel. Enjoy!%N%N")
         else
            io.put_string("Liberty Eiffel was not properly installed.%N%
                               %Please run the installer again to fix the installation.%N%N")
         end
      end

feature {} -- Misc:
   put_dashed_line is
      do
         io.put_string(once "%N%N---------------------------------------------------------------------------%N%N")
      end

   restore_current_working_directory is
      do
         if cwd /= Void then
            basic_directory.change_current_working_directory(cwd)
         end
      end

   read_line is
      do
         entry_buffer.clear_count
         io.read_line_in(entry_buffer)
         entry_buffer.left_adjust
         entry_buffer.right_adjust
      end

   set_jobs (a_jobs: like jobs) is
      do
         jobs := a_jobs
      end

feature {} -- Buffers:
   tmp_buffer: STRING is
      once
         create Result.make(16)
      end

   entry_buffer: STRING is
      once
         create Result.make(16)
      end

   levels: ASSERTION_LEVEL_NUMBERING is
      once
         create Result
      end

   tfw: TEXT_FILE_WRITE is
      once
         create Result.make
      end

   tfr: TEXT_FILE_READ is
      once
         create Result.make
      end

   strings: STRING_RECYCLING_POOL is
      once
         create Result.make
      end

   compile_feedback (name: STRING; slice, max: INTEGER) is
      do
         if max = 0 then
            io.put_string(once "C compiling no-split of ")
         elseif slice = max then
            io.put_string(once "C linking of ")
         else
            io.put_string(once "C compiling slice ")
            io.put_integer(slice)
            io.put_character('/')
            io.put_integer(max)
            io.put_string(once " of ")
         end
         io.put_line(name)
      end

   execute_command (command: STRING): BOOLEAN is
         -- Call {SYSTEM}.execute_command with `io' echoing. Also treat correctly multi-lines
         -- commands. A False Result indicates some problem during system call.
      local
         idx: INTEGER
      do
         if not command.has('%N') then
            -- Single line command:
            io.put_string("System call %"" + command + "%".%N")
            Result := (create {SYSTEM}).execute_command(command) = 0
            if not Result then
               io.put_string("Last system call failed (error reported).%N")
               io.put_string("System call %"" + command + "%" failed.%N")
            end
         else
            -- It may be a multiple line command and we have to split lines because Windows
            -- ignore all but the first one:
            idx := command.index_of('%N', 1)
            Result := execute_command(command.substring(1, idx - 1))
            Result := Result and execute_command(command.substring(idx + 1, command.count))
         end
      end

invariant
   not echo.is_verbose

end -- class INSTALL
--
-- ------------------------------------------------------------------------------------------------------------------------------
-- Copyright notice below. Please read.
--
-- Liberty Eiffel is free software; you can redistribute it and/or modify it under the terms of the GNU General Public License,
-- as published by the Free Software Foundation; either version 2, or (at your option) any later version.
-- Liberty Eiffel is distributed in the hope that it will be useful but WITHOUT ANY WARRANTY; without even the implied warranty
-- of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details. You should have
-- received a copy of the GNU General Public License along with Liberty Eiffel; see the file COPYING. If not, write to the Free
-- Software Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301, USA.
--
-- Copyright(C) 1994-2002: INRIA - LORIA (INRIA Lorraine) - ESIAL U.H.P.       - University of Nancy 1 - FRANCE
-- Copyright(C) 2003-2004: INRIA - LORIA (INRIA Lorraine) - I.U.T. Charlemagne - University of Nancy 2 - FRANCE
--
-- Authors: Dominique COLNET, Philippe RIBET, Cyril ADRIAN, Vincent CROIZIER, Frederic MERIZEN
--
-- http://liberty-eiffel.blogspot.com - liberty-eiffel.blogspot.com
-- ------------------------------------------------------------------------------------------------------------------------------
