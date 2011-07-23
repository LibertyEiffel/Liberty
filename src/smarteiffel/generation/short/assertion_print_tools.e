class ASSERTION_PRINT_TOOLS
feature {}
   hidden_expression_detector: HIDDEN_EXPRESSION_DETECTOR is
      once
         create Result.make
      end

   tmp_assertion_list: FAST_ARRAY[ASSERTION] is
      once
         create Result.with_capacity(4)
      end

end -- class ASSERTION_PRINT_TOOLS
