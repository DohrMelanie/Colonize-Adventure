% LOAL - Game by Caroline Hornhuber, Melanie Dohr, Lucas Gastelsberger
% Wir haben 2 Dateien, einmal aus der Sicht der Sklavin und einmal aus der Sicht des Kolonialisten
% Wir haben die 2 Dateien nicht zusammengefügt, da es sonst sehr unübersichtlich geworden wäre
% Der Benutzer unseres Spiels soll einfach am Anfang entscheiden, aus wessen Sicht er die Geschichte erleben will.
% Innerhalb der Sichten gibt es gravierende Unterschiede im Bezug auf die Entscheidungen, die der Benutzer treffen kann und was der Benutzer erlebt.
% Die Grundgeschichte ist allerdings dieselbe.

% meta stuff
start :-
    instructions,
    scene(colonialist_introduction).

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
% Szene 1: Kolonialist verabschiedet sich von seiner Frau und seiner 8-jaehrigen Tochter
scene(colonialist_introduction) :-
    write('Dein Name lautet Rudolf Wolfram. Du bist beim deutschen Heer und hast den Dienstgrad Hauptmann.'), nl,
    sleep(1),
    write('Du bist kurz vor der Versetzung nach Deutsch-Namibia, als Kolonialist.'), nl,
    sleep(1),
    write('Du musst dich nun von Luise Wolfram, deiner Frau und Anja Wolfram, deiner 8-jaehrigen Tochter verabschieden.'), nl,
    sleep(1),
    write('Du faehrst zum Hafen. Es ist Seemannssontag (ein Donnerstag mit sehr gutem Essen).'), nl,
    sleep(1),
    write('Du kannst dir jetzt ein Gericht zubereiten: '), nl,
    sleep(1),
    start_cooking.    

% Szene 1a: Rudolf entscheidet über sein Essen
scene(colonialist_eat) :-
    cls,
    write('Am Tag darauf kannst du waehlen was du essen wirst: '),nl,
    sleep(1),
    write('***Choice: Was wirst du essen?***'), nl,
    sleep(1),
    write('a: Fisch mit Kartoffeln'), nl,
    sleep(1),
    write('b: getrocknete Bohnen'), nl,
    sleep(1),
    write('c: Haferbrei mit Zimt'), nl,
    read_choice(Choice),
    handle_choice(colonialist_eat, Choice).


% Szene 2a: Rudolf ist bis zur Ende der Reise krank und muss sich auch mehrmals uebergeben.
scene(sick_officers) :-
    cls,
    write('Du: Ich fuehle mich nicht gut... ich glaube ich habe das Falsche gegessen...'), nl,
    sleep(1),
    write('Albrecht: Ich auch nicht... wir haben beide das Falsche gegessen... dieser Fisch war nicht das gelbe vom Ei...'), nl,
    sleep(1),
    write('Beide muessen sich uebergeben und sind durchgehend, bis zum Ende der Reise krank.'), nl,
    sleep(1),
    scene(meeting_niya).

% Szene 2b: Rudolf lernt Albrecht kennen (Offizierskabine)
scene(officer_get_together) :-
    cls,
    write('Du: Ach, dich sehe ich hier zum ersten Mal. Wie lautet dein Name?'), nl,
    sleep(1),
    write('Albrecht: Mein Name ist Albrecht von Vogel, schoen dich kennenzulernen. Wie heisst du?'), nl,
    sleep(1),
    write('Du: Mein Name ist Rudolf Wolfram und ich bin vierundzwanzig Jahre alt. Vom Dienstgrad bin ich ein Hauptmann. Und du?'), nl,
    sleep(1),
    write('Albrecht: Mein Dienstgrad ist Major.'), nl,
    sleep(1),
    write('Du: Sehr schoen. Wir sollten heute am Abend noch etwas trinken.'), nl,
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
    write('Du: Sehr schoen. Wir sollten heute am Abend noch etwas trinken.'), nl,
    sleep(1),
    write('Albrecht: Ja, das sehe ich auch toll. Ich gehe wieder zurueck auf meine Station arbeiten, bis spaeter!'), nl,
    sleep(1),
    write('Du: Bis spaeter!'), nl,
    sleep(1),
    scene(officers_get_wild).
    

% Szene 3: Rudolf und Albrecht betrinken sich am Schiff und leiden an einer Alkoholvergiftung.
scene(officers_get_wild) :-
    nl,
    write('Du: Hallo Albrecht. Schoen, dass du hier bist.'), nl,
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
    nl,
    write('Niya: Hallo! Mein Name ist Niya Niambe und ich bin 16 Jahre alt. Wie ich sehe, seid ihr gerade erst angekommen. Fuehlt euch hier wohl!'), nl,
    sleep(1),
    write('Albrecht: Hallo Niya! Danke.'), nl,
    sleep(1),
    write('Du: Schoen dich kennenzulernen. Mein Name ist Rudolf und ich bin 24 Jahre alt.'), nl,
    sleep(1),
    write('Niya: Ich werde auf euch aufpassen. Falls ihr etwas braucht, bitte sagt es mir.'), nl,
    sleep(1),
    write('Du: Werden wir, danke.'), nl,
    sleep(1),
    scene(taking_care).

% Szene 5: Niya legt einen kalten Lappen auf deren Stirn
scene(taking_care) :-
    nl,
    write('Niya: Eure Temperatur ist erhoeht. Hier fuer euch beide, ein kalter Lappen.'), nl,
    sleep(1),
    write('Du: Vielen Dank, mir geht es direkt viel besser...'), nl,
    sleep(1),
    write('Albrecht: Danke.'), nl,
    sleep(1),
    scene(surviving).

% Szene 6: Beide ueberleben und es geht beiden besser
scene(surviving) :-
    nl,
    write('Niya: Ich merke, euch geht es schon besser. Hier ein Kraeutertee, der putscht auf.'), nl,
    sleep(1),
    write('Du: Dank deiner Hilfe geht es uns schon viel besser, danke vielmals ;)'), nl,
    sleep(1),
    write('Albrecht: Danke.'), nl,
    sleep(1),
    scene(talk).

% Szene 7: Albrecht bekommt mit, wie Rudolf sie anschaut
scene(talk) :-
    nl,
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
    write('c: Du fuehlst dich schuldig wegen deiner Frau'), nl,
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
    write('Du: Komm mit. Dich bringe ich jetzt in ein Gefaengnis. Da gehoeren so Leute wie du hin.'), nl,
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

% Szene 10: Sie reden ueber ihre Gefuehle und kommen zusammen
scene(get_together) :-
    nl,
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
    scene(decision_vacation).

% Szene 11: Entscheidung ueber die Möglichkeit nach Hause zu seiner Frau zu fahren (Krankenurlaub)
scene(decision_vacation) :-
    cls,
    write('Du hast nun die Moeglichkeit, nach Hause zu deiner Frau zu fahren und Krankenurlaub zu machen.'), nl,
    sleep(1),
    write('***Choice: Was wirst du machen?***'), nl,
    sleep(1),
    write('a: Du machst den Urlaub'), nl,
    sleep(1),
    write('b: Du bleibst in Namibia bei deiner Geliebten'), nl,
    read_choice(Choice),
    handle_choice(decision_vacation, Choice).

% Szene 12a: Er macht den Urlaub
scene(taking_vacation) :-
    cls,
    write('Du entscheidest dich, den Urlaub zu machen und faehrst nach Hause.'), nl,
    sleep(1),
    write('***Choice: Wie gehst du mit deiner Frau um?***'), nl,
    sleep(1),
    write('a: Du fuehlst dich schuldig und erzaehlst ihr davon'), nl,
    sleep(1),
    write('b: Du verheimlichst deiner frau deine geliebte.'), nl,
    read_choice(Choice),
    handle_choice(taking_vacation, Choice).

% Szene 12b: Er bleibt in Namibia bei seiner Geliebten
scene(staying_namibia) :-
    cls,
    write('Du entscheidest dich, in Namibia bei deiner Geliebten zu bleiben.'), nl,
    scene(rudolf_meets_albrecht).

% Szene 13a: Du fuehlst dich schuldig und erzaehlst deiner Frau davon
scene(feeling_guilty) :-
    cls,
    write('Du erzaehlst deiner Frau von der Affaere und fuehlst dich schuldig.'), nl,
    sleep(1),
    write('Deine Frau bringt sich um.'), nl,
    die,
    finish.

% Szene 13b: Deine Frau erfaehrt durch einen Brief von Rudolf an Niya von dir und deiner Geliebten
scene(wife_finds_out) :-
    cls,
    write('Deine Frau erfaehrt durch einen Brief von Rudolf an Niya von dir und deiner Geliebten.'), nl,
    sleep(1),
    write('Sie laesst sich scheiden.'), nl,
    sleep(1),
    write('Du gehst zurueck nach Namibia.'), nl,
    scene(rudolf_meets_albrecht).


% Szene 14: Rudolf trifft auf Albrecht
scene(rudolf_meets_albrecht) :-
    nl,
    write('*Du durchquerst das Lager, ein Ort voller Unruhe und gemischter Gefuehle. Die tropische Hitze drueckt schwer auf deine Schultern, als du Albrecht siehst, der gerade dabei ist, seine Ausruestung zu sortieren. Deine Gedanken rasen. Albrecht war immer ein treuer Kamerad in dieser unwirtlichen Umgebung, aber nun suchst du verzweifelt nach Niya.*'), nl,
    sleep(2),
    write('***Choice: Was machst du?***'), nl,
    sleep(1),
    write('a: Sage Albrecht, dass er ein guter Freund ist'), nl,
    sleep(1),
    write('b: Fuehre Smalltalk, erzaehle dass du nach Niya suchst'), nl,
    read_choice(Choice),
    handle_choice(rudolf_meets_albrecht, Choice).

% Szene 15a: Rudolf sagt ihm, dass er ein guter Freund ist
scene(rudolf_tells_albrecht_that_he_is_a_good_friend) :-
    cls,
    write('Du: Albrecht, du bist ein guter Freund!'), nl,
    sleep(1),
    write('*Albrecht wird rot und schaut verlegen zu Boden. Du spuerst eine unerwartete Spannung in der Luft, die ueber die uebliche Kameradschaft hinausgeht.*'), nl,
    sleep(2),
    write('Albrecht: Ich aehh... Ich stehe auf dich!'), nl,
    sleep(1),
    write('*Dein Herz schlaegt schneller. Diese unerwartete Offenbarung laesst dich stocken. In dieser rauen, fremden Welt haettest du nie gedacht, dass solch zarte Gefuehle entstehen koennten.*'), nl,
    sleep(2),
    write('Du: Ich stehe auch auf dich!'), nl,
    sleep(1),    
    write('*Albrechts Augen leuchten auf, und ohne ein weiteres Wort zu verlieren, nehmt ihr euch bei den Haenden und beschliesst, gemeinsam in den Regenwald zu fluechten. Ihr verlasst das Chaos und die Gewalt des Lagers und findet Frieden in der Wildnis, wo ihr gluecklich bis ans Ende eurer Tage lebt.*'), nl,
    finish.

% Szene 15b: Sie reden nur kurz miteinander
scene(they_talk_with_each_other) :-
    cls,
    write('*Du gehst auf Albrecht zu und versuchst, moeglichst ruhig zu wirken, obwohl die Sorge um Niya dich innerlich zerreisst. Diese Kolonie, mit all ihren Gefahren und Herausforderungen, hat dich gelehrt, deine Emotionen zu verbergen.*'), nl,
    sleep(1),
    write('Du: Hallo Albrecht, ich suche Niya. Hast du sie irgendwo gesehen?'), nl,
    sleep(2),
    write('Albrecht: Ja, sie ist in ihrem Zelt. Warum suchst du sie?'), nl,
    sleep(2),
    write('Du: Danke! Ich muss dringend mit ihr sprechen.'), nl,
    sleep(1),
    write('*Du verabschiedest dich hastig und machst dich auf den Weg zu Niya. Deine Gedanken kreisen um die letzten Wochen. Niya, die Sklavin, die dein Herz beruehrt hat, war mehr als nur eine Dienerin. Sie war eine Seele, die du retten wolltest.*'), nl, nl,
    sleep(1),
    write('*Im Zelt angekommen, findest du Niya, die gerade dabei ist, ihre Sachen zu packen. Ihre Augen weiten sich ueberrascht, als sie dich sieht.*'), nl,
    sleep(2),
    write('Du: Hi Niya!'), nl,
    sleep(1),
    write('Niya: Hi Rudolf! Was gibt\'s?'), nl,
    sleep(1),
    write('Du: Ich hab eine Idee ... wollen wir gemeinsam fluechten?'), nl,
    get_random_choice(Choice),
    handle_choice(do_we_want_to_flee, Choice).

% Szene 16a: Sie sagt zu, da sie mittlerweile wirklich auf ihn steht
scene(she_really_likes_him) :-
    cls,
    write('*Niya schaut dich an, und du siehst, wie sich ein sanftes Laecheln auf ihrem Gesicht ausbreitet. Ihre Augen, die oft Schmerz und Trauer spiegeln, leuchten nun voller Hoffnung und Zuneigung.*'), nl,
    sleep(1),
    write('Niya: Ja, ich moechte sehr gerne mit dir fluechten. Ich liebe dich! <3'), nl,
    sleep(2),
    write('*Euer Herzschlag synchronisiert sich, als ihr euch umarmt. Ihr wisst, dass ihr zusammen alles schaffen koennt. Ihr verlasst das Militaerlager, das Symbol der Unterdrueckung und Angst, und findet Zuflucht im dichten Gruen des Regenwaldes. Dort baut ihr euch ein neues Leben auf, fernab von den Schrecken der Vergangenheit.*'), nl,
    sleep(2),
    write('Ihr ueberlebt beide und lebt gluecklich bis ans Ende eurer Tage. HAPPY END :)'), nl,
    finish.

% Szene 16b: Sie muss ihm vorher noch etwas Wichtiges sagen
scene(she_has_to_tell_him_something) :-
    cls,
    write('*Niya schaut dich mit ernster Miene an und atmet tief durch. Ihr Gesicht, von den Jahren der Unterdrueckung und des Leids gezeichnet, zeigt einen Ausdruck der Unsicherheit.*'), nl,
    sleep(1),
    write('Niya: Ich muss dir vorher noch etwas Wichtiges sagen...'), nl,
    sleep(2),
    write('Niya: Ich bin schwanger.'), nl,
    sleep(1),
    write('*Die Worte treffen dich unerwartet, und fuer einen Moment weisst du nicht, was du sagen sollst. Deine Gedanken wirbeln durcheinander, aber du fuehlst auch eine tiefe Freude.*'), nl,
    sleep(2),
    write('Rudolf: Oh mein Gott! Ich freu mich ja so <3'), nl,
    sleep(1),
    write('*Ihr fluechtet trotzdem gemeinsam in den Regenwald, voller Hoffnung und Vorfreude. Doch das Schicksal ist grausam. Bei der Geburt des Kindes stirbt Niya, und du musst das Kind alleine aufziehen. Der Schmerz ueber ihren Verlust ist unermesslich, aber die Liebe zu eurem Kind gibt dir die Kraft, weiterzumachen.*'), nl,
    finish.

% Szene 16c: Sie hauen gemeinsam aus dem Militaerlager ab, sie steht nicht wirklich auf ihn
scene(she_does_not_like_him) :-
    nl,
    write('*Niya nickt entschlossen, aber du siehst ein Zoegern in ihren Augen. Etwas stimmt nicht, doch du verdraengst deine Zweifel. Die Hoffnung auf ein gemeinsames Leben ist zu stark.*'), nl,
    sleep(1),
    write('Niya: Ja, ich moechte mit dir fluechten.'), nl,
    sleep(2),
    write('*Ihr fluechtet gemeinsam aus dem Militaerlager, aber die Reise ist hart und entbehrungsreich. Bald merkst du, dass etwas nicht stimmt. Niya wirkt abwesend und distanziert.*'), nl,
    sleep(2),
    write('Niya: Es tut mir leid, Rudolf, aber ich kann das nicht. Ich... ich habe jemanden anders getroffen.'), nl,
    sleep(2),
    write('*Ihr Gestaendnis trifft dich wie ein Schlag. Niya verlaesst dich, und du bleibst mit einem gebrochenen Herzen zurueck. Die Erkenntnis, dass sie dich nur benutzt hat, um zu entkommen, laesst einen bitteren Geschmack in deinem Mund zurueck. Der Traum von einem gemeinsamen Leben zerbricht, und du kehrst in die Einsamkeit zurueck.*'), nl,
    finish.

% *****************************Choice Handling******************************
handle_choice(colonialist_eat, a) :-
    scene(sick_officers).
handle_choice(colonialist_eat, b) :-
    scene(officer_get_together).
handle_choice(colonialist_eat, c) :-
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

handle_choice(decision_vacation, a) :-
    scene(taking_vacation).
handle_choice(decision_vacation, b) :-
    scene(staying_namibia).

handle_choice(taking_vacation, a) :-
    scene(feeling_guilty).
handle_choice(taking_vacation, b) :-
    scene(wife_finds_out).

handle_choice(staying_namibia, a) :-
    scene(feeling_guilty).
handle_choice(staying_namibia, b) :-
    scene(wife_finds_out).

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


% Zutaten und Gerichte
dish(fisch_und_kartoffeln, [fisch, kartoffeln]).
dish(wasser_und_bohnen, [wasser, bohnen]).
dish(haferbrei, [hafer, zimt, wasser]).

% Start 
start_cooking :- 
    write('Willkommen zum Prolog Kochspiel!'), nl,
    write('Bitte gib die Zutaten (als Kleinbuchstaben!) ein, um ein Gericht zu erstellen.'), nl,
    write('Moegliche Zutaten: fisch, kartoffeln, bohnen, hafer, zimt, wasser.'), nl,
    loop([]).

loop(Ingredients) :-
    length(Ingredients, Length),
    Length < 4,
    write('Gib eine Zutat ein (oder fertig. zum Beenden): '), read(Ingredient),
    process(Ingredient, Ingredients).

loop(_) :-
    write('Max. Anzahl an Zutaten erreicht oder ungueltige Eingabe(n).'), nl,
    write('Das Gericht kann nicht erstellt werden.'), nl,
    start_cooking.

process(fertig, Ingredients) :-
    check_and_cook(Ingredients).

process(Ingredient, Ingredients) :-
    member(Ingredient, [fisch, kartoffeln, bohnen, hafer, zimt, wasser]),
    append(Ingredients, [Ingredient], NewIngredients),
    loop(NewIngredients).

process(_, Ingredients) :-
    write('Ungueltige Zutat, versuche es erneut.'), nl,
    loop(Ingredients).

check_and_cook(Ingredients) :-
    dish(Dish, Ingredients),
    nl, write('Du hast folgendes Gericht erstellt: '), write(Dish), nl,
    write('Guten Appetit!'), nl,
    scene(colonialist_eat).

check_and_cook(_) :-
    nl, write('Die Kombination der Zutaten ergeben kein Gericht.'), nl,
    write('Bitte versuche es erneut'), nl,
    start_cooking.
