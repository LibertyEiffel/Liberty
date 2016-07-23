-- See the Copyright notice at the end of this file.
--
class LOGIGRAM

create {ANY}
   make

feature {}
   description: DESCRIPTION

   situation: SITUATION

   make
      do
         create situation
         create description.make
         make_description
         situation.make(description)
         situation.solve
      end

   make_description
      do
         describe_problem_classic
         --describe_problem_small
         --describe_problem_jojo
         --describe_problem_big
      end

feature {}
   describe_problem_classic
         -- A classic problem.
         --  Knowing that:
         --    - the house of the english is red,
         --    - the spanish has a dog,
         --    - one drink coffee in the green house,
         --    - the ukrainian drinks tea,
         --    - the green house is just at right of the ivory house,
         --    - the man that smokes winstons have a snail,
         --    - the man that smokes kools have the yellow house,
         --    - one drinks milk in the house at the middle,
         --    - the norvegian lives in the house at left,
         --    - the one who smokes chesterfields is neibourgh of a fox,
         --    - the one who smokes kools is neibourgh of a horse,
         --    - the one who smokes luckystrike drinks orange juice,
         --    - the japanese smokes parliaments,
         --    - the norvegian is neibourgh of the blue house.
         --  Tell who got the zebra and who drinks water?
      local
         a, b: ITEM
      do
         group_ordered("house", {ARRAY[STRING] 1, << "left", "mid-left", "middle", "mid-right", "right" >> })
         group_atomic("nationality", {ARRAY[STRING] 1, << "english", "spanish", "ukrainian", "norvegian", "japanese" >> })
         group_atomic("animal", {ARRAY[STRING] 1, << "dog", "fox", "zebra", "horse", "snail" >> })
         group_atomic("drink", {ARRAY[STRING] 1, << "tea", "milk", "orange juice", "coffee", "water" >> })
         group_atomic("cigarette", {ARRAY[STRING] 1, << "kools", "winston", "chesterfields", "luckystrike", "parliaments" >> })
         group_atomic("color", {ARRAY[STRING] 1, << "green", "ivory", "yellow", "blue", "red" >> })
         -- the house of the english is red
         rule(yes(item("nationality", "english"), item("color", "red")))
         -- the spanish has a dog
         rule(yes(item("nationality", "spanish"), item("animal", "dog")))
         -- one drink coffee in the green house
         rule(yes(item("drink", "coffee"), item("color", "green")))
         -- the ukrainian drinks tea
         rule(yes(item("nationality", "ukrainian"), item("drink", "tea")))
         -- the green house is just at right of the ivory house
         a := some("house")
         b := some("house")
         rule(eq(sub(ref(a), ref(b)), num(1))) -- a at right of b
         rule(yes(a, item("color", "green")))
         rule(yes(b, item("color", "ivory")))
         -- the man that smokes winstons have a snail
         rule(yes(item("cigarette", "winston"), item("animal", "snail")))
         -- the man that smokes kools have the yellow house
         rule(yes(item("cigarette", "kools"), item("color", "yellow")))
         -- one drinks milk in the house at the middle
         rule(yes(item("house", "middle"), item("drink", "milk")))
         -- the norvegian lives in the house at left
         rule(yes(item("house", "left"), item("nationality", "norvegian")))
         -- the one who smokes chesterfields is neibourgh of a fox
         a := some("house")
         b := some("house")
         rule(eq(abs(sub(ref(b), ref(a))), num(1))) -- neibourghs
         rule(yes(a, item("cigarette", "chesterfields")))
         rule(yes(b, item("animal", "fox")))
         -- the one who smokes kools is neibourgh of a horse
         a := some("house")
         b := some("house")
         rule(eq(abs(sub(ref(b), ref(a))), num(1))) -- neibourghs
         rule(yes(a, item("cigarette", "kools")))
         rule(yes(b, item("animal", "horse")))
         -- the one who smokes luckystrike drinks orange juice
         rule(yes(item("cigarette", "luckystrike"), item("drink", "orange juice")))
         -- the japanese smokes parliaments
         rule(yes(item("cigarette", "parliaments"), item("nationality", "japanese")))
         -- the norvegian is neibourgh of the blue house
         a := some("house")
         b := some("house")
         rule(eq(abs(sub(ref(b), ref(a))), num(1))) -- neibourghs
         rule(yes(a, item("nationality", "norvegian")))
         rule(yes(b, item("color", "blue")))
      end

   describe_problem_small
         -- A small problem for beginning and debugging
         -- * The one that had no child was born in 1804 and is not Marie.
         -- * Julie didn't have exactly one child and had fewer children than Marie.
         -- * The one that has 2 children was not born in 1805 and is not Eve.
      local
         a, b: ITEM
      do
         group_atomic("forname", {ARRAY[STRING] 1, << "marie", "julie", "eve" >> })
         group_numeric("children", {ARRAY[STRING] 1, << "0", "1", "2" >> })
         group_numeric("birth", {ARRAY[STRING] 1, << "1804", "1805", "1806" >> })

         rule(no(item("forname", "marie"), item("children", "0")))
         rule(yes(item("birth", "1804"), item("children", "0")))
         rule(no(item("forname", "julie"), item("children", "1")))
         rule(no(item("forname", "eve"), item("children", "2")))
         rule(no(item("birth", "1805"), item("children", "2")))
         a := some("children")
         b := some("children")
         rule(yes(a, item("forname", "marie")))
         rule(yes(b, item("forname", "julie")))
         rule(inf(ref(b), ref(a)))
      end

   describe_problem_jojo
         -- A problem from jojo.
         --
         -- After coming back to China from France, Wang Fox, a student
         -- in occidental history, discover that almost all his documents
         -- are lost. From its study about 5 ladies of a little french
         -- city in the first middle of the 19th century, he only
         -- remembers that:
         -- * fornames are Marie, Julie, Eve, Lucie, Zora.
         -- * they had from 0 to 4 children (no one the same count)
         -- * they are born between 1804 and 1808 (inclusive, no one the same)
         -- * they died between 1844 and 1848 (inclusive, no one the same)
         -- * The one who died in 1847 was born after the one having
         --   3 children and two years before Eve.
         -- * The one not having any children has lived less
         --   long than Eve and 2 years less than the one
         --   born in 1806.
         -- * Marie did not have 4 children, she has lived
         --   at least 41 years and had more children than
         --   the one born in 1804.
         -- * Lucie died before Zora and had fewer
         --   children than the one died in 1844.
         --
         -- The same in french.
         -- * Celle morte en 1847 est née apres celle ayant eu 3 enfants et
         --   deux ans avant Eve.
         -- * Celle n'ayant pas eu d'enfants a vecu moins longtemps que Eve
         --   et 2 ans de moins que celle née en 1806.
         -- * Marie n'a pas eu 4 enfants, elle a vecu au moins 41 ans
         --   et a eu plus d'enfant que celle née en 1804.
         -- * Lucie est morte avant Zora et a eu moins d'enfants que celle
         --   decedée en 1844.
      local
         a, b, c, d, e, f: ITEM
      do
         group_atomic("forname", {ARRAY[STRING] 1, << "marie", "julie", "eve", "lucie", "zora" >> })
         group_numeric("children", {ARRAY[STRING] 1, << "0", "1", "2", "3", "4" >> })
         group_numeric("birth", {ARRAY[STRING] 1, << "1804", "1805", "1806", "1807", "1808" >> })
         group_numeric("death", {ARRAY[STRING] 1, << "1844", "1845", "1846", "1847", "1848" >> })
         -- * The one died in 1847 was born after the one having
         --   3 children and two years before Eve.

         a := some("birth")
         b := some("birth")
         c := some("birth")
         rule(yes(a, item("death", "1847")))
         rule(yes(b, item("children", "3")))
         rule(yes(c, item("forname", "eve")))
         rule(sup(ref(a), ref(b)))
         rule(eq(add(ref(a), num(2)), ref(c)))
         -- * The one not having children has lived less
         --   longer than Eve and 2 years less than the one
         --   born in 1806.

         a := some("birth")
         d := some("death")
         e := some("death")
         f := some("death")
         rule(yes(a, item("children", "0")))
         rule(yes(d, item("children", "0")))
         rule(yes(e, item("birth", "1806")))
         rule(yes(f, item("forname", "eve")))
         rule(inf(sub(ref(d), ref(a)), sub(ref(f), ref(c))))
         rule(eq(add(sub(ref(d), ref(a)), num(2)), sub(ref(e), num(1806))))
         -- * Marie did not have 4 children, she has lived
         --   at least 41 years and had more child than
         --   the one born in 1804.

         rule(no(item("forname", "marie"), item("children", "4")))
         a := some("birth")
         b := some("death")
         rule(yes(a, item("forname", "marie")))
         rule(yes(b, item("forname", "marie")))
         rule(inf(num(40), sub(ref(b), ref(a))))
         a := some("children")
         b := some("children")
         rule(yes(a, item("birth", "1804")))
         rule(yes(b, item("forname", "marie")))
         rule(inf(ref(a), ref(b)))
         -- * Lucie died before zora and had less
         --   children than the one died in 1844.

         a := some("death")
         b := some("death")
         rule(yes(a, item("forname", "lucie")))
         rule(yes(b, item("forname", "zora")))
         rule(inf(ref(a), ref(b)))
         a := some("children")
         b := some("children")
         rule(yes(a, item("forname", "lucie")))
         rule(yes(b, item("death", "1844")))
         rule(inf(ref(a), ref(b)))
      end

   describe_problem_big
         -- a big problem not translated
      local
         a, b: ITEM
      do
         group_atomic("film", {ARRAY[STRING] 1, << "10", "coup", "corse", "prix", "vipere" >> })
         group_atomic("acteur", {ARRAY[STRING] 1, << "emilio", "gerard", "louis", "norbert", "sammy" >> })
         group_atomic("animal", {ARRAY[STRING] 1, << "cheval", "cobra", "chien", "singe", "tigre" >> })
         group_ordered("jour", {ARRAY[STRING] 1, << "lundi", "mardi", "mercredi", "jeudi", "vendredi" >> })
         group_numeric("prise", {ARRAY[STRING] 1, << "2", "3", "4", "6", "8" >> })
         group_atomic("lieu", {ARRAY[STRING] 1, << "cuisine", "champ", "escalier", "foret", "rue" >> })
         group_numeric("scene", {ARRAY[STRING] 1, << "30", "60", "120", "180", "240" >> })
         group_atomic("ennui", {ARRAY[STRING] 1, << "agressivite", "fuite", "immobilite", "panique", "panne" >> })
         rule(no(item("ennui", "fuite"), item("animal", "cobra")))
         rule(no(item("ennui", "fuite"), item("acteur", "emilio")))
         rule(yes(item("acteur", "sammy"), item("film", "corse")))
         rule(no(item("acteur", "sammy"), item("jour", "jeudi")))
         rule(no(item("acteur", "sammy"), item("scene", "30")))
         rule(yes(item("lieu", "foret"), item("ennui", "panne")))
         a := some("jour")
         rule(yes(a, item("prise", "8")))
         b := some("jour")
         rule(yes(b, item("film", "vipere")))
         rule(eq(add(num(-2), ref(a)), ref(b)))
         b := some("jour")
         rule(yes(b, item("lieu", "foret")))
         rule(eq(add(num(1), ref(a)), ref(b)))
         rule(no(item("film", "vipere"), item("prise", "3")))
         rule(no(item("film", "vipere"), item("lieu", "rue")))
         rule(yes(item("lieu", "cuisine"), item("animal", "cobra")))
         rule(no(item("jour", "lundi"), item("animal", "cobra")))
         rule(no(item("jour", "mardi"), item("animal", "cobra")))
         rule(no(item("scene", "30"), item("animal", "cobra")))
         rule(no(item("scene", "60"), item("animal", "cobra")))
         rule(no(item("animal", "chien"), item("lieu", "escalier")))
         rule(no(item("animal", "chien"), item("ennui", "panique")))
         a := some("scene")
         rule(yes(a, item("film", "prix")))
         b := some("scene")
         rule(yes(b, item("animal", "cheval")))
         rule(eq(add(num(-60), ref(a)), ref(b)))
         b := some("scene")
         rule(yes(b, item("acteur", "norbert")))
         rule(eq(add(num(60), ref(a)), ref(b)))
         rule(no(item("jour", "lundi"), item("animal", "cheval")))
         rule(yes(item("acteur", "norbert"), item("prise", "6")))
         rule(no(item("acteur", "gerard"), item("jour", "lundi")))
         rule(no(item("acteur", "gerard"), item("scene", "120")))
         rule(no(item("film", "10"), item("acteur", "emilio")))
         rule(no(item("film", "10"), item("acteur", "norbert")))
         rule(no(item("film", "10"), item("prise", "2")))
         rule(no(item("film", "10"), item("prise", "3")))
         rule(no(item("animal", "tigre"), item("jour", "lundi")))
         rule(no(item("animal", "tigre"), item("jour", "mardi")))
         rule(no(item("animal", "tigre"), item("lieu", "rue")))
         rule(yes(item("animal", "tigre"), item("ennui", "immobilite")))
         rule(yes(item("scene", "180"), item("jour", "mardi")))
         rule(no(item("scene", "180"), item("prise", "6")))
         rule(no(item("scene", "180"), item("lieu", "escalier")))
         rule(no(item("scene", "180"), item("animal", "chien")))
      end

feature {}
   group_atomic (nam: STRING; values: ARRAY[STRING])
      do
         description.add_group_atomic(nam)
         values.for_each(agent description.group.add_item(?))
      end

   group_numeric (nam: STRING; values: ARRAY[STRING])
      do
         description.add_group_numeric(nam)
         values.for_each(agent description.group.add_item(?))
      end

   group_ordered (nam: STRING; values: ARRAY[STRING])
      do
         description.add_group_ordered(nam)
         values.for_each(agent description.group.add_item(?))
      end

feature {}
   rule (cstr: CONSTRAINT)
      do
         description.constraints.add(cstr)
      end

   no (i, j: ITEM): CONSTRAINT_NO
      do
         create Result.make(i, j)
      end

   yes (i, j: ITEM): CONSTRAINT_YES
      do
         create Result.make(i, j)
      end

   eq (i, j: EXPR): CONSTRAINT_EQUAL
      do
         create Result.make(i, j)
      end

   neq (i, j: EXPR): CONSTRAINT_NOT_EQUAL
      do
         create Result.make(i, j)
      end

   inf (i, j: EXPR): CONSTRAINT_LESSER
      do
         create Result.make(i, j)
      end

   sup (i, j: EXPR): CONSTRAINT_GREATER
      do
         create Result.make(i, j)
      end

   add (i, j: EXPR): EXPR_ADD
      do
         create Result.make(i, j)
      end

   sub (i, j: EXPR): EXPR_SUB
      do
         create Result.make(i, j)
      end

   mul (i, j: EXPR): EXPR_MUL
      do
         create Result.make(i, j)
      end

   abs (i: EXPR): EXPR_ABS
      do
         create Result.make(i)
      end

   num (i: INTEGER): EXPR_VALUE
      do
         create Result.make(i)
      end

   ref (i: ITEM): EXPR_ITEM
      do
         create Result.make(i)
      end

   item (group, name: STRING): ITEM_ITEM
      do
         Result := description.get_item(group, name)
      end

   var (group, name: STRING): ITEM_VAR
      do
         Result := description.get_var(group, name)
      end

   some (group: STRING): ITEM_VAR
      do
         Result := description.get_anonymous_var(group)
      end

end -- class LOGIGRAM
--
-- ------------------------------------------------------------------------------------------------------------------------------
-- Copyright notice below. Please read.
--
-- This file is free software, which comes along with SmartEiffel. This software is distributed in the hope that it will be
-- useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
-- You can modify it as you want, provided this footer is kept unaltered, and a notification of the changes is added.
-- You are allowed to redistribute it and sell it, alone or as a part of another product.
--
-- Copyright(C) 1994-2002: INRIA - LORIA (INRIA Lorraine) - ESIAL U.H.P.       - University of Nancy 1 - FRANCE
-- Copyright(C) 2003-2005: INRIA - LORIA (INRIA Lorraine) - I.U.T. Charlemagne - University of Nancy 2 - FRANCE
--
-- Authors: Dominique COLNET, Philippe RIBET, Cyril ADRIAN, Vincent CROIZIER, Frederic MERIZEN
--
-- http://SmartEiffel.loria.fr - SmartEiffel@loria.fr
-- ------------------------------------------------------------------------------------------------------------------------------
