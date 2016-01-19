-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.
deferred class HWINT_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	abs_hwi (an_argument_l3768_c7: like long): like long 
               -- abs_hwi
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	absu_hwi (an_argument_l2948_c7: like long): like long_unsigned 
               -- absu_hwi
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	ceil_log2 (a_x: like long_unsigned): INTEGER 
               -- ceil_log2
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	clz_hwi (a_x: like long_unsigned): INTEGER 
               -- clz_hwi
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	ctz_hwi (a_x: like long_unsigned): INTEGER 
               -- ctz_hwi
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	exact_log2 (a_x: like long_unsigned): INTEGER 
               -- exact_log2
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	ffs_hwi (a_x: like long_unsigned): INTEGER 
               -- ffs_hwi
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	floor_log2 (a_x: like long_unsigned): INTEGER 
               -- floor_log2
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	gcd (an_argument_l4757_c7: like long; an_argument_l4758_c7: like long): like long 
               -- gcd
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	least_common_multiple (an_argument_l4640_c7: like long; an_argument_l4641_c7: like long): like long 
               -- least_common_multiple
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	mul_hwi (an_argument_l622_c7: like long; an_argument_l623_c7: like long): like long 
               -- mul_hwi
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	popcount_hwi (a_x: like long_unsigned): INTEGER 
               -- popcount_hwi
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	pos_mul_hwi (an_argument_l2013_c7: like long; an_argument_l2014_c7: like long): like long 
               -- pos_mul_hwi
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	sext_hwi (a_src: like long; a_prec: NATURAL): like long 
               -- sext_hwi
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	zext_hwi (a_src: like long_unsigned; a_prec: NATURAL): like long_unsigned 
               -- zext_hwi
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end


end -- class HWINT_EXTERNALS
