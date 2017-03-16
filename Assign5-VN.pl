mylength([], Length):-
    Length is 0.
mylength([X|Y], Length):-
    mylength(Y, L),
    Length is L + 1.

mylast([L],L).
mylast([_ | Tail], L):-
    mylast(Tail, L).

mymax([MaxVal],MaxVal) :- !, true.
mymax([MaxVal|MaxValTail], Max) :-
    mymax(MaxValTail, Max),
    Max > MaxVal.
mymax([MaxVal|MaxValTail], MaxVal):-
    mymax(MaxValTail,Max),
    MaxVal > Max.

mymember([Element|CheckTail], Element).
mymember([CheckHead|CheckTail],Element):-
    mymember(CheckTail,Element).

intersect([], _, []).
intersect([List1Head|List1Tail],List2 ,IntList):-
    mymember(List2, List1Head),
    !,
    IntList = [List1Head|IntListTail],
    intersect(List1Tail, List2, IntListTail).
intersect([_|List1Tail], List2, IntList):-
    intersect(List1Tail, List2, IntList).


union([L1Head|L1Tail],[],[L1Head|L1Tail]).
union([],[L2Head|L2Tail],[L2Head|L2Tail]).
union([L1Head|L1Tail], L2, UnionList):-
    mymember(L2,L1Head),
    !,
    union(L1Tail,L2,UnionList).
union([L1Head|L1Tail], L2, [L1Head|UnionList]):-
    union(L1Tail, L2, UnionList).

