expanded class EDC_CONSTANTS

feature {} -- Query options
   Edc_default: EDC_QUERY_OPTION is
      once
         create {EDC_QUERY_OPTION_DEFAULT} Result.make
      end

   Edc_for_update: EDC_QUERY_OPTION is
      once
         create {EDC_QUERY_OPTION_FOR_UPDATE} Result.make
      end

end -- class EDC_CONSTANTS
