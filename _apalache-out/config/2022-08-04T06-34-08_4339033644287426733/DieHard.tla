---- MODULE DieHard ----


\* Here comes DieHard!
EXTENDS Naturals

VARIABLE big, small

TYPEOK == 
    /\ small \in 0..3
    /\ big \in 0..5
Init == 
    /\ big = 0
    /\ small = 0

FillBig ==
    /\ big' = 5
    /\ UNCHANGED small
  
FillSmall ==
    /\ small' = 3
    /\ UNCHANGED big

EmptyBig ==
    /\ big' = 0
    /\ UNCHANGED small

EmptySmall ==
    /\ small' = 0
    /\ UNCHANGED big

PourBigToSmall ==
    /\ big' = IF (big + small > 3) THEN big - (3 - small) ELSE 0
    /\ small' = IF (big + small > 3) THEN 3 ELSE big + small

PourSmallToBig ==
    /\ big' = IF (big + small > 5) THEN 5 ELSE big + small
    /\ small' = IF (big + small > 5) THEN small - (5 - big) ELSE 0

Next ==
    \/ FillBig
    \/ FillSmall
    \/ EmptyBig
    \/ EmptySmall
    \/ PourBigToSmall
    \/ PourSmallToBig         


Spec == Init /\ [][Next]_<<big, small>> 

NotSolved == big # 4
=======