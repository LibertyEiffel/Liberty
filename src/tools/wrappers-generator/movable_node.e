deferred class MOVABLE_NODE
   -- A node of a GCC-XML file that represent a symbol that may be wrapped in a
   -- class different by those assigned with default rules.  For example
   -- function "memcpy" that the standard require to be defined into <string.h>
   -- may be actually defined into another implementation-dependent file.
   -- Gccxml cannot distinguish those cases.

inherit
   NAMED_NODE
   FILED_NODE

end -- class MOVABLE_NODE
