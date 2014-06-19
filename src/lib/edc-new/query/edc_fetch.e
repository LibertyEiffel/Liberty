class EDC_FETCH[D_ -> EDC_TYPED_DESCRIPTOR[R_, K_], R_ -> EDC_RECORD, K_ -> TUPLE]

inherit
   EDC_TYPED_QUERY[R_]

create {EDC_DESCRIPTOR}
   make

feature {ANY}
   list (session: EDC_SESSION): TRAVERSABLE[R_]
      local
         data: FAST_ARRAY[EDC_SESSION_DATA]
      do
         data := session.select_data(descriptor.table.name, crit_where, crit_having, crit_order_by)
         Result := data_to_record(data)
         session.recycle_data(data)
      end

feature {}
   data_to_record (data: FAST_ARRAY[EDC_SESSION_DATA]): FAST_ARRAY[R_]
      require
         data /= Void
      local
         i: INTEGER; record: R_
      do
         create Result.make(data.count)
         from
            i := data.lower
         until
            i > data.upper
         loop
            record := descriptor.new_record
            record.set_session_data(data.item(i))
            Result.put(record, i)
            i := i + 1
         end
      ensure
         (create {ZIP[EDC_SESSION_DATA, R_]}.make(data, Result)).for_all(agent (d: EDC_SESSION_DATA; r: R_): BOOLEAN do Result := r.session_data = d end (?, ?))
      end

feature {}
   make (a_options: like options)
      require
         a_options /= Void
      do
         options := a_options
      ensure
         options = a_options
      end

   actual_descriptor: BOOLEAN
      do
         Result := descriptor /= Void
      end

   descriptor: D_

invariant
   actual_descriptor

end -- class EDC_FETCH
