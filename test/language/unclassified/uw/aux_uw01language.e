class AUX_UW01LANGUAGE

feature {ANY}
   s1: STRING is
      once
         Result := "animal_action (is it a ..)%N"
      end

   s2: STRING is
      once
         Result := "I guessed it!%N"
      end

   s3: STRING is
      once
         Result := "I don't know that animal!%N"
      end

   s4: STRING is
      once
         Result := "Is it a "
      end

   s5: STRING is
      once
         Result := " ? "
      end

   s6: STRING is
      once
         Result := "(y/n): "
      end

   s7: STRING is
      once
         Result := "Another try ? "
      end

   s8: STRING is
      once
         Result := "For a `"
      end

   s9: STRING is
      once
         Result := "' the answer to the question%N`"
      end

   s10: STRING is
      once
         Result := "'? (y/n): "
      end

   s11: STRING is
      once
         Result := "What question distinguishes "
      end

   s12: STRING is
      once
         Result := " from a "
      end

   s13: STRING is
      once
         Result := "?%N"
      end

   s14: STRING is
      once
         Result := "question_action (Question: ..)%N"
      end

   s15: STRING is
      once
         Result := "Enter animal: "
      end

   s16: STRING is
      once
         Result := "Enter question: "
      end

feature {ANY}
   yes_character: CHARACTER is
         -- character used for positive replies
      once
         Result := 'y'
      end

   no_character: CHARACTER is
         -- character used for negative replies
      once
         Result := 'n'
      end

end -- class AUX_UW01LANGUAGE
