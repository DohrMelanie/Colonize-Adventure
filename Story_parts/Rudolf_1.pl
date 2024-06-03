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
% Szene 1: Kolonialist verabschiedet sich von seiner Frau und seiner 8-jährigen Tochter
scene(colonialist_introduction) :-
    nl,
    write('Dein Name lautet Rudolf Wolfram. Du bist beim deutschen Heer und hast den Dienstgrad Hauptmann.'), nl,
    sleep(1),
    write('Du bist kurz vor der Versetzung nach Deutsch-Namibia, als Kolonialist.'), nl,
    sleep(1),
    write('Du musst dich nun von Luise Wolfram, deiner Frau und Anja Wolfram, deiner 8-jährigen Tochter verabschieden.'), nl,
    sleep(1),
    write('Du fährst zum Hafen. Es ist Seemannssontag (ein Donnerstag mit sehr gutem Essen).'), nl,
    sleep(1),
    write('***Choice: Was wirst du essen?***'), nl,
    sleep(1),
    write('a: Fisch mit Kartoffeln'), nl,
    sleep(1),
    write('b: getrocknete Bohnen'), nl,
    sleep(1),
    write('c: Haferbrei mit Zimt'), nl
    read_choice(Choice),
    handle_choice(colonialist_introduction, Choice).

% Szene 2a: Rudolf ist bis zur Ende der Reise krank und muss sich auch mehrmals übergeben.
scene(sick_officers) :-
    cls,
    write('Du: Ich fuehle mich nicht gut... ich glaube ich habe das Falsche gegessen...'), nl,
    sleep(1),
    write('Albrecht: Ich auch nicht... wir haben beide das Falsche gegessen... dieser Fisch war nicht das gelbe vom Ei...'), nl,
    sleep(1),
    write('Beide müssen sich uebergeben und sind durchgehend, bis zum Ende der Reise krank.'), nl,
    sleep(1),
    scene(meeting_niya).

% Szene 2b: Rudolf lernt Albrecht kennen (Offizierskabine)
scene(officer_get_together) :-
    cls,
    write('Du: Ach, dich sehe ich hier zum ersten Mal. Wie lautet dein Name?'), nl,
    sleep(1),
    write('Albrecht: Mein Name ist Albrecht von Vogel, schön dich kennenzulernen. Wie heißt du?'), nl,
    sleep(1),
    write('Du: Mein Name ist Rudolf Wolfram und ich bin vierundzwanzig Jahre alt. Vom Dienstgrad bin ich ein Hauptmann. Und du?'), nl,
    sleep(1),
    write('Albrecht: Mein Dienstgrad ist Major.'), nl,
    sleep(1),
    write('Du: Sehr schön. Wir sollten heute am Abend noch etwas trinken.'), ni,
    sleep(1),
    write('Albrecht: Ja, das sehe ich auch toll. Ich gehe wieder zurueck auf meine Station arbeiten, bis spaeter!'), nl,
    sleep(1),
    write('Du: Bis spaeter!'), nl,
    sleep(1),
    scene(officers_get_wild).

% Szene 2c: Rudolf lernt Albrecht kennen (Haferbrei)
scene(rudolf_and_albrecht) :-
    cls,
    write('Albrecht: Nein. Das gibt es nicht. Zum ersten Mal sehe ich jemanden, der Haferbrei mit Zimt genauso liebt wie ich'), nl,
    sleep(1),
    write('Du: Du auch? Das ist doch wunderbar. Mein Name ist Rudolf Wolfram und ich bin vom Dienstgrad ein Hauptmann. Und du?'), nl,
    sleep(1),
    write('Albrecht: Mein Dienstgrad ist Major.'), nl,
    sleep(1),
    write('Du: Sehr schön. Wir sollten heute am Abend noch etwas trinken.'), ni,
    sleep(1),
    write('Albrecht: Ja, das sehe ich auch toll. Ich gehe wieder zurueck auf meine Station arbeiten, bis spaeter!'), nl,
    sleep(1),
    write('Du: Bis spaeter!'), nl,
    sleep(1),
    scene(officers_get_wild).
    

% Szene 3: Rudolf und Albrecht betrinken sich am Schiff und leiden an einer Alkoholvergiftung.
scene(officers_get_wild) :-
    cls,
    write('Du: Hallo Albrecht. Schön, dass du hier bist.'), nl,
    sleep(1),
    write('Albrecht: Hallo Rudolf! Es freut mich, dich zu sehen. Zeit, ein bisschen was zu trinken. Fangen wir doch mit dem Wein an.'), nl, 
    sleep(1),
    write('Du: Gute Idee. Hier ist die erste Flasche.'), nl,
    sleep(1),
    write('Es ist nicht bei einer Flasche Wein geblieben. Beide haben jeweils 2 Flaschen Wein getrunken und haben eine Alkoholvergiftung erlitten.'), nl,
    sleep(1),
    scene(meeting_niya).

% Szene 4: Niya und Rudolf treffen sich auf der Krankenstation + Niya muss auf Rudolf und Albrecht aufpassen
scene(meeting_niya) :-
    cls,
    write('Niya: Hallo! Mein Name ist Niya Niambe und ich bin 16 Jahre alt. Wie ich sehe, seid ihr gerade erst angekommen. Fuehlt euch hier wohl!'), nl,
    sleep(1),
    write('Albrecht: Hallo Niya! Danke.'), nl,
    sleep(1),
    write('Du: Schön dich kennenzulernen. Mein Name ist Rudolf und ich bin 24 Jahre alt.'), nl,
    sleep(1),
    write('Niya: Ich werde auf euch aufpassen. Falls ihr etwas braucht, bitte sagt es mir.'), nl,
    sleep(1),
    write('Du: Werden wir, danke.'), nl,
    sleep(1),
    scene(taking_care).

% Szene 5: Niya legt einen kalten Lappen auf deren Stirn
scene(taking_care) :-
    cls,
    write('Niya: Eure Temperatur ist ueberhoeht. Hier fuer euch beide, ein kalter Lappen.'), nl,
    sleep(1),
    write('Du: Vielen Dank, mir geht es direkt viel besser...'), nl,
    sleep(1),
    write('Albrecht: Danke.'), nl,
    sleep(1),
    scene(surviving).

% Szene 6: Beide ueberleben und es geht beiden besser
scene(surviving) :-
    cls,
    write('Niya: Ich merke, euch geht es schon besser. Hier ein Kraeutertee, der putscht auf.'), nl,
    sleep(1),
    write('Du: Dank deiner Hilfe geht es uns schon viel besser, danke vielmals ;)'), nl,
    sleep(1),
    write('Albrecht: Danke.'), nl,
    sleep(1),
    scene(talk).

% Szene 7: Albrecht bekommt mit, wie Rudolf sie anschaut
scene(talk) :-
    cls,
    write('Albrecht: Ich bekomme mit, wie du Niya die ganze Zeit anschaust. Hast du etwa Gefuele fuer sie?'), nl,
    sleep(1),
    write('Du: Ach, quatsch. Ich habe eine Frau und eine Tochter zu Hause. Ich kann mich doch nicht in eine Sklavin verlieben...'), nl,
    sleep(1),
    write('Albrecht: Sag niemals nie. Ich merke, wie du sie ansiehst. Du stehst auf sie, gib es zu.'), nl,
    sleep(1),
    write('Du: Naja, ich mag sie... aber ich stehe doch nicht auf sie. Eigentlich ist das gelogen. Ich liebe sie.'), nl,
    sleep(1),
    write('***Choice: Was wirst du machen?***'), nl,
    sleep(1),
    write('a: Niya von deinen Gefuehlen erzaehlen'), nl,
    sleep(1),
    write('b: Weiter mit Albrecht darueber reden'), nl,
    sleep(1),
    write('c: Du fuehlst dich schuldig wegen deiner Frau'), nl
    read_choice(Choice),
    handle_choice(talk, Choice).


% Szene 8a: Rudolf erzaehlt Niya von seinen Gefuehlen
scene(telling_niya) :-
    cls,
    write('Niya: Du wolltest mich sehen, Rudolf?'), nl,
    sleep(1),
    write('Du: Ja, ich muss dir etwas sagen...'), nl,
    sleep(1),
    write('Niya: Ja, was denn?'), nl,
    sleep(1),
    write('Du: Ich liebe dich.'), nl,
    sleep(1),
    write('Niya: Danke, das ist voll nett zu hoeren.... aber ich liebe dich nicht.'), nl,
    sleep(1),
    write('***Choice: Was wirst du machen?***'), nl,
    sleep(1),
    write('a: Niya schlechter als andere behandeln'), nl,
    sleep(1),
    write('b: Ihr mehr Essen als dem Rest geben'), nl,
    read_choice(Choice),
    handle_choice(telling_niya, Choice).

% Szene 8b: Rudolf redet mit Albrecht ueber seine Gefuehle
scene(talking_with_albrecht) :-
    cls,
    write('Albrecht: Du kannst dich doch nicht in eine Sklavin verlieben.'), nl,
    sleep(1),
    write('Du: Und wie ich das kann. Die Liebe kennt keine Grenzen. Keine Grenzen auf Grund von der Hautfarbe oder sonstigem. Ich liebe Niya und ich muss es ihr sagen.'), nl,
    sleep(1),
    write('Albrecht: Unglaublich. Wenn irgendjemand etwas davon mitbekommt, dann haben wir ein riesiges Problem. Ich wuerde dir empfehlen, das alles zu lassen.'), nl,
    sleep(1),
    write('Du: Das kann ich Niya nicht antuen. Das kommt nicht in Frage!'), nl,
    sleep(1),
    write('Niya: Rudolf, bitte komm mit in das Nebenzimmer. Wir muessen Bewegungsuebungen machen.'), nl,
    sleep(1),
    write('Du kommst mit.'), nl,
    sleep(1),
    write('Niya: Ich habe alles mitbekommen. Liebst du mich wirklich?'), nl,
    sleep(1),
    scene(get_together).

% Szene 8c: Rudolf fuehlt sich schuldig wegen seiner Frau
scene(no_cheating) :-
    cls,
    write('Albrecht: Du kannst das deiner Frau nicht antuen.'), nl,
    sleep(1),
    write('Du: Das ist mir bewusst. Aber ich kann nicht eine Person lieben, und dann so tun, wie als wuerde ich sie nicht lieben...'), nl,
    sleep(1),
    write('Du greifst zu deiner Waffe.'), nl,
    sleep(1),
    write('Albrecht: Was machst du da? Weg mit der Waffe. DAS IST EIN BEFEHL!'), nl,
    sleep(1),
    write('Du: FUER DEUTSCHLAND!'), nl,
    sleep(1),
    write('Du begehst wegen deiner Schuldgefuehle Suizid.'), nl,
    die,
    finish.

% Szene 9a: Er behandelt sie schlechter als den Rest
scene(worse_treatment) :-
    cls,
    write('Du: Wer glaubst du wer du bist? Wer bist du, dass du einen Offizier ablehnst?'), nl,
    sleep(1),
    write('Niya: Es tut mir leid. Es ist einfach keine Attraktion hier. Ich liebe dich nicht.'), nl,
    sleep(1),
    write('Du: Das lasse ich mir nicht gefallen. Hau ab, du dreckige Sklavin!'), nl,
    sleep(1),
    write('Niya: Erspare dir die Beleidigungen. Ich liebe dich nicht.'), nl,
    sleep(1),
    write('Du: Komm mit. Dich bringe ich jetzt in ein Gefaengnis. Da gehören so Leute wie du hin.'), nl,
    sleep(1),
    write('Niya: Wieso? Hey. Lass mich in Ruhe!'), nl,
    sleep(1),
    write('Du hast Niya grundlos in ein Gefaengnis gesperrt. Sie stirbt an einer dir unbekannten Krankheit.'), nl,
    finish.

% Szene 9b: Sie bekommt mehr Essen als der Rest
scene(better_treatment) :-
    cls,
    write('Du: Du bist aber eine anspruchsvolle Dame. Ich werde deinen Anspruechen gerecht werden. Hier, hab du bekommst ein bisschen mehr zum Essen als der Rest.'), nl,
    sleep(1),
    write('Niya: Danke, waere aber nicht noetig.'), nl,
    sleep(1),
    scene(get_together).

% Szene 10: Sie reden über ihre Gefühle und kommen zusammen
scene(get_together) :-
    cls,
    write('Niya: Du scheinst ja nicht so schlecht zu sein. Aber ich bin mich nicht sicher, ob ich momentan einen Freund vertragen koennte... meine Familie ist naemlich riesig.'), nl,
    sleep(1),
    write('Du: Mit mir wird deine Familie groesser. Ich liebe dich. Bitte gib mir doch wenigstens eine Chance.'), nl,
    sleep(1),
    write('Niya: Na gut... von mir aus. Aber wir sollten das keinem erzaehlen.'), nl,
    sleep(1),
    write('Du: Passt.'), nl,
    sleep(1),
    write('Niya: Ich muss zurueck in die Minen. Irgendjemand muss bei uns ja das Geld auftreiben. Das bin halt nunmal ich.'), nl,
    sleep(1),
    write('Du: Schade. Ich werde dich vermissen.'), nl,
    sleep(1),
    write('Ihr kuesst euch und verabschiedet euch so.'), nl,
    sleep(1),
    -- Anbindung an anderen Part

% *****************************Choice Handling******************************
handle_choice(colonialist_introduction, a) :-
    scene(sick_officers).
handle_choice(colonialist_introduction, b) :-
    scene(officer_get_together).
handle_choice(colonialist_introduction, c) :-
    scene(rudolf_and_albrecht).

handle_choice(talk, a) :- 
    scene(telling_niya).
handle_choice(talk, b) :-
    scene(talking_with_albrecht).
handle_choice(talk, c) :-
    scene(no_cheating).

handle_choice(telling_niya, a) :-
    scene(worse_treatment).
handle_choice(telling_niya, b) :-
    scene(better_treatment).