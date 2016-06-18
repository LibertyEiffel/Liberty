class MEMORY_MAPPED_MESSAGE

inherit MESSAGE redefine port end

feature {ANY}
	port: MEMORY_MAPPED_MESSAGE_PORT

	contained_in_message_port: BOOLEAN
		local internal: TYPED_INTERNAL[like Current]; i: INTEGER
		do
			-- Get an internal for Current
			create {TYPED_INTERNALS[like Current]} internal.for_object(Current)

			from Result:=True i:=1 until Result=False or else i>internal.type_attribute_count
			loop
				Result := internal.object_attribute(i).object_as_pointer
				i:=i+1
			end
		end
invariant 
	
