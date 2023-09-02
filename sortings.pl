% Bubble Sort
bubbleSort(L, S) :- swap(L, L1), !, bubbleSort(L1, S).
bubbleSort(L, L).

swap([X,Y|Rest], [Y,X|Rest]) :- X>Y, !.
swap([Z|Rest], [Z|Rest1]) :- swap(Rest, Rest1).


% Insertion Sort
insertionSort([H|L], S) :- insertionSort(L, L1), insertItem(H, L1, S).
insertionSort([], []).

insertItem(X, [H|L], [H|S]) :- H<X, !, insertItem(X, L, S).
insertItem(X, L, [X|L]).

% Merge Sort
mergeSort([], []).
mergeSort([A], [A]).
mergeSort([A, B | Rest], S) :- divide([A, B | Rest], L1, L2), mergeSort(L1, S1), mergeSort(L2, S2), merge(S1, S2, S).

divide([], [], []).
divide([A], [A], []).
divide([A, B | R], [A | Ra], [B | Rb]) :- divide(R, Ra, Rb).

merge(A, [], A).
merge([], B, B).
merge([A | Ra], [B | Rb], [A | M]) :- A =< B, merge(Ra, [B | Rb], M).
merge([A | Ra], [B | Rb], [B | M]) :- A > B, merge([A | Ra], Rb, M).

% Quick Sort
quickSort([X|Xs], Ys) :- partition(Xs, X, Left, Right), quickSort(Left, Ls), quickSort(Right, Rs), listAppend(Ls, [X|Rs], Ys).
quickSort([], []).

partition([X|Xs], Y, [X|Ls], Rs) :- X=<Y, partition(Xs, Y, Ls, Rs).
partition([X|Xs], Y, Ls, [X|Rs]) :- X>Y, partition(Xs, Y, Ls, Rs).
partition([], Y, [], []).

listAppend([], Ys, Ys).
listAppend([X|Xs], Ys, [X|Zs]) :- listAppend(Xs, Ys, Zs).

% Selection Sort
selection_sort(List, Sorted) :-
    List = [] ->
        Sorted = []
    ;
        min_rem(List, Min, Rem),
        selection_sort(Rem, RemSorted),
        Sorted = [Min | RemSorted].

min_rem([X | L], Min, Rem) :-
    L = [] ->
        Min = X, Rem = []
    ;
        min_rem(L, X, Min, Rem).

min_rem([], X, X, []).
min_rem([Y | L], X, Min, Rem) :-
    Y < X ->
        min_rem(L, Y, Min, SubRem),
        Rem = [X | SubRem]
    ;
        min_rem(L, X, Min, SubRem),
        Rem = [Y | SubRem].
