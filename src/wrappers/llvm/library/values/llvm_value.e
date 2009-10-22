class LLVM_VALUE
	-- LLVM Value Representation.

	-- This is a very important LLVM class. It is the anchestor of all values
	-- computed by a program that may be used as operands to other values.
	-- LLVM_VALUE is the parent of other important classes such as Instruction
	-- and Function. 
	
	-- All LLVM_VALUEs have a Type. Type is not a subclass of Value. All types
	-- can have a name and they should belong to some Module. Setting the name
	-- on the Value automatically updates the module's symbol table.

	-- Every value has a "use list" that keeps track of which other Values are
	-- using this Value. A Value can also have an arbitrary number of
	-- ValueHandle objects that watch it and listen to RAUW and Destroy events
	-- see llvm/Support/ValueHandle.h for details.
inherit 
	C_STRUCT
	EIFFEL_OWNED
	LLVM_TYPE_FACTORY
feature 
	type: LLVM_TYPE is
		do
			Result:=wrapper(llvmtype_of(handle))
		end
	
	name: FIXED_STRING is
		-- The name of the value. TODO: currently the content is copied from a
		-- "const char*" into Result; turn Result into a CONST_STRING.
	do
	
		create Result.from_external_copy(llvmget_value_name(handle))
	end

	set_name (a_name: ABSTRACT_STRING) is
		require a_name /= Void
		do
			llvmset_value_name(handle,a_name.to_external)
		end
		
	dump is
		do
			llvmdump_value(handle)
		end

feature -- Queries
	is_basic_block: BOOLEAN is
		do
			Result:=llvmvalue_is_basic_block(handle).to_boolean
		end

	-- TODO: may be unnecessary "as_basic_block: LLVM_BASIC_BLOCK is do Result:=wrapper_or_void(llvmvalue_as_basic_block(handle)) end"

feature
	struct_size: INTEGER is
		-- LLVM_VALUE wraps a polymorphic C++ class; temporarly this query
		-- always fails; it should not hamper proper usage, since it is used
		-- only to allocate memory during object copying with the standard
		-- feature.
	require implemented: False
		do
			not_yet_implemented -- or mostly unuseful
		end

end -- class LLVM_VALUE

-- Copyright 2009 Paolo Redaelli

