deferred class GI_CLASS
	-- Metainformation regarding a GObject introspection class, shared between
	-- GI_OBJECT_INFO and GI_INTERFACE_INFO. A GI_OBJECT_INFO maps to an
	-- effective, unexpanded Eiffel wrapper class while a GI_INTERFACE_INFO
	-- represent a deferred class. 

	-- Both objects and interfaces have methods, properties, signals,
	-- interfaces, constants and virtual functions.

	-- GI_INTERFACE_INFO also has prerequities which as far as I know can be
	-- only other interfaces yet its documetnation says that a prerequisite is
	-- a GI_BASE_INFO which could be just anything.... 

	-- Interfaces and objects actually offer indexed accesed to their
	-- prerequisites, properties, methods, signales, virtual functions and
	-- constants.  

	-- Therefore they should be - at least conceptually - ITERABLE or INDEXABLE
	-- or TRAVERSABLE over GI_FUNCTION_INFO, GI_PROPERTY_INFO, GI_SIGNAL_INFO,
	-- GI_INTERFACE_INFO, GI_CONSTANT_INFO and GI_VFUNC_INFO.

	-- This class should inherit repeatedly six times from TRAVERSABLE; such a
	-- multiple, repeated inheritance tree would make GI_CLASS needlessly
	-- complex as each repeated inheritance would require renaming and
	-- redefining of pratically all the indexable interface (lower, upper,
	-- valid_index, item, first, last, for_each, for_all, exists, aggregate
	-- out_in_tagged_out_memory, count, is_empty)

	-- Given the particular status of this introspection library it seems more
	-- pratical to provide "only" iterators.

	-- The iteration facilities are also expanded classes thus making proper
	-- inheritance from ITERABLE quite a chore. 
	
	-- The iteration features are all made expanded classes to avoid creating a
	-- new object everytime the program needs to iterate over the items
	-- contained into a GI_CLASS. An expanded iterator-like object gives the
	-- efficience of an old-school loop over indexes without bothering about
	-- indexes and off-by-one bugs.

	-- TODO: the documentation og GIR is not consistent as it reads that an interface has fields and interfaces yet it hasn't.

inherit GI_BASE_INFO
	undefine out_in_tagged_out_memory 
	end

feature {ANY} -- Methods 
	methods_lower: INTEGER 0
	methods_upper: INTEGER do Result:=methods_count-1 end
	methods_count: INTEGER
		-- the number of methods.
		deferred 
		end

	method (n: INTEGER): GI_FUNCTION_INFO is
		-- the interface type method at index `n'.
	require valid_index: n.in_range(0,methods_count-1)
	deferred 
	ensure Result/=Void
	end

	find_method (a_name: ABSTRACT_STRING): GI_FUNCTION_INFO is
		-- The method with `a_name'. Void if there's no method available with that name.
	require 
		not_void: a_name /= Void
		not_empty: not a_name.is_empty
	deferred
	end
   
	methods_iter: METHODS_ITER is
		do
			Result.set_class(Current)
		end

feature {ANY} -- Properties
	properties_lower: INTEGER is 0
	properties_upper: INTEGER is do Result := properties_count-1 end
	properties_count: INTEGER is deferred end 
  
	property (i: INTEGER): GI_PROPERTY_INFO is
		-- the interface type property at index `i'. 
	require valid_index: i.in_range(properties_lower,properties_upper)
	deferred 
	ensure Result/=Void
	end
   
	properties_iter: PROPERTIES_ITER is
		-- Expanded iterator over properties
	do
		Result.set_class(Current)
	end

feature {ANY} -- Signals
	signals_lower: INTEGER is 0
	signals_upper: INTEGER is do Result:=signals_count-1 end
	signals_count: INTEGER is
		-- the number of signals that this interface type has.
	deferred
	ensure non_signals: Result>=0
	end

	signal (n: INTEGER): GI_SIGNAL_INFO is
		-- The an interface type signal at index n.
	require valid_n: n.in_range(0,signals_count-1)
	deferred
	ensure Result/=Void
	end

	find_signal (a_name: ABSTRACT_STRING): GI_SIGNAL_INFO is
		-- The information for the signal with `a_name'. Void if no such a signal exists.
	require 
		a_name /= Void
		not a_name.is_empty
	deferred
	end

	signals_iter: SIGNALS_ITER is
		-- Expanded iterator over signals
	do
		Result.set_class(Current)
	end

feature {ANY} -- Virtual functions 
	virtual_functions_lower: INTEGER is 0
	virtual_functions_upper: INTEGER is do Result:=virtual_functions_count-1 end
	virtual_functions_count: INTEGER is 
	deferred
	ensure non_negative: Result>=0
	end

	virtual_function (n: INTEGER): GI_VFUNC_INFO is

		-- The interface type virtual function at index `n'.
	require	valid_index: n.in_range(0,virtual_functions_count)
	deferred
	ensure Result/=Void
	end

	find_virtual_function (a_name: ABSTRACT_STRING): GI_VFUNC_INFO is
		-- The virtual function with `a_name'. Void if such a functon does not exist.
	require 
		a_name /= Void
		not a_name.is_empty
	deferred
	end

	vfuncs_iter: VFUNCS_ITER is
		do
			Result.set_class(Current)
		end

feature {ANY} -- Constants
	constants_lower: INTEGER is 0
	constants_upper: INTEGER is do Result := constants_count-1 end
	constants_count: INTEGER is
		-- the number of constants that this interface type has.
	deferred
	ensure Result>=0
	end

	constant (n: INTEGER): GI_CONSTANT_INFO is
		-- The interface type constant at index n.
	require valid_index: n.in_range(0,constants_count-1)
	deferred
	ensure Result/=Void
	end

	constants_iter: CONSTANTS_ITER is
		-- Expanded iterator over constans
	do
		Result.set_class(Current)
	end

end

-- Copyright (C) 2013-2018: Paolo Redaelli <paolo.redaelli@gmail.com>
-- 
-- This library is free software; you can redistribute it and/or
-- modify it under the terms of the GNU Lesser General Public License
-- as published by the Free Software Foundation; either version 2.1 of
-- the License, or (at your option) any later version.
-- 
-- This library is distributed in the hope that it will be useful, but
-- WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
-- Lesser General Public License for more details.
-- 
-- You should have received a copy of the GNU Lesser General Public
-- License along with this library; if not, write to the Free Software
-- Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
-- 02110-1301 USA
	
