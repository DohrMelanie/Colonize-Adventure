% meta stuff
start :-
    instructions,
    scene(rudolf_meets_albrecht).

die :-
    !, finish.

finish :-
    nl,
    write('The game is over. Please enter the halt. command.'),
    nl, !.

instructions :-
    nl,
    write('Enter commands using standard Prolog syntax.'), nl,
    write('Available commands are:'), nl,
    write('start.             -- to start the game.'), nl,
    write('halt.              -- to end the game and quit.'), nl,
    write('instructions.      -- to see this message again.'), nl,
    write('a.                 -- when in a decision, choose option a'), nl,
    write('b.                 -- when in a decision, choose option b'), nl,
    write('c.                 -- when in a decision, choose option c'), nl,
    nl.

read_choice(Choice) :-
    read(Choice).

get_random_choice(Choice) :-
    random_between(1, 3, Rand),
    (   Rand = 1 -> Choice = a
    ;   Rand = 2 -> Choice = b
    ;   Rand = 3 -> Choice = c
    ).

cls :- write('\e[2J').

% *****************************Szenes******************************
% Szene 1: Rudolf trifft auf Albrecht
scene(rudolf_meets_albrecht) :-
    nl,
    write('*du triffst auf Albrecht*'), nl,
    sleep(1),
    write('***Choice: Was machst du?***'), nl,
    sleep(1),
    write('a: sage Albrecht, dass er ein guter Freund ist'), nl,
    sleep(1),
    write('b: fuehre smalltalk, erzaehle dass du nach Niya suchst'), nl,
    read_choice(Choice),
    handle_choice(rudolf_meets_albrecht, Choice).

% Szene 2a: Rudolf sagt ihm, dass er ein guter Freund ist
scene(rudolf_tells_albrecht_that_he_is_a_good_friend) :-
    cls,
    write('Du: Albrecht, du bist ein guter Freund!'), nl,
    sleep(1),
    write('*Albrecht wird rot*'), nl,
    sleep(1),
    write('Albrecht: Ich aehh... Ich stehe auf dich!'), nl,
    sleep(1),
    write('*Oh mein Gott!*'), nl,
    write('Du: Ich stehe auch auf dich!'), nl,
    sleep(1),    
    write('Albrecht und du beschliesst gemeinsam in den Regenwald zu fluechten. Ihr lebt gluecklich bis ans Ende unserer Tage'), nl,
    finish.

% Szene 2b: Sie reden nur kurz miteinander
scene(they_talk_with_each_other) :-
    cls,
    write('Du: Hallo Albrecht, ich suche Niya, hast du sie wo gesehen?'), nl,
    sleep(1),
    write('Albrecht: Ja sie ist in ihrem Zelt'), nl,
    sleep(1),
    write('Du: Danke!'), nl,
    sleep(1),
    write('*du gehst zu Niya*'), nl, nl,
    sleep(1),
    write('Du: Hi Niya!'), nl,
    sleep(1),
    write('Niya: Hi Rudolf!'), nl,
    sleep(1),
    write('Du: Ich hab eine Idee ... wollen wir gemeinsam fluechten?'),
    get_random_choice(Choice),
    handle_choice(do_we_want_to_flee, Choice).

% Szene 3a: Sie sagt zu, da sie mittlerweile wirklich auf ihn steht
scene(she_really_likes_him) :-
    cls,
    write('Niya: Ja, ich moechte sehr gerne mit dir fluechten. Ich liebe dich! <3'), nl,
    sleep(1),
    write('Ihr ueberlebt beide und lebt gluecklich bis ans Ende eurer Tage. HAPPY END :)'), nl,
    finish.

% Szene 3b: Sie muss ihm vorher noch etwas wichtiges sagen
scene(she_has_to_tell_him_something) :-
    cls,
    write('Niya: Ich muss dir vorher noch etwas Wichtiges sagen...'), nl,
    sleep(1),
    write('Niya: Ich bin schwanger.'), nl,
    sleep(1),
    write('Rudolf: Oh mein Gott! Ich freu mich ja so <3'), nl,
    sleep(1),
    write('Ihr fluechtet trotzdem gemeinsam in den Regenwald. Bei der Geburt des Kindes allerdings stirbst du, und Rudolf musst das Kind alleine aufziehen. :('), nl,
    finish.

% Szene 3c: Sie hauen gemeinsam aus dem Militaerlager ab, sie steht nicht wirklich auf ihn
scene(she_does_not_like_him) :-
    nl,
    write('Niya: Ja, ich moechte mit dir fluechten.'), nl,
    sleep(1),
    write('Ihr fluechtet gemeinsam aus dem Militaerlager. Spaeter entkommt Niya dir. Anscheinend hat sie dich nur benutzt um fluechten zu koennen. Du hast ein gebrochenes Herz :('), nl,
    finish.

% *****************************Choice Handling******************************
% Entscheidungen in der Szene "Rudolf trifft auf Albrecht"
handle_choice(rudolf_meets_albrecht, a) :-
    scene(rudolf_tells_albrecht_that_he_is_a_good_friend).
handle_choice(rudolf_meets_albrecht, b) :-
    scene(they_talk_with_each_other).

% Entscheidungen in der Szene "Sie reden nur kurz miteinander"
handle_choice(do_we_want_to_flee, a) :-
    scene(she_really_likes_him).
handle_choice(do_we_want_to_flee, b) :-
    scene(she_has_to_tell_him_something).
handle_choice(do_we_want_to_flee, c) :-
    scene(she_does_not_like_him).
