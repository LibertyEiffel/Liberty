-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
expanded class XDG
   --
   -- freedesktop.org management
   --

insert
   FILE_TOOLS
   BASIC_DIRECTORY

feature {ANY}
   set_package (a_package: ABSTRACT_STRING)
         -- Be sure to call that method before any other!!
      require
         require_system_notation
         is_unix_notation: unix_notation or else cygwin_notation
         valid_package_name: system_notation.is_valid_file_name(a_package.out)
         set_only_once: package = Void
      once
         package_name.set_item(a_package.intern)
      ensure
         is_set: package.same_as(a_package)
      end

   package: FIXED_STRING
      do
         Result := package_name.item
      end

feature {ANY}
   read_data (filename: ABSTRACT_STRING): TEXT_FILE_READ
      require
         package /= Void
      do
         Result := read(filename, data_dirs)
      ensure
         Result /= Void implies Result.is_connected
      end

   read_config (filename: ABSTRACT_STRING): TEXT_FILE_READ
      require
         package /= Void
      do
         Result := read(filename, config_dirs)
      ensure
         Result /= Void implies Result.is_connected
      end

   cache_home: FIXED_STRING
      require
         package /= Void
      once
         Result := getenv("XDG_CACHE_HOME", Void, agent: ABSTRACT_STRING do Result := "#(1)/.cache/#(2)" # home # package end)
         check_dir(Result)
      end

   runtime_dir: FIXED_STRING
      require
         package /= Void
      once
         Result := getenv("XDG_RUNTIME_DIR",
                          Void,
                          agent: ABSTRACT_STRING
                          do
                             Result := getenv("TMPDIR",
                                              agent (tmp: ABSTRACT_STRING): ABSTRACT_STRING
                                              do
                                                 Result := "#(1)/#(2)" # tmp # package
                                              end,
                                              agent: ABSTRACT_STRING
                                              do
                                                 Result := "/tmp/#(1)-#(2)" # package # user
                                              end)
                          end)
         check_dir(Result)
      end

   data_home: FIXED_STRING
      require
         package /= Void
      once
         Result := ("#(1)/#(2)" # data_home_ # package).intern
      end

   config_home: FIXED_STRING
      require
         package /= Void
      once
         Result := ("#(1)/#(2)" # config_home_ # package).intern
      end

feature {}
   read (filename: ABSTRACT_STRING; dirs: TRAVERSABLE[FIXED_STRING]): TEXT_FILE_READ
      local
         i: INTEGER; path: STRING
      do
         path := once ""
         from
            i := dirs.lower
         until
            Result /= Void or else i > dirs.upper
         loop
            path.make_from_string(dirs.item(i))
            path.extend('/')
            path.append(package)
            path.extend('/')
            path.append(filename)
            if file_exists(path) then
               create Result.connect_to(path.twin)
            end
            i := i + 1
         end
      ensure
         Result /= Void implies Result.is_connected
      end

   data_home_: FIXED_STRING
      once
         Result := getenv("XDG_DATA_HOME", Void, agent: ABSTRACT_STRING do Result := "#(1)/.local/share" # home end)
      end

   config_home_: FIXED_STRING
      once
         Result := getenv("XDG_CONFIG_HOME", Void, agent: ABSTRACT_STRING do Result := "#(1)/.config" # home end)
      end

   home: FIXED_STRING
      once
         Result := getenv("HOME", Void, Void)
      end

   user: FIXED_STRING
      once
         Result := getenv("USER", Void, Void)
      end

feature {}
   data_dirs: TRAVERSABLE[FIXED_STRING]
      local
         value: FIXED_STRING; dirs: FAST_ARRAY[FIXED_STRING]
      once
         create dirs.with_capacity(4)
         dirs.add_last(data_home_)
         value := getenv("XDG_DATA_DIRS", Void, agent: ABSTRACT_STRING do Result := "/usr/local/share/:/usr/share/" end)
         split_dirs(value, dirs)
         Result := dirs
      end

   config_dirs: TRAVERSABLE[FIXED_STRING]
      local
         value: FIXED_STRING; dirs: FAST_ARRAY[FIXED_STRING]
      once
         create dirs.with_capacity(4)
         dirs.add_last(config_home_)
         value := getenv("XDG_CONFIG_DIRS", Void, agent: ABSTRACT_STRING do Result := "/usr/local/etc:/etc/xdg" end) -- the first one is not standard but useful for local installs
         split_dirs(value, dirs)
         Result := dirs
      end

   check_dir (dir: FIXED_STRING)
      require
         dir /= Void
      do
         if not is_directory(dir) then
            if not create_new_directory(dir) then
               std_error.put_line("**** Fatal error: could not create #(1)" # dir)
               die_with_code(1)
            end
         end
      end

feature {}
   split_dirs (value: FIXED_STRING; dirs: FAST_ARRAY[FIXED_STRING])
      require
         value /= Void
         dirs /= Void
      local
         start, next: INTEGER
      do
         from
            start := value.lower
            next := start
         until
            not value.valid_index(next)
         loop
            next := value.index_of(':', start)
            if value.valid_index(next) then
               dirs.add_last(value.substring(start, next - 1))
               start := next + 1
            else
               dirs.add_last(value.substring(start, value.upper))
            end
         end
      end

   getenv (var: ABSTRACT_STRING; ext: FUNCTION[TUPLE[ABSTRACT_STRING], ABSTRACT_STRING]; def: FUNCTION[TUPLE, ABSTRACT_STRING]): FIXED_STRING
      require
         var /= Void
      local
         system: SYSTEM; value: STRING
      do
         value := system.get_environment_variable(var.out)
         if value = Void or else value.is_empty then
            if def = Void then
               -- mandatory
               std_error.put_line("**** Fatal error: no $#(1) defined!" # var)
               die_with_code(1)
            end
            Result := def.item([]).intern
         else
            if ext = Void then
               Result := value.intern
            else
               Result := ext.item([value]).intern
            end
         end
      ensure
         Result /= Void
      end

   package_name: REFERENCE[FIXED_STRING]
      once
         create Result
      end

end -- class XDG
--
-- Copyright (C) 2009-2016: by all the people cited in the AUTHORS file.
--
-- Permission is hereby granted, free of charge, to any person obtaining a copy
-- of this software and associated documentation files (the "Software"), to deal
-- in the Software without restriction, including without limitation the rights
-- to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
-- copies of the Software, and to permit persons to whom the Software is
-- furnished to do so, subject to the following conditions:
--
-- The above copyright notice and this permission notice shall be included in
-- all copies or substantial portions of the Software.
--
-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
-- IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
-- FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
-- AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
-- LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
-- OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
-- THE SOFTWARE.
