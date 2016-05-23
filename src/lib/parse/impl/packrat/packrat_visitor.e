-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
deferred class PACKRAT_VISITOR

inherit
   VISITOR

feature {PACKRAT_NON_TERMINAL}
   visit_non_terminal (visited: PACKRAT_NON_TERMINAL)
      require
         visited /= Void
      deferred
      end

feature {PACKRAT_TERMINAL}
   visit_terminal (visited: PACKRAT_TERMINAL)
      require
         visited /= Void
      deferred
      end

feature {PACKRAT_AND}
   visit_and (visited: PACKRAT_AND)
      require
         visited /= Void
      deferred
      end

feature {PACKRAT_CHOICE}
   visit_choice (visited: PACKRAT_CHOICE)
      require
         visited /= Void
      deferred
      end

feature {PACKRAT_NOT}
   visit_not (visited: PACKRAT_NOT)
      require
         visited /= Void
      deferred
      end

feature {PACKRAT_REFERENCE}
   visit_reference (visited: PACKRAT_REFERENCE)
      require
         visited /= Void
      deferred
      end

feature {PACKRAT_SEQUENCE}
   visit_sequence (visited: PACKRAT_SEQUENCE)
      require
         visited /= Void
      deferred
      end

feature {}
   accept_atom (a_atom: PARSE_ATOM[PACKRAT_PARSE_CONTEXT])
      local
         atom: PACKRAT_ATOM
      do
         atom ::= a_atom
         atom.accept(Current)
      end

end -- class PACKRAT_VISITOR
--
-- Copyright (C) 2009-2016: by all the people cited in the AUTHORS file.
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
