% Meta stuff
start :-
    instructions,
    scene(do_we_want_to_flee_rainforest).

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

% Szenes
% Szene 1: Rudolf asks Niya if they want to flee to the rainforest

scene(do_we_want_to_flee_rainforest) :-
    nl,
    write('Rudolf: Willst du mit mir in den Regenwald fluechten?'), nl,
    sleep(1),
    write('***Choice: Was machst du?***'), nl,
    sleep(1),
    write('a: Ja, ich will *ich liebe ihn wirklich*'), nl,
    sleep(1),
    write('b: Rudolf... ich muss dir noch etwas sagen ...'), nl,
    sleep(1),
    write('c: Ja, ich will *ich liebe ihn nicht aber nur mit ihm entkomme ich*'), nl,
    read_choice(Choice),
    handle_choice(do_we_want_to_flee_rainforest, Choice).

% Szene 2a: She agrees because she really likes him now
scene(she_really_likes_him) :-
    nl,
    write('Niya: Ja, ich moechte mit dir fluechten. Ich stehe wirklich auf dich!'), nl,
    sleep(1),
    write('Ihr ueberlebt beide und lebt gluecklich bis ans Ende eurer Tage.'), nl,
    finish.

% Szene 2b: She has to tell him something important
scene(she_has_to_tell_him_something) :-
    nl,
    write('Niya: Ich muss dir vorher noch etwas Wichtiges sagen...'), nl,
    sleep(1),
    write('Niya: Ich bin schwanger.'), nl,
    sleep(1),
    write('Ihr fluechtet trotzdem gemeinsam in den Regenwald, aber sie stirbt und du musst das Kind alleine aufziehen.'), nl,
    finish.

% Szene 2c: They break out of the military camp and she has to decide whether to take ship 1 or 2
scene(she_dont_like_him) :-
    nl,
    write('Ihr habt aus dem Militaerlager ausbrechen koennen.'), nl,
    sleep(1),
    write('Nun seid ihr im Hafen von Namibia.'), nl,
    sleep(1),
    write('Da sind 2 Schiffe.'), nl,
    sleep(1),
    write('***Choice: Was machst du?***'), nl,
    sleep(1),
    write('a: Nehme Schiff 1'), nl,
    sleep(1),
    write('b: Nehme Schiff 2'), nl,
    read_choice(Choice),
    handle_choice(ship, Choice).

% Szene 3a: Ship one, she gets discovered by the passengers and thrown overboard with racist insults
scene(ship_one) :-
    nl,
    write('Die Insassen des Schiffes entdecken dich.'), nl,
    sleep(1),
    write('Du wirst ueber Bord geworfen.'), nl,
    finish.

% Szene 3b: Ship two, they aren't discovered and live happily ever after in Argentina
scene(ship_two) :-
    nl,
    write('Ihr werdet nicht entdeckt und seid in Argentinien.'), nl,
    sleep(1),
    write('Ihr lebt gluecklich bis zum Ende eurer Tage.'), nl,
    finish.

% Choice Handling
handle_choice(do_we_want_to_flee_rainforest, a) :-
    scene(she_really_likes_him).
handle_choice(do_we_want_to_flee_rainforest, b) :-
    scene(she_has_to_tell_him_something).
handle_choice(do_we_want_to_flee_rainforest, c) :-
    scene(she_dont_like_him).
handle_choice(ship, a) :-
    scene(ship_one).
handle_choice(ship, b) :-
    scene(ship_two).
