class FILTER_EXAMPLES

create {ANY}
   make

feature {}
   make
      local
         file: TEXT_FILE_WRITE; html: HTML_OUTPUT_STREAM
      do
         -- first create the terminal stream (the one that can write characters to some device)
         create file.connect_to("index.html")
         -- now create the filter, and attach it the previous stream (many filters can be hooked this way)
         create html.connect_to(file)
         -- now write the file using the upmost filter (the one that is *not* connected by something else)
         -- The HTML_OUTPUT_STREAM is a bit peculiar because it exports many helper functions instead of the
         -- all-purpose put_character. Those functions ensure the integrity of the produced HTML.

         html.header
         html.open_title
         html.put_string("My Home Page")
         html.close_title
         html.put_stylesheet("styles.css")

         html.body
         html.with_attribute("class", "section")
         html.open_section
         html.put_string("My Home Page")
         html.close_section

         html.with_attribute("class", "par")
         html.open_paragraph
         html.put_string("This is ")
         html.open_bold
         html.put_string("my")
         html.close_bold
         html.put_string(" home page!")
         html.close_paragraph

         html.close
         -- only now can the HTML file be disconnected.
      end

end -- class FILTER_EXAMPLES
