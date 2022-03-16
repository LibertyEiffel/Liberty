-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
class READLINE_PANEL

inherit
   UI_TYPED_BRIDGE_PANEL[READLINE_JOB, READLINE_WIDGET[UI_WIDGET]]

insert
   READLINE_WIDGET[UI_PANEL]
      redefine
         make
      end

create {READLINE_JOB}
   make

feature {UI_PANEL}
   add (a_child: READLINE_WIDGET[UI_WIDGET])
      do
         children.add(a_child, a_child.id)
      end

feature {READLINE_ITEM}
   run (context: READLINE_CONTEXT): BOOLEAN
      local
         name: STRING
         dot_index: INTEGER; child: READLINE_WIDGET[UI_WIDGET]
      do
         if not context.line.is_empty then
            name := context.line.first
            if name /= Void then
               dot_index := name.first_index_of('.')
               if name.valid_index(dot_index) then
                  child := children.fast_reference_at(name.substring(name.lower, dot_index - 1).intern)
                  if child /= Void then
                     name.shrink(dot_index + 1, name.upper)
                     Result := child.run(context)
                  end
               else
                  child := children.fast_reference_at(name.intern)
                  if child /= Void then
                     name.clear_count
                     Result := child.run(context)
                  end
               end
            end
         end
      end

feature {}
   children: HASHED_DICTIONARY[READLINE_WIDGET[UI_WIDGET], FIXED_STRING]

   make (a_ui: like ui)
      do
         Precursor(a_ui)
         create children.make
      end

invariant
   children /= Void

end -- class READLINE_PANEL
--
-- Copyright (C) 2012-2022: Cyril ADRIAN <cyril.adrian@gmail.com>.
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
