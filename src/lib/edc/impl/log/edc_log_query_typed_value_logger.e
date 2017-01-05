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
class EDC_LOG_QUERY_TYPED_VALUE_LOGGER[T_]

inherit
   EDC_LOG_QUERY_VALUE_LOGGER
   EDC_MANIFEST_VALUE_VISITOR[T_]
   EDC_PARAMETER_VISITOR[T_]

create {EDC_LOG_QUERY_LOGGER}
   make

feature {EDC_MANIFEST_VALUE}
   visit_manifest_value (a_manifest_value: EDC_MANIFEST_VALUE[T_])
      do
         put.call([a_manifest_value.item])
      end

feature {EDC_PARAMETER}
   visit_parameter (a_parameter: EDC_PARAMETER[T_])
      do
         put.call([a_parameter.item])
      end

feature {}
   make (a_put: like put)
      require
         a_put /= Void
      do
         put := a_put
      end

   put: PROCEDURE[TUPLE[T_]]

end -- class EDC_LOG_QUERY_TYPED_VALUE_LOGGER
