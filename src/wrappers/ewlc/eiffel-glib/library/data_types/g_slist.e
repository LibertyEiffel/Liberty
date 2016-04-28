note
	description: "The GSList provides a standard singly-linked list data %
   %structure. See also G_SLIST_TRAVERSABLE."
	copyright: "2008 Raphael Mack"
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

deferred class G_SLIST [ITEM->WRAPPER]
   
inherit
	G_SLIST_TRAVERSABLE[ITEM]
      undefine
         fill_tagged_out_memory
      end
   
   COLLECTION[ITEM]
      undefine
         swap,
         has,
         fast_has,
         clear_all,
         append_collection
      end
   
invariant
   mutable_by_eiffel_code: is_mutable
   
end
