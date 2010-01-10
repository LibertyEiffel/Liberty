class LLVM_VALUE
	-- LLVM Value Representation.

	-- This is a very important LLVM class. It is the anchestor of all values
	-- computed by a program that may be used as operands to other values.
	-- LLVM_VALUE is the parent of other important classes such as Instruction
	-- and Function. 
	
	-- A particular Value may be used many times in the LLVM representation for
	-- a program. For example, an incoming argument to a function (represented
	-- with an instance of the Argument class) is "used" by every instruction
	-- in the function that references the argument. To keep track of this
	-- relationship, the Value class keeps a list of all of the Users that is
	-- using it (the User class is a base class for all nodes in the LLVM graph
	-- that can refer to Values). This use list is how LLVM represents def-use
	-- information in the program, and is accessible through the use_* methods,
	-- shown below.

	-- Because LLVM is a typed representation, every LLVM Value is typed, and
	-- this Type is available through the getType() method. In addition, all
	-- LLVM values can be named. The "name" of the Value is a symbolic string
	-- printed in the LLVM code:

	-- %foo = add i32 1, 2

	-- The name of this instruction is "foo". NOTE that the name of any value
	-- may be missing (an empty string), so names should ONLY be used for
	-- debugging (making the source code easier to read, debugging printouts),
	-- they should not be used to keep track of values or map between them. For
	-- this purpose, use a std::map of pointers to the Value itself instead.

	-- One important aspect of LLVM is that there is no distinction between an
	-- SSA variable and the operation that produces it. Because of this, any
	-- reference to the value produced by an instruction (or the value
	-- available as an incoming argument, for example) is represented as a
	-- direct pointer to the instance of the class that represents this value.
	-- Although this may take some getting used to, it simplifies the
	-- representation and makes it easier to manipulate.

	-- All LLVM_VALUEs have a Type. Type is not a subclass of Value. All types
	-- can have a name and they should belong to some Module. Setting the name
	-- on the Value automatically updates the module's symbol table.

	-- Every value has a "use list" that keeps track of which other Values are
	-- using this Value. A Value can also have an arbitrary number of
	-- ValueHandle objects that watch it and listen to RAUW and Destroy events
	-- see llvm/Support/ValueHandle.h for details.
	

	-- Implementation notes: in order to avoid creation of duplicate wrappers
	-- for the same C++ object during program lifetime an LLVM_VALUE should be
	-- cached into various wrapper factories, one for each type actually used
	-- (functions, integers, floating point numbers and so on); this would be
	-- necessary if various heirs of LLVM_VALUE are also COLLECTIONs. For
	-- example each value knows which other values are using it, a function is
	-- made up of blocks and blocks are instructions grouped . Making all those
	-- classes a COLLECTION would require to satisfy various pre and
	-- post-conditions like "put(element: ITEM; i: INTEGER) ... ensure
	-- item(i)=element"; this postcontion is not satisfied if we create a new
	-- wrapper every time COLLECTION.item is invoked. Iterator based access
	-- instead does not have to satisfy this kind of postconditions, barring
	-- the need of potentially big dictionaries of LLVM_VALUEs. 

inherit 
	C_STRUCT
	C_OWNED
	LLVM_TYPE_FACTORY

creation {WRAPPER, WRAPPER_HANDLER} from_external_pointer
feature 
	type: LLVM_TYPE is
		do
			Result:=type_wrapper(llvmtype_of(handle))
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
	basic_blocks_count: NATURAL_32 is
		do
			Result := llvmcount_basic_blocks(handle)
		end

	-- TODO: basic_blocks: COLLECTION[LLVM_BASIC_BLOCK] is
	-- May be not efficiently implemented.
	-- void LLVMGetBasicBlocks(LLVMValueRef Fn, LLVMBasicBlockRef *BasicBlocks);

	basic_block_iterator: BIDIRECTIONAL_ITERATOR[LLVM_BASIC_BLOCK] is
		do
			create {ITERATOR_OVER_BASIC_BLOCKS} Result.from_value(Current)
		ensure Result/=Void
		end
feature -- TODO: Important Public Members of the Value class
-- Value::use_iterator - Typedef for iterator over the use-list
-- Value::use_const_iterator - Typedef for const_iterator over the use-list
-- unsigned use_size() - Returns the number of users of the value.
-- bool use_empty() - Returns true if there are no users.
-- use_iterator use_begin() - Get an iterator to the start of the use-list.
-- use_iterator use_end() - Get an iterator to the end of the use-list.
-- User *use_back() - Returns the last element in the list.
-- These methods are the interface to access the def-use information in LLVM. As with all other iterators in LLVM, the naming conventions follow the conventions defined by the STL.
-- 
-- Type *getType() const
-- This method returns the Type of the Value.
-- 
-- bool hasName() const
-- std::string getName() const
-- void setName(const std::string &Name)
-- This family of methods is used to access and assign a name to a Value, be aware of the precaution above.
-- 
-- void replaceAllUsesWith(Value *V)
-- This method traverses the use list of a Value changing all Users of the current value to refer to "V" instead. For example, if you detect that an instruction always produces a constant value (for example through constant folding), you can replace all uses of the instruction with the constant like this:
-- 
-- Inst->replaceAllUsesWith(ConstVal);
-- 

feature {WRAPPER, WRAPPER_HANDLER}
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

