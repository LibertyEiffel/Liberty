note
   description:
      "Dummy wrapper factory."
   copyright:
      "(C) 2007 Paolo Redaelli"
   license:
      "LGPL v2 or later"
   date:
      "$Date:$"
   revision:
      "$Revision:$"
class DUMMY_CACHING_FACTORY[ITEM_ -> SHARED_C_STRUCT]
   -- A dummy caching factory, useful to create temporary
   -- NULL_TERMINATED_C_ARRAY to be passed to underlying C functions.

inherit
   DUMMY_FACTORY[ITEM_]
   CACHING_FACTORY[ITEM_]

create {ANY}
   default_create

end -- class DUMMY_CACHING_FACTORY
