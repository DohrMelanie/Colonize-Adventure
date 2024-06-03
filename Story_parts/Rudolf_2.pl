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
    write('*Du durchquerst das Lager, ein Ort voller Unruhe und gemischter Gefuehle. Die tropische Hitze drueckt schwer auf deine Schultern, als du Albrecht siehst, der gerade dabei ist, seine Ausruestung zu sortieren. Deine Gedanken rasen. Albrecht war immer ein treuer Kamerad in dieser unwirtlichen Umgebung, aber nun suchst du verzweifelt nach Niya.*'), nl,
    sleep(2),
    write('***Choice: Was machst du?***'), nl,
    sleep(1),
    write('a: Sage Albrecht, dass er ein guter Freund ist'), nl,
    sleep(1),
    write('b: Fuehre Smalltalk, erzaehle dass du nach Niya suchst'), nl,
    read_choice(Choice),
    handle_choice(rudolf_meets_albrecht, Choice).

% Szene 2a: Rudolf sagt ihm, dass er ein guter Freund ist
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

% Szene 2b: Sie reden nur kurz miteinander
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

% Szene 3a: Sie sagt zu, da sie mittlerweile wirklich auf ihn steht
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

% Szene 3b: Sie muss ihm vorher noch etwas Wichtiges sagen
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

% Szene 3c: Sie hauen gemeinsam aus dem Militaerlager ab, sie steht nicht wirklich auf ihn
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
