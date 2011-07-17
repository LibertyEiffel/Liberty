class COMBO_DEMO
	-- Show how to use COMBO to allow selection from pre-defined values.

inherit
	GRAPHIC

creation {ANY}
	make

feature {}
	make is
		local
			toplevel_window: TOPLEVEL_WINDOW; language, day: COMBO
		do
			create toplevel_window.default_create
			toplevel_window.when_close_requested(agent vision.loop_stack.break)
			toplevel_window.set_background_color(light_grey_color)
			create language.with_text(toplevel_window, languages_names_list)
			language.map
			create day.with_text(toplevel_window, days_names_list_en)
			day.map
			language.when_value_change(agent change_language(day, ?))
			toplevel_window.map
			vision.start
		end

	change_language (c: COMBO; i: INTEGER) is
		local
			memo: INTEGER
		do
			memo := c.active_item
			c.change_items_with_text(languages_list.item(i))
			c.activate(memo)
		end

	languages_list: FAST_ARRAY[FAST_ARRAY[UNICODE_STRING]] is
		once
			Result := {FAST_ARRAY[FAST_ARRAY[UNICODE_STRING]] << days_names_list_en,
																				  days_names_list_es,
																				  days_names_list_fr >> }
		end

	languages_names_list: FAST_ARRAY[UNICODE_STRING] is
		once
			Result := {FAST_ARRAY[UNICODE_STRING] <<U"English", U"Spanish", U"French">> }
		end

	days_names_list_en: FAST_ARRAY[UNICODE_STRING] is
		once
			Result := {FAST_ARRAY[UNICODE_STRING] << U"Monday",
																  U"Tuesday",
																  U"Wednesday",
																  U"Thursday",
																  U"Friday",
																  U"Saturday",
																  U"Sunday" >> }
		end

	days_names_list_es: FAST_ARRAY[UNICODE_STRING] is
		once
			Result := {FAST_ARRAY[UNICODE_STRING] << U"Lunes",
																  U"Martes",
																  U"Miercoles",
																  U"Jueves",
																  U"Viernes",
																  U"Sabado",
																  U"Domingo" >> }
		end

	days_names_list_fr: FAST_ARRAY[UNICODE_STRING] is
		once
			Result := {FAST_ARRAY[UNICODE_STRING] << U"Lundi",
																  U"Mardi",
																  U"Mercredi",
																  U"Jeudi",
																  U"Vendredi",
																  U"Samedi",
																  U"Dimanche" >> }
		end

end -- class COMBO_DEMO
