% meta stuff
start :-
    scene(niya_mines).

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
% Szene 0: Einleitung
scene(niya_mines) :-
    nl,
    write('Dein Name lautet Niya Niambe. Du bis 16 Jahre alt, und deine ueberaus arme Familie gehoert zum Volk der Nama. Ausserdem hast du 10 Geschwister, darunter drei aeltere Brueder.'), nl,
    sleep(1),
    write('Du bist Sklavin der Deutschen Konolialisten. Sie zwingen dich dazu in den Minen von, wie sie es nennen, Deutsch-Sudwestafrika zu arbeiten.'), nl,
    start_mine.


% Szene 1: Niya trifft auf Rudolf und Albrecht
scene(niya_introduction) :-
    instructions,
    write('Eines Tages kommt einer der Kolonialisten auf dich zu. Er erzaehlt dir, dass du aus den Minen rauskommst (in denen du seit deiner Kindheit arbeiten musst, um deine Familie zu versorgen), und du auf einer Krankenstation Menschen versorgen sollst.'), nl,
    sleep(1),
    write('Du bist froh, dass du endlich aus den Minen rauskommst und freust dich auf die Arbeit in der Krankenstation.'), nl,
    sleep(1),
    write('Als du bei der Krankenstation ankommst, triffst du auf zwei Kolonialisten, Rudolf und Albrecht. Sie leiden beide an Fieber und Uebelkeit. Den Grund dafuer kennst du nicht.'), nl, nl,
    sleep(1),
    write('Du wirst gebeten, bestimmte Gegenstaende in der Krankenstation zu finden.'), nl,
    search_items.

% Scene 1b: Story geht weiter
scene(niya_choice_heal) :-
    cls,
    write('Nun, da du die Gegenstaende gefunden hast, kannst du dich um Rudolf und Albrecht kuemmern.'), nl,
    sleep(1),
    write('***Choice: Du hast mehrere Behandlungsmoeglichkeiten. Welche waehlst du?***'), nl,
    sleep(1),
    write('a: Lege ihnen nasse, kalte Lappen auf die Stirn'), nl,
    sleep(1),
    write('b: Du probierst eine alternative Behandlungsmoeglichkeit: Die Einfloessung von zerdruecktem Kakao'), nl,
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
    write('*Ach du Scheisse!*'), nl, nl,
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
    write('***Choice: Wie reagierst du auf die Situation?***'), nl, nl,
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
    write('In den Minen triffst du auf deinen alten Schwarm.'), nl, nl,
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
    scene(do_we_want_to_flee_rainforest).
    finish.

% Szene 4b: Sie erzaehlt ihrem Schwarm von ihren Gefuehlen
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
    write('Ihr beide seid ein glueckliches Paar und fluechtet gemeinsam in den Regenwald. HAPPY END :)'), nl,
    finish.

% Szene 5b: Er mag sie nicht
scene(he_does_not_like_her) :-
    cls,
    write('Er mag dich nicht.'), nl,
    sleep(1),
    write('Sobald Rudolf von seinem Urlaub zurueck ist, triffst du dich wieder mit ihm.'), nl,
    sleep(1),
    scene(do_we_want_to_flee_rainforest).
    finish.
% Szene 6: Rudolf asks Niya if they want to flee to the rainforest
scene(do_we_want_to_flee_rainforest) :-
    nl,
    write('Du triffst wieder auf Rudolf. Er sieht dich ernst an und nach einem kurzen Moment der Stille spricht er endlich:'), nl,
    write('Rudolf: "Niya, ich kann es hier nicht mehr ertragen. Diese Grausamkeit, diese Ungerechtigkeit. Ich muechte mit dir in den Regenwald fliehen. Dort kuennten wir frei sein, fernab von all dem hier."'), nl,
    sleep(1),
    write('Du bist ueberrascht von seinem Vorschlag und weisst nicht, wie du reagieren sollst. Einerseits kuenntest du dem Albtraum entkommen, andererseits hast du Angst vor der Ungewissheit.'), nl, nl,
    sleep(1),
    write('***Choice: Was machst du?***'), nl,
    sleep(1),
    write('a: Ja, ich will *ich liebe ihn wirklich*'), nl,
    sleep(1),
    write('b: Rudolf... ich muss dir noch etwas sagen ...'), nl,
    sleep(1),
    write('c: Ja, ich will *ich liebe ihn nicht, aber nur mit ihm habe ich eine Chance, zu entkommen!*'), nl,
    read_choice(Choice),
    handle_choice(do_we_want_to_flee_rainforest, Choice).

% Szene 7a: She agrees because she really likes him now
scene(she_really_likes_him) :-
    cls,
    write('Niya: "Ja, ich moechte sehr gerne mit dir fluechten. Ich liebe dich! <3"'), nl,
    sleep(1),
    write('Rudolf laechelt und nimmt deine Hand. Ihr flieht gemeinsam in den tiefen Regenwald, fernab von der grausamen Realitaet, die euch bisher gefangen hielt.'), nl,
    sleep(1),
    write('Die Zeit vergeht, und ihr beide baut euch ein neues Leben auf. Ihr entdeckt die Schuenheit der Natur und geniesst jede Sekunde eurer neuen Freiheit. Mit der Zeit wird eure Liebe immer staerker.'), nl,
    sleep(1),
    write('Ihr ueberlebt beide und lebt gluecklich bis ans Ende eurer Tage. HAPPY END :)'), nl,
    finish.

% Szene 7b: She has to tell him something important
scene(she_has_to_tell_him_something) :-
    cls,
    write('Niya: "Rudolf, bevor wir fluechten, muss ich dir noch etwas Wichtiges sagen..."'), nl,
    sleep(1),
    write('Du nimmst einen tiefen Atemzug und schaust ihm in die Augen:'), nl,
    write('Niya: "Ich bin schwanger."'), nl,
    sleep(1),
    write('Rudolfs Augen weiten sich vor ueberraschung, doch dann breitet sich ein breites Laecheln auf seinem Gesicht aus.'), nl,
    write('Rudolf: "Oh mein Gott! Ich freue mich ja so <3"'), nl,
    sleep(1),
    write('Ihr entscheidet euch trotzdem, gemeinsam in den Regenwald zu fluechten. Die Flucht ist anstrengend und gefaehrlich, aber eure Liebe und die Aussicht auf ein neues Leben geben euch Kraft.'), nl,
    sleep(1),
    write('Doch die Strapazen der Flucht und die Geburt des Kindes fordern ihren Tribut. Du stirbst bei der Geburt, und Rudolf bleibt mit eurem Kind allein zurueck. Er schwuert, es in deinem Andenken grosszuziehen und ihm eine bessere Zukunft zu ermueglichen. :('), nl,
    finish.

% Szene 7c: They break out of the military camp and she has to decide whether to take ship 1 or 2
scene(she_dont_like_him) :-
    cls,
    write('Ihr habt es geschafft, aus dem Militaerlager zu entkommen. Die Nacht ist dunkel und ihr seid weit genug weg, um eine kurze Verschnaufpause einzulegen.'), nl,
    sleep(1),
    write('In einem ruhigen Moment nutzt du die Gelegenheit, um Rudolf zu entkommen. Du rennst so schnell du kannst zum Hafen von Namibia, in der Hoffnung, ein Schiff zu finden, das dich in die Freiheit bringt.'), nl,
    sleep(1),
    write('Am Hafen angekommen, siehst du zwei Schiffe, die bereit zum Ablegen sind. Beide sehen so aus, als kuenntest du unbemerkt an Bord gelangen.'), nl, nl,
    sleep(1),
    write('***Choice: Was machst du?***'), nl,
    sleep(1),
    write('a: Nehme Schiff 1, ein rot lackiertes altes Segelschiff'), nl,
    sleep(1),
    write('b: Nehme Schiff 2, ein moderneres Segelschiff mit hellblauen Waenden'), nl,
    read_choice(Choice),
    handle_choice(ship, Choice).

% Szene 8a: Ship one, she gets discovered by the passengers and thrown overboard with racist insults
scene(ship_one) :-
    cls,
    write('Du entscheidest dich fuer Schiff 1, ein rot lackiertes altes Segelschiff. Du schleichst dich an Bord und versteckst dich im Frachtraum. Die Stunden vergehen und du denkst, du bist in Sicherheit.'), nl,
    sleep(1),
    write('Doch eines Nachts, als du dich unvorsichtig bewegst, wirst du von einem der Matrosen entdeckt. Er schlaegt Alarm, und bald bist du von wuetenden Besatzungsmitgliedern umzingelt.'), nl,
    sleep(1),
    write('Sie schreien dich an, beschimpfen dich mit rassistischen Beleidigungen und zerren dich schliesslich gewaltsam an Deck. Ohne ein weiteres Wort wirst du ueber Bord geworfen. Die kalten Wellen des Ozeans verschlingen dich, und dein Schicksal ist besiegelt. :('), nl,
    finish.

% Szene 8b: Ship two, she doesnt get discovered and lives happily ever after in Argentina
scene(ship_two) :-
    nl,
    write('Du entscheidest dich fuer Schiff 2, ein moderneres Segelschiff mit hellblauen Waenden. Du schleichst dich an Bord und findest ein Versteck in einem unbenutzten Raum tief im Inneren des Schiffes.'), nl,
    sleep(1),
    write('Die Reise ist lang und anstrengend, doch du wirst nicht entdeckt. Du ueberlebst von den wenigen Vorraeten, die du mitgenommen hast und huerst hin und wieder Gespraeche der Besatzung, die dir Hoffnung geben, dass das Ziel in greifbarer Naehe ist.'), nl,
    sleep(1),
    write('Nach Wochen auf See legst du endlich in Argentinien an. Du verlaesst das Schiff unbemerkt und betrittst das Land, das dir eine neue Chance auf ein besseres Leben bietet. In Argentinien findest du Arbeit und baust dir ein neues Leben auf. Du lebst gluecklich bis zum Ende deiner Tage. HAPPY END.'), nl,
    finish.

% *****************************Mini Game******************************

% Function to search for items in the Krankenstation
search_items :-
    nl,
    write('***Suche nach folgenden Gegenstaenden 1n der Krankenstation:***'), nl,
    sleep(1),
    write('1. Thermometer'), nl,
    sleep(1),
    write('2. Verbandskasten'), nl,
    sleep(1),
    write('3. Schluessel fuer das Medizinka9inett'), nl,
    sleep(1),
    find_item(thermometer).

% Function to find an item
find_item(Item) :-
    nl,
    format('Du suchst nach ~w. W0 moechtest du nachsehen?', [Item]), nl,
    sleep(1),
    write('a: Schreibtisch'), nl,
    sleep(1),
    write('b: Schrank'), nl,
    sleep(1),
    write('c: Be4t'), nl,
    read_choice(Choice),
    check_item_location(Item, Choice).

% Check the location for the item
check_item_location(thermometer, b) :-
    nl,
    write('Du hast das Thermometer im Schrank gefunden!'), nl,
    write('Allerdings ist es kaputt. Vielleicht kannst du es reparieren.'), nl,
    write('Vielleicht ist wo anders ein Schraubenzieher?'), nl,
    find_item(schraubenzieher).

check_item_location(thermometer, _) :-
    nl,
    write('Das Thermometer ist hier nicht. Versuche es woanders.'), nl,
    find_item(thermometer).

check_item_location(verbandskasten, c) :-
    nl,
    write('Du hast den Verbandskasten unter dem Bett gefunden!'), nl,
    find_item(schluessel).

check_item_location(verbandskasten, _) :-
    nl,
    write('Der Verbandskasten ist hier nicht. Versuche es woanders.'), nl,
    find_item(verbandskasten).

check_item_location(schluessel, a) :-
    nl,
    write('Du hast den Schluessel auf dem Schreibtisch gefunden! Jetzt kannst du das Medizinkabinett oeffnen.'), nl,
    solve_puzzle.

check_item_location(schluessel, _) :-
    nl,
    write('Der Schluessel ist hier nicht. Versuche es woanders.'), nl,
    find_item(schluessel).

check_item_location(schraubenzieher, a) :-
    nl,
    write('Du hast den Schraubenzieher im Schreibtisch gefunden!'), nl,
    write('Du konntest mit ihm deinen Thermometer reparieren. YAY!'), nl,
    find_item(verbandskasten).

check_item_location(schraubenzieher, _) :-
    nl,
    write('Der Schraubenzieher ist hier nicht. Versuche es woandersm um deinen Thermometer zu reparieren.'), nl,
    find_item(schraubenzieher).

% Function to solve the puzzle for the Medizinkabinett
solve_puzzle :-
    nl,
    write('Das Medizinkabinett ist mit einem Zahlenschloss gesichert. Die Kombination besteht aus drei Ziffern. Doch welche Zahlen sind es wohl? Tipp: du kennst sie bereits!'), nl,
    sleep(1),
    write('Tippe die dreistellige Kombination ein: '), nl,
    read_choice(Choice),
    check_code(Choice).

% Check the entered code
check_code(1904) :-
    nl,
    write('Das Zahlenschloss oeffnet sich! Du hast das Raetsel geloest und Zugang zu den Medikamenten im Kabinett.'), nl,
    write('Warum 1904? Nun, von diesem Jahr bis zu Jahre 1908 wurde gegen das Volk von Niya, die Nama, Genozid begangen. Die Zahlen sind eine Erinnerung an die Grausamkeit, die Niya und ihr Volk erleiden mussten.'),
    scene(niya_choice_heal).

check_code(_) :-
    nl,
    write('Falscher Code. Versuche es erneut.'), nl,
    solve_puzzle.

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





















:- dynamic i_am_at/1, at/2, holding/1, torch_lifetime/1, battery_state/3, flashlight_on/0, snake_calm/0, tnt_boom/0.

% Initialisierung der Variablen
initialize :-
    retractall(i_am_at(_)), 
    retractall(at(_, _)), 
    retractall(holding(_)), 
    retractall(torch_lifetime(_)), 
    retractall(battery_state(_, _, _)), 
    retractall(flashlight_on), 
    retractall(snake_calm), 
    retractall(tnt_boom),
    
    assert(i_am_at(r1)),
    assert(torch_lifetime(7)),  % Anfangslebensdauer der Fackel.
    
    assert(path(r1, e, r2)),
    assert(path(r1, n, r3)),
    assert(path(r2, w, r1)),
    assert(path(r2, e, r4)),
    assert(path(r3, s, r1)),
    assert(path(r3, e, r5)),
    assert(path(r4, w, r2)),
    assert(path(r5, w, r3)),
    assert(path(r5, e, r6)),
    assert(path(r6, w,r5)),
    
    assert(at(flashlight, r2)),
    assert(at(flute, r3)),
    assert(at(lighter, r4)),
    assert(at(rope,r1)),
    
    % Anfangszustaende der Batterien
    assert(battery_state(battery1, 1, '[+===-]')),  % Batterie 1, Position 1, Anfangszustand
    assert(battery_state(battery2, 2, '[-===+]')),  % Batterie 2, Position 2, Anfangszustand
    assert(battery_state(battery3, 3, '[+===-]')),  % Batterie 3, Position 3, Anfangszustand
    
    % Startgegenstaende im Inventar
    assert(holding(torch)),
    assert(holding(lighter)).

% Start des Spiels
start_mine :-
    initialize,
    write('Du gehst gerade deinen Geschaeften in den Minen nach, und ploetzlich'), nl,    sleep(1),
    write('WOOOOOOOMP.'), nl,    sleep(1),
    write('Der Ausgang der Mine ist gerade eingestaerzt...'), nl,sleep(1),
    write('Du musst einen anderen Weg hinausfinden.'), nl,sleep(1),
    write('Das Einzige, was du vom Minen hast, ist eine Fackel.'), nl,sleep(1),
    write('Aber die Fackel scheint jede Minute weniger Licht auszustrahlen.'), nl,sleep(1),
    write('Wenn du aeberleben willst, solltest du diese Hoehle verlassen, bevor sie ausgeht...'), nl,sleep(1),
    instructions_mine,
    look.

% Anweisungen
instructions_mine :-
    nl,
    write('Gib Befehle im Standard-Prolog-Syntax ein.'), nl,sleep(1),
    write('Verfaegbare Befehle sind:'), nl,sleep(1),
    write('n.  s.  e.  w.     -- um in diese Richtung zu gehen.'), nl,
    write('take(Object).      -- um ein Objekt aufzunehmen.'), nl,
    write('drop(Object).      -- um ein Objekt abzulegen.'), nl,
    write('inventory.         -- um zu sehen, was du bei dir hast.'), nl,
    write('look.              -- um dich erneut umzuschauen.'), nl,
    write('instructions_mine. -- um diese Nachricht erneut zu sehen.'), nl,
    write('halt.              -- um das Spiel zu beenden und zu verlassen.'), nl,
    nl.

% Umgebung anschauen
look :-
    nl,
    decrement_torch,
    i_am_at(Place),
    describe(Place),
    (Place \== r4 -> notice_objects_at(Place);nl).

% Fackel abbrennen lassen
decrement_torch :-
    flashlight_on,
    nl.

decrement_torch :-
    torch_lifetime(X),
    X > 0,
    NewX is X - 1,
    retract(torch_lifetime(X)),
    assert(torch_lifetime(NewX)),
    check_torch(NewX),
    !.

decrement_torch :-
    torch_lifetime(0),
    restart.

check_torch(X) :-
    X > 0,
    write('Deine Fackel brennt. Verbleibende Zeit: '), write(X), write(' Zaege.'), nl,
    !.

check_torch(0) :-
    write('Deine Fackel ist ausgebrannt!'), nl,sleep(1),
    restart.

% Bewegungslogik
n :- go(n).
s :- go(s).
e :- go(e).
w :- go(w).

go(n) :-
    i_am_at(r1),
    \+ holding(rope),  % Spieler muss das Seil haben, um nach Norden zu gehen
    write('Vor dir ist eine Klippe. Wenn du sie jetzt erklimmst, wirst du sicher fallen'), nl,sleep(1),
    !.

go(n) :-
    i_am_at(r1),
    holding(rope),
    assert(at(rope, r1)),
    retract(i_am_at(r1)),
    assert(i_am_at(r3)),  % Spieler geht von R1 nach R3
    look,
    start_puzzle(r3),  % Starte das Raetsel in R3
    !.

go(e) :-
    tnt_boom,
    i_am_at(Here),
    path(Here, e, There),
    retract(i_am_at(Here)),
    assert(i_am_at(There)),
    look,
    start_puzzle(There),!.

go(e) :-
    i_am_at(r5),
    \+ holding(lighter),  % Spieler muss das Feuerzeug haben, um nach Osten zu gehen
    write('Du brauchst etwas, um das TNT zu entzaenden.'), nl,sleep(1),
    !.

go(e) :-
    i_am_at(r5),
    holding(lighter),
    start_puzzle(r5),  % Zaende das TNT an
    retract(i_am_at(r5)),
    assert(i_am_at(r6)),  % Gehe von R5 nach R6
    look,
    !.

go(Direction) :-
    i_am_at(Here),
    path(Here, Direction, There),
    retract(i_am_at(Here)),
    assert(i_am_at(There)),
    look,
    start_puzzle(There),
    !.

go(_) :-
    write('Du kannst dort nicht hingehen.').

% Objekte aufheben und ablegen
take(X) :-
    holding(X),
    write('Du haeltst das bereits!'),
    !.

take(X) :-
    i_am_at(Place),
    at(X, Place),
    retract(at(X, Place)),
    assert(holding(X)),
    write('Du hast ein '),write(X),write('aufgehoben'),nl,sleep(1),
    decrement_torch,
    nl,
    start_puzzle(X),
    !.

take(_) :-
    write('Ich sehe es hier nicht.'),
    nl.

drop(X) :-
    holding(X),
    i_am_at(Place),
    retract(holding(X)),
    assert(at(X, Place)),
    write('Du hast '),write(X),write(' fallen lassen'),sleep(1),
    !, nl.

drop(_) :-
    write('Du haeltst es nicht!'),
    nl.

% Inventar anzeigen
inventory :-
    write('Du haeltst: '), nl,
    findall(Item, holding(Item), Items),
    print_list(Items),
    nl.

print_list([]).
print_list([H|T]) :-
    write('- '), write(H), nl,
    print_list(T).

% Raum-Beschreibungen
describe(r1) :-
    write('Du bist am Anfang. Es gibt zwei Wege: eine Hoehle im Osten und eine Klippe im Norden.'),sleep(1), nl.

describe(r2) :-
    write('Du bist in einer Hoehle. Schau, da ist ein Minecart.'),sleep(1), nl.

describe(r3) :-
    write('Du kletterst mit deinem Seil auf die Klippe.'),sleep(1), nl.

describe(r4) :-
    write('Du bist in einer Hoehle. Hier ist eine große Schlange.'),sleep(1),nl.

describe(r5) :-
    tnt_boom,
    write('Dieser Raum riecht nach Schießpulver. Warum wohl....'),sleep(1), nl.

describe(r5) :-
    write('Du bist in einem Raum mit einer großen Kiste TNT.'),sleep(1), nl.

describe(r6) :-
    write('Du bist in einem Raum voller Kristalle. WOOOOOOW. Das ist das Schoenste, was ich je gesehen habe.'),sleep(1), nl.

% Raetsel starten
start_puzzle(flashlight) :-
    write('Du hast die Taschenlampe aufgehoben! Sie hat sogar Batterien. Wow. Jetzt musst du die Batterien richtig anordnen.'),sleep(1), nl,
    write('Verwende den Befehl `show_flashlight.` um die aktuelle Anordnung der Batterien zu sehen.'),sleep(1), nl,
    write('Verwende den Befehl `turn_battery(Number).` um die Batterie an der angegebenen Position (1, 2 oder 3) zu drehen.'),sleep(1), nl,
    write('Wiederhole dies, bis alle Batterien in der richtigen Ausrichtung sind.'),sleep(1), nl,
    show_flashlight,
    !.

start_puzzle(r3) :-
    holding(rope),
    !.

start_puzzle(r4) :-
    snake_calm,
    write('Die Schlange ist ruhig und du kannst sicher vorbeigehen.'),sleep(1), nl,
    !.

start_puzzle(r4) :-
    holding(flute),
    write('du hast eine verraeckte idee.'), nl,sleep(1),
    write('vielleicht kAnnst du die floete benutzen, um die SchlAnge zu beruhigen. wie ein schlangenbaendiger.'), nl,sleep(1),
    write('bei genauerer Betrachtung kannst du auf deiner floete 2 toene spielen, a und b.'), nl,sleep(1),
    write('die SchlAnge ist eher klein, also sollten 4 noten ausreichen!'), nl,sleep(1),
    write('du musst nur herausfinden, wann du a und b in diesen 4 noten spielen musst.'), nl,sleep(1),
    write('gib deine melodie wie folgt ein, z.B.: aaaa.'), nl,sleep(1),
    puzzle_melody.

puzzle_melody :-
    read(Tune),
    (Tune = aaba -> write('Du hast die richtige Melodie gespielt und ein Feuerzeug gefunden!'), nl, assert(holding(lighter)), assert(snake_calm);
    write('Falsche Melodie! Die Schlange ist fast aufgewacht. Versuche es erneut.'), nl, puzzle_melody).

start_puzzle(r4) :-
    write('Hier ist eine riesige Schlange. Es scheint, als waerde sie auf etwas schlafen. Versuchen wir, heimlich vorbeizuschleichen. Wenn das nicht funktioniert... '), nl,sleep(1),
    write('Muss ich etwas finden, um sie zu betaeuben oder so.'), nl,sleep(1),
    write('Oh nein, sie ist aufgewacht...'), nl,sleep(1),
    write('Die Schlange hat dich gerade gebissen...'), nl,sleep(1),
    restart.

start_puzzle(r5) :-
    tnt_boom, !.

start_puzzle(r5) :-
    holding(lighter),
    write('Du zaendest das TNT an und raeumst den Weg frei! Ist das ein Sonnenstrahl?'), nl,sleep(1), assert(tnt_boom),
    !.

start_puzzle(r5) :-
    write('Du brauchst etwas, um das TNT zu entzaenden.'), nl,sleep(1),
    !.

start_puzzle(r6) :-
    write('Die Kristalle scheinen zu leuchten. Irgendwo muss ein Loch in den Waenden dieser Hoehle sein.'), nl,sleep(1),
    write('Du siehst einen Indigo,einen Gelben,einen Graenen und einen Roten Kristall am boden liegen.'), nl,sleep(1),
    write('Ordne die Kristalle in Regenbogenreihenfolge an, um zu entkommen. Gib die Reihenfolge als Liste ein (z.B. [rot-orange-gelb-gruen-blau-indigo-violett]): '), nl,sleep(1),
    puzzle_crystals.

puzzle_crystals :-
    read(Order),
    (Order = rot-gelb-gruen-indigo -> write('Du hast die Kristalle richtig angeordnet, alle leuchten. WOW.'), nl,
        write('Du hast gefunden, woher das Licht kommt, und bist aus der Mine entkommen!'), nl,sleep(5), scene(niya_introduction);
    write('Das scheint nicht richtig zu sein. Nicht alle Kristalle leuchten. Versuche es erneut.'), nl,
    puzzle_crystals).

start_puzzle(_) :- !.

% Objekte bemerken
notice_objects_at(Place) :-
    at(X, Place),
    write('Hier ist ein '), write(X), write('.'), nl,sleep(1),
    fail.

notice_objects_at(_).

% Batterie-Operationen
turn_battery(Number) :-
    battery_state(battery1, Number, State),
    rotate(State, NewState),
    retract(battery_state(battery1, Number, State)),
    assert(battery_state(battery1, Number, NewState)),
    check_flashlight_batteries,
    !.

turn_battery(Number) :-
    battery_state(battery2, Number, State),
    rotate(State, NewState),
    retract(battery_state(battery2, Number, State)),
    assert(battery_state(battery2, Number, NewState)),
    check_flashlight_batteries,
    !.

turn_battery(Number) :-
    battery_state(battery3, Number, State),
    rotate(State, NewState),
    retract(battery_state(battery3, Number, State)),
    assert(battery_state(battery3, Number, NewState)),
    check_flashlight_batteries,
    !.

rotate('[+===-]', '[-===+]').  % Batterie drehen
rotate('[-===+]', '[+===-]').  % Batterie drehen

show_flashlight :-
    battery_state(battery1, 1, State1),
    battery_state(battery2, 2, State2),
    battery_state(battery3, 3, State3),
    nl,
    write('Taschenlampe: '), nl,
    write(State1), nl,
    write(State2), nl,
    write(State3), nl,
    nl.

check_flashlight_batteries :-
    battery_state(battery1, 1, State1),
    battery_state(battery2, 2, State2),
    battery_state(battery3, 3, State3),
    (State1 = '[-===+]',
     State2 = '[-===+]',
     State3 = '[-===+]') ->
        write('Du hast die Batterien richtig angeordnet und die Taschenlampe funktioniert jetzt!'), nl,sleep(1),
        assert(flashlight_on);
    write('Die Taschenlampe funktioniert immer noch nicht. Ordne weiter die Batterien an.'), nl,sleep(1),
        decrement_torch.

% Tod des Spielers
restart :-
    write('Du bist gestorben.'), nl,
    sleep(3),
    write('Aber an diesem Ort ist etwas Besonderes. Du wurdest wiederbelebt.'),
    start_mine.

