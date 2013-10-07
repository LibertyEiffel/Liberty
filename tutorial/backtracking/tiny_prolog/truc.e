class TRUC

feature {ANY}
   init_string: STRING is "[
   once(Goal):-call(Goal),!.
   '\='(X,Y):-'='(X,Y),!,fail;true.
   '->'(Goal1,Goal2):-call(Goal1),!,call(Goal2).
   '=='(A,B):-__compare_terms__(A,B)=:=0.
   '\=='(A,B):-__compare_terms__(A,B)=\=0.
   '@<'(A,B):-__compare_terms__(A,B)<0.
   '@>'(A,B):-__compare_terms__(A,B)>0.
   '@<='(A,B):-__compare_terms__(A,B)<=0.
   '@>='(A,B):-__compare_terms__(A,B)>=0.
   ]"

end -- class TRUC
--	':-'(A,B):-
--	clause(Head,Body):-':-'(Head,Body).
