class TEST_JBOLLO2

insert
   AUX_JBOLLO2[INTEGER]
      rename
         item as value, put as put_value
      end
   AUX_JBOLLO2[INTEGER]
      rename
         item as seed, put as put_seed
      end

create {}
   make

feature {}
   make
      do
         put_seed(5)
         next print(value.out+"%N")
         next print(value.out+"%N")
         next print(value.out+"%N")
      end

   next
      do
         put_value(seed #+ 1)
         put_seed(seed #* 19 #+ -45)
      end

end
