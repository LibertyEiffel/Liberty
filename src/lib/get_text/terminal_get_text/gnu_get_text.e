deferred class GNU_GET_TEXT

inherit
   NUMBER_GET_TEXT[STRING]
      undefine is_equal
      end
   TERMINAL_GET_TEXT[STRING]
      rename init as init_in_default_directory
      undefine is_equal
      redefine init_in_default_directory
      end

insert
   SINGLETON

feature {}
   init_in_default_directory
         -- Initialise with default values. Message catalogs will be
         -- looked for in
         -- /usr/local/share/locale/`locale'/LC_MESSAGES/`domain_name'.mo
      do
         set_text_domain
         Precursor
      end

   init_in_current_working_directory
         -- Initialise with default values. Message catalogs will be
         -- looked for in
         -- ./`locale'/LC_MESSAGES/`domain_name'.mo
      local
         bd: BASIC_DIRECTORY
      do
         default_message_catalog_directory := bd.current_working_directory.out
         init_in_default_directory
      end

feature {ANY}
   translation (message: STRING): like message
      local
         p: POINTER
      do
         Result := once ""
         p := message.to_external
         p := basic_gettext(p)
         Result.from_external(p)
      end

   number_translation (message_1, message_other: like translation; n: INTEGER): like translation
      local
         p1, p2: POINTER
      do
         Result := once ""
         p1 := message_1.to_external
         p2 := message_other.to_external
         p1 := basic_ngettext(p1, p2, n)
         Result.from_external(p1)
      end

feature {FILTER_GET_TEXT}
   domain_translation (domain_name, message: STRING): like translation
      local
         p: POINTER
      do
         Result := once ""
         p := message.to_external
         p := basic_dgettext(domain_name.to_external, p)
         Result.from_external(p)
      end

   domain_number_translation (domain_name: STRING; message_1, message_other: like translation; n: INTEGER): like translation
      local
         p1, p2: POINTER
      do
         Result := once ""
         p1 := message_1.to_external
         p2 := message_other.to_external
         p1 := basic_dngettext(domain_name.to_external, p1, p2, n)
         Result.from_external(p1)
      end

   register_domain (domain_name: STRING)
      do
         if default_message_catalog_directory /= Void then
            bind_text_domain(domain_name, default_message_catalog_directory)
         end
      end

feature {ANY}
   set_environment_variable (variable, value: STRING)
      local
         sys: SYSTEM
      do
         sys.set_environment_variable(variable, value)
         notify_change
      end

feature {ANY}
   set_message_locale (locale_name: like message_locale)
      local
         p: POINTER
      do
         p := locale_name.to_external
         p := basic_setlocale(lc_messages, p)
      end

   set_default_message_locale
      local
         s: STRING; p: POINTER
      do
         s := once ""
         p := s.to_external
         p := basic_setlocale(lc_all, p)
      end

   message_locale: STRING
      local
         p: POINTER
      do
         p := basic_setlocale(lc_messages, default_pointer)
         if p.is_not_null then
            Result := once ""
            Result.from_external(p)
         end
      end

   is_message_locale_set: BOOLEAN
      local
         p: POINTER
      do
         p := basic_setlocale(lc_messages, default_pointer)
         Result := p.is_not_null
      end

feature {ANY}
   set_text_domain
      local
         p: POINTER
      do
         p := text_domain.to_external
         p := basic_textdomain(p)
      ensure
         is_text_domain_set
      end

   is_text_domain_set: BOOLEAN
      local
         p: POINTER
      do
         p := basic_textdomain(default_pointer)
         Result := p.is_not_null
      end

feature {ANY}
   bind_text_domain (domain_name: like text_domain; dir_name: like text_domain_binding)
         -- The message catalog for domain `domain_name' will be
         -- looked for in directory `dir_name'.
      require
         domain_name /= Void
         dir_name /= Void
      local
         p1, p2: POINTER
      do
         p1 := domain_name.to_external
         p2 := dir_name.to_external
         p1 := basic_bindtextdomain(p1, p2)
      ensure
         text_domain_binding(domain_name).is_equal(dir_name)
      end

   text_domain_binding (domain_name: like text_domain): STRING
         -- In which directory will the message catalog for domain
         -- `domain_name' be looked for?
      require
         domain_name /= Void
      local
         p: POINTER
      do
         p := domain_name.to_external
         p := basic_bindtextdomain(p, default_pointer)
         if p.is_not_null then
            Result := once ""
            Result.from_external(p)
         end
      end

   is_text_domain_bound (domain_name: like text_domain): BOOLEAN
      require
         domain_name /= Void
      local
         p: POINTER
      do
         p := domain_name.to_external
         p := basic_bindtextdomain(p, default_pointer)
         Result := p.is_not_null
      ensure
         Result = (text_domain_binding(domain_name) /= Void)
      end

feature {ANY}
   bind_text_domain_code_set (domain_name: like text_domain; code_set: like text_domain_code_set)
      require
         domain_name /= Void
         code_set /= Void
      local
         p1, p2: POINTER
      do
         p1 := domain_name.to_external
         p2 := code_set.to_external
         p1 := basic_bind_textdomain_codeset(p1, p2)
      ensure
         text_domain_code_set(domain_name).is_equal(code_set)
      end

   text_domain_code_set (domain_name: like text_domain): STRING
      local
         p: POINTER
      do
         p := domain_name.to_external
         p := basic_bind_textdomain_codeset(p, default_pointer)
         if p.is_not_null then
            Result := once ""
            Result.from_external(p)
         end
      end

   is_text_domain_set_up (domain_name: STRING): BOOLEAN
      do
         Result := True
      ensure
         Result
      end

feature {}
   notify_change
      do
         not_yet_implemented
      end

   lc_messages: INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "gnu_get_text"
         feature_name: "LC_MESSAGES"
         }"
      end

   lc_all: INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "gnu_get_text"
         feature_name: "LC_ALL"
         }"
      end

   basic_textdomain (domain_name: POINTER): POINTER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "gnu_get_text"
         feature_name: "textdomain"
         }"
      end

   basic_gettext (msgid: POINTER): POINTER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "gnu_get_text"
         feature_name: "gettext"
         }"
      end

   basic_dgettext (domain_name, msgid: POINTER): POINTER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "gnu_get_text"
         feature_name: "dgettext"
         }"
      end

   basic_bind_textdomain_codeset (domainname, codeset: POINTER): POINTER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "gnu_get_text"
         feature_name: "bind_textdomain_codeset"
         }"
      end

   basic_ngettext (msgid1, msgid2: POINTER; n: INTEGER): POINTER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "gnu_get_text"
         feature_name: "ngettext"
         }"
      end

   basic_dngettext (domain, msgid1, msgid2: POINTER; n: INTEGER): POINTER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "gnu_get_text"
         feature_name: "dngettext"
         }"
      end

   basic_bindtextdomain (domain_name, dir_name: POINTER): POINTER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "gnu_get_text"
         feature_name: "bindtextdomain"
         }"
      end

   basic_setlocale (category: INTEGER; locale: POINTER): POINTER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "gnu_get_text"
         feature_name: "setlocale"
         }"
      end

feature {}
   default_message_catalog_directory: STRING

end -- class GNU_GET_TEXT
