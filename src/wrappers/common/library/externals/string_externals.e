-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.
deferred class STRING_EXTERNALS

insert
   ANY
      undefine is_equal, copy
      end
   STANDARD_C_LIBRARY_TYPES

feature {}
   -- External calls
   -- function basename @(2) skipped as requested.
   -- function basename @(2) skipped as requested.
   bcmp (a_s1: POINTER; a_s2: POINTER; a_n: like long_unsigned): INTEGER is
         -- bcmp
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "bcmp"
      }"
      end -- `hidden' function __bzero skipped.

   ffs (an_i: INTEGER): INTEGER is
         -- ffs
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "ffs"
      }"
      end

   ffsl (a_l: like long): INTEGER is
         -- ffsl
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "ffsl"
      }"
      end

   ffsll (a_ll: INTEGER_64): INTEGER is
         -- ffsll
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "ffsll"
      }"
      end
      -- function index @(2) skipped as requested.
      -- function index @(2) skipped as requested.

   memccpy (a_dest: POINTER; a_src: POINTER; a_c: INTEGER; a_n: like long_unsigned): POINTER is
         -- memccpy
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "memccpy"
      }"
      end
      -- function memchr @(2) skipped as requested.
      -- function memchr @(2) skipped as requested.

   memcmp (a_s1: POINTER; a_s2: POINTER; a_n: like long_unsigned): INTEGER is
         -- memcmp
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "memcmp"
      }"
      end

   memfrob (a_s: POINTER; a_n: like long_unsigned): POINTER is
         -- memfrob
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "memfrob"
      }"
      end

   memmem (a_haystack: POINTER; a_haystacklen: like long_unsigned; a_needle: POINTER; a_needlelen: like long_unsigned): POINTER is
         -- memmem
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "memmem"
      }"
      end
      -- `hidden' function __mempcpy skipped.
      -- function memrchr @(2) skipped as requested.
      -- function memrchr @(2) skipped as requested.
      -- function rawmemchr @(2) skipped as requested.
      -- function rawmemchr @(2) skipped as requested.
      -- function rindex @(2) skipped as requested.
      -- function rindex @(2) skipped as requested.
      -- `hidden' function __stpcpy skipped.
      -- `hidden' function __stpncpy skipped.

   strcasecmp (a_s1: POINTER; a_s2: POINTER): INTEGER is
         -- strcasecmp
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "strcasecmp"
      }"
      end

   strcasecmp_l (a_s1: POINTER; a_s2: POINTER; a_loc: POINTER): INTEGER is
         -- strcasecmp_l
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "strcasecmp_l"
      }"
      end
      -- function strcasestr @(2) skipped as requested.
      -- function strcasestr @(2) skipped as requested.
      -- function strchr @(2) skipped as requested.
      -- function strchr @(2) skipped as requested.
      -- function strchrnul @(2) skipped as requested.
      -- function strchrnul @(2) skipped as requested.

   strcmp (a_s1: POINTER; a_s2: POINTER): INTEGER is
         -- strcmp
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "strcmp"
      }"
      end

   strcoll (a_s1: POINTER; a_s2: POINTER): INTEGER is
         -- strcoll
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "strcoll"
      }"
      end

   strcoll_l (a_s1: POINTER; a_s2: POINTER; a_l: POINTER): INTEGER is
         -- strcoll_l
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "strcoll_l"
      }"
      end

   strcspn (a_s: POINTER; a_reject: POINTER): like long_unsigned is
         -- strcspn
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "strcspn"
      }"
      end

   strdup (a_s: POINTER): POINTER is
         -- strdup
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "strdup"
      }"
      end

   strerror (an_errnum: INTEGER): POINTER is
         -- strerror
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "strerror"
      }"
      end

   strerror_l (an_errnum: INTEGER; a_l: POINTER): POINTER is
         -- strerror_l
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "strerror_l"
      }"
      end

   strerror_r (an_errnum: INTEGER; a_buf: POINTER; a_buflen: like long_unsigned): POINTER is
         -- strerror_r
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "strerror_r"
      }"
      end

   strfry (a_string: POINTER): POINTER is
         -- strfry
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "strfry"
      }"
      end

   strlen (a_s: POINTER): like long_unsigned is
         -- strlen
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "strlen"
      }"
      end

   strncasecmp (a_s1: POINTER; a_s2: POINTER; a_n: like long_unsigned): INTEGER is
         -- strncasecmp
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "strncasecmp"
      }"
      end

   strncasecmp_l (a_s1: POINTER; a_s2: POINTER; a_n: like long_unsigned; a_loc: POINTER): INTEGER is
         -- strncasecmp_l
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "strncasecmp_l"
      }"
      end

   strncmp (a_s1: POINTER; a_s2: POINTER; a_n: like long_unsigned): INTEGER is
         -- strncmp
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "strncmp"
      }"
      end

   strndup (a_string: POINTER; a_n: like long_unsigned): POINTER is
         -- strndup
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "strndup"
      }"
      end

   strnlen (a_string: POINTER; a_maxlen: like long_unsigned): like long_unsigned is
         -- strnlen
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "strnlen"
      }"
      end
      -- function strpbrk @(2) skipped as requested.
      -- function strpbrk @(2) skipped as requested.
      -- function strrchr @(2) skipped as requested.
      -- function strrchr @(2) skipped as requested.

   strsep (a_stringp: POINTER; a_delim: POINTER): POINTER is
         -- strsep
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "strsep"
      }"
      end

   strsignal (a_sig: INTEGER): POINTER is
         -- strsignal
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "strsignal"
      }"
      end

   strspn (a_s: POINTER; an_accept: POINTER): like long_unsigned is
         -- strspn
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "strspn"
      }"
      end
      -- function strstr @(2) skipped as requested.
      -- function strstr @(2) skipped as requested.

   strtok (a_s: POINTER; a_delim: POINTER): POINTER is
         -- strtok
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "strtok"
      }"
      end -- `hidden' function __strtok_r skipped.

   strtok_r (a_s: POINTER; a_delim: POINTER; a_save_ptr: POINTER): POINTER is
         -- strtok_r
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "strtok_r"
      }"
      end

   strverscmp (a_s1: POINTER; a_s2: POINTER): INTEGER is
         -- strverscmp
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "strverscmp"
      }"
      end

   strxfrm (a_dest: POINTER; a_src: POINTER; a_n: like long_unsigned): like long_unsigned is
         -- strxfrm
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "strxfrm"
      }"
      end

   strxfrm_l (a_dest: POINTER; a_src: POINTER; a_n: like long_unsigned; a_l: POINTER): like long_unsigned is
         -- strxfrm_l
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "strxfrm_l"
      }"
      end

end -- class STRING_EXTERNALS
