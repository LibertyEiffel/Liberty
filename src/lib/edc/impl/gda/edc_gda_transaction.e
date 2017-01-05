-- -----------------------------------------------------------------------------------------------------------
-- This file is part of the ESE library.
-- Copyright (C) 2006-2017: Cyril ADRIAN <cyril.adrian@gmail.com> and others (see AUTHORS)
--
-- Permission is hereby granted, free of charge, to any person obtaining a copy of this software and
-- associated documentation files (the "Software"), to deal in the Software without restriction, including
-- without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
-- copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the
-- following conditions:
--
-- The above copyright notice and this permission notice shall be included in all copies or substantial
-- portions of the Software.
--
-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT
-- LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO
-- EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
-- IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE
-- USE OR OTHER DEALINGS IN THE SOFTWARE.
--
-- http://ese.sourceforge.net
-- -----------------------------------------------------------------------------------------------------------
class EDC_GDA_TRANSACTION

inherit
   EDC_SAVEPOINT

create {EDC_GDA_CONNECTION}
   make

feature {ANY}
   name: STRING
      do
         Result := transaction.name
      ensure
         Result /= Void
      end

   is_active: BOOLEAN

   release
      do
         check
            not is_null
         end
         next.set_previous(previous)
         if previous = Void then
            connection.set_current_transaction(next)
         end
         is_active := False
      end

feature {EDC_GDA_CONNECTION, EDC_GDA_TRANSACTION}
   commit_to (t: like Current): EDC_GDA_TRANSACTION
      require
         t.is_active
      do
         if is_active and then not is_null then
            gda.commit_transaction(name)
            is_active := False
         end
         if t = Current then
            Result := next
         elseif next /= Void then
            Result := next.commit_to(t)
         end
      ensure
         Result.is_active
      end

   rollback_to (t: like Current): EDC_GDA_TRANSACTION
      require
         t.is_active
      do
         if is_active and then not is_null then
            gda.rollback_transaction(name)
            is_active := False
         end
         if t = Current then
            Result := next
         elseif next /= Void then
            Result := next.rollback_to(t)
         end
      ensure
         Result.is_active
      end

feature {EDC_GDA_TRANSACTION}
   set_previous (a_previous: like previous)
      require
         a_previous /= Void
      do
         previous := a_previous
      ensure
         previous = a_previous
      end

feature {}
   make (a_name: like name; a_next: like next; a_connection: like connection)
      require
         a_name /= Void
         a_next /= Void
         a_connection /= Void
      do
         create transaction.make(name)
         next := a_next
         next.set_previous(Current)
         connection := a_connection
         is_active := True
      ensure
         not is_null
         name = a_name
         next = a_next
         connection = a_connection
      end

   null
      do
         is_active := True
         next := Current
      ensure
         is_null
      end

   is_null: BOOLEAN
      do
         Result := transaction = Void
      end

   gda: GDA_CLIENT
      do
         Result := connection.gda
      end

   transaction: GDA_TRANSACTION

   next: EDC_GDA_TRANSACTION
   previous: EDC_GDA_TRANSACTION
   connection: EDC_GDA_CONNECTION

invariant
   is_null implies is_active

end -- class EDC_GDA_TRANSACTION
