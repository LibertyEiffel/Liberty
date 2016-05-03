-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
expanded class XML_BUFFER_ALLOCATION_SCHEME_ENUM

-- Wrapper of enum xmlBufferAllocationScheme defined in file /usr/include/libxml2/libxml/tree.h
insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN
        do
            Result := ((a_value = bounded_low_level)  or else
				(a_value = doubleit_low_level)  or else
				(a_value = exact_low_level)  or else
				(a_value = hybrid_low_level)  or else
				(a_value = immutable_low_level)  or else
				(a_value = io_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_bounded
               do
                       value := bounded_low_level
               end

	set_doubleit
               do
                       value := doubleit_low_level
               end

	set_exact
               do
                       value := exact_low_level
               end

	set_hybrid
               do
                       value := hybrid_low_level
               end

	set_immutable
               do
                       value := immutable_low_level
               end

	set_io
               do
                       value := io_low_level
               end

feature {ANY} -- Queries
       is_bounded: BOOLEAN
               do
                       Result := (value=bounded_low_level)
               end

       is_doubleit: BOOLEAN
               do
                       Result := (value=doubleit_low_level)
               end

       is_exact: BOOLEAN
               do
                       Result := (value=exact_low_level)
               end

       is_hybrid: BOOLEAN
               do
                       Result := (value=hybrid_low_level)
               end

       is_immutable: BOOLEAN
               do
                       Result := (value=immutable_low_level)
               end

       is_io: BOOLEAN
               do
                       Result := (value=io_low_level)
               end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
     bounded_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_BUFFER_ALLOC_BOUNDED"
                       }"
               end

     doubleit_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_BUFFER_ALLOC_DOUBLEIT"
                       }"
               end

     exact_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_BUFFER_ALLOC_EXACT"
                       }"
               end

     hybrid_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_BUFFER_ALLOC_HYBRID"
                       }"
               end

     immutable_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_BUFFER_ALLOC_IMMUTABLE"
                       }"
               end

     io_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_BUFFER_ALLOC_IO"
                       }"
               end


end -- class XML_BUFFER_ALLOCATION_SCHEME_ENUM
