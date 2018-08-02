class GI_ARG_INFO
   -- A GObject Introspection metadata representing an argument
   -- An argument is always part of a GICallableInfo.

inherit
   GI_BASE_INFO

insert
   GIARGINFO_EXTERNALS
      -- undefine is_equal end
   GIARGINFO_EXTERNALS

create {ANY}
   from_external_pointer

feature {ANY} -- Wrapper
	emit_wrapper is
		do
			("GI_ARG_INFO: #(1)%N" # name).print_on(std_output)
		end

    eiffel_wrapper: ABSTRACT_STRING is
		do
			if name/=Void then
				Result:=name | ": " | "FOOBAR"
			end
		end

    suffix: STRING is "_ARGUMENT"
feature {ANY}

   direction: GIDIRECTION_ENUM is
         --  the direction of the argument. Can be in, out and inout
      do
         Result.set(g_arg_info_get_direction(handle))
      end

   is_allocated_by_caller: BOOLEAN is
         --  Is the caller required to have allocated the argument?
         -- Obtain if the argument is a pointer to a struct or object that will
         -- receive an output of a function. The default   assumption for
         -- GI_DIRECTION_OUT arguments which have allocation is that the callee
         -- allocates; if this is TRUE, then the   caller must allocate.
      do
         Result := g_arg_info_is_caller_allocates(handle).to_boolean
      end

   is_return_value: BOOLEAN is
         -- Is the argument a return value? It can either be a parameter or a return value.
      do
         Result := g_arg_info_is_return_value(handle).to_boolean
      end

   is_optional: BOOLEAN is
         -- Is the argument optional?
      do
         Result := g_arg_info_is_optional(handle).to_boolean
      end

   may_be_null: BOOLEAN is
         -- Can the argument be NULL?
      do
         Result := g_arg_info_may_be_null(handle).to_boolean
      end

   ownership_transfer: GITRANSFER_ENUM is
         -- the ownership transfer for this argument.
         -- The transfer is the exchange of data between two parts, from the
         -- callee to the caller. The callee is either a function/method/signal
         -- or an object/interface where a property is defined. The caller is
         -- the side accessing a property or calling a function. GITransfer
         -- specifies who's responsible for freeing the resources after the
         -- ownership transfer is complete. In case of a containing type such as
         -- a list, an array or a hash table the container itself is specified
         -- differently from the items within the container itself. Each
         -- container is freed differently, check the documentation for the
         -- types themselves for information on how to free them.
         -- gi_transfer_nothing    transfer nothing from the callee (function or the type instance the property belongs to) to the
         --                        caller. The callee retains the ownership of the transfer and the caller doesn't need to do
         --                        anything to free up the resources of this transfer.
         -- gi_transfer_container  transfer the container (list, array, hash table) from the callee to the caller. The callee
         --                        retains the ownership of the individual items in the container and the caller has to free up the
         --                        container resources (g_list_free()/g_hash_table_destroy() etc) of this transfer.
         -- gi_transfer_everything transfer everything, eg the container and its contents from the callee to the caller. This is
         --                        the case when the callee creates a copy of all the data it returns. The caller is responsible
         --                        for cleaning up the container and item resources of this transfer.
      do
         Result.set(g_arg_info_get_ownership_transfer(handle))
      end

   scope: GISCOPE_TYPE_ENUM is
         -- The scope type for this argument. The scope type explains how a
         -- callback is going to be invoked, most importantly when the resources
         -- required to invoke it can be freed. GIScopeType contains a list of
         -- possible values.
         -- Scope type of a GIArgInfo representing callback, determines how the
         -- callback is invoked and is used to decided when the invoke structs
         -- can be freed.
         -- gi_scope_type_invalid  The argument is not of callback type.
         -- gi_scope_type_call     The callback and associated user_data is only used during the call to this function.
         -- gi_scope_type_async    The callback and associated user_data is only used until the callback is invoked, and the
         --                        callback. is invoked always exactly once.
         -- gi_scope_type_notified The callback and and associated user_data is used until the caller is notfied via the
         --                        destroy_notify.
      do
         Result.set(g_arg_info_get_scope(handle))
      end

   closure: INTEGER is
         -- the index of the user data argument of a callback. This is only
         -- valid for arguments which are callbacks. It's -1 if there is no dat
         -- argument
      do
         Result := g_arg_info_get_closure(handle)
      end

feature {} -- Unwrapped
      --  g_arg_info_get_destroy ()
      --
      -- gint                g_arg_info_get_destroy              (GIArgInfo *info);
      --
      --   Obtains the index of the GDestroyNotify argument. This is only valid for arguments which are callbacks.
      --
      --   info :    a GIArgInfo
      --   Returns : index of the GDestroyNotify argument or -1 if there is none
      --

    type: GI_TYPE_INFO 
        -- Type information of Current argument
    do
        create Result.from_external_pointer(g_arg_info_get_type(handle))
    ensure Result/=Void
    end
      --
      --  g_arg_info_load_type ()
      --
      -- void                g_arg_info_load_type                (GIArgInfo *info,
      --                                                          GITypeInfo *type);
      --
      --   Obtain information about a the type of given argument info; this function is a variant of g_arg_info_get_type()
      --   designed for stack allocation.
      --
      --   The initialized type must not be referenced after info is deallocated.
      --
      --   info : a GIArgInfo
      --   type : Initialized with information about type of info. [out caller-allocates]
      --

end -- class GI_ARG_INFO

-- Copyright (C) 2013-2018: , 2016 Paolo Redaelli <paolo.redaelli@gmail.com>
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
	
