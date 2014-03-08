class EDC_FIND[D_ -> EDC_TYPED_DESCRIPTOR[R_, K_], R_ -> EDC_RECORD, K_]

inherit
   EDC_TYPED_QUERY[R_]

create {EDC_DESCRIPTOR}
   make

feature {ANY}
   list (session: EDC_SESSION): TRAVERSABLE[R_] is
      local
         descriptor: D_
         data: FAST_ARRAY[EDC_SESSION_DATA]
         res: FAST_ARRAY[R_]
         i: INTEGER; record: R_
      do
         check
            actual_descriptor: descriptor /= Void
         end
         data := session.select_data(descriptor.table.name, crit_where, crit_having, crit_order_by)
         create res.make(data.count)
         from
            i := data.lower
         until
            i > data.upper
         loop
            record := descriptor.new_record
            record.set_session_data(data.item(i))
            res.put(record, i)
            i := i + 1
         end
         session.recycle_data(data)
         Result := res
      ensure then
         Result.count.in_range(0, 1)
      end

feature {}
   make (a_pk: like pk; a_options: like options) is
      require
         a_options /= Void
      do
         pk := a_pk
         options := a_options
      ensure
         pk = a_pk
         options = a_options
      end

   pk: K_

end -- class EDC_FIND
