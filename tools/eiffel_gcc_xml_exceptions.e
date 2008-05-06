deferred class EIFFEL_GCC_XML_EXCEPTIONS
	-- The exceptions used in eiffel-gcc-xml

insert ANY undefine default_create end

feature
	variadic_function: STRING is "Variadic functions cannot be automatically wrapped"

	unhandled_type: STRING is "Unhandled type "
	unhandled_complex_type: STRING is "Unhandled complex type"
	unhandled_unsigned_integer_type: STRING is "Unhandled_unsigned integer type"
	unhandled_integer_type: STRING is "Unhandled integer type"
	unhandled_double_type: STRING is "Unhandled double type"
	unhandled_structure_type: STRING is "C structure passed by value and not by reference does not have a valid Eiffel wrapper type; they are mostly akin to an eventual expanded external type"
	unhandled_union_type: STRING is "Unhnalded union type"
	unhandled_reference_type: STRING is "Unhnalded reference type: C++ reference does not have a valid Eiffel wrapper type."
end
