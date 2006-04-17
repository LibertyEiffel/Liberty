indexing
	copyright: "(C) 2005 Paolo Redaelli <paolo.redaelli@poste.it>"
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision "$REvision:$"

class G_VALUE_EXAMPLE

inherit G_TYPE_EXTERNALS
creation make
feature make is
		do
			g_type_init
			create bool.from_boolean (True)
			create int.from_integer (-12)
			create uint.from_natural (23)
			create real.from_real (23.53)
			create string.from_string ("Foo")
			check
				correct_bool: bool.is_boolean
				correct_int: int.is_integer
				correct_uint: uint.is_natural
				correct_real: real.is_real
				correct_string: string.is_string
			end
			print ("Bool is "+bool.boolean.to_string+"%N") 
			print ("int is "+int.integer.to_string+"%N")
			print ("uint is "+uint.natural.to_string+"%N")
			print ("real is "+real.real.to_string+"%N")
			print ("string is '"+string.string+"'%N")
		end

feature -- generic values
	bool, int, uint, real, string: G_VALUE
end
	
