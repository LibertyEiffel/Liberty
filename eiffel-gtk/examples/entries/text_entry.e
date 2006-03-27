class TEXT_ENTRY
inherit GTK_ENTRY
creation with_label
feature with_label (a_label: STRING) is
		require a_label/=Void
		do
			make
			set_text (a_label)
			connect (Current, "changed", $on_changed)
			connect (Current, "delete-text", $on_delete)
		end

	on_changed is
		do
			print ("Entry has changed; now it contains `") print(text) print ("'%N")
		end

	on_delete (a_start,an_end: INTEGER) is
		do
			print ("Deleting text in entry from ") print(a_start.out) print (" to ") print (an_end.out) print("%N")
		end

end

