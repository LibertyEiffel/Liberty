class EIFFELDOC_OUTPUT_STREAM

inherit
   HTML_OUTPUT_STREAM
      redefine
         open_anchor_address, put_stylesheet, put_javascript
      end

insert
   EIFFELDOC_GLOBALS
      undefine
         tmp_file_read
      end

create {EIFFELDOC_GLOBALS}
   make, connect_to

feature {ANY}
   put_meta_refresh_api (url_string: STRING)
         -- <meta http-equiv="refresh" content="0; url=..." />
      local
         content: STRING
      do
         content := once ""
         content.copy(once "0; url=")
         content.append(relocalized(url_string))
         put_meta(once "refresh", content)
      end

   open_anchor_address (ref, target: STRING)
      do
         Precursor(relocalized(ref), target)
      end

   with_href (ref: STRING)
      do
         with_attribute(once "href", relocalized(ref))
      end

   put_stylesheet (ref: STRING)
      do
         Precursor(relocalized(ref))
      end

   put_javascript (ref: STRING)
      do
         Precursor(relocalized(ref))
      end

feature {EIFFELDOC_GLOBALS}
   set_depth (a_depth: INTEGER)
      local
         i: INTEGER
      do
         depth := ""
         from
            i := 1
         until
            i > a_depth
         loop
            depth.append(once "../")
            i := i + 1
         end
      end

   depth: STRING

   relocalized (ref: STRING): STRING
      local
         i: INTEGER; s: STRING
      do
         if ref.first = '#' then
            Result := ref
         else
            i := ref.first_index_of(':')
            if ref.valid_index(i) then
               s := once ""
               s.copy(ref)
               s.shrink(1, i - 1)
               inspect
                  s
               when "http", "https", "ftp", "mailto", "javascript" then
                  Result := ref
               else
               end
            end
            if Result = Void then
               Result := once ""
               Result.copy(depth)
               Result.append(ref)
            end
         end
      end

end
