class TEST_UW01
   -- From a bug report of Ulrich Windl

create {}
   make

feature {ANY}
   make
      local
         boool: BOOLEAN
      do
         -- boool := true
         if boool then
            from
               create extra_io.make
               create {AUX_UW01PREFERRED_LANGUAGE} language
            until
               done
            loop
               print_tree(root, 0)
               extra_io.read_yes_no(language.s7)
               done := not extra_io.last_boolean
               if not done then
                  guess
               end
            end
         end
      end

   guess
         -- guess an animal
      local
         last_node, node: AUX_UW01YES_NO_NODE
      do
         from
            node := root
         until
            node = Void
         loop
            last_node := node
            node.execute
            node.read_answer
            node := node.decision
         end
         if root = Void or else last_node /= Void and then not last_node.last_answer then
            add_new_animal(last_node)
         end
      end

   print_tree (node: AUX_UW01YES_NO_NODE; level: INTEGER)
         -- print tree starting at `node', using indent `level'
      require
         good_level: level >= 0
      do
         if node /= Void then
            indent(level)
            print(node.out)
            io.put_new_line
            if node.yes /= Void and then node.yes /= node then
               print_tree(node.yes, level + 1)
            end

            if node.no /= Void and then node.no /= node then
               print_tree(node.no, level + 1)
            end
         end
      end

feature {}
   make_new_animal: AUX_UW01ANIMAL_NODE
         -- new animal
      do
         extra_io.read_string(language.s15)
         if extra_io.last_string.count > 0 then
            create Result.make_simple(extra_io.last_string.twin)
         end
      end

   make_new_question: AUX_UW01QUESTION_NODE
         -- new question
      do
         extra_io.read_string(language.s16)
         if extra_io.last_string.count > 0 then
            create Result.make_simple(extra_io.last_string.twin)
         end
      end -- make_new_animal

   insert_animal_question_pair (before: AUX_UW01YES_NO_NODE; new_animal: AUX_UW01ANIMAL_NODE
      new_question: AUX_UW01QUESTION_NODE)
         -- insert QUESTION_NODE `new_question' before
         -- `new_animal', and `before', depending on the
         -- answer to the question.
      require
         valid_parent: before /= Void
         valid_question: new_question /= Void
         valid_animal: new_animal /= Void
      local
         text: STRING; answer: BOOLEAN; before_parent: AUX_UW01YES_NO_NODE
      do
         text := language.s8.twin
         text.append(new_animal.name)
         text.append(language.s9)
         io.put_string(text)
         io.put_string(new_question.property)
         extra_io.read_yes_no(language.s10)
         answer := extra_io.last_boolean
         before_parent := before.parent
         if before_parent /= Void then
            -- make sure new question will be found!
            if before_parent.yes = before then
               before_parent.set_yes_node(new_question)
            else
               before_parent.set_no_node(new_question)
            end
         end

         new_question.set_parent_node(before.parent)
         new_animal.set_parent_node(new_question)
         before.set_parent_node(new_question)
         if answer then
            new_question.set_yes_node(new_animal)
            new_question.set_no_node(before)
         else
            new_question.set_yes_node(before)
            new_question.set_no_node(new_animal)
         end
      end

   add_new_animal (before: AUX_UW01YES_NO_NODE)
         -- add a new animal before node `before', possibly with a new question
      local
         animal: AUX_UW01ANIMAL_NODE; question: AUX_UW01QUESTION_NODE
      do
         io.put_string(language.s3)
         animal := make_new_animal
         if animal /= Void then
            if before = Void then
               -- start with animal
               root := animal
            else
               -- Need a new question
               io.put_string(language.s11)
               io.put_string(animal.out)
               io.put_string(language.s12)
               io.put_string(before.out)
               io.put_string(language.s13)
               question := make_new_question
               if question /= Void then
                  insert_animal_question_pair(before, animal, question)
                  if before = root then
                     -- start with question
                     root := question
                  end
               end
            end
         end
      end

   indent (level: INTEGER)
         -- output indentation for level `level'
      require
         good_level: level >= 0
      local
         str: STRING
      do
         create str.make(3 * level)
         str.make_filled(' ', 3 * level)
         io.put_string(str)
      end

   root: AUX_UW01YES_NO_NODE -- root of the tree

   extra_io: AUX_UW01EXTRA_IO -- additional I/O

   done: BOOLEAN -- exit main loop?

   language: AUX_UW01LANGUAGE -- language to use

end -- class TEST_UW01
