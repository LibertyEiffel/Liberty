class AUX_UW01LANGUAGE

feature {ANY}
   s1: STRING
      once
         Result := "animal_action (is it a ..)%N"
      end

   s2: STRING
      once
         Result := "I guessed it!%N"
      end

   s3: STRING
      once
         Result := "I don't know that animal!%N"
      end

   s4: STRING
      once
         Result := "Is it a "
      end

   s5: STRING
      once
         Result := " ? "
      end

   s6: STRING
      once
         Result := "(y/n): "
      end

   s7: STRING
      once
         Result := "Another try ? "
      end

   s8: STRING
      once
         Result := "For a `"
      end

   s9: STRING
      once
         Result := "' the answer to the question%N`"
      end

   s10: STRING
      once
         Result := "'? (y/n): "
      end

   s11: STRING
      once
         Result := "What question distinguishes "
      end

   s12: STRING
      once
         Result := " from a "
      end

   s13: STRING
      once
         Result := "?%N"
      end

   s14: STRING
      once
         Result := "question_action (Question: ..)%N"
      end

   s15: STRING
      once
         Result := "Enter animal: "
      end

   s16: STRING
      once
         Result := "Enter question: "
      end

feature {ANY}
   yes_character: CHARACTER
         -- character used for positive replies
      once
         Result := 'y'
      end

   no_character: CHARACTER
         -- character used for negative replies
      once
         Result := 'n'
      end

end -- class AUX_UW01LANGUAGE
