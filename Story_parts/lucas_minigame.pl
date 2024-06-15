% Zutaten und Gerichte
dish(fisch_und_kartoffeln, [fisch, kartoffeln]).
dish(wasser_und_bohnen, [wasser, bohnen]).
dish(haferbrei, [hafer, zimt, wasser]).

% Start 
start :- 
    write('Willkommen zum Prolog Kochspiel!'), nl,
    write('Bitte gib die Zutaten (als Kleinbuchstaben!) ein, um ein Gericht zu erstellen.'), nl,
    write('Mögliche Zutaten: Fisch, Kartoffeln, Bohnen, Hafer, Zimt, Wasser.'), nl,
    loop([]).

loop(Ingredients) :-
    length(Ingredients, Length),
    Length < 4,
    write('Gib eine Zutat ein (oder fertig. zum Beenden): '), read(Ingredient),
    process(Ingredient, Ingredients).

loop(_) :-
    write('Max. Anzahl an Zutaten erreicht oder ungültige Eingabe(n).'), nl,
    write('Das Gericht kann nicht erstellt werden.'), nl,
    start.

process(fertig, Ingredients) :-
    check_and_cook(Ingredients).

process(Ingredient, Ingredients) :-
    member(Ingredient, [fisch, kartoffeln, bohnen, hafer, zimt, wasser]),
    append(Ingredients, [Ingredient], NewIngredients),
    loop(NewIngredients).

process(_, Ingredients) :-
    write('Ungültige Zutat, versuche es erneut.'), nl,
    loop(Ingredients).

check_and_cook(Ingredients) :-
    dish(Dish, Ingredients),
    nl, write('Du hast folgendes Gericht erstellt: '), write(Dish), nl,
    write('Guten Appetit!'), nl,
    start.

check_and_cook(_) :-
    nl, write('Die Kombination der Zutaten ergeben kein Gericht.'), nl,
    write('Bitte versuche es erneut'), nl,
    start.