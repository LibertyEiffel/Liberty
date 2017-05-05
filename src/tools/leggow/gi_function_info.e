class GI_FUNCTION_INFO 
	-- A GObject Introspection metadata structure representing a function, a method or a constructor. 
	
	-- `flags' query To find out what kind of entity a GIFunctionInfo represents, call g_function_info_get_flags().  

	-- See also GICallableInfo for information on how to retreive arguments and other metadata.

inherit GI_CALLABLE_INFO

insert GIFUNCTIONINFO_EXTERNALS

create{GI_REPOSITORY, GI_INFO_FACTORY, WRAPPER} from_external_pointer

feature {ANY} -- Wrapper
	emit_wrapper is
		do
			("GI_FUNCTION: #(1)%N" # name).print_on(std_output)
		end
    
    feature_name: STRING 
       -- The name of the Eiffel feature that wrap Current function
       do
          if stored_feaure_name=Void then
             stored_feaure_name := eiffel_feature(name)
             -- name alone is not right
          end
          Result := stored_feaure_name
       end

   eiffel_wrapper: STRING 
      local i: like lower
      do
         Result := feature_name
         if has_arguments then
            debug 
                  log.info.put_line("#(1) arguments from #(2) to #(3)" # & count # & lower # & upper)
               end

               Result.append(once "(")
               from i:=lower until i>upper-1
               loop -- iterate from first to next to second-last element
                     debug 
                           log.info.put_line("arg #(1): #(2)" # &i # & item(i))
                        end
                        Result.append(item(i).eiffel_wrapper)
                        Result.append(once "; ")
                        i:=i+1
                     end
                     Result.append(last.eiffel_wrapper)
                     Result.append(once ")")
                  end
                  if is_query then
                     Result.append(once ": #(1) -- C type #(2)" # return_type.eiffel_wrapper # name)
                  end
                  Result.append(once "    -- TODO: add a description")
                  Result.append("[

               external "plug_in"
                  alias "{
                  location: "."
                  module_name: "plugin"
                  feature_name: "#(1)"
                  }"
               end

               ]" # symbol)

               -- "-- GI_FUNCTION_INFO not_yet_implemented"
            end

    suffix: STRING is "_FUNCTION"


feature {ANY}
   symbol: FIXED_STRING 
      -- The symbol of the function; the symbol is the name of the exported function, suitable to be used as an argument to g_module_symbol().
   local ptr: POINTER
   do
      ptr:=g_function_info_get_symbol(handle)
      if ptr.is_not_null then 
         create Result.from_external(ptr)
      else
         -- raise ("anonymous symbol in a function") 
         log.warning.put_line(once "anonymous symbol in function ")
         Result := (once "").intern
      end
	ensure not_void: Result/=Void
	end
   
  	flags: GIFUNCTION_INFO_FLAGS_ENUM is
		-- The flags of Current function. It may be:
		-- GI_FUNCTION_IS_METHOD      is a method.
		-- GI_FUNCTION_IS_CONSTRUCTOR is a constructor.
		-- GI_FUNCTION_IS_GETTER      is a getter of a GIPropertyInfo.
		-- GI_FUNCTION_IS_SETTER      is a setter of a GIPropertyInfo.
		-- GI_FUNCTION_WRAPS_VFUNC    represents a virtual function.
		-- GI_FUNCTION_THROWS         the function may throw an error.
	do
		Result.set(g_function_info_get_flags(handle))
    rescue
        std_error.put_line("Invalid gi function info flags enum value: #(1), valid values are #(2), #(3) #(4) #(5) #(6) #(7)%N " # & Result.value # & Result.is_constructor_low_level   # & Result.is_getter_low_level    # & Result.is_method_low_level    # & Result.is_setter_low_level    # & Result.throws_low_level# &  Result.wraps_vfunc_low_level)
    end

	property: GI_PROPERTY_INFO is
		-- The property associated with this GIFunctionInfo. Only
		-- GIFunctionInfo with the flag GI_FUNCTION_IS_GETTER or
		-- GI_FUNCTION_IS_SETTER have a property set. For other cases, NULL
		-- will be returned.
	local res: POINTER
	do
   		-- Returns : the property or NULL if not set. Free it with g_base_info_unref() when done. [transfer full]
		res := g_function_info_get_property(handle)
		if res.is_not_null then
			create Result.from_external_pointer(res)
		end
	end

	vfunc: GI_VFUNC_INFO is
		-- The virtual function associated with this GIFunctionInfo.
		-- Only GIFunctionInfo with the flag GI_FUNCTION_WRAPS_VFUNC has a
		-- virtual function set. For other cases, Void will be returned.
	local res: POINTER
	do
		res := g_function_info_get_vfunc(handle)
		-- Returns : the virtual function or NULL if not set. Free it by
		-- calling g_base_info_unref() when done. [transfer full]
		if res.is_not_null then
			create Result.from_external_pointer(res)
		end
	end

	-- TODO: shall "g_function_info_invoke" be wrapped? It could be useful to implement an interpreter but since Liberty Eiffel currently "only" provides a compiler it is debatable if it's useful.

	--
	-- gboolean            g_function_info_invoke              (GIFunctionInfo *info,
	--                                                          const GIArgument *in_args,
	--                                                          int n_in_args,
	--                                                          const GIArgument *out_args,
	--                                                          int n_out_args,
	--                                                          GIArgument *return_value,
	--                                                          GError **error);
	--
	--   Invokes the function described in info with the given arguments. Note that inout parameters must appear in both
	--   argument lists. This function uses dlsym() to obtain a pointer to the function, so the library or shared object
	--   containing the described function must either be linked to the caller, or must have been g_module_symbol()ed before
	--   calling this function.
	--
	--   info :         a GIFunctionInfo describing the function to invoke
	--   in_args :      an array of GIArguments, one for each in parameter of info. If there are no in parameter, in_args can be
	--                  NULL
	--   n_in_args :    the length of the in_args array
	--   out_args :     an array of GIArguments, one for each out parameter of info. If there are no out parameters, out_args
	--                  may be NULL
	--   n_out_args :   the length of the out_args array
	--   return_value : return location for the return value of the function. If the function returns void, return_value may be
	--                  NULL
	--   error :        return location for detailed error information, or NULL
	--   Returns :      TRUE if the function has been invoked, FALSE if an error occurred.
--   enum GInvokeError
-- 
--  typedef enum {
--    G_INVOKE_ERROR_FAILED,
--    G_INVOKE_ERROR_SYMBOL_NOT_FOUND,
--    G_INVOKE_ERROR_ARGUMENT_MISMATCH
--  } GInvokeError;
-- 
--    An error occuring while invoking a function via g_function_info_invoke().
-- 
--    G_INVOKE_ERROR_FAILED            invokation failed, unknown error.
--    G_INVOKE_ERROR_SYMBOL_NOT_FOUND  symbol couldn't be found in any of the libraries associated with the typelib of the
--                                     function.
--    G_INVOKE_ERROR_ARGUMENT_MISMATCH the arguments provided didn't match the expected arguments for the functions type
--                                     signature.
-- 
--    -----------------------------------------------------------------------------------------------------------------------
-- 
-- 
feature {} -- Implementation
   stored_feaure_name: STRING
end -- class GI_FUNCTION_INFO
	
-- Copyright (C) 2013-2017: Paolo Redaelli <paolo.redaelli@gmail.com>
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
	
