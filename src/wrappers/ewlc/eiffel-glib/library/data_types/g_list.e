note
	description: "The GList provides a standard doubly-linked list data %
   %structure. See also G_LIST_TRAVERSABLE."
	copyright: "2008 Raphael Mack"
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

deferred class G_LIST [ITEM->WRAPPER]

   -- TODO: add test for all COLLECTION features (modify the version 
   -- from SE testsuite?)
   
inherit
	G_LIST_TRAVERSABLE[ITEM]
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
