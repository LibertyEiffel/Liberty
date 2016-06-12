class EIFFELDOC_LIKE
   -- This example illustrates how to make a tool that works like eiffeldoc.
   -- It lists all the classes of all clusters
   --*** Currently broken. You'll probably want to use CLUSTER.read_classes and then find some way to get at the
   --*** data in CLUSTER.pool . ACE.for_all and ACE.for_all_clusters may be helpful in the process. <FM-30/07/2007>

inherit
   CLUSTER_VISITOR
   VISITOR

insert
   EXTERNAL_TOOL

create {ANY}
   make

feature {}
   make
      do
         root_class_name := as_any
         bootstrap
         ace.for_all_clusters(agent visit_cluster(?))
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
            elseif add_loadpath(arg) then
            else
               system_tools.bad_use_exit(command_name, usage)
            end

            argi := argi + 1
         end
      end

   add_loadpath (loadpath: STRING): BOOLEAN
      do
         if loadpath.has_suffix(once ".ace") or else loadpath.has_suffix(once ".ACE") then
            -- nothing to do: bootstrap takes care of that
            Result := True
         elseif loadpath.has_suffix(once ".se") or else loadpath.has_suffix(once ".SE") then
            system_tools.add_loadpath_file(loadpath)
            Result := True
         end
      end

   is_valid_argument_for_ace_mode (arg: STRING): BOOLEAN
      do
         -- This is called by smart_eiffel.ace from a loop similar to the one in parse_arguments
         Result := is_version_flag(arg) or else is_style_warning_flag(arg) or else is_no_warning_flag(arg) or else is_verbose_flag(arg)
      end

   valid_argument_for_ace_mode: STRING "Only the flags -verbose, -version and -help are allowed%Nin ACE file mode.%N"

   use_short_mode: BOOLEAN True

   usage: STRING "[
   Usage: eiffeldoc_like [options] <LoadPathFileName>.se ...
      or: eiffeldoc_like [options] <ACEfileName>.ace

    Option summary:

    Information:
      -help               Display this help information
      -version            Display Liberty Eiffel version information
      -verbose            Display detailed information about what
                           eiffeldoc_like is doing

    Warning levels:
      -style_warning      Print warnings about style violations
      -no_warning         Don't print any warnings

   ]"

feature {CLUSTER}
   visit_cluster (a_cluster: CLUSTER)
         -- For each class in `a_cluster' print its name
      local
         path: STRING; directory: DIRECTORY
      do
         io.put_string(once "Cluster: ")
         io.put_line(a_cluster.name)
         path := a_cluster.directory_path
         if path /= Void and then not path.is_empty then
            create directory.scan(path)
            directory.for_each(agent io.put_line(?))
         else
            io.put_line(once "Path void or empty")
         end
      end

end -- class EIFFELDOC_LIKE
