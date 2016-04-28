note
	copyright: "(C) 2005 Paolo Redaelli "
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision "$REvision:$"

class G_VALUE_EXAMPLE
insert
	G_TYPE_EXTERNALS
	G_PARAM_FLAGS
create {ANY} make
feature {ANY} make
		do
			g_type_init
			create bool.from_boolean (True)
			create int.from_integer (-12)
			create uint.from_natural (23)
			create real.from_real (23.53)
			create string.from_string ("Foo")
			create int_param.make_integer ("int-foo", "integer parameter", "an integer parameter",
													 -5,12,3, g_param_readable)
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
			print (int_param.name + " has default " + int_param.default_integer.out + "%N")
		end

feature {ANY} -- generic values
	bool, int, uint, real, string: G_VALUE
	int_param: G_PARAM_SPEC
end
	
