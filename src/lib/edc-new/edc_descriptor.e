deferred class EDC_DESCRIPTOR[K_]

insert
   EDC_CONSTANTS

feature {} -- Field options
   Edc_primary_key: EDC_FIELD_OPTION is
      once
         create {EDC_FIELD_OPTION_PRIMARY_KEY} Result.make
      end

   Edc_mandatory: EDC_FIELD_OPTION is
      once
         create {EDC_FIELD_OPTION_MANDATORY} Result.make
      end

end -- class EDC_TYPED_DESCRIPTOR
