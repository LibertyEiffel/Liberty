indexing
   description: "preferred language (German)";
   status: "See notice at end of class";
   author: "Ulrich Windl <Ulrich.Windl@rz.uni-regensburg.de>";
   version: "$Revision$";
   last_modification: "$Date$"
class AUX_UW01PREFERRED_LANGUAGE
inherit
   AUX_UW01LANGUAGE
      redefine
         s1, s2, s3, s4, s5, s6, s7, s8, s9, s10,
         s11, s12, s13, s14, s15, s16,
         yes_character, no_character
      end;

feature -- strings
   s1 : STRING is
      once
         Result := "animal_action (is it a ..)%N";
      end;
   
   s2 : STRING is
      once
         Result := "Erraten!%N";
      end;
   
   s3 : STRING is
      once
         Result := "Dieses Tier kenne ich nicht!%N";
      end;
   
   s4 : STRING is
      once
         Result := "Ist es ein ";
      end;
   
   s5 : STRING is
      once
         Result := " ? ";
      end;
   
   s6 : STRING is
      once
         Result := "(j/n): ";
      end;
   
   s7 : STRING is
      once
         Result := "Nochmal ? ";
      end;
   
   s8 : STRING is
      once
         Result := "Für ein `";
      end;
   
   s9 : STRING is
      once
         Result := "' ist die Antwort auf die Frage%N`";
      end;
   
   s10 : STRING is
      once
         Result := "'? (j/n): ";
      end;
   
   s11 : STRING is
      once
         Result := "Welche Frage unterscheidet ";
      end;
   
   s12 : STRING is
      once
         Result := " von ";
      end;
   
   s13 : STRING is
      once
         Result := "?%N";
      end;
   
   s14 : STRING is
      once
         Result := "question_action (Question: ..)%N";
      end;
   
   s15 : STRING is
      once
         Result := "Tier eingeben: ";
      end;
   
   s16 : STRING is
      once
         Result := "Frage eingeben: ";
      end;
   
   
feature -- magic characters
   yes_character : CHARACTER is
         -- character used for positive replies
      once
         Result := 'j';
      end;
   
   no_character : CHARACTER is
         -- character used for negative replies
      once
         Result := 'n';
      end;
   
end -- AUX_UW01PREFERRED_LANGUAGE
-- Copyright (c) 1998 by Ulrich Windl
-- Copyright (c) 1998 by Klinikum der Universität Regensburg,
--      D-93042 Regensburg
--
--  This program is free software; you can redistribute it and/or modify
--  it under the terms of the GNU General Public License as published by
--  the Free Software Foundation; either version 2 of the License, or
--  (at your option) any later version.
--
--  This program is distributed in the hope that it will be useful,
--  but WITHOUT ANY WARRANTY; without even the implied warranty of
--  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
--  GNU General Public License for more details.
--
--  You should have received a copy of the GNU General Public License
--  along with this program; if not, write to the Free Software
--  Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301, USA
