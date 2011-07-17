class BASIC_UNICODE
-- This file is writen in utf8 format. If you read it using utf8 mode
-- and good unicode font, you'll see euro symbol. If not, you may see
-- three characters instead.
--
-- If you use linux, try "cat basic_unicode.e". If euro symbol is not
-- displayed then try: LC_CTYPE=en_GB.UTF-8 xterm -fn '-Misc-Fixed-Medium-R-SemiCondensed--13-120-75-75-C-60-ISO10646-1'&
-- If you didn't have this font, look for some font matching '-*-*-*-*-*-*-*-*-*-*-m-*-iso10646-1' or '-*-*-*-*-*-*-*-*-*-*-c-*-iso10646-1'. Use xfontsel
-- or xlsfonts -fn '-*-*-*-*-*-*-*-*-*-*-m(or c)-*-iso10646-1'. If you find
-- none then you need to install unicode fonts (iso10646).
--
-- If you are using windows, look for an unicode capable editor 
-- (Microsoft Word is known to be able to read UTF-8 encoded files)
-- Many unicode editors are available on the web.
--
-- More information is available at:
-- http://www.unicode.org/
-- http://www.unicode.org/charts/
-- http://www.unicode.org/onlinedat/products.html

inherit GRAPHIC

create
   make

feature {}

   toplevel_window: TOPLEVEL_WINDOW

   make is
      local
	 label_1, label_2, label_3, label_4: LABEL
	 s: UNICODE_STRING
      do
	 create s.make(0)
	 -- utf8 sequence decoding (when read from file for example)
	 if s.utf8_decode_from("Currency sign for the European monetary: €") then
	    create toplevel_window.default_create
	    toplevel_window.set_title("Unicode demo")
	    toplevel_window.set_background_color(white_color)
	    toplevel_window.map
	    create label_1.make(s)
	    toplevel_window.child_attach(label_1)

	    -- unicode manifest string (in utf8 format)
	    create label_2.make(U"Latin capital letter A, combining ring above: A%/204/%/138/")
	    toplevel_window.child_attach(label_2)

	    create label_3.make(U"Angstrom sign: Å")
	    toplevel_window.child_attach(label_3)

	    -- unicode manifest string with unicode character number (hexa)
	    create label_4.make(U"Surface integral symbol: %/Ux222F/")
	    toplevel_window.child_attach(label_4)

	    toplevel_window.when_close_requested(agent vision.loop_stack.break)
	    vision.start
	 else
	    io.put_string("Error%N")
	 end
      end
end
