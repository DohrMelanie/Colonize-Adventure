% meta stuff
start :-
    instructions,
    scene(niya_introduction).

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
% Szene 1: Niya trifft auf Rudolf und Albrecht
scene(niya_introduction) :-
    nl,
    write('Dein Name lautet Niya Niambe. Du bis 16 Jahre alt, und deine ueberaus arme Familie gehoert zum Volk der Nama. Ausserdem hast du 10 Geschwister, darunter drei aeltere Brueder.'), nl,
    sleep(1),
    write('Eines Tages kommt einer der Kolonialisten auf dich zu. Er erzaehlt dir, dass du aus den Minen rauskommst (in denen du seit deiner Kindheit arbeiten musst, um deine Familie zu versorgen), und du auf einer Krankenstation Menschen versorgen sollst.'), nl,
    sleep(1),
    write('Du bist froh, dass du endlich aus den Minen rauskommst und freust dich auf die Arbeit in der Krankenstation.'), nl,
    sleep(1),
    write('Als du bei der Krankenstation ankommst, triffst du auf zwei Kolonialisten, Rudolf und Albrecht. Sie leiden beide an Fieber und Uebelkeit. Den Grund dafuer kennst du nicht.'), nl,
    sleep(1),
    write('***Choice: Du hast mehrere Behandlungsmoeglichkeiten. Welche waehlst du?***'), nl,
    sleep(1),
    write('a: Lege ihnen nasse, kalte Lappen auf die Stirn'), nl,
    sleep(1),
    write('b: Du probierst eine alternative Behandlungsmoeglichkeit: Die Einflössung von zerdruecktem Kakao'), nl,
    sleep(1),
    write('c: Du versuchst es mit einer allseits bekannten Methode: Voodoo!'), nl,
    read_choice(Choice),
    handle_choice(niya_introduction, Choice).

% Szene 2a: Rudolf und Albrecht bekommen einen nassen lappen auf die Stirn
scene(niya_water_cloth) :-
    cls,
    write('Du gibst beiden einen nassen, kalten Lappen auf die Stirn. Sie ueberleben beide und es geht ihnen im Laufe der naechsten Tage immer besser. '), nl,
    sleep(1),
    write('Eines Tages willst du gerade in die Krankenstation durch die offene Tuer gehen, du bekommst aber gerade noch rechtzeitig mit, dass Rudolf und Albrecht ein sehr interessantes Gespraech fuehren.'), nl,
    sleep(1),
    write('Rudolf: du, Albrecht, ich glaub ich hab mich verliebt.'), nl,
    sleep(1),
    write('Albrecht: Ach wirklich? In wen denn?'), nl,
    sleep(1),
    write('Rudolf: In Niya.'), nl,
    sleep(1),
    write('Albrecht: Oh, das ist ja interessant. Ich glaube, sie steht auf dich.'), nl,
    sleep(1),
    write('*Ach du Scheisse!*'), nl,
    sleep(1),
    write('***Choice: Wie reagierst du auf die Situation?***'), nl,
    sleep(1),
    write('a: Du redest in einem ruhigen Moment mit Rudolf und gaukelst ihm Gefuehle vor, um von ihm besser behandelt zu werden.'), nl,
    sleep(1),
    write('b: Du redest in einem ruhigen Moment mit Rudolf und lehnst ihn ab, da du auf einen Freund von dir aus der Mine stehst. '), nl,
    sleep(1),
    write('c: Oh mein Gott! Du stehst auch auf ihn. Allerdings weisst du noch nicht so ganz, wie du mit deinen Gefuehlen fuer ihn umgehen sollst ...'), nl,
    read_choice(Choice),
    handle_choice(niya_water_cloth, Choice).

% Szene 2b: Rudolf und Albrecht bekommen zerdrueckten Kakao eingefloesst
scene(niya_crushed_cacao) :-
    cls,
    write('Du floesst ihnen zerdrueckten Kakao ein.'), nl,
    sleep(1),
    write('Im Laufe der naechsten Tage geht es ihnen immer besser. Dir faellt auf, dass besonders Rudolf sehr nett zu dir ist.'), nl,
    sleep(1),
    write('Eines Tages sprichst du Rudolf darauf an.'), nl,
    sleep(1),
    write('Rudolf: Du, Niya, ich glaub ich hab mich verliebt.'), nl,
    sleep(1),
    write('Niya: Ach wirklich? In wen denn?'), nl,
    sleep(1),
    write('Rudolf: In dich.'), nl,
    sleep(1),
    write('*ACH DU HEILIGE SCHEISSE!*'), nl,
    sleep(1),
    write('***Choice: Wie reagierst du auf die Situation?***'), nl,
    sleep(1),
    write('a: Du redest mit Rudolf und gaukelst ihm Gefuehle vor, um von ihm besser behandelt zu werden.'), nl,
    sleep(1),
    write('b: Du redest mit Rudolf und lehnst ihn ab, da du auf einen Freund von dir aus der Mine stehst. '), nl,
    sleep(1),
    write('c: Oh mein Gott! Du stehst auch auf ihn. Allerdings weisst du noch nicht so ganz, wie du mit deinen Gefuehlen fuer ihn umgehen sollst ...'), nl,
    read_choice(Choice),
    handle_choice(niya_crushed_cacao, Choice).

% Szene 2c: Rudolf und Albrecht bekommen Voodoo
scene(niya_voodoo) :-
    cls,
    write('Du versuchst es mit einer allseits bekannten Methode: Voodoo!'), nl,
    sleep(1),
    write('Rudolf und Albrecht sterben beide. Du wirst von den anderen Kolonialisten beschuldigt, sie vergiftet zu haben.'), nl,
    sleep(1),
    write('Du wirst in den Regenwald verbannt und musst dort alleine ueberleben.'), nl,
    finish.

% Szene 3a: Sie tut so, als ob sie auf ihn steht
scene(niya_pretends_to_like_him) :-
    cls,
    write('Du stehst nicht wirklich auf ihn, tust aber so, damit Rudolf dich besser behandelt.'), nl,
    sleep(1),
    write('Ihr beide seid ein anscheinend glueckliches Paar (auch wenn ihr eure Beziehung geheimhalten muesst). Und Rudolf ist ueber beide Ohren verliebt in dich.'), nl,
    sleep(1),
    write('Eines Tages passiert etwas Schreckliches: Du musst wieder zurueck in die Minen! Waehrenddessen wird Rudolf in den Krankenurlaub geschickt.'), nl,
    sleep(1),
    write('In den Minen triffst du auf deinen alten Schwarm.'), nl,
    sleep(1),
    write('***Choice: wie gehst du mit ihm um?***'), nl,
    sleep(1),
    write('a: Du erzaehlst ihm nicht von deinen Gefuehlen'), nl,
    sleep(1),
    write('b: Du erzaehlst ihm von deinen Gefuehlen'), nl,
    read_choice(Choice),
    handle_choice(niya_pretends_to_like_him, Choice).
    
% Szene 3b: Niya lehnt Rudolf ab, weil sie auf jemand anderen steht
scene(niya_likes_another_guy) :-
    cls,
    write('Niya: Rudolf, ich mag dich wirklich sehr, aber ich stehe auf jemand anderen.'), nl,
    sleep(1),
    write('Rudolf: Oh, das ist schade. Aber ich verstehe das.'), nl,
    sleep(1),
    write('Was du nicht weisst, ist, dass das eine Luege war. Er findet in den naechsten Tagen heraus, wer dein Freund aus der Mine ist. Daraufhin erschiesst er ihn. '), nl,
    sleep(1),
    write('Du bist am Boden zerstoert. Am Tag nach dem Mord kommt Rudolf zu dir und bringt dich ebenfalls aus Liebeskummer um, denn wenn er dich nicht haben kann, soll dich keiner haben.'), nl,
    finish.

% Szene 3c: Niya liebt ihn
scene(niya_loves_him) :-
    cls,
    write('Oh mein Gott! Du stehst auch auf ihn. Allerdings weisst du noch nicht so ganz, wie du mit deinen Gefuehlen fuer ihn umgehen sollst ...'), nl,
    sleep(1),
    write('Ab dem naechsten Tag wirst du durch Liebeskummer sehr traurig.'), nl,
    sleep(1),
    write('*Da wird sowieso nichts daraus. '), nl,
    sleep(1),
    write('Aus Liebeskummer ertraenkst du dich.'), nl,
    finish.

% Szene 4a: Sie erzaehlt ihrem Schram nicht von ihren Gefuehlen
scene(niya_does_not_tell_him) :-
    cls,
    write('Du erzaehlst ihm nicht von deinen Gefuehlen.'), nl,
    sleep(1),
    write('Sobald Rudolf von seinem Urlaub zurueck ist, triffst du dich wieder mit ihm.'), nl,
    sleep(1),
    % scene(do_we_want_to_flee).
    finish.

% Szene 4b: Sie erzählt ihrem Schwarm von ihren Gefuehlen
scene(niya_tells_him) :-
    cls,
    write('Du erzaehlst ihm von deinen Gefuehlen.'), nl,
    get_random_choice(Choice),
    handle_choice(does_he_like_her, Choice).

% Szene 5a: Er mag sie
scene(he_likes_her) :-
    cls,
    write('Er mag dich auch.'), nl,
    sleep(1),
    write('Ihr beide seid ein glueckliches Paar und fluechtet gemeinsam in den Regenwald. HAPPY END!'), nl,
    finish.

% Szene 5b: Er mag sie nicht
scene(he_does_not_like_her) :-
    cls,
    write('Er mag dich nicht.'), nl,
    sleep(1),
    write('Sobald Rudolf von seinem Urlaub zurueck ist, triffst du dich wieder mit ihm.'), nl,
    sleep(1),
    % scene(do_we_want_to_flee).
    finish.

% *****************************Choice Handling******************************

% Entscheidungen in der Szene "Niya trifft auf Rudolf und Albrecht"
handle_choice(niya_introduction, a) :-
    scene(niya_water_cloth).
handle_choice(niya_introduction, b) :-
    scene(niya_crushed_cacao).
handle_choice(niya_introduction, c) :-
    scene(niya_voodoo).

% Entscheidungen in der Szene "Rudolf und Albrecht bekommen einen nassen Lappen auf die Stirn"
handle_choice(niya_water_cloth, a) :-
    scene(niya_pretends_to_like_him).
handle_choice(niya_water_cloth, b) :-
    scene(niya_likes_another_guy).
handle_choice(niya_water_cloth, c) :-
    scene(niya_loves_him).

% Entscheidungen in der Szene "Rudolf und Albrecht bekommen zerdrueckten Kakao eingefloesst"
handle_choice(niya_crushed_cacao, a) :-
    scene(niya_pretends_to_like_him).
handle_choice(niya_crushed_cacao, b) :-
    scene(niya_likes_another_guy).
handle_choice(niya_crushed_cacao, c) :-
    scene(niya_loves_him).

% Entscheidungen in der Szene "Sie tut so, als ob sie auf ihn steht"
handle_choice(niya_pretends_to_like_him, a) :-
    scene(niya_does_not_tell_him).
handle_choice(niya_pretends_to_like_him, b) :-
    scene(niya_tells_him).

% Entscheidungen in der Szene "Sie erzaehlt ihrem Schwarm von ihren Gefuehlen"
handle_choice(does_he_like_her, a) :-
    scene(he_likes_her).

handle_choice(does_he_like_her, b) :-
    scene(he_does_not_like_her).