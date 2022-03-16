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

	-- The Module class represents the top level
	-- structure present in LLVM programs. An LLVM
	-- module is effectively either a translation
	-- unit of the original program or a combination
	-- of several translation units merged by the
	-- linker. The Module class keeps track of a
	-- list of Functions, a list of GlobalVariables,
	-- and a SymbolTable. Additionally, it contains
	-- a few helpful member functions that try to
	-- make common operations easy.
inherit 
	C_STRUCT
	EIFFEL_OWNED redefine dispose end 
	STREAM_HANDLER undefine copy, is_equal end
	LLVM_FUNCTION_FACTORY 

insert 
	LLVM_TYPE_FACTORY
	CORE_EXTERNALS 
	BITWRITER_EXTERNALS
	STDIO_EXTERNALS -- to use low-level fileno function
	EXCEPTIONS undefine copy, is_equal end

create {ANY} with_name, with_name_in_context

create {WRAPPER} from_external_pointer

feature {ANY}
	with_name (a_name: STRING)
	require a_name/=Void
	do
		handle:=llvmmodule_create_with_name(a_name.to_external)
	end

	with_name_in_context (a_name: STRING; a_context: LLVM_CONTEXT)
	require 
		a_name/=Void
		a_context/=Void
	do
		handle := llvmmodule_create_with_name_in_context
		(a_name.to_external, a_context.handle)
	end

feature {ANY} -- Queries
	data_layout: FIXED_STRING
		do
			create Result.from_external_copy(llvmget_data_layout(handle))
		ensure Result/=Void
		end
	
	target: FIXED_STRING
		do
			create Result.from_external_copy(llvmget_target(handle))
		ensure Result/=Void
		end
feature {ANY} -- Commands
	set_data_layout (a_triple: FIXED_STRING)
		require a_triple/=Void -- TODO: correct layout
		do
			llvmset_data_layout(handle,a_triple.to_external)
		end

	set_target (a_target: FIXED_STRING)
		require a_target/=Void-- TODO: correct layout
		do
			llvmset_target(handle,a_target.to_external)
		end


feature {ANY} -- Types
	type_at (a_name: ABSTRACT_STRING): LLVM_TYPE
	require
		a_name/=Void
	do
		Result := type_wrapper_or_void(llvmget_type_by_name(handle,a_name.to_external))
	end

feature {ANY} -- Aliases
	new_alias (a_type: LLVM_TYPE; an_aliasee: LLVM_VALUE; a_name: ABSTRACT_STRING): LLVM_GLOBAL_ALIAS
		-- TODO: does LLVMAddAlias actually return a LLVM_GLOBAL_ALIAS?
	require
		a_type/=Void
		an_aliasee/=Void
		a_name/=Void
		do

			create Result.from_external_pointer
			(llvmadd_alias(handle, a_type.handle, an_aliasee.handle, a_name.to_external))
		ensure not_void: Result/=Void
		end

feature {ANY} -- Operation on functions
	new_function  (a_name: ABSTRACT_STRING; a_type: LLVM_FUNCTION_TYPE): LLVM_FUNCTION
		-- A newly created function with `a_name' of `a_type'
		-- contained in Current module.
	require
		name_not_void: a_name /= Void
		type_not_void: a_type /= Void
	local p: POINTER
	do
		p:= llvmadd_function(handle,a_name.to_external, a_type.handle)
		check p.is_not_null end
		create Result.from_external_pointer(p)
	end

	function_iterator: ITERATOR[LLVM_FUNCTION]
		do
			create {ITERATOR_OVER_MODULE_FUNCTIONS} Result.from_module(Current)
		end

	function_with_name (a_name: ABSTRACT_STRING): LLVM_FUNCTION
			-- The function named with `a_name'.
		require name_not_void: a_name/=Void
		do
			Result:=function_wrapper_or_void(llvmget_named_function(handle,a_name.to_external))
		end

	first_function: LLVM_FUNCTION
		do
			Result:=function_wrapper_or_void(llvmget_first_function(handle))
		end

	last_function: LLVM_FUNCTION
		do
			Result:=function_wrapper_or_void (llvmget_last_function(handle))
		end

feature {ANY} -- Global variables
	add_global (a_type: LLVM_TYPE; a_name: ABSTRACT_STRING): LLVM_GLOBAL_VARIABLE
		require 
			a_type/=Void
			a_name/=Void
		do
			create Result.from_external_pointer
			(llvmadd_global (handle, a_type.handle, a_name.to_external))
		ensure Result/=Void
		end

	global_with_name (a_name: ABSTRACT_STRING): LLVM_GLOBAL_VARIABLE
		require a_name/=Void
		local a_gv: POINTER
		do
			a_gv := llvmget_named_global(handle,a_name.to_external)
			if a_gv.is_not_null then
				create Result.from_external_pointer(a_gv)
			end
		end
	
	iterator_over_global_variables: ITERATOR_OVER_GLOBAL_VARIABLES
		do
			create Result.from_module(Current)
		ensure Result/=Void
		end
feature {ANY} -- Outputting

	write_bitcode_to_file (a_path: STRING)
		-- Writes Current module to `a_path'. TODO: in case of error raises an exception; errors shall be more properly handled.
	require a_path/=Void
	local res: INTEGER_32
	do
		res:=llvmwrite_bitcode_to_file(handle,a_path.to_external)
		if res/=0 
		then raise(once "Error during LLVM_MODULE.write_bitcode_to_file") 
		end
	end

	write_bitcode_to (a_stream: OUTPUT_STREAM)
		require a_stream/=Void
		local res: INTEGER_32
		do
			res:=llvmwrite_bitcode_to_file_handle(handle,fileno(a_stream.stream_pointer))
			if res/=0 
			then raise(once "Error during LLVM_MODULE.write_bitcode_to") 
			end
		end
	
	dump
		-- Output Current on standard error.
		do
			llvmdump_module(handle)
		end

feature {ANY} -- Local strings
	local_string (a_text: ABSTRACT_STRING): LLVM_GLOBAL_VARIABLE
		-- A constant C string containing `a_text'. 
		
		-- More properly, a new global variable whose type is a pointer to a character, referring to the memory area containing `a_text'. 
		do
			-- Converted from Leooolas code snippet found at 
			-- http://stackoverflow.com/questions/1061753/how-can-i-implement-a-string-data-type-in-llvm
			create Result.from_external_pointer
			(llvmadd_global(handle, llvmarray_type(llvmint8type,(a_text.count+1).to_natural_32),(once "string").to_external))
			Result.set_internal_linkage
			Result.set_global_constant(True)
			Result.set_initializer(create {LLVM_CONST_STRING}.from_string(a_text))
	end

feature {} -- Unwrapped

-- 	Important Public Members of the Module class
-- Module::Module(std::string name = "")
-- Constructing a Module is easy. You can optionally provide a name for it (probably based on the name of the translation unit).
-- 
-- Module::iterator - Typedef for function list iterator
-- Module::const_iterator - Typedef for const_iterator.
-- begin(), end() size(), empty()
-- These are forwarding methods that make it easy to access the contents of a Module object's Function list.
-- 
-- Module::FunctionListType &getFunctionList()
-- Returns the list of Functions. This is necessary to use when you need to update the list or perform a complex action that doesn't have a forwarding method.
-- 
-- Module::global_iterator - Typedef for global variable list iterator
-- Module::const_global_iterator - Typedef for const_iterator.
-- global_begin(), global_end() global_size(), global_empty()
-- These are forwarding methods that make it easy to access the contents of a Module object's GlobalVariable list.
-- 
-- Module::GlobalListType &getGlobalList()
-- Returns the list of GlobalVariables. This is necessary to use when you need to update the list or perform a complex action that doesn't have a forwarding method.
-- 
-- SymbolTable *getSymbolTable()
-- Return a reference to the SymbolTable for this Module.
-- 
-- Function *getFunction(const std::string &Name, const FunctionType *Ty)
-- Look up the specified function in the Module SymbolTable. If it does not exist, return null.
-- 
-- Function *getOrInsertFunction(const std::string &Name, const FunctionType *T)
-- Look up the specified function in the Module SymbolTable. If it does not exist, add an external declaration for the function and return it.
-- 
-- std::string getTypeName(const Type *Ty)
-- If there is at least one entry in the SymbolTable for the specified Type, return it. Otherwise return the empty string.
-- 
-- bool addTypeName(const std::string &Name, const Type *Ty)
-- Insert an entry in the SymbolTable mapping Name to Ty. If there is already an entry for this name, true is returned and the SymbolTable is not modified.
-- 
-- 
feature {} -- Documentation from doxygen documentation of LLVM's Module
	
	-- Global lists: functions, symbols and variables
	-- const GlobalListType & 	getGlobalList () const
	--  	Get the Module's list of global variables (constant). 
	-- GlobalListType & 	getGlobalList ()
	--  	Get the Module's list of global variables. 
	-- const FunctionListType & 	getFunctionList () const
	--  	Get the Module's list of functions (constant). 
	-- FunctionListType & 	getFunctionList ()
	--  	Get the Module's list of functions. 
	-- const AliasListType & 	getAliasList () const
	--  	Get the Module's list of aliases (constant). 
	-- AliasListType & 	getAliasList ()
	--  	Get the Module's list of aliases. 
	-- const NamedMDListType & 	getNamedMDList () const
	--  	Get the Module's list of named metadata (constant). 
	-- NamedMDListType & 	getNamedMDList ()
	--  	Get the Module's list of named metadata. 
	-- const ValueSymbolTable & 	getValueSymbolTable () const
	--  	Get the symbol table of global variable and function identifiers. 
	-- ValueSymbolTable & 	getValueSymbolTable ()
	--  	Get the Module's symbol table of global variable and function identifiers. 
	-- const TypeSymbolTable & 	getTypeSymbolTable () const
	--  	Get the symbol table of types. 
	-- TypeSymbolTable & 	getTypeSymbolTable ()
	--  	Get the Module's symbol table of types. 
	-- static iplist< GlobalVariable >
	-- Module::* 	getSublistAccess (GlobalVariable *)
	-- static iplist< Function > Module::* 	getSublistAccess (Function *)
	-- static iplist< GlobalAlias >
	-- Module::* 	getSublistAccess (GlobalAlias *)
	-- static iplist< NamedMDNode >
	-- Module::* 	getSublistAccess (NamedMDNode *)

	-- Public Types

	-- Types And Enumerations
	-- enum  	Endianness { AnyEndianness, LittleEndian, BigEndian }
	--  	An enumeration for describing the endianess of the target machine. More...
	-- enum  	PointerSize { AnyPointerSize, Pointer32, Pointer64 }
	--  	An enumeration for describing the size of a pointer on the target machine. More...
	-- typedef iplist< GlobalVariable > 	GlobalListType
	--  	The type for the list of global variables. 
	-- typedef iplist< Function > 	FunctionListType
	--  	The type for the list of functions. 
	-- typedef iplist< GlobalAlias > 	AliasListType
	--  	The type for the list of aliases. 
	-- typedef iplist< NamedMDNode > 	NamedMDListType
	--  	The type for the list of named metadata. 
	-- typedef std::vector< std::string > 	LibraryListType
	--  	The type for the list of dependent libraries. 
	-- typedef GlobalListType::iterator 	global_iterator
	--  	The Global Variable iterator. 
	-- typedef 
	-- GlobalListType::const_iterator 	const_global_iterator
	--  	The Global Variable constant iterator. 
	-- typedef FunctionListType::iterator 	iterator
	--  	The Function iterators. 
	-- typedef 
	-- FunctionListType::const_iterator 	const_iterator
	--  	The Function constant iterator. 
	-- typedef AliasListType::iterator 	alias_iterator
	--  	The Global Alias iterators. 
	-- typedef 
	-- AliasListType::const_iterator 	const_alias_iterator
	--  	The Global Alias constant iterator. 
	-- typedef NamedMDListType::iterator 	named_metadata_iterator
	--  	The named metadata iterators. 
	-- typedef 
	-- NamedMDListType::const_iterator 	const_named_metadata_iterator
	--  	The named metadata constant interators. 
	-- typedef 
	-- LibraryListType::const_iterator 	lib_iterator
	--  	The Library list iterator. 

	-- Public Member Functions

	-- Constructors
	--  	Module (const StringRef &ModuleID, LLVMContext &C)
	--  	~Module ()
	--  	The module destructor. This will dropAllReferences. 
	-- Module Level Accessors
	-- const std::string & 	getModuleIdentifier () const
	-- const std::string & 	getDataLayout () const
	-- const std::string & 	getTargetTriple () const
	-- Endianness 	getEndianness () const
	--  	Target endian information... 
	-- PointerSize 	getPointerSize () const
	--  	Target Pointer Size information... 
	-- LLVMContext & 	getContext () const
	-- const std::string & 	getModuleInlineAsm () const
	-- Module Level Mutators
	-- void 	setModuleIdentifier (const StringRef &ID)
	--  	Set the module identifier. 
	-- void 	setDataLayout (const StringRef &DL)
	--  	Set the data layout. 
	-- void 	setTargetTriple (const StringRef &T)
	--  	Set the target triple. 
	-- void 	setModuleInlineAsm (const StringRef &Asm)
	--  	Set the module-scope inline assembly blocks. 
	-- void 	appendModuleInlineAsm (const StringRef &Asm)
	-- Generic Value Accessors
	-- GlobalValue * 	getNamedValue (const StringRef &Name) const
	-- Function Accessors
	-- Constant * 	getOrInsertFunction (const StringRef &Name, const FunctionType *T, AttrListPtr AttributeList)
	-- Constant * 	getOrInsertFunction (const StringRef &Name, const FunctionType *T)
	-- Constant * 	getOrInsertFunction (const StringRef &Name, AttrListPtr AttributeList, const Type *RetTy,...) END_WITH_NULL
	-- Constant * 	getOrInsertFunction (const StringRef &Name, const Type *RetTy,...) END_WITH_NULL
	-- Constant * 	getOrInsertTargetIntrinsic (const StringRef &Name, const FunctionType *Ty, AttrListPtr AttributeList)
	-- Function * 	getFunction (const StringRef &Name) const
	-- Global Variable Accessors
	-- GlobalVariable * 	getGlobalVariable (const StringRef &Name, bool AllowInternal=false) const
	-- GlobalVariable * 	getNamedGlobal (const StringRef &Name) const
	-- Constant * 	getOrInsertGlobal (const StringRef &Name, const Type *Ty)
	-- Global Alias Accessors
	-- GlobalAlias * 	getNamedAlias (const StringRef &Name) const
	-- Named Metadata Accessors
	-- NamedMDNode * 	getNamedMetadata (const StringRef &Name) const
	-- NamedMDNode * 	getOrInsertNamedMetadata (const StringRef &Name)
	-- Type Accessors
	-- bool 	addTypeName (const StringRef &Name, const Type *Ty)
	-- std::string 	getTypeName (const Type *Ty) const
	-- const Type * 	getTypeByName (const StringRef &Name) const
	-- Global Variable Iteration
	-- global_iterator 	global_begin ()
	--  	Get an iterator to the first global variable. 
	-- const_global_iterator 	global_begin () const
	--  	Get a constant iterator to the first global variable. 
	-- global_iterator 	global_end ()
	--  	Get an iterator to the last global variable. 
	-- const_global_iterator 	global_end () const
	--  	Get a constant iterator to the last global variable. 
	-- bool 	global_empty () const
	--  	Determine if the list of globals is empty. 
	-- Function Iteration
	-- iterator 	begin ()
	--  	Get an iterator to the first function. 
	-- const_iterator 	begin () const
	--  	Get a constant iterator to the first function. 
	-- iterator 	end ()
	--  	Get an iterator to the last function. 
	-- const_iterator 	end () const
	--  	Get a constant iterator to the last function. 
	-- size_t 	size () const
	--  	Determine how many functions are in the Module's list of functions. 
	-- bool 	empty () const
	--  	Determine if the list of functions is empty. 
	-- Dependent Library Iteration
	-- lib_iterator 	lib_begin () const
	--  	Get a constant iterator to beginning of dependent library list. 
	-- lib_iterator 	lib_end () const
	--  	Get a constant iterator to end of dependent library list. 
	-- size_t 	lib_size () const
	--  	Returns the number of items in the list of libraries. 
	-- void 	addLibrary (const StringRef &Lib)
	--  	Add a library to the list of dependent libraries. 
	-- void 	removeLibrary (const StringRef &Lib)
	--  	Remove a library from the list of dependent libraries. 
	-- const LibraryListType & 	getLibraries () const
	--  	Get all the libraries. 
	-- Alias Iteration
	-- alias_iterator 	alias_begin ()
	--  	Get an iterator to the first alias. 
	-- const_alias_iterator 	alias_begin () const
	--  	Get a constant iterator to the first alias. 
	-- alias_iterator 	alias_end ()
	--  	Get an iterator to the last alias. 
	-- const_alias_iterator 	alias_end () const
	--  	Get a constant iterator to the last alias. 
	-- size_t 	alias_size () const
	--  	Determine how many aliases are in the Module's list of aliases. 
	-- bool 	alias_empty () const
	--  	Determine if the list of aliases is empty. 
	-- Named Metadata Iteration
	-- named_metadata_iterator 	named_metadata_begin ()
	--  	Get an iterator to the first named metadata. 
	-- const_named_metadata_iterator 	named_metadata_begin () const
	--  	Get a constant iterator to the first named metadata. 
	-- named_metadata_iterator 	named_metadata_end ()
	--  	Get an iterator to the last named metadata. 
	-- const_named_metadata_iterator 	named_metadata_end () const
	--  	Get a constant iterator to the last named metadata. 
	-- size_t 	named_metadata_size () const
	--  	Determine how many NamedMDNodes are in the Module's list of named metadata. 
	-- bool 	named_metadata_empty () const
	--  	Determine if the list of named metadata is empty. 
	-- Utility functions for printing and dumping Module objects
	-- void 	print (raw_ostream &OS, AssemblyAnnotationWriter *AAW) const
	--  	Print the module to an output stream with AssemblyAnnotationWriter. 
	-- void 	dump () const
	--  	Dump the module to stderr (for debugging). 
	-- void 	dropAllReferences ()
feature {LLVM_MODULE_PROVIDER} -- Provider owning modules
	
	owner: LLVM_MODULE_PROVIDER
	-- The eventual provider owning Current module

	set_owner (a_provider: LLVM_MODULE_PROVIDER)
		-- Makes `a_provider' the owner of Current module
	require
		a_provider/=Void
		not is_owned
	do
		owner:=a_provider
	ensure 
		set: a_provider=owner
		is_owned
	end

	is_owned: BOOLEAN
		-- Is Current module owned by a provider?
	do
		Result := (owner/=Void)
	ensure Result implies owner/=Void -- Note: this shall be more properly an invariant.
	end
	
feature {ANY} 
	struct_size: like size_t
		do
			not_yet_implemented
		end

	dispose
		do
			llvmdispose_module(handle)
		end
end -- class LLVM_MODULE


-- Copyright (C) 2009-2022: Paolo Redaelli
-- This file is part of LLVM wrappers for Liberty Eiffel.
--
-- This library is free software: you can redistribute it and/or modify
-- it under the terms of the GNU Lesser General Public License as published by
-- the Free Software Foundation, version 3 of the License.
--
-- Liberty Eiffel is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
--
-- You should have received a copy of the GNU General Public License
-- along with Liberty Eiffel.  If not, see <http://www.gnu.org/licenses/>.
--

