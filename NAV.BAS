DECLARE SUB Acaba (text$)
DECLARE SUB Menu (text$)
DECLARE SUB Nave4T (text$)
DECLARE SUB Nave4C (text$)
DECLARE SUB Nave3T (text$)
DECLARE SUB Nave3C (text$)
DECLARE SUB Life (text$)
DECLARE SUB Nave2T (text$)
DECLARE SUB Nave1T (text$)
DECLARE SUB Nave1 (text$)
DECLARE SUB Nave1C (text$)
DECLARE SUB Nave2C (text$)
DECLARE SUB Nave2 (text$)
DECLARE SUB fase3 (text$)
DECLARE SUB fase1 (text$)
DECLARE SUB fase2 (text$)
DECLARE SUB entrada (text$)
DECLARE SUB jogo (text$)

TYPE inimigo
 PremioPh AS INTEGER
 PremioPv AS INTEGER
 PremioB AS INTEGER
 Premio AS INTEGER
 Perde AS INTEGER
 Vida AS INTEGER
 Posv AS INTEGER
 Posh AS INTEGER
 Tiro AS INTEGER
 defe AS INTEGER
 velo AS INTEGER
 Dire AS INTEGER
 Piscar AS INTEGER
 Explode AS INTEGER
 Tiroph AS INTEGER
 TiroPv AS INTEGER
 Morre AS INTEGER
END TYPE

TYPE SuaNave
 Dinheiro AS INTEGER
 Explode AS INTEGER
 Life AS INTEGER
 Dire AS INTEGER
 PerdeA AS INTEGER
 Piscar AS INTEGER
 Posv AS INTEGER
 Posh AS INTEGER
 Tiro AS INTEGER
 defe AS INTEGER
 BomA AS INTEGER
 BomB AS INTEGER
 velo AS INTEGER
 Tiroph AS INTEGER
 TiroPv AS INTEGER
 Vidas AS INTEGER
END TYPE

DIM SHARED ColocaVida
DIM SHARED Part
DIM SHARED inimigos
DIM SHARED NaveI(1 TO 6) AS inimigo
DIM SHARED Nave(1 TO 2) AS SuaNave
DIM SHARED fase
DIM SHARED Tiro
DIM SHARED NaveS(300)
DIM SHARED NaveSP(300)
DIM SHARED NaveI1(300)
DIM SHARED NaveI2(300)
DIM SHARED NaveI3(300)
DIM SHARED Tiro1(100)
DIM SHARED Explosao(600)
DIM SHARED TiroI1(100)
DIM SHARED Premio(300)
DIM SHARED Vidas(150)
DIM SHARED Premio2(300)
DIM SHARED Acabar

FOR i = 1 TO 2

Part = 1        'em q parte da fase come‡a.
fase = 1
NaveI(1).Posh = 50
NaveI(1).Posv = 40
NaveI(1).Dire = 1
NaveI(2).Posh = 100
NaveI(2).Posv = 20
NaveI(2).Dire = 2
Nave(i).Vidas = 3
Nave(i).Tiro = 1
Nave(i).Posh = 100
Nave(i).Posv = 160
Nave(i).velo = 1
Nave(i).Vidas = 3

NEXT i

Nave1 ""
Nave2 ""
Menu ""
jogo ""

SUB Acaba (text$)

 IF Nave(1).Posh < 100 THEN Nave(1).Posh = Nave(1).Posh + 1
 IF Nave(1).Posh > 100 THEN Nave(1).Posh = Nave(1).Posh - 1
 IF Nave(1).Posh = 100 THEN Nave(1).Posv = Nave(1).Posv - 3
 IF Nave(1).Posv < 10 THEN
 Acabar = 2
 Part = 1
 END IF

END SUB

SUB entrada (text$)
END SUB

SUB fase1 (text$)

RANDOMIZE TIMER

CLS
1.01 :
LINE (40, 10)-(240, 185), 1, B
LOCATE 11, 8: COLOR 10: PRINT "Zona 1: The Big Bang"
SLEEP 1
LOCATE 13, 8: COLOR 14: PRINT "Fase 1"
SLEEP 2
LOCATE 15, 8: COLOR 40: PRINT "Boa Sorte!"
SLEEP 1

1.001 : CLS

NaveI(3).Explode = 50

FOR a = 1 TO 3
NaveI(a).Tiro = 1
NaveI(a).Vida = 1
Nave(1).Life = 33
NEXT a
inimigos = 2
ColocaVida = 2
Life ""

LINE (40, 10)-(240, 185), 1, B

1 :

IF Part = 1 THEN
  IF inimigos < 0 THEN inimigos = 0
  IF inimigos = 0 THEN
   NaveI(1).Morre = 0
   Part = 2: inimigos = 2: NaveI(1).Vida = 1: NaveI(1).Tiro = 1
   NaveI(2).Tiro = 1: NaveI(2).Vida = 1: NaveI(1).Posv = 70
   NaveI(2).Explode = 0: NaveI(1).Explode = 0
   NaveI(1).Dire = 1: NaveI(2).Dire = 2: NaveI(2).Morre = 0
   NaveI(2).Posv = 50: NaveI(1).PremioB = 0: NaveI(2).PremioB = 0
   CLS
   LINE (40, 10)-(240, 185), 1, B
   ColocaVida = 2
   Life ""
  GOTO 1.11
  END IF
 Nave3C ""
 Nave2C ""
 Nave1C ""
 FOR i = 1 TO 3000: NEXT i
END IF
1.11 :

IF Part = 2 THEN
 IF inimigos < 0 THEN inimigos = 0
 IF inimigos = 0 THEN
   NaveI(1).Morre = 0
   Part = 3: inimigos = 3: NaveI(1).Vida = 1: NaveI(1).Tiro = 1
   NaveI(2).Tiro = 1: NaveI(2).Vida = 1: NaveI(1).Posv = 40
   NaveI(2).Explode = 0: NaveI(1).Explode = 0
   NaveI(1).Dire = 2: NaveI(2).Dire = 1: NaveI(2).Morre = 0
   NaveI(2).Posv = 20: NaveI(1).PremioB = 0
   NaveI(3).Posv = 60: NaveI(3).Posh = 60: NaveI(3).Explode = 0: NaveI(3).Vida = 1: NaveI(3).Tiro = 1: NaveI(3).Dire = 2
   Nave(1).Tiroph = 0: NaveI(2).PremioB = 0
   CLS
   LINE (40, 10)-(240, 185), 1, B
   ColocaVida = 2
   Life ""
   GOTO 1.12
 END IF
 Nave3C ""
 Nave2C ""
 Nave1C ""
 FOR i = 1 TO 3000: NEXT i
END IF

1.12 :
  IF Part = 3 THEN
IF inimigos < 0 THEN inimigos = 0
 IF inimigos = 0 THEN
   NaveI(1).Morre = 0
   Part = 4: inimigos = 3: NaveI(1).Vida = 1: NaveI(1).Tiro = 1
   NaveI(2).Tiro = 1: NaveI(2).Vida = 1: NaveI(1).Posv = 20
   NaveI(2).Explode = 0: NaveI(1).Explode = 0
   NaveI(1).Dire = 2: NaveI(2).Dire = 1: NaveI(2).Morre = 0
   NaveI(2).Posv = 60: NaveI(1).PremioB = 0
   NaveI(3).Posv = 80: NaveI(3).Posh = 140: NaveI(3).Explode = 0: NaveI(3).Vida = 1: NaveI(3).Tiro = 1: NaveI(3).Dire = 2
   Nave(1).Tiroph = 0: NaveI(2).PremioB = 0
  CLS
  LINE (40, 10)-(240, 185), 1, B
  ColocaVida = 2
  Life ""
  GOTO 1.12
 END IF
 Nave4C ""
 Nave3C ""
 Nave2C ""
 Nave1C ""
 FOR i = 1 TO 3000: NEXT i
END IF

IF Part = 4 THEN
 IF inimigos < 0 THEN inimigos = 0
 IF inimigos = 0 THEN
   NaveI(1).Morre = 0
   Part = 5: inimigos = 2: NaveI(1).Vida = 1: NaveI(1).Tiro = 1
   NaveI(1).Posv = 40
   NaveI(1).Explode = 0
   NaveI(1).Dire = 2
   NaveI(1).PremioB = 0
   NaveI(3).Posv = 60: NaveI(3).Posh = 60: NaveI(3).Explode = 0: NaveI(3).Vida = 1: NaveI(3).Tiro = 1: NaveI(3).Dire = 2
   Nave(1).Tiroph = 0
   CLS
   LINE (40, 10)-(240, 185), 1, B
   ColocaVida = 2
   Life ""
   GOTO 1.12
 END IF
 Nave4C ""
 Nave3C ""
 Nave2C ""
 Nave1C ""
 FOR i = 1 TO 3000: NEXT i
END IF

IF Part = 5 THEN
 IF inimigos < 0 THEN inimigos = 0
 IF inimigos = 0 THEN
 Acabar = 1
 Acaba ""
 END IF
 IF Acabar <> 1 THEN
 Nave4C ""
 Nave2C ""
 END IF
 Nave1C ""
 IF Acabar = 2 THEN
  Acabar = 0
  GOTO Fim1
 END IF
 FOR i = 1 TO 3000: NEXT i
END IF


IF NaveI(1).Explode <> 50 THEN
PUT (NaveI(1).Posh, NaveI(1).Posv), NaveI1
END IF
IF NaveI(2).Explode <> 50 THEN
PUT (NaveI(2).Posh, NaveI(2).Posv), NaveI2
END IF
IF NaveI(3).Explode <> 50 THEN
PUT (NaveI(3).Posh, NaveI(3).Posv), NaveI3
END IF

1.1 :

IF Nave(1).Explode <> 50 AND Nave(1).Life > 0 THEN
IF Nave(1).Piscar = 1 OR Nave(1).Piscar = 5 OR Nave(1).Piscar = 10 THEN
PUT (Nave(1).Posh, Nave(1).Posv), NaveSP
GOTO 1.2
END IF
PUT (Nave(1).Posh, Nave(1).Posv), NaveS
END IF

1.2 :

IF NaveI(1).Explode = 50 THEN
 IF NaveI(1).Morre = 0 THEN
  IF NaveI(1).Premio = 2 OR NaveI(1).Premio = 4 OR NaveI(1).Premio = 5 OR NaveI(1).Premio = 6 OR NaveI(1).Premio = 7 OR NaveI(1).Premio = 8 THEN
   PUT (NaveI(1).PremioPh, NaveI(1).PremioPv), Premio
  END IF
  IF NaveI(1).Premio = 9 OR NaveI(1).Premio = 10 THEN
   PUT (NaveI(1).PremioPh, NaveI(1).PremioPv), Premio2
  END IF
 END IF
END IF

IF NaveI(2).Explode = 50 THEN
 IF NaveI(2).Morre = 0 THEN
  IF NaveI(2).Premio = 2 OR NaveI(2).Premio = 4 OR NaveI(2).Premio = 5 OR NaveI(2).Premio = 6 OR NaveI(2).Premio = 7 OR NaveI(2).Premio = 8 THEN
   PUT (NaveI(2).PremioPh, NaveI(2).PremioPv), Premio
  END IF
  IF NaveI(2).Premio = 9 OR NaveI(2).Premio = 10 THEN
   PUT (NaveI(2).PremioPh, NaveI(2).PremioPv), Premio2
  END IF
 END IF
END IF



IF Tiro = 2 THEN
 IF Nave(1).Explode <> 50 THEN
  IF Nave(1).Tiro = 1 THEN
   PUT (Nave(1).Tiroph, Nave(1).TiroPv), Tiro1
  END IF
  IF Nave(1).Tiro = 2 THEN
   PUT (Nave(1).Tiroph - 4, Nave(1).TiroPv), Tiro1
   PUT (Nave(1).Tiroph + 4, Nave(1).TiroPv), Tiro1
  END IF
  IF Nave(1).Tiro = 3 THEN
   PUT (Nave(1).Tiroph - 4, Nave(1).TiroPv), Tiro1
   PUT (Nave(1).Tiroph + 4, Nave(1).TiroPv), Tiro1
   PUT (Nave(1).Tiroph + 12, Nave(1).TiroPv), Tiro1
  END IF
 END IF
END IF

FOR a = 1 TO 2
IF NaveI(a).Vida <> 0 THEN
 IF NaveI(a).Tiro = 2 THEN
 PUT (NaveI(a).Tiroph, NaveI(a).TiroPv), TiroI1
 END IF
END IF
NEXT a

IF NaveI(3).Vida <> 0 THEN
 IF NaveI(3).Tiro = 2 THEN
PUT (NaveI(3).Tiroph - 8, NaveI(3).TiroPv), TiroI1
PUT (NaveI(3).Tiroph + 4, NaveI(3).TiroPv), TiroI1
 END IF
END IF

IF Tiro = 2 THEN Nave1T ""

IF Nave(1).Vidas > 0 THEN
SELECT CASE INKEY$
CASE "T", "t": END
CASE CHR$(0) + "K": IF Nave(1).Life > -1 THEN Nave(1).Dire = 2
CASE CHR$(0) + "M": IF Nave(1).Life > -1 THEN Nave(1).Dire = 1
CASE CHR$(0) + "P": IF Nave(1).Life > -1 THEN Nave(1).Dire = 0
CASE "Z", "z":
IF Tiro <> 2 THEN
IF Nave(1).Explode <> 50 THEN
Tiro = 1: Nave1T ""
END IF
END IF
END SELECT
END IF

IF Nave(1).Vidas < 1 THEN
 LOCATE 11, 10: COLOR 40: PRINT "Game Over"
SELECT CASE INKEY$
 CASE "Z", "z": Nave(1).Vidas = 3: Menu ""
END SELECT
END IF

GOTO 1

Fim1:

END SUB

SUB fase2 (text$)

CLS
2.01 :
LINE (40, 10)-(240, 185), 1, B
LOCATE 11, 8: COLOR 10: PRINT "Zona 1: The Big Bang"
SLEEP 1
LOCATE 13, 8: COLOR 14: PRINT "Fase 2"
SLEEP 2
LOCATE 15, 8: COLOR 40: PRINT "Boa Sorte!"
SLEEP 1

2.001 : CLS

NaveI(3).Explode = 50

FOR a = 1 TO 3
NaveI(a).Tiro = 1
NaveI(a).Vida = 1
NaveI(1).Explode = 0
NaveI(2).Explode = 0
Nave(1).Posh = 100
Nave(1).Posv = 160
NEXT a
inimigos = 2
ColocaVida = 2
Life ""

LINE (40, 10)-(240, 185), 1, B

2 :

LOCATE 3, 1: PRINT Part

IF Part = 1 THEN
  IF inimigos < 0 THEN inimigos = 0
  IF inimigos = 0 THEN
   NaveI(1).Morre = 0
   Part = 2: inimigos = 2: NaveI(1).Vida = 1: NaveI(1).Tiro = 1
   NaveI(2).Tiro = 1: NaveI(2).Vida = 1: NaveI(1).Posv = 70
   NaveI(2).Explode = 0: NaveI(1).Explode = 0
   NaveI(1).Dire = 1: NaveI(2).Dire = 2: NaveI(2).Morre = 0
   NaveI(2).Posv = 50: NaveI(1).PremioB = 0: NaveI(2).PremioB = 0
   CLS
   LINE (40, 10)-(240, 185), 1, B
   ColocaVida = 2
   Life ""
  GOTO 2.11
  END IF
 Nave3C ""
 Nave2C ""
 Nave1C ""
 FOR i = 1 TO 3000: NEXT i
END IF
2.11 :

IF Part = 2 THEN
 IF inimigos < 0 THEN inimigos = 0
 IF inimigos = 0 THEN
   NaveI(1).Morre = 0
   Part = 3: inimigos = 3: NaveI(1).Vida = 1: NaveI(1).Tiro = 1
   NaveI(2).Tiro = 1: NaveI(2).Vida = 1: NaveI(1).Posv = 40
   NaveI(2).Explode = 0: NaveI(1).Explode = 0
   NaveI(1).Dire = 2: NaveI(2).Dire = 1: NaveI(2).Morre = 0
   NaveI(2).Posv = 20: NaveI(1).PremioB = 0
   NaveI(3).Posv = 60: NaveI(3).Posh = 60: NaveI(3).Explode = 0: NaveI(3).Vida = 1: NaveI(3).Tiro = 1: NaveI(3).Dire = 2
   Nave(1).Tiroph = 0: NaveI(2).PremioB = 0
   CLS
   LINE (40, 10)-(240, 185), 1, B
   ColocaVida = 2
   Life ""
   GOTO 2.12
 END IF
 Nave3C ""
 Nave2C ""
 Nave1C ""
 FOR i = 1 TO 3000: NEXT i
END IF

2.12 :
  IF Part = 3 THEN
IF inimigos < 0 THEN inimigos = 0
 IF inimigos = 0 THEN
   NaveI(1).Morre = 0
   Part = 4: inimigos = 3: NaveI(1).Vida = 1: NaveI(1).Tiro = 1
   NaveI(2).Tiro = 1: NaveI(2).Vida = 1: NaveI(1).Posv = 20
   NaveI(2).Explode = 0: NaveI(1).Explode = 0
   NaveI(1).Dire = 2: NaveI(2).Dire = 1: NaveI(2).Morre = 0
   NaveI(2).Posv = 60: NaveI(1).PremioB = 0
   NaveI(3).Posv = 80: NaveI(3).Posh = 140: NaveI(3).Explode = 0: NaveI(3).Vida = 1: NaveI(3).Tiro = 1: NaveI(3).Dire = 2
   Nave(1).Tiroph = 0: NaveI(2).PremioB = 0
  CLS
  LINE (40, 10)-(240, 185), 1, B
  ColocaVida = 2
  Life ""
  GOTO 2.12
 END IF
 Nave4C ""
 Nave3C ""
 Nave2C ""
 Nave1C ""
 FOR i = 1 TO 3000: NEXT i
END IF

IF Part = 4 THEN
 IF inimigos < 0 THEN inimigos = 0
 IF inimigos = 0 THEN
   NaveI(1).Morre = 0
   Part = 5: inimigos = 2: NaveI(1).Vida = 1: NaveI(1).Tiro = 1
   NaveI(1).Posv = 40
   NaveI(1).Explode = 0
   NaveI(1).Dire = 2
   NaveI(1).PremioB = 0
   NaveI(3).Posv = 60: NaveI(3).Posh = 60: NaveI(3).Explode = 0: NaveI(3).Vida = 1: NaveI(3).Tiro = 1: NaveI(3).Dire = 2
   Nave(1).Tiroph = 0
   CLS
   LINE (40, 10)-(240, 185), 1, B
   ColocaVida = 2
   Life ""
   GOTO 2.12
 END IF
 Nave4C ""
 Nave3C ""
 Nave2C ""
 Nave1C ""
 FOR i = 1 TO 3000: NEXT i
END IF

IF Part = 5 THEN
 IF inimigos < 0 THEN inimigos = 0
 IF inimigos = 0 THEN
 Acabar = 1
 Acaba ""
 END IF
 IF Acabar <> 1 THEN
 Nave4C ""
 Nave2C ""
 END IF
 Nave1C ""
 IF Acabar = 2 THEN
  Acabar = 0
  GOTO Fim2
 END IF
 FOR i = 1 TO 3000: NEXT i
END IF


IF NaveI(1).Explode <> 50 THEN
PUT (NaveI(1).Posh, NaveI(1).Posv), NaveI1
END IF
IF NaveI(2).Explode <> 50 THEN
PUT (NaveI(2).Posh, NaveI(2).Posv), NaveI2
END IF
IF NaveI(3).Explode <> 50 THEN
PUT (NaveI(3).Posh, NaveI(3).Posv), NaveI3
END IF

21 :

IF Nave(1).Explode <> 50 AND Nave(1).Life > 0 THEN
IF Nave(1).Piscar = 1 OR Nave(1).Piscar = 5 OR Nave(1).Piscar = 10 THEN
PUT (Nave(1).Posh, Nave(1).Posv), NaveSP
GOTO 2.2
END IF
PUT (Nave(1).Posh, Nave(1).Posv), NaveS
END IF

2.2 :

IF NaveI(1).Explode = 50 THEN
 IF NaveI(1).Morre = 0 THEN
  IF NaveI(1).Premio = 2 OR NaveI(1).Premio = 4 OR NaveI(1).Premio = 5 OR NaveI(1).Premio = 6 OR NaveI(1).Premio = 7 OR NaveI(1).Premio = 8 THEN
   PUT (NaveI(1).PremioPh, NaveI(1).PremioPv), Premio
  END IF
  IF NaveI(1).Premio = 9 OR NaveI(1).Premio = 10 THEN
   PUT (NaveI(1).PremioPh, NaveI(1).PremioPv), Premio2
  END IF
 END IF
END IF

IF NaveI(2).Explode = 50 THEN
 IF NaveI(2).Morre = 0 THEN
  IF NaveI(2).Premio = 2 OR NaveI(2).Premio = 4 OR NaveI(2).Premio = 5 OR NaveI(2).Premio = 6 OR NaveI(2).Premio = 7 OR NaveI(2).Premio = 8 THEN
   PUT (NaveI(2).PremioPh, NaveI(2).PremioPv), Premio
  END IF
  IF NaveI(2).Premio = 9 OR NaveI(2).Premio = 10 THEN
   PUT (NaveI(2).PremioPh, NaveI(2).PremioPv), Premio2
  END IF
 END IF
END IF



IF Tiro = 2 THEN
 IF Nave(1).Explode <> 50 THEN
  IF Nave(1).Tiro = 1 THEN
   PUT (Nave(1).Tiroph, Nave(1).TiroPv), Tiro1
  END IF
  IF Nave(1).Tiro = 2 THEN
   PUT (Nave(1).Tiroph - 4, Nave(1).TiroPv), Tiro1
   PUT (Nave(1).Tiroph + 4, Nave(1).TiroPv), Tiro1
  END IF
  IF Nave(1).Tiro = 3 THEN
   PUT (Nave(1).Tiroph - 4, Nave(1).TiroPv), Tiro1
   PUT (Nave(1).Tiroph + 4, Nave(1).TiroPv), Tiro1
   PUT (Nave(1).Tiroph + 12, Nave(1).TiroPv), Tiro1
  END IF
 END IF
END IF

FOR a = 1 TO 2
IF NaveI(a).Vida <> 0 THEN
 IF NaveI(a).Tiro = 2 THEN
 PUT (NaveI(a).Tiroph, NaveI(a).TiroPv), TiroI1
 END IF
END IF
NEXT a

IF NaveI(3).Vida <> 0 THEN
 IF NaveI(3).Tiro = 2 THEN
PUT (NaveI(3).Tiroph - 8, NaveI(3).TiroPv), TiroI1
PUT (NaveI(3).Tiroph + 4, NaveI(3).TiroPv), TiroI1
 END IF
END IF

IF Tiro = 2 THEN Nave1T ""

IF Nave(1).Vidas > 0 THEN
SELECT CASE INKEY$
CASE "T", "t": END
CASE CHR$(0) + "K": IF Nave(1).Life > -1 THEN Nave(1).Dire = 2
CASE CHR$(0) + "M": IF Nave(1).Life > -1 THEN Nave(1).Dire = 1
CASE CHR$(0) + "P": IF Nave(1).Life > -1 THEN Nave(1).Dire = 0
CASE "Z", "z":
IF Tiro <> 2 THEN
IF Nave(1).Explode <> 50 THEN
Tiro = 1: Nave1T ""
END IF
END IF
END SELECT
END IF

IF Nave(1).Vidas < 1 THEN
 LOCATE 11, 10: COLOR 40: PRINT "Game Over"
SELECT CASE INKEY$
 CASE "Z", "z": Nave(1).Vidas = 3: Menu ""
END SELECT
END IF

GOTO 2

Fim2:


END SUB

SUB fase3 (text$)
END SUB

SUB jogo (text$)

IF fase = 1 THEN
FOR i = 1 TO 2
Nave(i).Tiro = 1
Nave(i).defe = 1
Nave(i).velo = 1
NEXT i
fase1 ""
END IF

IF fase = 2 THEN fase2 ""
IF fase = 3 THEN fase3 ""

END SUB

SUB Life (text$)

FOR i = 180 TO 180 - (40 * 5) STEP -5
 LINE (245, i)-(250, i), 0
NEXT i

FOR i = 180 TO 180 - (Nave(1).Life * 5) STEP -5
 LINE (245, i)-(250, i), 42
NEXT i

IF Nave(1).Life < 0 THEN
Nave(1).Dire = 0
END IF

LOCATE 23, 33: COLOR 45: PRINT Nave(1).Dinheiro

IF ColocaVida = 1 THEN
FOR i = 5 TO ((Nave(1).Vidas + 1) * 10) STEP 10
PUT (1, i), Vidas
NEXT i

FOR i = 5 TO (Nave(1).Vidas * 10) STEP 10
PUT (1, i), Vidas
NEXT i
ColocaVida = 0
END IF

IF ColocaVida = 2 THEN
FOR i = 5 TO (Nave(1).Vidas * 10) STEP 10
PUT (1, i), Vidas
NEXT i
ColocaVida = 0
END IF

END SUB

SUB Menu (text$)


DIM flecha
DIM anima
DIM muda

CLS

muda = 1
flecha = 1
anima = 1

LOCATE 10, 10
COLOR 9: PRINT "Novo Jogo"
LOCATE 11, 10: PRINT "Jogo Salvo"
LOCATE 12, 10: PRINT "Recordes"
LOCATE 13, 10: PRINT "Instru‡äes"
COLOR 4
LOCATE 14, 10: PRINT "Sair"
LOCATE 19, 10: COLOR 53: PRINT "Z = Enter"

0.01 :
FOR i = 1 TO 30000: NEXT i

SELECT CASE INKEY$
 CASE CHR$(0) + "H": IF flecha <> 1 THEN flecha = flecha - 1
 CASE CHR$(0) + "P": IF flecha <> 5 THEN flecha = flecha + 1
 CASE "Q", "q": END
 CASE "Z", "z"
  IF flecha = 1 THEN GOTO jogar
  IF flecha = 2 THEN GOTO abri
  IF flecha = 3 THEN GOTO record
  IF flecha = 4 THEN GOTO inst
  IF flecha = 5 THEN GOTO fim
END SELECT

IF anima = 1 THEN anima = 2: GOTO 0.02
IF anima = 2 THEN anima = 1: GOTO 0.02
0.02 :

IF flecha = 1 THEN
 LOCATE 11, 5: COLOR 0: PRINT "   "
 IF anima = 1 THEN LOCATE 10, 5: COLOR 0: PRINT "   ": LOCATE 10, 5: COLOR 39: PRINT "->"
 IF anima = 2 THEN LOCATE 10, 5: COLOR 0: PRINT "   ": LOCATE 10, 5: COLOR 39: PRINT "-->"
ELSEIF flecha = 2 THEN
 LOCATE 10, 5: COLOR 0: PRINT "   ": LOCATE 12, 5: PRINT "   "
 IF anima = 1 THEN LOCATE 11, 5: COLOR 0: PRINT "   ": LOCATE 11, 5: COLOR 39: PRINT "->"
 IF anima = 2 THEN LOCATE 11, 5: COLOR 0: PRINT "   ": LOCATE 11, 5: COLOR 39: PRINT "-->"
ELSEIF flecha = 3 THEN
 LOCATE 11, 5: COLOR 0: PRINT "   ": LOCATE 13, 5: PRINT "   "
 IF anima = 1 THEN LOCATE 12, 5: COLOR 0: PRINT "   ": LOCATE 12, 5: COLOR 39: PRINT "->"
 IF anima = 2 THEN LOCATE 12, 5: COLOR 0: PRINT "   ": LOCATE 12, 5: COLOR 39: PRINT "-->"
ELSEIF flecha = 4 THEN
 LOCATE 12, 5: COLOR 0: PRINT "   ": LOCATE 14, 5: PRINT "   "
 IF anima = 1 THEN LOCATE 13, 5: COLOR 0: PRINT "   ": LOCATE 13, 5: COLOR 39: PRINT "->"
 IF anima = 2 THEN LOCATE 13, 5: COLOR 0: PRINT "   ": LOCATE 13, 5: COLOR 39: PRINT "-->"
ELSEIF flecha = 5 THEN
 LOCATE 13, 5: COLOR 0: PRINT "   "
 IF anima = 1 THEN LOCATE 14, 5: COLOR 0: PRINT "   ": LOCATE 14, 5: COLOR 39: PRINT "->"
 IF anima = 2 THEN LOCATE 14, 5: COLOR 0: PRINT "   ": LOCATE 14, 5: COLOR 39: PRINT "-->"
END IF



GOTO 0.01

jogar: fase1 ""
       fase2 ""

abri:
GOTO 0.01
record:
GOTO 0.01
inst:
GOTO 0.01
fim: END

END SUB

SUB Nave1 (text$)

SCREEN 13

 LINE (10, 20)-(10, 15), 15
 LINE (9, 17)-(9, 20), 15
 LINE (11, 17)-(11, 20), 15
 LINE (12, 17)-(12, 20), 15
 LINE (13, 15)-(13, 20), 15
 LINE (14, 13)-(14, 20), 15
 LINE (15, 10)-(15, 20), 15
 LINE (16, 10)-(16, 20), 15

 LINE (17, 9)-(17, 20), 15

 LINE (18, 10)-(18, 20), 15
 LINE (19, 10)-(19, 20), 15
 LINE (20, 13)-(20, 20), 15
 LINE (21, 15)-(21, 20), 15
 LINE (22, 17)-(22, 20), 15
 LINE (23, 17)-(23, 20), 15
 LINE (24, 15)-(24, 20), 15
 LINE (25, 20)-(25, 17), 15

 LINE (15, 10)-(19, 10), 9

GET (1, 1)-(27, 21), NaveS
CLS

END SUB

SUB Nave1C (text$)

IF Nave(1).Explode = 50 THEN
LOCATE 1, 10: PRINT "Aperte Z at‚ vocˆ voltar."
SELECT CASE INKEY$
CASE "Z", "z": Nave(1).Explode = 0
 PUT (Nave(1).Posh, Nave(1).Posv), NaveS
 Nave(1).Life = 33
 ColocaVida = 1
 LOCATE 1, 10: COLOR 0: PRINT "                          "
 Life ""
END SELECT
GOTO 3.3
END IF

IF Nave(1).Dire = 1 THEN Nave(1).Posh = Nave(1).Posh + Nave(1).velo
IF Nave(1).Dire = 2 THEN Nave(1).Posh = Nave(1).Posh - Nave(1).velo

IF Nave(1).PerdeA = 1 THEN
 Nave(1).Piscar = Nave(1).Piscar + 1
 IF Nave(1).Piscar = 1 OR Nave(1).Piscar = 5 OR Nave(1).Piscar = 10 THEN
 PUT (Nave(1).Posh, Nave(1).Posv), NaveSP
 GOTO 3.1
 END IF
 IF Nave(1).Piscar = 11 THEN Nave(1).PerdeA = 0
END IF

PUT (Nave(1).Posh, Nave(1).Posv), NaveS

FOR i = Nave(1).Posh + 8 TO Nave(1).Posh + 23
IF POINT(i, Nave(1).Posv - 1) = 40 THEN
Nave(1).Life = Nave(1).Life - 1
Life ""
END IF
NEXT i

IF Nave(1).Life < 0 THEN
    Nave(1).Dire = 0
 IF Nave(1).Explode = 50 THEN
    GOTO 3.3
 END IF
 IF Nave(1).Life < 0 THEN
  IF Nave(1).Explode = 0 THEN
   PUT (Nave(1).Posh, Nave(1).Posv), NaveS
   PUT (Nave(1).Tiroph, Nave(1).TiroPv), Tiro1
   Nave(1).Explode = 1
  ELSE
   Nave(1).Explode = Nave(1).Explode + 1
    IF Nave(1).Explode = 2 THEN
   PUT (Nave(1).Posh - 4, Nave(1).Posv), Explosao
    END IF
    IF Nave(1).Explode = 8 THEN
   PUT (Nave(1).Posh - 4, Nave(1).Posv), Explosao
    END IF
    IF Nave(1).Explode = 14 THEN
   PUT (Nave(1).Posh - 7, Nave(1).Posv - 4), Explosao
    END IF
    IF Nave(1).Explode = 19 THEN
   PUT (Nave(1).Posh - 7, Nave(1).Posv - 4), Explosao
    END IF
    IF Nave(1).Explode = 28 THEN
   PUT (Nave(1).Posh + 7, Nave(1).Posv - 2), Explosao
    END IF
    IF Nave(1).Explode = 35 THEN
   PUT (Nave(1).Posh + 7, Nave(1).Posv - 2), Explosao
    Nave(1).Explode = 50: Nave(1).Vidas = Nave(1).Vidas - 1
    END IF
    END IF
 END IF

END IF

3.1 :

IF Nave(1).Posh < 10 THEN Nave(1).Dire = 0: Nave(1).Posh = 10
IF Nave(1).Posh > 190 THEN Nave(1).Dire = 0: Nave(1).Posh = 190

3.3 :

END SUB

SUB Nave1T (text$)

IF Tiro = 1 THEN
Tiro = 2
Nave(1).Tiroph = Nave(1).Posh + 10
Nave(1).TiroPv = Nave(1).Posv - 4
END IF

Nave(1).TiroPv = Nave(1).TiroPv - 3

IF Nave(1).Tiro = 1 THEN
 PUT (Nave(1).Tiroph, Nave(1).TiroPv), Tiro1
END IF

IF Nave(1).Tiro = 2 THEN
 PUT (Nave(1).Tiroph - 4, Nave(1).TiroPv), Tiro1
 PUT (Nave(1).Tiroph + 4, Nave(1).TiroPv), Tiro1
END IF

IF Nave(1).Tiro = 3 THEN
  PUT (Nave(1).Tiroph - 4, Nave(1).TiroPv), Tiro1
  PUT (Nave(1).Tiroph + 4, Nave(1).TiroPv), Tiro1
  PUT (Nave(1).Tiroph + 12, Nave(1).TiroPv), Tiro1
END IF


IF Nave(1).TiroPv < 11 THEN
 IF Nave(1).Tiro = 1 THEN
  PUT (Nave(1).Tiroph, Nave(1).TiroPv), Tiro1
 ELSEIF Nave(1).Tiro = 2 THEN
  PUT (Nave(1).Tiroph - 4, Nave(1).TiroPv), Tiro1
  PUT (Nave(1).Tiroph + 4, Nave(1).TiroPv), Tiro1
 ELSEIF Nave(1).Tiro = 3 THEN
  PUT (Nave(1).Tiroph - 4, Nave(1).TiroPv), Tiro1
  PUT (Nave(1).Tiroph + 4, Nave(1).TiroPv), Tiro1
  PUT (Nave(1).Tiroph + 12, Nave(1).TiroPv), Tiro1
 END IF
Tiro = 0
END IF




END SUB

SUB Nave2 (text$)

LINE (5, 5)-(5, 10), 2
LINE (6, 5)-(6, 10), 2
FOR i = 5 TO 7
LINE (5, i)-(20, i), 2
NEXT i
LINE (21, 5)-(21, 10), 2
LINE (22, 5)-(22, 10), 2
LINE (13, 5)-(13, 15), 2
LINE (14, 5)-(14, 15), 2
LINE (12, 5)-(12, 13), 2
LINE (15, 5)-(15, 13), 2

GET (1, 1)-(27, 21), NaveI1

CLS

LINE (2, 2)-(5, 10), 53, BF

GET (1, 1)-(6, 11), Tiro1

CLS

FOR i = 2 TO 15 STEP 3
FOR k = 4 TO 15 STEP 3

CIRCLE (16, 16), i, 40
CIRCLE (16, 16), k, 42

NEXT k
NEXT i

GET (1, 1)-(35, 35), Explosao

CLS

LINE (2, 2)-(5, 10), 40, BF

GET (1, 1)-(6, 11), TiroI1

CLS

LINE (2, 2)-(2, 4), 4
LINE (3, 2)-(3, 5), 4
LINE (4, 2)-(4, 6), 4
LINE (5, 2)-(5, 7), 4
LINE (6, 2)-(6, 8), 4
LINE (7, 2)-(7, 10), 4
FOR i = 8 TO 10
LINE (i, 2)-(i, 14), 4
NEXT
LINE (9, 11)-(9, 18), 4
LINE (11, 2)-(11, 10), 4
LINE (12, 2)-(12, 8), 4
LINE (13, 2)-(13, 7), 4
LINE (14, 2)-(14, 6), 4
LINE (15, 2)-(15, 5), 4
LINE (16, 2)-(16, 4), 4

GET (1, 1)-(19, 19), NaveI2

CLS

LINE (2, 8)-(2, 15), 15
LINE (3, 8)-(3, 15), 15
LINE (4, 8)-(4, 12), 15
FOR i = 1 TO 5
CIRCLE (10, 8), i, 9
NEXT i
LINE (16, 8)-(16, 12), 15
LINE (17, 8)-(17, 15), 15
LINE (18, 8)-(18, 15), 15
LINE (8, 5)-(8, 12), 9
LINE (12, 5)-(12, 12), 9

GET (1, 1)-(19, 19), NaveI3

CLS

CIRCLE (11, 11), 7, 14
LOCATE 2, 2: PRINT "$"

GET (1, 1)-(20, 20), Premio

CLS

CIRCLE (12, 11), 8, 55
LOCATE 2, 2: PRINT "T"

GET (1, 1)-(21, 21), Premio2

LINE (5, 5)-(15, 5), 15
LINE (5, 4)-(15, 4), 15
LINE (6, 3)-(6, 3), 15
LINE (14, 3)-(14, 3), 15
LINE (9, 3)-(11, 3), 15
LINE (9, 2)-(11, 2), 15
LINE (10, 1)-(10, 1), 9

GET (1, 1)-(16, 6), Vidas

END SUB

SUB Nave2C (text$)

IF NaveI(1).Explode = 50 THEN GOTO 2.3

IF NaveI(1).Vida <> 0 THEN

IF NaveI(1).Dire = 1 THEN NaveI(1).Posh = NaveI(1).Posh + 1
IF NaveI(1).Dire = 2 THEN NaveI(1).Posh = NaveI(1).Posh - 1

PUT (NaveI(1).Posh, NaveI(1).Posv), NaveI1

Nave2T ""

FOR i = NaveI(1).Posh + 5 TO NaveI(1).Posh + 15
IF POINT(i, NaveI(1).Posv + 15) = 53 THEN
NaveI(1).Vida = 0
Sortear = INT(RND * 10) + 1
NaveI(1).Premio = Sortear
END IF
NEXT i

ELSE
 IF NaveI(1).Explode = 50 THEN
    GOTO 2.3
 END IF
 IF NaveI(1).Vida = 0 THEN
  IF NaveI(1).Explode = 0 THEN
   PUT (NaveI(1).Posh, NaveI(1).Posv), NaveI1
   PUT (NaveI(1).Tiroph, NaveI(1).TiroPv), TiroI1
   NaveI(1).Explode = 1
  ELSE
   NaveI(1).Explode = NaveI(1).Explode + 1
    IF NaveI(1).Explode = 2 THEN
   PUT (NaveI(1).Posh - 4, NaveI(1).Posv), Explosao: NaveI(1).Explode = 2
    END IF
    IF NaveI(1).Explode = 20 THEN
   PUT (NaveI(1).Posh - 4, NaveI(1).Posv), Explosao: NaveI(1).Explode = 2
    NaveI(1).Explode = 50      'explode = 50 : A Nave morreu
    END IF
   END IF
 END IF
END IF


2.1 :

IF NaveI(1).Posh < 50 THEN NaveI(1).Dire = 1
IF NaveI(1).Posh > 100 THEN NaveI(1).Dire = 2

IF NaveI(1).Explode <> 50 THEN GOTO 2.4

2.3 :
      IF NaveI(1).Morre = 1 THEN
       IF NaveI(1).PremioB = 3 THEN
        IF NaveI(1).Premio = 2 OR NaveI(1).Premio = 4 OR NaveI(1).Premio = 5 OR NaveI(1).Premio = 6 OR NaveI(1).Premio = 7 OR NaveI(1).Premio = 8 THEN
         PUT (NaveI(1).PremioPh, NaveI(1).PremioPv), Premio
        ELSEIF NaveI(1).Premio = 9 OR NaveI(1).Premio = 10 THEN
          PUT (NaveI(1).PremioPh, NaveI(1).PremioPv), Premio2
        END IF
        NaveI(1).PremioB = 0
        NaveI(1).PremioPv = 0
       END IF
      GOTO 2.4
      END IF

      IF NaveI(1).PremioPv > 170 THEN NaveI(1).Morre = 1: NaveI(1).PremioB = 3: inimigos = inimios - 1
     
      IF NaveI(1).Premio = 1 OR NaveI(1).Premio = 3 THEN
       NaveI(1).Morre = 1: NaveI(1).PremioB = 3: inimigos = inimigos - 1
      END IF
     
      IF NaveI(1).Premio = 2 OR NaveI(1).Premio = 4 THEN
        IF NaveI(1).PremioB = 0 THEN
         NaveI(1).PremioB = 1
         NaveI(1).PremioPh = NaveI(1).Posh
         NaveI(1).PremioPv = NaveI(1).Posv + 4
        END IF
       NaveI(1).PremioPv = NaveI(1).PremioPv + 2
       PUT (NaveI(1).PremioPh, NaveI(1).PremioPv), Premio
       IF NaveI(1).PremioPh > Nave(1).Posh - 5 AND NaveI(1).PremioPh < Nave(1).Posh + 20 THEN
        IF NaveI(1).PremioPv = Nave(1).Posv OR NaveI(1).PremioPv = Nave(1).Posv + 1 THEN Nave(1).Dinheiro = Nave(1).Dinheiro + 100: NaveI(1).Morre = 1: NaveI(1).PremioB = 3: inimigos = inimigos - 1
        Life ""
       END IF
      END IF
     
      IF NaveI(1).Premio = 5 OR NaveI(1).Premio = 6 THEN
        IF NaveI(1).PremioB = 0 THEN
         NaveI(1).PremioB = 1
         NaveI(1).PremioPh = NaveI(1).Posh
         NaveI(1).PremioPv = NaveI(1).Posv + 4
        END IF
       NaveI(1).PremioPv = NaveI(1).PremioPv + 2
       PUT (NaveI(1).PremioPh, NaveI(1).PremioPv), Premio
       IF NaveI(1).PremioPh > Nave(1).Posh - 5 AND NaveI(1).PremioPh < Nave(1).Posh + 20 THEN
        IF NaveI(1).PremioPv = Nave(1).Posv OR NaveI(1).PremioPv = Nave(1).Posv + 1 THEN Nave(1).Dinheiro = Nave(1).Dinheiro + 200: NaveI(1).Morre = 1: NaveI(1).PremioB = 3: inimigos = inimigos - 1
        Life ""
       END IF
      END IF

      IF NaveI(1).Premio = 7 OR NaveI(1).Premio = 8 THEN
        IF NaveI(1).PremioB = 0 THEN
         NaveI(1).PremioB = 1
         NaveI(1).PremioPh = NaveI(1).Posh
         NaveI(1).PremioPv = NaveI(1).Posv + 4
        END IF
       NaveI(1).PremioPv = NaveI(1).PremioPv + 2
       PUT (NaveI(1).PremioPh, NaveI(1).PremioPv), Premio
       IF NaveI(1).PremioPh > Nave(1).Posh - 5 AND NaveI(1).PremioPh < Nave(1).Posh + 20 THEN
        IF NaveI(1).PremioPv = Nave(1).Posv OR NaveI(1).PremioPv = Nave(1).Posv + 1 THEN Nave(1).Dinheiro = Nave(1).Dinheiro + 500: NaveI(1).Morre = 1: NaveI(1).PremioB = 3: inimigos = inimigos - 1
        Life ""
       END IF
      END IF
      
      IF NaveI(1).Premio = 9 OR NaveI(1).Premio = 10 THEN
        IF NaveI(1).PremioB = 0 THEN
         NaveI(1).PremioB = 1
         NaveI(1).PremioPh = NaveI(1).Posh
         NaveI(1).PremioPv = NaveI(1).Posv + 4
        END IF
       NaveI(1).PremioPv = NaveI(1).PremioPv + 2
       PUT (NaveI(1).PremioPh, NaveI(1).PremioPv), Premio2
       IF NaveI(1).PremioPh > Nave(1).Posh - 5 AND NaveI(1).PremioPh < Nave(1).Posh + 20 THEN
        IF NaveI(1).PremioPv = Nave(1).Posv OR NaveI(1).PremioPv = Nave(1).Posv + 1 THEN
          NaveI(1).Morre = 1: NaveI(1).PremioB = 3
           IF Nave(1).Tiro <> 3 THEN Nave(1).Tiro = Nave(1).Tiro + 1
           inimigos = inimigos - 1
        Life ""
        END IF
       END IF
      END IF

      

2.4 :

END SUB

SUB Nave2T (text$)

IF NaveI(1).Tiro = 1 THEN
NaveI(1).Tiro = 2
NaveI(1).Tiroph = NaveI(1).Posh + 10
NaveI(1).TiroPv = NaveI(1).Posv + 4
END IF

NaveI(1).TiroPv = NaveI(1).TiroPv + 2

PUT (NaveI(1).Tiroph, NaveI(1).TiroPv), TiroI1

IF NaveI(1).TiroPv > 170 THEN
PUT (NaveI(1).Tiroph, NaveI(1).TiroPv), TiroI1
NaveI(1).Tiro = 1
END IF


END SUB

SUB Nave3C (text$)

IF NaveI(2).Explode = 50 THEN GOTO 8.3

IF NaveI(2).Vida <> 0 THEN

IF NaveI(2).Dire = 1 THEN NaveI(2).Posh = NaveI(2).Posh + 1
IF NaveI(2).Dire = 2 THEN NaveI(2).Posh = NaveI(2).Posh - 1

PUT (NaveI(2).Posh, NaveI(2).Posv), NaveI2

Nave3T ""

FOR i = NaveI(2).Posh + 5 TO NaveI(2).Posh + 15
IF POINT(i, NaveI(2).Posv + 15) = 53 THEN
NaveI(2).Vida = 0
Sortear = INT(RND * 10) + 1
NaveI(2).Premio = Sortear
END IF
NEXT i

ELSE
 IF NaveI(2).Explode = 50 THEN
    GOTO 8.3
 END IF
 IF NaveI(2).Vida = 0 THEN
  IF NaveI(2).Explode = 0 THEN
   PUT (NaveI(2).Posh, NaveI(2).Posv), NaveI2
   PUT (NaveI(2).Tiroph, NaveI(2).TiroPv), TiroI1
   NaveI(2).Explode = 1
  ELSE
   NaveI(2).Explode = NaveI(2).Explode + 1
    IF NaveI(2).Explode = 2 THEN
   PUT (NaveI(2).Posh - 4, NaveI(2).Posv), Explosao: NaveI(2).Explode = 2
    END IF
    IF NaveI(2).Explode = 20 THEN
   PUT (NaveI(2).Posh - 4, NaveI(2).Posv), Explosao: NaveI(2).Explode = 2
    NaveI(2).Explode = 50      'explode = 50 : A Nave morreu
    END IF
   END IF
 END IF
END IF


8.1 :

IF NaveI(2).Posh < 70 THEN NaveI(2).Dire = 1
IF NaveI(2).Posh > 140 THEN NaveI(2).Dire = 2

IF NaveI(2).Explode <> 50 THEN GOTO 8.4

8.3 : IF NaveI(2).Morre = 1 THEN
       IF NaveI(2).PremioB = 3 THEN
        IF NaveI(2).Premio = 2 OR NaveI(2).Premio = 4 OR NaveI(2).Premio = 5 OR NaveI(2).Premio = 6 OR NaveI(2).Premio = 7 OR NaveI(2).Premio = 8 THEN
         PUT (NaveI(2).PremioPh, NaveI(2).PremioPv), Premio
        ELSEIF NaveI(2).Premio = 9 OR NaveI(2).Premio = 10 THEN
          PUT (NaveI(2).PremioPh, NaveI(2).PremioPv), Premio2
        END IF
        NaveI(2).PremioB = 0
        NaveI(2).PremioPv = 0
       END IF
      GOTO 8.4
      END IF

      IF NaveI(2).PremioPv > 170 THEN NaveI(2).Morre = 1: NaveI(2).PremioB = 3: inimigos = inimios - 1
    
      IF NaveI(2).Premio = 1 OR NaveI(2).Premio = 3 THEN
       NaveI(2).Morre = 1: NaveI(2).PremioB = 3: inimigos = inimigos - 1
      END IF
    
      IF NaveI(2).Premio = 2 OR NaveI(2).Premio = 4 THEN
        IF NaveI(2).PremioB = 0 THEN
         NaveI(2).PremioB = 1
         NaveI(2).PremioPh = NaveI(2).Posh
         NaveI(2).PremioPv = NaveI(2).Posv + 4
        END IF
       NaveI(2).PremioPv = NaveI(2).PremioPv + 2
       PUT (NaveI(2).PremioPh, NaveI(2).PremioPv), Premio
       IF NaveI(2).PremioPh > Nave(1).Posh - 5 AND NaveI(2).PremioPh < Nave(1).Posh + 20 THEN
        IF NaveI(2).PremioPv = Nave(1).Posv OR NaveI(2).PremioPv = Nave(1).Posv + 1 THEN Nave(1).Dinheiro = Nave(1).Dinheiro + 50: NaveI(2).Morre = 1: NaveI(2).PremioB = 3: inimigos = inimigos - 1
        Life ""
        END IF
      END IF
    
      IF NaveI(2).Premio = 5 OR NaveI(2).Premio = 6 THEN
        IF NaveI(2).PremioB = 0 THEN
         NaveI(2).PremioB = 1
         NaveI(2).PremioPh = NaveI(2).Posh
         NaveI(2).PremioPv = NaveI(2).Posv + 4
        END IF
       NaveI(2).PremioPv = NaveI(2).PremioPv + 2
       PUT (NaveI(2).PremioPh, NaveI(2).PremioPv), Premio
       IF NaveI(2).PremioPh > Nave(1).Posh - 5 AND NaveI(2).PremioPh < Nave(1).Posh + 20 THEN
        IF NaveI(2).PremioPv = Nave(1).Posv OR NaveI(2).PremioPv = Nave(1).Posv + 1 THEN Nave(1).Dinheiro = Nave(1).Dinheiro + 100: NaveI(2).Morre = 1: NaveI(2).PremioB = 3: inimigos = inimigos - 1
        Life ""
       END IF
      END IF

      IF NaveI(2).Premio = 7 OR NaveI(2).Premio = 8 THEN
        IF NaveI(2).PremioB = 0 THEN
         NaveI(2).PremioB = 1
         NaveI(2).PremioPh = NaveI(2).Posh
         NaveI(2).PremioPv = NaveI(2).Posv + 4
        END IF
       NaveI(2).PremioPv = NaveI(2).PremioPv + 2
       PUT (NaveI(2).PremioPh, NaveI(2).PremioPv), Premio
       IF NaveI(2).PremioPh > Nave(1).Posh - 5 AND NaveI(2).PremioPh < Nave(1).Posh + 20 THEN
        IF NaveI(2).PremioPv = Nave(1).Posv OR NaveI(2).PremioPv = Nave(1).Posv + 1 THEN Nave(1).Dinheiro = Nave(1).Dinheiro + 250: NaveI(2).Morre = 1: NaveI(2).PremioB = 3: inimigos = inimigos - 1
        Life ""
       END IF
      END IF
     
      IF NaveI(2).Premio = 9 OR NaveI(2).Premio = 10 THEN
        IF NaveI(2).PremioB = 0 THEN
         NaveI(2).PremioB = 1
         NaveI(2).PremioPh = NaveI(2).Posh
         NaveI(2).PremioPv = NaveI(2).Posv + 4
        END IF
       NaveI(2).PremioPv = NaveI(2).PremioPv + 2
       PUT (NaveI(2).PremioPh, NaveI(2).PremioPv), Premio2
       IF NaveI(2).PremioPh > Nave(1).Posh - 5 AND NaveI(2).PremioPh < Nave(1).Posh + 20 THEN
        IF NaveI(2).PremioPv = Nave(1).Posv OR NaveI(2).PremioPv = Nave(1).Posv + 1 THEN
          NaveI(2).Morre = 1: NaveI(2).PremioB = 3
           IF Nave(1).Tiro <> 3 THEN Nave(1).Tiro = Nave(1).Tiro + 1
           inimigos = inimigos - 1
        Life ""
        END IF
       END IF
      END IF

     

8.4 :



END SUB

SUB Nave3T (text$)

IF NaveI(2).Tiro = 1 THEN
NaveI(2).Tiro = 2
NaveI(2).Tiroph = NaveI(2).Posh + 10
NaveI(2).TiroPv = NaveI(2).Posv + 4
END IF

NaveI(2).TiroPv = NaveI(2).TiroPv + 2

PUT (NaveI(2).Tiroph, NaveI(2).TiroPv), TiroI1

IF NaveI(2).TiroPv > 170 THEN
PUT (NaveI(2).Tiroph, NaveI(2).TiroPv), TiroI1
NaveI(2).Tiro = 1
END IF

END SUB

SUB Nave4C (text$)

IF NaveI(3).Explode = 50 THEN GOTO 5.3

IF NaveI(3).Vida <> 0 THEN
IF NaveI(3).Dire = 1 THEN NaveI(3).Posh = NaveI(3).Posh + 1
IF NaveI(3).Dire = 2 THEN NaveI(3).Posh = NaveI(3).Posh - 1

PUT (NaveI(3).Posh, NaveI(3).Posv), NaveI3

Nave4T ""

FOR i = NaveI(3).Posh + 5 TO NaveI(3).Posh + 15
IF POINT(i, NaveI(3).Posv + 15) = 53 THEN NaveI(3).Vida = 0
NEXT i

ELSE
 IF NaveI(3).Explode = 50 THEN
    GOTO 5.3
 END IF
 IF NaveI(3).Vida = 0 THEN
  IF NaveI(3).Explode = 0 THEN
   PUT (NaveI(3).Posh, NaveI(3).Posv), NaveI3
   PUT (NaveI(3).Tiroph - 8, NaveI(3).TiroPv), TiroI1
   PUT (NaveI(3).Tiroph + 4, NaveI(3).TiroPv), TiroI1
   NaveI(3).Explode = 1
  ELSE
   NaveI(3).Explode = NaveI(3).Explode + 1
    IF NaveI(3).Explode = 3 THEN
   PUT (NaveI(3).Posh - 4, NaveI(3).Posv), Explosao
    END IF
    IF NaveI(3).Explode = 20 THEN
   PUT (NaveI(3).Posh - 4, NaveI(3).Posv), Explosao
    NaveI(3).Explode = 50      'explode = 50 : A Nave morreu
    inimigos = inimigos - 1
    END IF
   END IF
 END IF
END IF


5.1 :

IF NaveI(3).Posh < 100 THEN NaveI(3).Dire = 1
IF NaveI(3).Posh > 190 THEN NaveI(3).Dire = 2

5.3 :


END SUB

SUB Nave4T (text$)

IF NaveI(3).Tiro = 1 THEN
NaveI(3).Tiro = 2
NaveI(3).Tiroph = NaveI(3).Posh + 10
NaveI(3).TiroPv = NaveI(3).Posv + 4
END IF

NaveI(3).TiroPv = NaveI(3).TiroPv + 2

PUT (NaveI(3).Tiroph - 8, NaveI(3).TiroPv), TiroI1
PUT (NaveI(3).Tiroph + 4, NaveI(3).TiroPv), TiroI1

IF NaveI(3).TiroPv > 170 THEN
PUT (NaveI(3).Tiroph - 8, NaveI(3).TiroPv), TiroI1
PUT (NaveI(3).Tiroph + 4, NaveI(3).TiroPv), TiroI1
NaveI(3).Tiro = 1
END IF

END SUB

