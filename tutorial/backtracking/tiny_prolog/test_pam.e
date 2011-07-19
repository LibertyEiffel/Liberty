
class TEST_PAM

inherit

	PAM_GLOBALS

creation

	make

feature

	pam_pro: PAM_PROCESSOR;

	pam_printer: PAM_PRINTER;

	pam_parser : PAM_EXPR_PARSER;

feature

	make is
		do
			!!pam_pro.make;
			!!pam_printer.make;
			!!pam_parser.make;

			-- test1;
			-- test2;
			-- test3;
			-- test4;
			-- test5;
			-- test6;
			test7;
			-- test8;
		end

	parse (txt: STRING) is
		do
			pam_parser.parse (txt);
			if
				pam_parser.error_detected
			or else
				pam_parser.warning_detected
			or else
				pam_parser.query
			then
				print (pam_parser.error_message);
				die_with_code (exit_failure_code);
			end
		end

	query (txt: STRING) is
		do
			pam_parser.parse (txt);
			if
				pam_parser.error_detected
			or else
				pam_parser.warning_detected
			or else
				pam_parser.fact
			then
				print (pam_parser.error_message);
				die_with_code (exit_failure_code);
			end;
			pam_pro.query (pam_parser.parsed_expr);
		end

feature -- tests

	test1 is
		do
			print ("-----------%N");

			parse("p(f(X),h(Y,f(a)),Y).");
			pam_printer.print_fact(pam_parser.parsed_expr,-1);
			parse("p(Z,h(Z,W),f(W)).");
			pam_printer.print_fact(pam_parser.parsed_expr,-1);
			parse("p(Z,h(Z,W),f(W)):-t(Z,W),!,y(W,_).");
			pam_printer.print_fact(pam_parser.parsed_expr,-1);

			print ("-----------%N");
		end

	test2 is
		do
			print ("-----------%N");

			parse("cons([],R,R).");
			parse("cons([H1|T1],L2,[H1|R]) :- cons(T1,L2,R).");

			print ("-----------%N");

			query("cons([a,b,c],[e,f,g],R)?");
		end

	test3 is
		do
			print ("-----------%N");

			parse("mix([],[],[]).");
			parse("mix([H1|T1],L2,[H1|R]) :- mix(T1,L2,R).");
			parse("mix(L1,[H2|T2],[H2|R]) :- mix(L1,T2,R).");

			print ("-----------%N");

			query("mix([a,b],[e],R)?");
		end

	test4 is
		do
			print ("-----------%N");

			parse("dans([X|Y],[],X,Y).");
			parse("dans([X|Y],[X|T],D,Q):-dans(Y,T,D,Q).");

			print ("-----------%N");

			query("dans([a,b,c,d,e],T,R,Q)?");
			query("dans([a,b,c,d,e],_,R,L)?");
		end

	test5 is
		do
			print ("-----------%N");

			parse("permu([],[]).");
			parse("permu([X|Y],[D|R]):-dans([X|Y],T,D,Q),cons(T,Q,Z),permu(Z,R).");

			print ("-----------%N");

			query("permu([a,b,c,d],R)?");
		end

	test6 is
		do
			print ("-----------%N");

			--parse("in([c|Y],c):-!.");
			parse("in([X|Y],X).");
			parse("in([_|Y],Z):-in(Y,Z).");

			print ("-----------%N");

			query("in([a,b,c],R)?");
		end

	test7 is
		do
			print ("-----------%N");

			parse("clues(Maisons):-%
			%maison(A, Maisons), couleur(A, rouge), nationalite(A, anglais),     %
			%maison(B, Maisons), nationalite(B, espagnol), animal(B, chien),     %
			%maison(C, Maisons), couleur(C, vert), boit(C, cafe),                %
			%maison(D, Maisons), nationalite(D, ukrainien), boit(D, the),        %
			%adroite(Maisons, E, F), couleur(E, vert), couleur(F, ivoire),       %
			%maison(G, Maisons), fume(G, winston), animal(G, escargot),          %
			%maison(H, Maisons), fume(H, kools), couleur(H, jaune),              %
			%milieu(Maisons, I), boit(I, lait),                                  %
			%premiere(Maisons, J), nationalite(J, norvegien),                    %
			%voisins(Maisons, K, L), fume(K, chesterfields), animal(L, renard),  %
			%voisins(Maisons, M, N), fume(M, kools), animal(N, cheval),          %
			%maison(O, Maisons), fume(O, luckystrike), boit(O, jus_d_orange),    %
			%maison(P, Maisons), nationalite(P, japonais), fume(P, parliaments), %
			%voisins(Maisons, Q, R), nationalite(Q, norvegien), couleur(R, bleu).");

			parse("couleur(maison(C,_,_,_,_), C).");
			parse("nationalite(maison(_,N,_,_,_), N).");
			parse("animal(maison(_,_,P,_,_), P).");
			parse("boit(maison(_,_,_,D,_), D).");
			parse("fume(maison(_,_,_,_,S), S).");

			parse("premiere(maisons(X,_,_,_,_), X).");

			parse("milieu(maisons(_,_,X,_,_), X).");

			parse("adroite(maisons(L,R,_,_,_), R, L).");
			parse("adroite(maisons(_,L,R,_,_), R, L).");
			parse("adroite(maisons(_,_,L,R,_), R, L).");
			parse("adroite(maisons(_,_,_,L,R), R, L).");

			parse("voisins(Xs, X, Y):-adroite(Xs, X, Y).");
			parse("voisins(Xs, X, Y):-adroite(Xs, Y, X).");

			parse("maison(X, maisons(X,_,_,_,_)).");
			parse("maison(X, maisons(_,X,_,_,_)).");
			parse("maison(X, maisons(_,_,X,_,_)).");
			parse("maison(X, maisons(_,_,_,X,_)).");
			parse("maison(X, maisons(_,_,_,_,X)).");

			print ("-----------%N");

			query("clues(Maisons),%
						%maison(X, Maisons), animal(X, zebre), nationalite(X, ZebraOwner),%
						%maison(Y, Maisons), boit(Y, eau), nationalite(Y, WaterDrinker)?");
		end

	test8 is
		do
			print ("-----------%N");

			parse("plus(s(X),Y,s(Z)):-plus(X,Y,Z).");
			parse("plus(z,X,X).");

			print ("-----------%N");

			query("plus(X,Y,s(s(s(s(z)))))?");
		end

end -- class TEST_PAM


