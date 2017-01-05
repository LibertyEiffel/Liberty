-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
class WEB_PANEL

inherit
   UI_TYPED_BRIDGE_PANEL[WEB_JOB, WEB_WIDGET[UI_WIDGET]]

insert
   WEB_WIDGET[UI_PANEL]
      redefine
         make
      end

create {WEB_JOB}
   make

feature {UI_PANEL}
   add (a_child: WEB_WIDGET[UI_WIDGET])
      do
         children.add(a_child, a_child.id)
      end

feature {WEB_ITEM}
   save (context: WEB_CONTEXT)
      do
         children.for_each(agent {WEB_WIDGET[UI_WIDGET]}.save(context))
      end

   run (context: WEB_CONTEXT)
      do
         children.for_each(agent {WEB_WIDGET[UI_WIDGET]}.run(context))
      end

   retrieve_name (a_name: STRING; a_extension: COLLECTION[STRING]): ABSTRACT_STRING
      local
         dot_index: INTEGER; child: WEB_WIDGET[UI_WIDGET]
      do
         dot_index := a_name.first_index_of('.')
         if a_name.valid_index(dot_index) then
            child := children.fast_reference_at(a_name.substring(a_name.lower, dot_index - 1).intern)
            if child /= Void then
               Result := child.retrieve_name(a_name.substring(dot_index + 1, a_name.upper), a_extension)
            end
         end
      end

feature {}
   children: HASHED_DICTIONARY[WEB_WIDGET[UI_WIDGET], FIXED_STRING]

   make (a_ui: like ui)
      do
         Precursor(a_ui)
         create children.make
      end

invariant
   children /= Void

end -- class WEB_PANEL
--
-- Copyright (C) 2012-2017: Cyril ADRIAN <cyril.adrian@gmail.com>.
--
-- Permission is hereby granted, free of charge, to any person obtaining a copy
-- of this software and associated documentation files (the "Software"), to deal
-- in the Software without restriction, including without limitation the rights
-- to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
-- copies of the Software, and to permit persons to whom the Software is
-- furnished to do so, subject to the following conditions:
--
-- The above copyright notice and this permission notice shall be included in
-- all copies or substantial portions of the Software.
--
-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
-- IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
-- FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
-- AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
-- LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
-- OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
-- THE SOFTWARE.
