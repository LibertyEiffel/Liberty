expanded class EDC_CONSTANTS

feature {} -- Query options
   Edc_default: EDC_QUERY_OPTION
      once
         create {EDC_QUERY_OPTION_DEFAULT} Result.make
      end

   Edc_for_update: EDC_QUERY_OPTION
      once
         create {EDC_QUERY_OPTION_FOR_UPDATE} Result.make
      end

feature {} -- Field options
   Edc_primary_key: EDC_FIELD_OPTION
      once
         create {EDC_FIELD_OPTION_PRIMARY_KEY} Result.make
      end

   Edc_mandatory: EDC_FIELD_OPTION
      once
         create {EDC_FIELD_OPTION_MANDATORY} Result.make
      end

end -- class EDC_CONSTANTS
