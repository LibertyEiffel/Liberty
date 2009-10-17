class LLVM_MODULE
	-- The main container class for the LLVM Intermediate Representation.

	-- An LLVM_MODULE is used to store all the information related to an LLVM
	-- module. Modules are the top level container of all other LLVM
	-- Intermediate Representation (IR) objects. Each module directly contains
	-- a list of globals variables, a list of functions, a list of libraries
	-- (or other modules) this module depends on, a symbol table, and various
	-- data about the target's characteristics.

	-- A module maintains a GlobalValRefMap object that is used to hold all
	-- constant references to global variables in the module. When a global
	-- variable is destroyed, it should have no entries in the
	-- GlobalValueRefMap.

inherit 
	C_STRUCT
	EIFFEL_OWNED 
	-- TODO: make it a CACHING_FACTORY[LLVM_TYPE] 
	LLVM_TYPE_FACTORY
	STREAM_HANDLER undefine copy, is_equal end

insert 
	CORE_EXTERNALS 
	BIT_WRITER_EXTERNALS
	STDIOEXTERNALS -- to use low-level fileno function
	EXCEPTIONS undefine copy, is_equal end

creation with_name, with_name_in_context

feature
	with_name (a_name: STRING) is
	require a_name/=Void
	do
		handle:=llvmmodule_create_with_name(a_name.to_external)
	end

	with_name_in_context (a_name: STRING; a_context: LLVM_CONTEXT) is
	require 
		a_name/=Void
		a_context/=Void
	do
		handle := llvmmodule_create_with_name_in_context
		(a_name.to_external, a_context.handle)
	end
feature 
	data_layout: FIXED_STRING is
		do
			create Result.from_external_copy(llvmget_data_layout(handle))
		ensure Result/=Void
		end
	
	set_data_layout (a_triple: STRING) is
		require -- TODO: correct layout
		do
			llvmset_data_layout(handle,a_triple.to_external)
		end

	target: FIXED_STRING is
		do
			create Result.from_external_copy(llvmget_target(handle))
		ensure Result/=Void
		end

feature -- Types
	add_type (a_name: STRING; a_type: LLVM_TYPE) is
	require
		a_name/=Void
		a_type/=Void
	local res: INTEGER_32
	do
		res := llvmadd_type_name(handle,a_name.to_external,a_type.handle)
	ensure 
		name_untouched: a_name.is_equal(old a_name)
	end

	delete_type (a_name: STRING) is
	require
		a_name/=Void
	do
		llvmdelete_type_name(handle,a_name.to_external)
	ensure 
		name_untouched: a_name.is_equal(old a_name)
	end

	type_at (a_name: STRING): LLVM_TYPE is
	require
		a_name/=Void
	local r: POINTER
	do
		r := llvmget_type_by_name(handle,a_name.to_external)
		if r.is_not_null then
			-- TODO: cache the Eiffel wrapper Result:=types.reference_at(r)
			Result:=wrapper(r)
		end
	ensure 
		name_untouched: a_name.is_equal(old a_name)
	end
feature -- Outputting

	write_bitcode_to_file (a_path: STRING) is
		-- Writes Current module to `a_path'. TODO: in case of error raises an exception; errors shall be more properly handled.
	require a_path/=Void
	local res: INTEGER_32
	do
		res:=llvmwrite_bitcode_to_file(handle,a_path.to_external)
		if res/=0 
		then raise(once "Error during LLVM_MODULE.write_bitcode_to_file") 
		end
	end

	write_bitcode_to (a_stream: OUTPUT_STREAM) is
		require a_stream/=Void
		local res: INTEGER_32
		do
			res:=llvmwrite_bitcode_to_file_handle(handle,fileno(a_stream.stream_pointer))
			if res/=0 
			then raise(once "Error during LLVM_MODULE.write_bitcode_to") 
			end
		end
	
	dump is
		-- Output Current on standard error.
		do
			llvmdump_module(handle)
		end

feature 
	struct_size: INTEGER is
		do
			not_yet_implemented
		end
end -- class LLVM_MODULE


-- Copyright 2009 Paolo Redaelli
