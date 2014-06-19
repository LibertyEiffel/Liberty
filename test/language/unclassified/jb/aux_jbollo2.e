class AUX_JBOLLO2[X_]

feature {ANY}
   item: X_

   put(value: like item)
      do
         item := value
      ensure
         item = value
      end

end
