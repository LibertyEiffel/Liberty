deferred class EDC_SESSION_FETCH[E_]

feature {EDC_FIELD}
   item (record: EDC_RECORD; field: EDC_FIELD[E_]): E_
      deferred
      end

   set (record: EDC_RECORD; field: EDC_FIELD[E_]; i: E_)
      deferred
      end

end -- class EDC_SESSION_FETCH
