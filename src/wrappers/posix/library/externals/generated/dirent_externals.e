-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class DIRENT_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	alphasort (an_e1: POINTER; an_e2: POINTER): INTEGER 

		-- function alphasort (in `/usr/include/dirent.h')
               -- alphasort
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "alphasort"
               }"
               end

	alphasort64 (an_e1: POINTER; an_e2: POINTER): INTEGER 

		-- function alphasort64 (in `/usr/include/dirent.h')
               -- alphasort64
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "alphasort64"
               }"
               end

	closedir (a_dirp: POINTER): INTEGER 

		-- function closedir (in `/usr/include/dirent.h')
               -- closedir
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "closedir"
               }"
               end

	dirfd (a_dirp: POINTER): INTEGER 

		-- function dirfd (in `/usr/include/dirent.h')
               -- dirfd
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "dirfd"
               }"
               end

	fdopendir (a_fd: INTEGER): POINTER 

		-- function fdopendir (in `/usr/include/dirent.h')
               -- fdopendir
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "fdopendir"
               }"
               end

	getdirentries (a_fd: INTEGER; a_buf: POINTER; a_nbytes: like size_t; a_basep: POINTER): like long 

		-- function getdirentries (in `/usr/include/dirent.h')
               -- getdirentries
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "getdirentries"
               }"
               end

	getdirentries64 (a_fd: INTEGER; a_buf: POINTER; a_nbytes: like size_t; a_basep: POINTER): like long 

		-- function getdirentries64 (in `/usr/include/dirent.h')
               -- getdirentries64
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "getdirentries64"
               }"
               end

	opendir (a_name: POINTER): POINTER 

		-- function opendir (in `/usr/include/dirent.h')
               -- opendir
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "opendir"
               }"
               end

	readdir (a_dirp: POINTER): POINTER 

		-- function readdir (in `/usr/include/dirent.h')
               -- readdir
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "readdir"
               }"
               end

	readdir64 (a_dirp: POINTER): POINTER 

		-- function readdir64 (in `/usr/include/dirent.h')
               -- readdir64
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "readdir64"
               }"
               end

	readdir64_r (a_dirp: POINTER; an_entry: POINTER; a_result: POINTER): INTEGER 

		-- function readdir64_r (in `/usr/include/dirent.h')
               -- readdir64_r
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "readdir64_r"
               }"
               end

	readdir_r (a_dirp: POINTER; an_entry: POINTER; a_result: POINTER): INTEGER 

		-- function readdir_r (in `/usr/include/dirent.h')
               -- readdir_r
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "readdir_r"
               }"
               end

	rewinddir (a_dirp: POINTER) 

		-- function rewinddir (in `/usr/include/dirent.h')
               -- rewinddir
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rewinddir"
               }"
               end

	scandir (a_dir: POINTER; a_namelist: POINTER; a_selector: POINTER; a_cmp: POINTER): INTEGER 

		-- function scandir (in `/usr/include/dirent.h')
               -- scandir
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "scandir"
               }"
               end

	scandir64 (a_dir: POINTER; a_namelist: POINTER; a_selector: POINTER; a_cmp: POINTER): INTEGER 

		-- function scandir64 (in `/usr/include/dirent.h')
               -- scandir64
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "scandir64"
               }"
               end

	scandirat (a_dfd: INTEGER; a_dir: POINTER; a_namelist: POINTER; a_selector: POINTER; a_cmp: POINTER): INTEGER 

		-- function scandirat (in `/usr/include/dirent.h')
               -- scandirat
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "scandirat"
               }"
               end

	scandirat64 (a_dfd: INTEGER; a_dir: POINTER; a_namelist: POINTER; a_selector: POINTER; a_cmp: POINTER): INTEGER 

		-- function scandirat64 (in `/usr/include/dirent.h')
               -- scandirat64
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "scandirat64"
               }"
               end

	seekdir (a_dirp: POINTER; a_pos: like long) 

		-- function seekdir (in `/usr/include/dirent.h')
               -- seekdir
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "seekdir"
               }"
               end

	telldir (a_dirp: POINTER): like long 

		-- function telldir (in `/usr/include/dirent.h')
               -- telldir
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "telldir"
               }"
               end

	versionsort (an_e1: POINTER; an_e2: POINTER): INTEGER 

		-- function versionsort (in `/usr/include/dirent.h')
               -- versionsort
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "versionsort"
               }"
               end

	versionsort64 (an_e1: POINTER; an_e2: POINTER): INTEGER 

		-- function versionsort64 (in `/usr/include/dirent.h')
               -- versionsort64
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "versionsort64"
               }"
               end


end -- class DIRENT_EXTERNALS
