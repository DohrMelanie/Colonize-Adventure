% Funktion zum Starten des Kochspiels
start_cooking :-
    nl,
    write('Willkommen zum Kochspiel!'), nl,
    write('Dein Ziel ist es, eines der drei Gerichte zuzubereiten:'), nl,
    write(' - Fisch mit Kartoffeln'), nl,
    write(' - Getrocknete Bohnen'), nl,
    write(' - Haferbrei mit Zimt'), nl,
    write('Du hast folgende Zutaten zur Verfügung:'), nl,
    write(' - Fisch'), nl,
    write(' - Kartoffeln'), nl,
    write(' - Bohnen'), nl,
    write(' - Hafer'), nl,
    write(' - Zimt'), nl,
    write(' - Wasser'), nl,
    cooking([]).

% Funktion zum Kochen
cooking(Ingredients) :-
    nl,
    write('Welche Zutat möchtest du als nächstes hinzufügen?'), nl,
    write('a: Fisch'), nl,
    write('b: Kartoffeln'), nl,
    write('c: Bohnen'), nl,
    write('d: Hafer'), nl,
    write('e: Zimt'), nl,
    write('f: Wasser'), nl,
    write('g: Fertig'), nl,
    nl,
    read_choice(Choice),
    (
        Choice = g ->
        check_dish(Ingredients),
        ( 
            valid_dish(Ingredients) -> true;
            cooking(Ingredients)
        );

        add_ingredient(Choice, Ingredients, NewIngredients),
        cooking(NewIngredients)
    ).

% Funktion zum Hinzufügen einer Zutat
add_ingredient(a, Ingredients, [fisch|Ingredients]).
add_ingredient(b, Ingredients, [kartoffeln|Ingredients]).
add_ingredient(c, Ingredients, [bohnen|Ingredients]).
add_ingredient(d, Ingredients, [hafer|Ingredients]).
add_ingredient(e, Ingredients, [zimt|Ingredients]).
add_ingredient(f, Ingredients, [wasser|Ingredients]).

% Funktion zum Überprüfen des Gerichts
check_dish(Ingredients) :-
    length(Ingredients, Len),
    (
        Len < 1 ->
        nl, write('Du hast noch nicht genug Zutaten hinzugefügt.'), nl;

        Len > 2 ->
        nl, write('Leider hast du zu viele Zutaten hinzugefügt.'), nl;

        subset([fisch, kartoffeln], Ingredients), length(Ingredients, 2) ->
        nl, write('Glückwunsch! Du hast Fisch mit Kartoffeln zubereitet!'), nl;

        subset([bohnen], Ingredients), length(Ingredients, 1) ->
        nl, write('Glückwunsch! Du hast getrocknete Bohnen zubereitet!'), nl;

        subset([hafer, zimt], Ingredients), length(Ingredients, 2) ->
        nl, write('Glückwunsch! Du hast Haferbrei mit Zimt zubereitet!'), nl;

        nl, write('Leider hast du noch nicht alle Zutaten hinzugefügt oder ein unbekanntes Gericht zubereitet.'), nl
    ).

% Funktion zur Überprüfung, ob das Gericht gültig ist
valid_dish(Ingredients) :-
    subset([fisch, kartoffeln], Ingredients), length(Ingredients, 2);
    subset([bohnen], Ingredients), length(Ingredients, 1);
    subset([hafer, zimt], Ingredients), length(Ingredients, 2).

% Funktion zum Ausgeben der Zutaten
print_ingredients([]).
print_ingredients([Head|Tail]) :-
    write(Head), nl,
    print_ingredients(Tail).

% Funktion zum Einlesen der Benutzerauswahl
read_choice(Choice) :-
    read(Choice).