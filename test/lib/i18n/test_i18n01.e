class TEST_I18N01

create {}
	make

feature {}
	make is
		local
			i18n: I18N
			locale: LOCALE
			time: TIME
		do
			std_output.put_line(locale.out)
			time.update
			std_output.put_string(once "low-level locale:    ")
			std_output.put_line(locale.localized_time_and_date(time))
			std_output.put_string(once "up-level i18n layer: ")
			std_output.put_line(i18n.locale.localized_time_and_date(time))
		end

end
