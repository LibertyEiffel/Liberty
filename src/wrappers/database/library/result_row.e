note
	description: "."
	copyright: "(C) 2006 Paolo Redaelli "
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

deferred class RESULT_ROW
    -- A row of results from an SQL query. 

    -- Once this class cointained queries to test the types of the various
    -- elements of the row but it was a wrong design. A better approach is
    -- either to use VARIANT or one of its specialized heirs or to enrich
    -- VARIANT itself.
inherit
	TRAVERSABLE [VARIANT] 
end
