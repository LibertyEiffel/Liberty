note
	description: "Key-value file parser -- parses .ini-like config files."
	copyright: "[
					Copyright (C) 2007 Paolo Redaelli, Glib developers
					
					This library is free software; you can redistribute it and/or
					modify it under the terms of the GNU Lesser General Public License
					as published by the Free Software Foundation; either version 2.1 of
					the License, or (at your option) any later version.
					
					This library is distributed in the hope that it will be useful, but
					WITHOUT ANY WARRANTY; without even the implied warranty of
					MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
					Lesser General Public License for more details.

					You should have received a copy of the GNU Lesser General Public
					License along with this library; if not, write to the Free Software
					Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
					02110-1301 USA
			]"

class G_KEY_FILE
	-- G_KEY_FILE lets you parse, edit or create files containing
	-- groups of key-value pairs, which we call key files for lack of a
	-- better name. Several freedesktop.org specifications use key
	-- files now, e.g the Desktop Entry Specification and the Icon
	-- Theme Specification.
	
	-- The syntax of key files is described in detail in the Desktop
	-- Entry Specification, here is a quick summary: Key files consists
	-- of groups of key-value pairs, interspersed with comments.

	-- # this is just an example
	-- # there can be comments before the first group

	-- [First Group]

	-- Name=Key File Example\tthis value shows\nescaping

	-- # localized strings are stored in multiple key-value pairs
	-- Welcome=Hello
	-- Welcome[de]=Hallo
	-- Welcome[fr]=Bonjour
	-- Welcome[it]=Ciao

	-- [Another Group]

	-- Numbers=2;20;-200;0

	-- Booleans=true;false;true;true

	-- Lines beginning with a '#' and blank lines are considered comments.

	-- Groups are started by a header line containing the group name
	-- enclosed in '[' and ']', and ended implicitly by the start of
	-- the next group or the end of the file.  Each key-value pair must
	-- be contained in a group.

	-- Key-value pairs generally have the form key=value, with the
	-- exception of localized strings, which have the form
	-- key[locale]=value. Space before and after the '=' character are
	-- ignored. Newline, tab, carriage return and backslash characters
	-- are escaped as \n, \t, \r, and \\, respectively. To preserve
	-- initial and final spaces, these can also be escaped as \s.

	-- Key files can store strings (possibly with localized variants),
	-- integers, booleans and lists of these. Lists are separated by a
	-- separator character, typically ';' or ','. To use the list
	-- separator character in a value in a list, it has to be escaped
	-- by prefixing it with a backslash.
	
	-- This syntax is obviously inspired by the .ini files commonly met
	-- on Windows, but there are some important differences:

	-- o .ini files use the ';' character to begin comments, key files
	-- use the '#' character.

	-- o Key files allow only comments before the first group.

	-- o Key files are always encoded in UTF-8.

	-- o Key and Group names are case-sensitive, for example a group
	-- called [GROUP] is a different group from [group].

inherit 
	C_STRUCT redefine free end
	EIFFEL_OWNED redefine free end

insert
	SHARED_G_ERROR
	G_KEY_FILE_ERROR
	G_KEY_FILE_FLAGS
	
create {ANY} make, load_from_file, from_external_pointer

feature {} -- Creation
	make
			-- Creates a new empty G_KEY_FILE object. Use
			-- `load_from_file', `load_from_data' or
			-- `load_from_data_dirs' to read an existing key file.
		do
			from_external_pointer(g_key_file_new)
		end


	load_from_file (a_file: STRING; some_flags: INTEGER)
			-- Loads a key file into an empty GKeyFile structure. If
			-- `a_file' has been completely and correctly read
			-- `is_successful' is set to True, otherwise, i.e. if
			-- `a_file' could not be loaded, `error' is set to either a
			-- GFileError or GKeyFileError.

			-- `a_file' :     the path of a filename to load, in the GLib file name encoding
		require
			file_not_void: a_file /= Void
			valid_flags: are_valid_flags(some_flags)
		do
			make
			is_successful:=(g_key_file_load_from_file
								 (handle, a_file.to_external, some_flags,
								  address_of(error.handle))).to_boolean
		end

	-- TODO: load_from_data 

	-- gboolean g_key_file_load_from_data (GKeyFile *key_file, const
	-- gchar *data, gsize length, GKeyFileFlags flags, GError **error);

	-- Loads a key file from memory into an empty GKeyFile
	-- structure. If the object cannot be created then error is set to
	-- a GKeyFileError.

	-- key_file : an empty GKeyFile struct
	-- data :     key file loaded in memory.
	-- length :   the length of data in bytes
	-- flags :    flags from GKeyFileFlags
	-- error :    return location for a GError, or NULL
	-- Returns :  TRUE if a key file could be loaded, FALSE othewise

	load_from_data_dirs (a_file: STRING; some_flags: INTEGER)
			-- Looks for `a_key_file' in the paths returned from
			-- `g_get_user_data_dir' and `g_get_system_data_dirs' (TODO:
			-- these two are the names of the C functions; provide the
			-- Eiffel equivalents), loads the file into key_file and
			-- returns the file's full path in full_path. If the file
			-- could not be loaded then an error is set to either a
			-- GFileError or GKeyFileError.

			-- `a_keyfile' is a relative path to a filename to open and
			-- parse.
		
			-- `full_path' will be set to the full path of the file.
		
			-- `is_successful' and `error' will be updated.
		require
			file_not_void: a_file /= Void
			valid_flags: are_valid_flags(some_flags)
		local full_path_ptr: POINTER
		do
			make
			-- key_file must be an empty GKeyFile struct
			is_successful:=(g_key_file_load_from_data_dirs
								 (handle, a_file.to_external,
								  $full_path_ptr, -- gchar **full_path,
								  some_flags,
								  address_of(error.handle))).to_boolean
			create full_path.from_external(full_path_ptr)
		end
	
feature {ANY}
	full_path: STRING
			-- The full path of the key file. Set by `load_from_data_dirs'
	
	free (a_pointer: POINTER)
			-- Frees a GKeyFile.
		do
			g_key_file_free(a_pointer)
		end
	
	set_list_separator (a_separator: CHARACTER)
			-- Sets the character which is used to separate values in
			-- lists. Typically ';' or ',' are used as separators. The
			-- default list separator is ';'.
		do
			g_key_file_set_list_separator (handle, a_separator)
		end

	to_string: STRING
			-- The key file as a string.
		do
			create Result.from_external
			(g_key_file_to_data (handle, 
										default_pointer, -- i.e.: gsize *length,
										error.reference))
		end


	start_group: STRING
			-- the name of the start group of the file. A new string is 
			-- created every time.
		do
			create Result.from_external(g_key_file_get_start_group(handle))
		ensure not_void: Result/=Void
		end

	groups: COLLECTION[STRING]
			-- all the groups in the key file. Currently it is a NULL_TERMINATED_STRING_ARRAY
		local groups_ptr: POINTER; a_length: INTEGER
		do
			groups_ptr:=(g_key_file_get_groups 
							 (handle,$a_length))
			create {NULL_TERMINATED_STRING_ARRAY}
			Result.from_external(groups_ptr)

			-- g_key_file_get_groups returns all groups in the key file loaded with
			-- key_file. The array of returned groups will be NULL-terminated, so
			-- length may optionally be NULL.
			
			-- length : return location for the number of returned
			-- groups, or NULL
			
			-- Note: C documentation says to use g_strfreev to free groups.
			-- g_strfreev frees the array *and* the contained strings; it isn't
			-- necessary since memory handling is done throught Eiffel's GC
		end

	keys_of (a_group: STRING): COLLECTION[STRING]
			-- the all keys for `a_group'. If `a_group' cannot be found, Void is
			-- returned and `error' is set to
			-- `g_key_file_error_group_not_found'. Currently it is a
			-- NULL_TERMINATED_STRING_ARRAY
		require
			group_not_void: a_group/=Void
			group_exists: has_group(a_group)
		local keys_ptr: POINTER
		do
			-- the all keys for `a_group'. The array of returned keys will be
			-- NULL-terminated, so length may optionally be NULL. In the event that
			-- the group_name cannot be found, NULL is returned and error is set to
			-- G_KEY_FILE_ERROR_GROUP_NOT_FOUND.
			keys_ptr:=(g_key_file_get_keys
						  (handle, a_group.to_external,
							default_pointer, -- gsize *length,
							error.reference))
			create {NULL_TERMINATED_STRING_ARRAY}
			Result.from_external(keys_ptr)
		end

feature {ANY} -- Queries
	-- Note: there are not preconditions like "require
	-- is_integer(a_group,a_key)" in a `integer_value' query because
	-- the underlying GKeyFile API does not allow to implement it
	-- efficiently: there is no way to know the type of a key except
	-- trying to get it and then check if there were no error; i.e.

	-- width := key_file.integer(my_group,width_label)
	-- if key_file.is_valid then .... 
	
	-- Note: preconditions
	has_group (a_group: STRING): BOOLEAN
			-- Does the key file have the group named `a_group'?
		require group_not_void: a_group/=Void
		do
			Result:=(g_key_file_has_group(handle,a_group.to_external)).to_boolean
		end

	has_key  (a_group, a_key: STRING): BOOLEAN
			-- Does the key file have `a_key' in `a_group'? If `a_group' 
			-- is Void `start_group' is used.
		require
			key_not_void: a_key/=Void
		do
			Result:=(g_key_file_has_key
						(handle, a_group.to_external,
						 a_key.to_external, error.reference)).to_boolean
		end

	is_valid: BOOLEAN
			-- Did the last query returned a meaningful value? 
			--
			-- Note: further feature calls can change this value, 
			-- becuase it is computed from the value of the common, 
			-- shared error object.
		do
			Result := error.code/=g_key_file_error_invalid_value
		end

	value (a_group, a_key: STRING): STRING
			-- the value associated with `a_key' under `a_group'.
		require
			group_not_void: a_group/=Void
			key_not_void: a_key/=Void
			has_key: has_key(a_group, a_key)
		local value_ptr: POINTER
		do
			value_ptr:=(g_key_file_get_value
							(handle, a_group.to_external,
							 a_key.to_external, error.reference))
			check value_ptr.is_not_null end 
			create Result.from_external(value_ptr)
			-- g_key_file_get_value returns a newly allocated string or NULL if the
			-- specified key cannot be found.
			
			-- In the event the key cannot be found, NULL is returned and error is
			-- set to G_KEY_FILE_ERROR_KEY_NOT_FOUND. In the event that the
			-- group_name cannot be found, NULL is returned and error is set to
			-- G_KEY_FILE_ERROR_GROUP_NOT_FOUND.
		end

	string (a_group, a_key: STRING): STRING
			-- the string associated with `a_key' under `a_group'.
		require
			group_not_void: a_group/=Void
			key_not_void: a_key/=Void
			has_key: has_key(a_group, a_key)
		local value_ptr: POINTER
		do
			-- If `a_key' cannot be found, Result is Void and
			-- error is set to `g_key_file_error_key_not_found'. 

			-- If `a_group' cannot be found, Result is Void and error is
			-- set to `g_key_file_error_group_not_found'.
			value_ptr:=(g_key_file_get_string
							(handle, a_group.to_external,
							 a_key.to_external, error.reference))
			-- g_key_file_get_string returns a newly allocated string or
			-- NULL if the specified key cannot be found.
			check value_ptr.is_not_null end
			create Result.from_external(value_ptr)
		end	

	localized_string (a_group, a_key, a_locale: STRING): STRING
			-- the string value associated with `a_key' under `a_group',
			-- translated in the given locale, if available.  If no
			-- suitable translation can be found then the untranslated
			-- value is returned.
		require
			group_not_void: a_group/=Void
			key_not_void: a_key/=Void
			has_key: has_key(a_group, a_key)
		local value_ptr: POINTER
		do
			value_ptr:=(g_key_file_get_locale_string 
							(handle, a_group.to_external,
							 a_key.to_external, null_or_string(a_locale),
							 error.reference))
			-- Returns the value associated with key under group_name
			-- translated in the given locale if available. If locale is
			-- NULL then the current locale is assumed.

			-- If key cannot be found then NULL is returned and error is
			-- set to G_KEY_FILE_ERROR_KEY_NOT_FOUND. If the value
			-- associated with key cannot be interpreted or no suitable
			-- translation can be found then the untranslated value is
			-- returned.
			check value_ptr.is_not_null end
			create Result.from_external(value_ptr)
		end

	boolean (a_group, a_key: STRING): BOOLEAN
			-- the boolean value associated with `a_key' under
			-- `a_group'. If the value associated with key cannot be
			-- interpreted as a boolean then `is_valid' will be False.
		require
			key_not_void: a_key/=Void
			has_key: has_key(a_group, a_key)
		do
			Result:=(g_key_file_get_boolean
						(handle, a_group.to_external, a_key.to_external,
						 error.reference)).to_boolean
			-- g_key_file_get_boolean returns the value associated with
			-- key under group_name as a boolean. If key cannot be found
			-- then the return value is undefined and error is set to
			-- G_KEY_FILE_ERROR_KEY_NOT_FOUND. Likewise, if the value
			-- associated with key cannot be interpreted as a boolean
			-- then the return value is also undefined and error is set
			-- to G_KEY_FILE_ERROR_INVALID_VALUE.
		end

	integer (a_group, a_key: STRING): INTEGER
			-- the integer value associated with `a_key' under
			-- `a_group'. If `a_group' is Void, the start group is used.

			-- If the value associated with `a_key' cannot be interpreted
			-- as an integer then `is_valid' will be False.
		require
			key_not_void: a_key/=Void
			has_key: has_key(a_group, a_key)
		do
			Result:=(g_key_file_get_integer
						(handle, null_or_string(a_group), a_key.to_external,
						 error.reference))
			-- Returns the value associated with key under group_name as
			-- an integer.

			-- If key cannot be found then the return value is undefined
			-- and error is set to
			-- G_KEY_FILE_ERROR_KEY_NOT_FOUND. Likewise, if the value
			-- associated with key cannot be interpreted as an integer
			-- then the return value is also undefined and error is set
			-- to G_KEY_FILE_ERROR_INVALID_VALUE.
		end

	real (a_group, a_key: STRING): REAL
			-- the real value associated with `a_key' under `a_group'. If
			-- `a_group' is Void, the start group is used.

			-- If the value associated with `a_key' cannot be interpreted
			-- as a real then `is_valid' will be False.
		require
			key_not_void: a_key/=Void
			has_key: has_key(a_group, a_key)
		do
			Result:=(g_key_file_get_double(handle, a_group.to_external, a_key.to_external, error.reference))
		end

	string_list (a_group, a_key: STRING): COLLECTION[STRING]
			-- the values associated with `a_key' under `a_group'.
		require
			group_not_void: a_group/=Void
			key_not_void: a_key/=Void
			has_key: has_key(a_group, a_key)
		local value_ptr: POINTER
		do
			value_ptr:=(g_key_file_get_string_list
							(handle, a_group.to_external, a_key.to_external,
							 default_pointer, -- gsize *length,
							 error.reference))
			if value_ptr.is_not_null then
				create {NULL_TERMINATED_STRING_ARRAY}
				Result.from_external(value_ptr)
			end
			-- g_key_file_get_string_list returns the values associated with key
			-- under group_name.
			
			-- In the event the key cannot be found, NULL is returned and error is
			-- set to G_KEY_FILE_ERROR_KEY_NOT_FOUND. In the event that the
			-- group_name cannot be found, NULL is returned and error is set to
			-- G_KEY_FILE_ERROR_GROUP_NOT_FOUND.
			
			-- key_file :   a GKeyFile
			-- group_name : a group name
			-- key :        a key
			
			-- length return location for the number of returned strings, or NULL
			-- error return location for a GError, or NULL
			-- returns a NULL-terminated string array or NULL if the specified key
			-- cannot be found. The array should be freed with g_strfreev().
		end

	localized_string_list (a_group, a_key, a_locale: STRING): COLLECTION[STRING]
			-- the values associated with `a_key' under `a_group'
			-- translated in `a_locale' if available. If `a_locale' is
			-- Void then the current locale is assumed.
		require
			group_not_void: a_group/=Void
			key_not_void: a_key/=Void
			has_key: has_key(a_group, a_key)
		local value_ptr: POINTER
		do
			value_ptr:=(g_key_file_get_locale_string_list 
							(handle, a_group.to_external, a_key.to_external,
							 null_or_string(a_locale),
							 default_pointer, -- gsize *length, a return location for the number of returned strings or NULL
							 error.reference))
			-- g_key_file_get_locale_string_list returns the values associated with
			-- key under group_name translated in the given locale if available. If
			-- locale is NULL then the current locale is assumed.

			-- If key cannot be found then NULL is returned and error is set to
			-- G_KEY_FILE_ERROR_KEY_NOT_FOUND. If the values associated with key
			-- cannot be interpreted or no suitable translations can be found then
			-- the untranslated values are returned. The returned array is
			-- NULL-terminated, so length may optionally be NULL.

			-- g_key_file_get_locale_string_list returns a newly allocated
			-- NULL-terminated string array or NULL if the key isn't found. The
			-- string array should be freed with g_strfreev().
			if value_ptr.is_not_null then
				create {NULL_TERMINATED_STRING_ARRAY}
				Result.from_external(value_ptr)
			end
		end

	boolean_list (a_group, a_key: STRING): COLLECTION[BOOLEAN]
			-- the values associated with `a_key' under `a_group'. If `a_group' is
			-- Void, the start_group is used.
		require
			group_not_void: a_group/=Void
			key_not_void: a_key/=Void
			has_key: has_key(a_group, a_key)
		local value_ptr: POINTER; a_storage: NATIVE_ARRAY[INTEGER]; a_length, i: INTEGER
		do
			value_ptr:=(g_key_file_get_boolean_list
							(handle, a_group.to_external,
							 a_key.to_external,
							 $a_length, error.reference))
				-- If key cannot be found then the return value is undefined and error
				-- is set to G_KEY_FILE_ERROR_KEY_NOT_FOUND. Likewise, if the values
				-- associated with key cannot be interpreted as booleans then the
				-- return value is also undefined and error is set to
				-- G_KEY_FILE_ERROR_INVALID_VALUE.
			if value_ptr.is_not_null then 
				-- g_key_file_get_boolean_list returns the values associated with
				-- key under group_name as booleans.
				a_storage:=a_storage.from_pointer(value_ptr)
				create {FAST_ARRAY[BOOLEAN]} Result.make(a_length)
				from i:=a_length-1 until i=0 loop
					Result.force(a_storage.item(i).to_boolean,i)
					i:=i-1
				end
			end
		end

	integer_list (a_group, a_key: STRING): COLLECTION[INTEGER_32]
			-- the value associated with `a_key' under `a_group'.
		require
			group_not_void: a_group/=Void
			key_not_void: a_key/=Void
			has_key: has_key(a_group, a_key)
		local
			value_ptr: POINTER; a_storage: NATIVE_ARRAY[INTEGER_32];
			a_length, i: INTEGER_32
		do
			value_ptr:=(g_key_file_get_integer_list
							(handle, a_group.to_external,
							 a_key.to_external, $a_length, error.reference))
			-- g_key_file_get_integer_list returns the values associated with key
			-- under group_name as integers.
			
			-- If key cannot be found then the return value is undefined and error
			-- is set to G_KEY_FILE_ERROR_KEY_NOT_FOUND. Likewise, if the values
			-- associated with key cannot be interpreted as integers then the
			-- return value is also undefined and error is set to
			-- G_KEY_FILE_ERROR_INVALID_VALUE.
			if value_ptr.is_not_null then
				create {FAST_ARRAY[INTEGER_32]}
				Result.make(a_length)
				from i:=a_length-1 until i=0 loop
					Result.force(a_storage.item(i),i)
					i:=i-1
				end					
			end
		end
	
	real_list (a_group, a_key: STRING): COLLECTION[REAL]
			-- the real values associated with `a_key' under `a_group'. `is_valid'
			-- will be False if the values associated with key cannot be
			-- interpreted as real.
		require
			group_not_void: a_group/=Void
			key_not_void: a_key/=Void
			has_key: has_key(a_group, a_key)
		local
			value_ptr: POINTER; a_storage: NATIVE_ARRAY[REAL];
			a_length, i: INTEGER
		do
			value_ptr:=(g_key_file_get_double_list
							(handle, a_group.to_external,
							 a_key.to_external, $a_length,
							 error.reference))
			-- g_key_file_get_double_list returns the values associated with key
			-- under group_name as doubles. If group_name is NULL, the start group
			-- is used.
			if value_ptr.is_not_null then
				a_storage:=a_storage.from_pointer(value_ptr)
				create {FAST_ARRAY[REAL]}
				Result.make(a_length)
				from i:=a_length-1 until i=0 loop
					Result.force(a_storage.item(i),i)
					i:=i-1
				end					
			end
		end

	comment (a_group, a_key: STRING): STRING
			-- The comment above `a_key' from `a_group'. If `a_key' is Void then
			-- comment will be read from above `a_group'. If both `a_key' and
			-- `a_group' are Void, then comment will be read from above the first
			-- group in the file.
		require
			group_not_void: a_group/=Void
			key_not_void: a_key/=Void
			has_key: has_key(a_group, a_key)
		local ptr: POINTER
		do
			ptr:=(g_key_file_get_comment
					(handle, null_or_string(a_group),
					 null_or_string(a_key), error.reference))
			if ptr.is_not_null then create Result.from_external(ptr) end
		end
	
feature {ANY} -- Setting commands

	-- Note: g_key_file_set_value seems to be a perfect duplicate of
	-- g_key_file_set_string. Therefore I haven't wrapped it into an 
	-- eventual `set_value'.
	
	set_string (a_group, a_key, a_string: STRING)
			-- Associates `a_string' with `a_key' under `a_group'. If `a_key' cannot
			-- be found then it is created. If `a_group' cannot be found then it is
			-- created.
		require
			group_not_void: a_group/=Void
			key_not_void: a_key/=Void
			string_not_void: a_string/=Void
		do
			g_key_file_set_string(handle, a_group.to_external,
										 a_key.to_external, a_string.to_external)
		ensure set: string(a_group, a_key).is_equal(a_string)
		end

	set_localized_string (a_group, a_key, a_string, a_locale: STRING)
			-- Associates `a_string' with `a_key' under `a_group' for
			-- `a_locale'. If translation for `a_key' cannot be found then it is
			-- created. 
		require
			group_not_void: a_group/=Void
			key_not_void: a_key/=Void
			string_not_void: a_string/=Void
			locale_not_void: a_locale/=Void
		do
			g_key_file_set_locale_string(handle, a_group.to_external,
												  a_key.to_external, a_locale.to_external,
												  a_string.to_external)
		ensure set: localized_string(a_group, a_key, a_locale).is_equal(a_string)
		end

	set_boolean (a_group, a_key: STRING; a_value: BOOLEAN)
			-- Associates the boolean `a_value' with `a_key' under `a_group'. If
			-- `a_key' cannot be found then it is created.
		require
			group_not_void: a_group/=Void
			key_not_void: a_key/=Void
		do
			g_key_file_set_boolean(handle,a_group.to_external,
										  a_key.to_external, a_value.to_integer)
		ensure set: boolean(a_group,a_key)=a_value
		end

	set_integer (a_group, a_key: STRING; a_value: INTEGER_32)
			-- Associates the integer `a_value' with `a_key' under `a_group'. If
			-- `a_key' cannot be found then it is created.
		require
			group_not_void: a_group/=Void
			key_not_void: a_key/=Void
		do
			g_key_file_set_integer (handle, a_group.to_external,
											a_key.to_external, a_value)
		end

	set_real  (a_group, a_key: STRING; a_value: REAL)
			-- Associates the real `a_value' with `a_key' under `a_group'. If
			-- `a_key' cannot be found then it is created.
			-- If `a_group' is Void, the start group is used.
		require key_not_void: a_key/=Void
		do
			g_key_file_set_double  (handle, null_or_string(a_group),
											a_key.to_external, a_value)
		end

	-- Note: the original C API names were referring to lists. Eiffel
	-- wrapper allow to use generic collections, hence the missing
	-- "list".

	set_strings (a_group, a_key: STRING; some_strings: COLLECTION[STRING])
			-- Associates `some_strings' to `a_key' under `a_group'. If `a_key'
			-- cannot be found then it is created. If `a_group' cannot be found
			-- then it is created.
		require
			group_not_void: a_group/=Void
			key_not_void: a_key/=Void
			strings_not_void: some_strings/=Void
		local native: NATIVE_ARRAY[POINTER]; i: INTEGER; si: ITERATOR[STRING]
		do
			native:=native.calloc(some_strings.count)
			from
				i:=0; si:=some_strings.get_new_iterator; si.start
			until si.is_off loop
				native.put(null_or_string(si.item),i)
				i:=i+1
				si.next
			end
			g_key_file_set_string_list
			(handle, a_group.to_external, a_key.to_external,
			 native.to_external, some_strings.count)
		end

	set_localized_strings (a_group, a_key, a_locale: STRING; some_strings: COLLECTION[STRING])
			-- Associates `some_strings' to `a_key' under `a_group' for
			-- `a_locale' language. If `a_key' cannot be found then it is
			-- created. If `a_group' cannot be found then it is created.
		require
			group_not_void: a_group/=Void
			key_not_void: a_key/=Void
			strings_not_void: some_strings/=Void
			locale_not_void:  a_locale/=Void
		local native: NATIVE_ARRAY[POINTER]; i: INTEGER; si: ITERATOR[STRING]
		do
			native:=native.calloc(some_strings.count)
			from
				i:=0; si:=some_strings.get_new_iterator; si.start
			until si.is_off loop
				native.put(null_or_string(si.item),i)
				i:=i+1
				si.next
			end
			g_key_file_set_locale_string_list
			(handle, a_group.to_external, a_key.to_external,
			 a_locale.to_external, native.to_external, some_strings.count)
		end

	set_booleans (a_group, a_key: STRING; some_booleans: COLLECTION[BOOLEAN])
			-- Associates `some_booleans' to `a_key' under `a_group' If
			-- `a_key' cannot be found then it is created. If `a_group'
			-- cannot be found then it is created. If `a_group' is Void,
			-- `start_group' is used.
		require
			key_not_void: a_key/=Void
			valid_booleans: (some_booleans/=Void and then 
								  not some_booleans.is_empty)
		local native: NATIVE_ARRAY[INTEGER]; i: INTEGER; si: ITERATOR[BOOLEAN]
		do
			native:=native.calloc(some_booleans.count)
			from
				i:=0; si:=some_booleans.get_new_iterator; si.start
			until si.is_off loop
				native.put(si.item.to_integer,i)
				i:=i+1
				si.next
			end
			g_key_file_set_boolean_list (handle, null_or_string(a_group),
												  a_key.to_external,
												  native.to_external, some_booleans.count)
		end

	set_integers (a_group, a_key: STRING; some_integers: COLLECTION[INTEGER])
			-- Associates `some_integers' to `a_key' under `a_group' If
			-- `a_key' cannot be found then it is created. If `a_group'
			-- cannot be found then it is created. If `a_group' is Void,
			-- `start_group' is used.
		require
			key_not_void: a_key/=Void
			valid_integers: (some_integers/=Void and then 
								  not some_integers.is_empty)
		local native: NATIVE_ARRAY[INTEGER]; i: INTEGER; si: ITERATOR[INTEGER]
		do
			native:=native.calloc(some_integers.count)
			from
				i:=0; si:=some_integers.get_new_iterator; si.start
			until si.is_off loop
				native.put(si.item,i)
				i:=i+1
				si.next
			end
			g_key_file_set_integer_list
			(handle, null_or_string(a_group), a_key.to_external,
			 native.to_external, some_integers.count)
		end

	set_reals (a_group, a_key: STRING; some_reals: COLLECTION[REAL])
			-- Associates `some_reals' to `a_key' under `a_group' If
			-- `a_key' cannot be found then it is created. If `a_group'
			-- cannot be found then it is created. If `a_group' is Void,
			-- `start_group' is used.
		require
			key_not_void: a_key/=Void
			valid_reals: (some_reals/=Void and then 
								  not some_reals.is_empty)
		local native: NATIVE_ARRAY[REAL]; i: INTEGER; si: ITERATOR[REAL]
		do
			native:=native.calloc(some_reals.count)
			from i:=0; si:=some_reals.get_new_iterator; si.start
			until si.is_off loop
				native.put(si.item,i)
				i:=i+1
				si.next
			end
			g_key_file_set_double_list
			(handle, null_or_string(a_group), a_key.to_external,
			 native.to_external, some_reals.count)
		end

	set_comment (a_group, a_key, a_comment: STRING)
			-- Places `a_comment' above `a_key' from `a_group'. If `a_key' is
			-- Void then comment will be written above `a_group'. If both `a_key' and
			-- `a_group' are Void, then comment will be written above the first
			-- group in the file.
		require comment_not_void: a_comment/=Void
		do
			g_key_file_set_comment
			(handle, null_or_string(a_group),
			 null_or_string(a_key), a_comment.to_external,
			 error.reference)
		end
	
feature {ANY} -- Removing
	remove_group (a_group: STRING)
			-- Removes `a_group' from the key file. `error' is updated.
		require group_not_void: a_group/=Void
		do
			g_key_file_remove_group(handle,a_group.to_external,error.reference)
		end

	remove_key (a_group, a_key: STRING)
			-- Removes `a_key' in `a_group' from the key file.
		require
			group_not_void: a_group/=Void
			key_not_void: a_key/=Void
		do
			g_key_file_remove_key (handle, a_group.to_external, a_key.to_external, error.reference)
		end
	
	remove_comment (a_group, a_key: STRING)
			-- Removes a comment above `a_key' from `a_group'. If `a_key'
			-- is Void then comment will be written above `a_group'. If
			-- both `a_key' and `a_group' are Void, then comment will be
			-- written above the first group in the file. `error' is
			-- updated.
		do
			g_key_file_remove_comment(handle,null_or_string(a_group),
											  null_or_string(a_key), error.reference)
		end

feature {}
	-- G_KEY_FILE_ERROR
	
	-- #define G_KEY_FILE_ERROR g_key_file_error_quark()
	
	-- Error domain for key file parsing. Errors in this domain will be
	-- from the GKeyFileError enumeration. See GError for information
	-- on error domains.

feature {} -- External calls
	-- #define     G_KEY_FILE_ERROR
	
	g_key_file_new: POINTER
			-- GKeyFile* g_key_file_new (void);
		external "C use <glib.h>"
		end

	g_key_file_free (a_key_file: POINTER)
			-- void g_key_file_free (GKeyFile *key_file);
		external "C use <glib.h>"
		end

	g_key_file_set_list_separator (a_key_file: POINTER; a_separator: CHARACTER)
			-- void g_key_file_set_list_separator (GKeyFile *key_file,
			-- gchar separator);
		external "C use <glib.h>"
		end

	g_key_file_load_from_file (a_key_file, a_file: POINTER; some_flags: INTEGER; an_error: POINTER): INTEGER
			--  gboolean g_key_file_load_from_file (GKeyFile *key_file,
			--  const gchar *file, GKeyFileFlags flags, GError **error);
		external "C use <glib.h>"
		end

	g_key_file_load_from_data (a_key_file, a_data: POINTER; a_length: INTEGER; some_flags: INTEGER;  an_error_ref: POINTER): INTEGER
			-- gboolean g_key_file_load_from_data (GKeyFile *key_file,
			-- const gchar *data, gsize length, GKeyFileFlags flags,
			-- GError **error);
		external "C use <glib.h>"
		end

	g_key_file_load_from_data_dirs (a_key_file, a_file, a_full_path: POINTER; some_flags: INTEGER; an_error: POINTER): INTEGER
			-- gboolean g_key_file_load_from_data_dirs (GKeyFile
			-- *key_file, const gchar *file, gchar **full_path,
			-- GKeyFileFlags flags, GError **error);
		external "C use <glib.h>"
		end

	g_key_file_to_data (a_key_file, a_length, an_error: POINTER): POINTER
			-- gchar* g_key_file_to_data (GKeyFile *key_file, gsize
			-- *length, GError **error);
		external "C use <glib.h>"
		end

	g_key_file_get_start_group (a_key_file: POINTER): POINTER
			--  gchar* g_key_file_get_start_group (GKeyFile *key_file);
		external "C use <glib.h>"
		end

	g_key_file_get_groups (a_key_file, a_length: POINTER): POINTER
			-- gchar** g_key_file_get_groups (GKeyFile *key_file, gsize
			-- *length);
		external "C use <glib.h>"
		end

	g_key_file_get_keys (a_key_file, a_group_name, a_length, an_error: POINTER): POINTER
			-- gchar** g_key_file_get_keys (GKeyFile *key_file, const
			-- gchar *group_name, gsize *length, GError **error);
		external "C use <glib.h>"
		end

	g_key_file_has_group (a_key_file, a_group_name: POINTER): INTEGER
			-- gboolean g_key_file_has_group (GKeyFile *key_file, const
			-- gchar *group_name);
		external "C use <glib.h>"
		end

	g_key_file_has_key (a_key_file, a_group_name, a_key, an_error: POINTER): INTEGER
			-- gboolean g_key_file_has_key (GKeyFile *key_file, const
			-- gchar *group_name, const gchar *key, GError **error);
		external "C use <glib.h>"
		end

	g_key_file_get_value (a_key_file, a_group_name, a_key, an_error: POINTER): POINTER
			-- gchar* g_key_file_get_value (GKeyFile *key_file, const
			-- gchar *group_name, const gchar *key, GError **error);
		external "C use <glib.h>"
		end

	g_key_file_get_string (a_key_file, a_group_name, a_key, an_error: POINTER): POINTER
			-- gchar* g_key_file_get_string (GKeyFile *key_file, const
			-- gchar *group_name, const gchar *key, GError **error);
		external "C use <glib.h>"
		end

	g_key_file_get_locale_string (a_key_file, a_group_name, a_key, a_locale, an_error: POINTER): POINTER
			-- gchar* g_key_file_get_locale_string (GKeyFile *key_file,
			-- const gchar *group_name, const gchar *key, const gchar
			-- *locale, GError **error);
		external "C use <glib.h>"
		end

	g_key_file_get_boolean (a_key_file, a_group_name, a_key, an_error: POINTER): INTEGER
			-- gboolean g_key_file_get_boolean (GKeyFile *key_file, const
			-- gchar *group_name, const gchar *key, GError **error);
		external "C use <glib.h>"
		end

	g_key_file_get_integer (a_key_file, a_group_name, a_key, an_error: POINTER): INTEGER
			-- gint g_key_file_get_integer (GKeyFile *key_file, const
			-- gchar *group_name, const gchar *key, GError **error);
		external "C use <glib.h>"
		end

	g_key_file_get_double (a_key_file, a_group_name, a_key, an_error: POINTER): REAL
			-- gdouble g_key_file_get_double (GKeyFile *key_file, const
			-- gchar *group_name, const gchar *key, GError **error);
		external "C use <glib.h>"
		end

	g_key_file_get_string_list (a_key_file, a_group_name, a_key, a_length, an_error: POINTER): POINTER
			-- gchar** g_key_file_get_string_list (GKeyFile *key_file,
			-- const gchar *group_name, const gchar *key, gsize *length,
			-- GError **error);
		external "C use <glib.h>"
		end

	
	g_key_file_get_locale_string_list (a_key_file, a_group_name, a_key, a_locale, a_length, an_error: POINTER): POINTER
			-- gchar** g_key_file_get_locale_string_list (GKeyFile
			-- *key_file, const gchar *group_name, const gchar *key,
			-- const gchar *locale, gsize *length, GError **error);
		external "C use <glib.h>"
		end

	g_key_file_get_boolean_list (a_key_file, a_group_name, a_key, a_length, an_error: POINTER): POINTER
			-- gboolean* g_key_file_get_boolean_list (GKeyFile *key_file,
			-- const gchar *group_name, const gchar *key, gsize *length,
			-- GError **error);
		external "C use <glib.h>"
		end

	g_key_file_get_integer_list (a_key_file, a_group_name, a_key, a_length, an_error: POINTER): POINTER
			-- gint* g_key_file_get_integer_list (GKeyFile *key_file,
			-- const gchar *group_name, const gchar *key, gsize *length,
			-- GError **error);
		external "C use <glib.h>"
		end
	
	g_key_file_get_double_list (a_key_file, a_group_name, a_key, a_length, an_error: POINTER): POINTER
			-- gdouble* g_key_file_get_double_list (GKeyFile *key_file,
			-- const gchar *group_name, const gchar *key, gsize *length,
			-- GError **error);
		external "C use <glib.h>"
		end

	g_key_file_get_comment (a_key_file, a_group_name, a_key, an_error: POINTER): POINTER
			-- gchar* g_key_file_get_comment (GKeyFile *key_file, const
			-- gchar *group_name, const gchar *key, GError **error);
		external "C use <glib.h>"
		end

	g_key_file_set_value (a_key_file, a_group_name, a_key, a_value: POINTER)
			-- void g_key_file_set_value (GKeyFile *key_file, const gchar
			-- *group_name, const gchar *key, const gchar *value);
		external "C use <glib.h>"
		end

	g_key_file_set_string (a_key_file, a_group_name, a_key, a_string: POINTER)
			--  void g_key_file_set_string (GKeyFile *key_file, const
			--  gchar *group_name, const gchar *key, const gchar
			--  *string);
		external "C use <glib.h>"
		end

	g_key_file_set_locale_string (a_key_file, a_group_name, a_key, a_locale, a_string: POINTER)
			--  void g_key_file_set_locale_string (GKeyFile *key_file,
			--  const gchar *group_name, const gchar *key, const gchar
			--  *locale, const gchar *string);
		external "C use <glib.h>"
		end

	g_key_file_set_boolean (a_key_file, a_group_name, a_key: POINTER; a_bool: INTEGER)
			--  void g_key_file_set_boolean (GKeyFile *key_file, const
			--  gchar *group_name, const gchar *key, gboolean value);
		external "C use <glib.h>"
		end

	g_key_file_set_integer (a_key_file, a_group_name, a_key: POINTER; a_value: INTEGER)
			-- void g_key_file_set_integer (GKeyFile *key_file, const
			-- gchar *group_name, const gchar *key, gint value);
		external "C use <glib.h>"
		end

	g_key_file_set_double (a_key_file, a_group_name, a_key: POINTER; a_value: REAL)
			-- void g_key_file_set_double (GKeyFile *key_file, const
			-- gchar *group_name, const gchar *key, gdouble value);
		external "C use <glib.h>"
		end

	g_key_file_set_string_list (a_key_file, a_group_name, a_key, a_list: POINTER;
										 a_length: INTEGER)
			-- void g_key_file_set_string_list (GKeyFile *key_file, const gchar
			-- *group_name, const gchar *key, const gchar * const list[], gsize
			-- length);
		external "C use <glib.h>"
		end

	g_key_file_set_locale_string_list (a_key_file, a_group_name, a_key, a_locale, a_list: POINTER; a_length: INTEGER)
			--  void g_key_file_set_locale_string_list (GKeyFile *key_file, const
			--  gchar *group_name, const gchar *key, const gchar *locale; const
			--  gchar * const list[], gsize length););
		external "C use <glib.h>"
		end
	
	g_key_file_set_boolean_list (a_key_file, a_group_name, a_key, a_bool_list: POINTER; a_length: INTEGER)
			--  void g_key_file_set_boolean_list (GKeyFile *key_file,
			--  const gchar *group_name, const gchar *key, gboolean
			--  list[], gsize length);

			-- TODO: a_length should be NATURAL or "like gsize"
		external "C use <glib.h>"
		end

	g_key_file_set_integer_list (a_key_file, a_group_name, a_key, a_gint_list: POINTER; a_length: INTEGER)
			--  void g_key_file_set_integer_list (GKeyFile *key_file,
			--  const gchar *group_name, const gchar *key, gint list[],
			--  gsize length);

			-- TODO: a_length should be NATURAL or even better "like
			-- gsize"
		external "C use <glib.h>"
		end

	g_key_file_set_double_list (a_key_file, a_group_name, a_key, a_double_list: POINTER; a_length: INTEGER)
			--  void g_key_file_set_double_list (GKeyFile *key_file,
			--  const gchar *group_name, const gchar *key, gdouble
			--  list[], gsize length);

			-- TODO: a_length should be NATURAL or even better "like
			-- gsize"
		external "C use <glib.h>"
		end
	
	g_key_file_set_comment (a_key_file, a_group_name, a_key, a_comment, an_error_ref: POINTER)
			--  void g_key_file_set_comment (GKeyFile *key_file, const
			--  gchar *group_name, const gchar *key, const gchar
			--  *comment, GError **error);
		external "C use <glib.h>"
		end

	g_key_file_remove_group (a_key_file, a_group_name, an_error_ref: POINTER)
			--  void g_key_file_remove_group (GKeyFile *key_file, const
			--  gchar *group_name, GError **error);
		external "C use <glib.h>"
		end

	g_key_file_remove_key (a_key_file, a_group_name, a_key, an_error_ref: POINTER)
			--  void g_key_file_remove_key (GKeyFile *key_file, const
			--  gchar *group_name, const gchar *key, GError **error);
		external "C use <glib.h>"
		end

	g_key_file_remove_comment (a_key_file, a_group_name, a_key, an_error_ref: POINTER)
			-- void g_key_file_remove_comment (GKeyFile *key_file, const
			-- gchar *group_name, const gchar *key, GError **error);
		external "C use <glib.h>"
		end

feature {ANY} -- size
	struct_size: INTEGER
		external "C inline use <glib.h>"
		alias "sizeof(GKeyFile)"
		end
end -- class G_KEY_FILE
