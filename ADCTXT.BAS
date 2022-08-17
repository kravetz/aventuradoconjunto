'ADC21 Vers∆o 1.0.9
DECLARE SUB EscGlp (Glp$)
DECLARE SUB PrintLuta (text$)
'Lembret: certos itens n∆o d† pra usar em certas horas. (chaves, armas)
DECLARE SUB Janela (colour%)
DECLARE SUB logo (text$)
DECLARE SUB fprint (text$, textx%, texty%, colour%, file%)
DECLARE SUB LoadPlayer (text$)
DECLARE SUB Salvar (text$)
DECLARE SUB Animation (anima!)
DECLARE SUB PutEstatus (text$)
DECLARE SUB Putener2 (Bener%, Tener%, tipo%)
DECLARE SUB Luta (Ti%, Ilevel%, IPT%, ipn%, Variante%)
DECLARE SUB Agolpe (Golpe$)
DECLARE SUB exper (text$)
DECLARE SUB Item (text$)
DECLARE SUB Enemy (Enemigo%)
DECLARE SUB fala (text$)
DECLARE SUB Apaga (row%)
DECLARE SUB minimenu (text$)
DECLARE SUB PutGuy (Guy%)
DECLARE SUB PrintMenu (text$)
DECLARE SUB Putpic (Picture%, ColunaY%, LinhaX%)
DECLARE SUB sons (numero%)
DECLARE SUB PrintMap (text$)
DECLARE SUB Entrada (text$)
DECLARE SUB LoadAll (text$)
DECLARE SUB zona1 (text$)
DECLARE SUB Pmapa (text$)
DECLARE SUB Andar (text$)
DECLARE SUB escolhe (text$)

TYPE caraType
 level AS INTEGER
 pp AS LONG
 expe AS LONG
 golpe1 AS STRING * 15
 golpe2 AS STRING * 15
 golpe3 AS STRING * 15
 golpe4 AS STRING * 15
 energia AS INTEGER
 energiaT AS INTEGER
 itens AS LONG
 dinheiro AS SINGLE
 estatus AS STRING * 10
 ataque AS LONG
 defesa AS LONG
 agilidade AS LONG
 magia AS LONG
 direcao AS INTEGER
END TYPE

TYPE it
 nome AS STRING * 15
 Golpe AS STRING * 15
 energia AS LONG
 EEnergia AS LONG
 Elixir AS INTEGER
 Valor AS INTEGER
 Condicao AS INTEGER
 NCondicao AS INTEGER
 'Condicao 2 3 e 4 sao no ADC2
END TYPE

DIM SHARED Comida(1 TO 16) AS INTEGER
DIM SHARED Arma(1 TO 16) AS INTEGER
DIM SHARED Chave(1 TO 16) AS INTEGER
DIM SHARED Outro(1 TO 16) AS INTEGER

DIM SHARED cara(1) AS caraType

TYPE enemyType
 energia AS INTEGER
 energiaT AS INTEGER
 golpe1 AS STRING * 15
 golpe2 AS STRING * 15
 golpe3 AS STRING * 15
 golpe4 AS STRING * 15
 'Golpe5 AS STRING * 15   ADC2 - Randomizar. hehhe. :)
 estatus AS STRING * 10
 ataque AS LONG
 defesa AS LONG
 magia AS LONG
 agilidade AS LONG
 level AS INTEGER
END TYPE

DIM SHARED FightType
DIM SHARED PEI AS LONG
DIM SHARED Allpic(1 TO 500)
DIM SHARED Allpic2(1 TO 4000)
DIM SHARED Allpic3(1 TO 1000)
DIM SHARED Rodrigo1(80): DIM SHARED Rodrigo2(80)
DIM SHARED Rodrigo3(80): DIM SHARED Rodrigo4(80)
DIM SHARED Mayron1(80): DIM SHARED Mayron2(80)
DIM SHARED Mayron3(80): DIM SHARED Mayron4(80)
DIM SHARED Thayse1(80): DIM SHARED Thayse2(80)
DIM SHARED Thayse3(80): DIM SHARED Thayse4(80)
DIM SHARED Ronald1(80): DIM SHARED Ronald2(80)
DIM SHARED Ronald3(80): DIM SHARED Ronald4(80)
DIM SHARED F1F(1 TO 19) AS INTEGER
DIM SHARED F2F(1 TO 19) AS INTEGER
DIM SHARED F3F(1 TO 19) AS INTEGER
DIM SHARED F4F(1 TO 19) AS INTEGER
DIM SHARED F5F(1 TO 19) AS INTEGER
DIM SHARED F6F(1 TO 19) AS INTEGER
DIM SHARED Mapa1(100): DIM SHARED Mapa2(100): DIM SHARED Mapa3(100)
DIM SHARED Mapa4(100): DIM SHARED Mapa5(100): DIM SHARED Mapa6(100)
DIM SHARED Mapa7(100): DIM SHARED Mapa8(100): DIM SHARED Mapa9(100)
DIM SHARED Mapa10(100): DIM SHARED Mapa11(100): DIM SHARED Mapa12(100)
DIM SHARED Mapa13(100): DIM SHARED Mapa14(100): DIM SHARED Mapa15(100)
DIM SHARED Mapa16(100): DIM SHARED Mapa17(100): DIM SHARED Mapa18(100)
DIM SHARED Mapa19(100): DIM SHARED Mapa20(100): DIM SHARED Mapa21(100)
DIM SHARED Mapa23(100): DIM SHARED Mapa24(100): DIM SHARED Mapa25(100)
DIM SHARED Mapa22(100): DIM SHARED Tijol1(100): DIM SHARED Tijol2(100)
DIM SHARED Tijol3(100): DIM SHARED Pessoa1(100): DIM SHARED Pessoa2(100)
DIM SHARED Pessoa4(100): DIM SHARED Pessoa5(100): DIM SHARED Pessoa3(100)
DIM SHARED Luta1(100): DIM SHARED Luta6(100)
DIM SHARED Luta2(100): DIM SHARED Luta7(100)
DIM SHARED Luta3(100): DIM SHARED Luta8(100)
DIM SHARED Luta4(100): DIM SHARED Luta9(100)
DIM SHARED Luta5(100): DIM SHARED Luta10(100)
DIM SHARED Luta11(100)

'Vari†veis do jogo
DIM SHARED Zona: DIM SHARED Part: DIM SHARED MinPart
DIM SHARED Perso AS INTEGER
DIM SHARED PosGv AS INTEGER
DIM SHARED PosGh AS INTEGER
DIM SHARED Condicao(30)

DIM SHARED lugar AS STRING
lugar = "C:\ADC\"
DIM SHARED c$(8)
c$(0) = "&hB0&h20&h23&h40&h43&h60&h63&h80&h83&hA0&HBD&HC0&HE0&HE3&hB0"
c$(1) = "&hB1&h21&h24&h41&h44&h61&h64&h81&h84&hA1&HBD&HC1&HE1&HE4&hB1"
c$(2) = "&hB2&h22&h25&h42&h45&h62&h65&h82&h85&hA2&HBD&HC2&HE2&HE5&hB2"
c$(3) = "&hB3&h28&h2B&h48&h4B&h68&h6B&h88&h8B&hA3&HBD&HC3&HE8&HEB&hB3"
c$(4) = "&hB4&h29&h2C&h49&h4C&h69&h6C&h89&h8C&hA4&HBD&HC4&HE9&HEC&hB4"
c$(5) = "&hB5&h2A&h2D&h4A&h4D&h6A&h6D&h8A&h8D&hA5&HBD&HC5&HEA&HED&hB5"
c$(6) = "&hB6&h30&h33&h50&h53&h70&h73&h90&h93&hA6&HBD&HC6&HF0&HF3&hB6"
c$(7) = "&hB7&h31&h34&h51&h54&h71&h74&h91&h94&hA7&HBD&HC7&HF1&HF4&hB7"
c$(8) = "&hB8&h32&h35&h52&h55&h72&h75&h92&h95&hA8&HBD&HC8&HF2&HF5&hB8"

DIM SHARED cr, InN, SOM AS INTEGER
DIM SHARED Ocerror
DIM SHARED GolpeT AS STRING * 2
DIM SHARED GolpeF AS INTEGER

ON ERROR GOTO errorline
RANDOMIZE TIMER

CHDIR "SAVES"
IF Ocerror = 1 THEN MKDIR "SAVES"
IF Ocerror = 0 THEN CHDIR ".."
Ocerror = 0

SCREEN 13
Perso = 1
Reestart:
logo ""
DO
IF Ocerror = 1 THEN Ocerror = 0
SELECT CASE INKEY$
 CASE "N", "n": Zona = 1: EXIT DO
 CASE "J", "j": LoadPlayer "": IF Ocerror <> 1 THEN zona1 "" ELSE Janela -1: Apaga 21
 CASE "S", "s": END
END SELECT
LOOP
CLS
LoadAll ""
escolhe ""

errorline: Ocerror = 1: RESUME NEXT

SUB Agolpe (Golpe$)
 Janela 0
 Apaga 22
 COLOR 15
 LOCATE 16, 10: PRINT "Novo Golpe!": COLOR 9: LOCATE 17, 10: PRINT Golpe$
 COLOR 15: LOCATE 18, 10: INPUT "Aprender (S/N)"; re$

 IF re$ = "S" OR re$ = "s" THEN
  Apaga 22: COLOR 15
  LOCATE 16, 10: PRINT "Qual lugar?"
  LOCATE 17, 10: PRINT "1)"; cara(1).golpe1
  LOCATE 18, 10: PRINT "2)"; cara(1).golpe2
  LOCATE 19, 10: PRINT "3)"; cara(1).golpe3
  LOCATE 20, 10: PRINT "4)"; cara(1).golpe4
  LOCATE 21, 10: INPUT "", re$
  SELECT CASE re$
   CASE "1": cara(1).golpe1 = Golpe$
   CASE "2": cara(1).golpe2 = Golpe$
   CASE "3": cara(1).golpe3 = Golpe$
   CASE "4": cara(1).golpe4 = Golpe$
  END SELECT
 END IF
 

END SUB

SUB Animation (anima)

IF anima = 1 THEN ps = 16: ps1 = 115: ps2 = 180
IF anima = 2 OR anima = 6 OR anima = 8 THEN ps = -16: ps1 = 160: ps2 = 99
IF anima = 1 OR anima = 2 THEN tp = 1
IF anima = 6 OR anima = 8 THEN tp = 2

an2 = 1
'STOP
 FOR an4 = 1 TO 2
  FOR an = ps1 TO ps2 STEP ps
  IF tp = 1 THEN sons 0
  IF anima = 1 THEN LINE (an - 16, 40)-(an - 1, 40 + 16), 15, BF
  IF anima = 2 OR anima = 6 OR anima = 8 THEN LINE (an + 32, 40)-(an + 16, 40 + 16), 15, BF
  SELECT CASE an2
   CASE 1
    an2 = 2
    IF tp = 1 THEN PUT (an, 40), Luta2, PSET
    IF tp = 2 THEN PUT (an, 40), Luta5, PSET
   CASE 2
    an2 = 1
    IF tp = 1 THEN PUT (an, 40), Luta3, PSET
    IF tp = 2 THEN PUT (an, 40), Luta6, PSET
  END SELECT
  IF tp = 2 THEN
   FOR i = 1 TO 50000: NEXT
  END IF
  NEXT an
  IF anima = 1 THEN LINE (an - 16, 40)-(an - 1, 40 + 16), 15, BF
  IF anima = 2 OR anima = 6 OR anima = 8 THEN LINE (an + 16, 40)-(an + 32, 40 + 16), 15, BF
  NEXT an4

END SUB

SUB Apaga (row%)
FOR j = 16 TO row%
LOCATE j, 10: COLOR 0: PRINT "XXXXXXXXXXXXXXXXXXXXX"
NEXT j
END SUB

SUB EscGlp (Glp$)

SELECT CASE RTRIM$(Glp$)
CASE "Soco": GolpeF = 0: GolpeT = "AT": SOM = 4
CASE "Soco duplo": GolpeF = 2: GolpeT = "AT": SOM = 4
CASE "Chute": GolpeF = 1: GolpeT = "AT": SOM = 4
CASE "Chute duplo": GolpeF = 4: GolpeT = "AT": SOM = 4
CASE "Chute mortal": GolpeF = 15: GolpeT = "AT": SOM = 4
CASE "Chamas": GolpeF = 15: GolpeT = "MG": SOM = 4
CASE "Cabeáada": GolpeF = 6: GolpeT = "AT": SOM = 4
CASE "Choque": GolpeF = 1: GolpeT = "MG"
CASE "Raio": GolpeF = 6: GolpeT = "MG"
CASE "Peido": GolpeF = 5: GolpeT = "MG"
CASE "Arroto": GolpeF = 3: GolpeT = "MG"
CASE "Rasteira": GolpeF = INT(RND * 5) + 3: GolpeT = "AT": SOM = 4
CASE "Estrela": GolpeF = 3: GolpeT = "AT": SOM = 4
CASE "Gancho": GolpeF = 4: GolpeT = "AT": SOM = 4
CASE "Voadora": GolpeF = 6: GolpeT = "AT": SOM = 4
CASE "Escudo": GolpeF = 1: GolpeT = "DF"
CASE "Explos∆o": GolpeF = 30: GolpeT = "MG"
CASE "Execuá∆o": GolpeF = 30: GolpeT = "AT"
CASE "Agilidade": GolpeF = 0: GolpeT = "AG"
CASE "Cristal": GolpeF = 10: GolpeT = "DF"
END SELECT

END SUB

SUB escolhe (text$)

cara(1).pp = 100
cara(1).energia = 35
cara(1).energiaT = 35
cara(1).estatus = "OK"
cara(1).level = 5
Comida(1) = 3
Comida(5) = 5
Comida(6) = 2
cara(1).itens = 10
muda = 1
flecha = 1

CLS
LOCATE 1, 10: COLOR 1: PRINT "Escolha o personagem. V1.0.9 Beta"

PUT (140, 30), Rodrigo1
PUT (140, 60), Mayron1
PUT (140, 90), Ronald1
PUT (140, 120), Thayse1

LOCATE 5, 9: COLOR 40: PRINT "Rodrigo"

LINE (180, 30)-(315, 160), 40, B
LINE (183, 33)-(312, 157), 40, B

COLOR 15
COLOR 9
LOCATE 6, 25: PRINT "Estatus:  OK"
LOCATE 7, 25: PRINT "Level "; : COLOR 0: PRINT "55": COLOR 9
LOCATE 7, 25: PRINT "Level "; : COLOR 40: PRINT "5"

COLOR 0

 LOCATE 9, 25: PRINT "Ataque:    13"
 LOCATE 10, 25: PRINT "Defesa:    19"
 LOCATE 11, 25: PRINT "Agilidade: 16"
 LOCATE 12, 25: PRINT "Magia:     14"
 LOCATE 13, 25: PRINT "Total:    62 "
COLOR 15
LOCATE 9, 25: PRINT "Ataque:     6"
LOCATE 10, 25: PRINT "Defesa:     4"
LOCATE 11, 25: PRINT "Agilidade:  3"
LOCATE 12, 25: PRINT "Magia:      2"
LOCATE 13, 25: PRINT "Total:     15"
COLOR 9
LOCATE 15, 25: PRINT "Experiància"
COLOR 15: LOCATE 16, 25: PRINT "Ganha: "; : PRINT "0"
LOCATE 18, 25: PRINT "Para o level 6:"
LOCATE 19, 25: PRINT "100"
LOCATE 21, 5: COLOR 12: PRINT "Esc - "; : COLOR 15: PRINT "Reseta"
1 :
      IF muda = 1 THEN
      IF flecha = 1 THEN
 LOCATE 5, 9: COLOR 40: PRINT "Rodrigo"
 LOCATE 9, 9: COLOR 0: PRINT "Mayron"
 LINE (180, 30)-(315, 160), 40, B
 LINE (183, 33)-(312, 157), 40, B
 COLOR 15
 COLOR 9
 LOCATE 6, 25: PRINT "Estatus:  OK"
 LOCATE 7, 25: PRINT "Level "; : COLOR 0: PRINT "55": COLOR 9
 LOCATE 7, 25: PRINT "Level "; : COLOR 40: PRINT "5"
COLOR 0
 LOCATE 9, 25: PRINT "Ataque:    13"
 LOCATE 10, 25: PRINT "Defesa:    19"
 LOCATE 11, 25: PRINT "Agilidade: 16"
 LOCATE 12, 25: PRINT "Magia:     14"
 LOCATE 13, 25: PRINT "Total:    15 "

 COLOR 15
 LOCATE 9, 25: PRINT "Ataque:    6"
 LOCATE 10, 25: PRINT "Defesa:    4"
 LOCATE 11, 25: PRINT "Agilidade: 3"
 LOCATE 12, 25: PRINT "Magia:     2"
 LOCATE 13, 25: PRINT "Total:    15"
 COLOR 9
 LOCATE 15, 25: PRINT "Experiància"
 COLOR 15: LOCATE 16, 25: PRINT "Ganha: "; : PRINT "0"
 LOCATE 18, 25: PRINT "Para o level 6:"
 LOCATE 19, 25: PRINT "100"
 LOCATE 22, 25: COLOR 0: PRINT "Somente na 2¶ zona"
 muda = 0
ELSEIF flecha = 2 THEN
 LOCATE 5, 9: COLOR 0: PRINT "Rodrigo"
 LOCATE 9, 9: COLOR 53: PRINT "Mayron"
 LOCATE 13, 9: COLOR 0: PRINT "Ronald"
 LINE (180, 30)-(315, 160), 10, B
 LINE (183, 33)-(312, 157), 10, B
 COLOR 15
 COLOR 9
 LOCATE 6, 25: PRINT "Estatus:  OK"
 LOCATE 7, 25: PRINT "Level "; : COLOR 0: PRINT "55": COLOR 9
 LOCATE 7, 25: PRINT "Level "; : COLOR 40: PRINT "5"
COLOR 0
 LOCATE 9, 25: PRINT "Ataque:    13"
 LOCATE 10, 25: PRINT "Defesa:    19"
 LOCATE 11, 25: PRINT "Agilidade: 16"
 LOCATE 12, 25: PRINT "Magia:     14"
 LOCATE 13, 25: PRINT "Total:    15"

 COLOR 15
 LOCATE 9, 25: PRINT "Ataque:    4"
 LOCATE 10, 25: PRINT "Defesa:    2"
 LOCATE 11, 25: PRINT "Agilidade: 6"
 LOCATE 12, 25: PRINT "Magia:     3"
 LOCATE 13, 25: PRINT "Total:    15"
 COLOR 9
 LOCATE 15, 25: PRINT "Experiància"
 COLOR 15: LOCATE 16, 25: PRINT "Ganha: "; : PRINT "0"
 LOCATE 18, 25: PRINT "Para o level 6:"
 LOCATE 19, 25: PRINT "100"
 LOCATE 22, 25: COLOR 0: PRINT "Somente na 2¶ zona"
 muda = 0
ELSEIF flecha = 3 THEN

 LOCATE 9, 9: COLOR 0: PRINT "Mayron"
 LOCATE 13, 9: COLOR 9: PRINT "Ronald"
 LOCATE 17, 9: COLOR 0: PRINT "Thayse"

 LINE (180, 30)-(315, 160), 9, B
 LINE (183, 33)-(312, 157), 9, B

 COLOR 15
 COLOR 9
 LOCATE 6, 25: PRINT "Estatus:  OK"
 LOCATE 7, 25: PRINT "Level "; : COLOR 0: PRINT "55": COLOR 9
 LOCATE 7, 25: PRINT "Level "; : COLOR 40: PRINT "15"
 COLOR 0
 LOCATE 9, 25: PRINT "Ataque:    15"
 LOCATE 10, 25: PRINT "Defesa:    20"
 LOCATE 11, 25: PRINT "Agilidade: 13"
 LOCATE 12, 25: PRINT "Magia:     17"
 LOCATE 13, 25: PRINT "Total:    65"
 COLOR 15
 LOCATE 9, 25: PRINT "Ataque:    15"
 LOCATE 10, 25: PRINT "Defesa:    20"
 LOCATE 11, 25: PRINT "Agilidade: 13"
 LOCATE 12, 25: PRINT "Magia:     17"
 LOCATE 13, 25: PRINT "Total:    65"
 COLOR 9
 LOCATE 15, 25: PRINT "Experiància"
 COLOR 15: LOCATE 16, 25: PRINT "Ganha: "; : PRINT "0"
 LOCATE 18, 25: PRINT "Para o level 16"
 LOCATE 19, 25: PRINT "XXX"
 LOCATE 22, 25: COLOR 4: PRINT "Somente na 2¶ zona"
 muda = 0

ELSEIF flecha = 4 THEN

 LOCATE 13, 9: COLOR 0: PRINT "Ronald"
 LOCATE 17, 9: COLOR 12: PRINT "Thayse"

 LINE (180, 30)-(315, 160), 12, B
 LINE (183, 33)-(312, 157), 12, B

 COLOR 15
 COLOR 9
 LOCATE 6, 25: PRINT "Estatus:  OK"
 LOCATE 7, 25: PRINT "Level "; : COLOR 0: PRINT "55": COLOR 9
 LOCATE 7, 25: PRINT "Level "; : COLOR 40: PRINT "5"
 COLOR 0
 LOCATE 9, 25: PRINT "Ataque:    13"
 LOCATE 10, 25: PRINT "Defesa:    19"
 LOCATE 11, 25: PRINT "Agilidade: 16"
 LOCATE 12, 25: PRINT "Magia:     14"
 LOCATE 13, 25: PRINT "Total:    15"

 COLOR 15
 LOCATE 9, 25: PRINT "Ataque:    2"
 LOCATE 10, 25: PRINT "Defesa:    3"
 LOCATE 11, 25: PRINT "Agilidade: 4"
 LOCATE 12, 25: PRINT "Magia:     6"
 LOCATE 13, 25: PRINT "Total:    15"
 COLOR 9
 LOCATE 15, 25: PRINT "Experiància"
 COLOR 15: LOCATE 16, 25: PRINT "Ganha: "; : PRINT "0"
 LOCATE 18, 25: PRINT "Para o level 6:"
 LOCATE 19, 25: PRINT "100"
 LOCATE 22, 25: COLOR 0: PRINT "Somente na 2¶ zona"
 muda = 0
END IF
END IF
SELECT CASE INKEY$
 CASE CHR$(0) + "H": IF flecha <> 1 THEN flecha = flecha - 1: muda = 1
 CASE CHR$(0) + "P": IF flecha <> 4 THEN flecha = flecha + 1: muda = 1
 CASE CHR$(27): END
 CASE CHR$(32), CHR$(13)
  IF flecha = 1 THEN
  Zona = 1: Part = 1: MinPart = 1: Perso = 1
 PosGv = 3: Posv = 51
 PosGh = 11: Posh = 51
 cara(1).direcao = 1
cara(1).golpe1 = "Soco     "
cara(1).golpe2 = "Chute    "
cara(1).golpe3 = "- - -    "
cara(1).golpe4 = "- - -    "
cara(1).ataque = 6
cara(1).defesa = 4
cara(1).agilidade = 3
cara(1).magia = 2
sons 15
zona1 ""
ELSEIF flecha = 2 THEN
  Zona = 1: Part = 3: MinPart = 3: Perso = 2
 PosGv = 3
 PosGh = 11
cara(1).golpe1 = "Chute    ": cara(1).golpe2 = "Chute duplo"
cara(1).golpe3 = "Choque   ": cara(1).golpe4 = "- - -      "
cara(1).ataque = 4: cara(1).defesa = 2: cara(1).agilidade = 6
cara(1).magia = 3
cara(1).direcao = 1
cara(1).energia = 30: cara(1).energiaT = 30
sons 15: zona1 ""
ELSEIF flecha = 4 THEN
 PosGv = 2
 PosGh = 12
cara(1).golpe1 = "Chute    "
cara(1).golpe2 = "Choque   "
cara(1).golpe3 = "Raio     "
cara(1).golpe4 = "- - -    "
cara(1).level = 5
cara(1).ataque = 2: cara(1).defesa = 3
cara(1).agilidade = 4: cara(1).magia = 6
cara(1).direcao = 3
cara(1).energia = 25
cara(1).energiaT = 25
sons 15
Zona = 1: Part = 3: MinPart = 2: Perso = 4: zona1 ""
END IF

END SELECT

GOTO 1


END SUB

SUB exper (text$)

DIM At AS INTEGER, Df AS INTEGER, Mg AS INTEGER, Ag AS INTEGER

VerSePassou:
IF cara(1).expe >= cara(1).pp THEN
 Janela 0
 Apaga 22
 pontsS = cara(1).expe - cara(1).pp
 cara(1).level = cara(1).level + 1
 cara(1).pp = cara(1).level * cara(1).level * 10
 LOCATE 17, 10: COLOR 15: PRINT "Novo level!"; : COLOR 14: PRINT cara(1).level
 cara(1).ataque = cara(1).ataque + 1
 cara(1).defesa = cara(1).defesa + 1
 cara(1).agilidade = cara(1).agilidade + 1
 cara(1).magia = cara(1).magia + 1
 cara(1).energiaT = cara(1).energiaT + 3
 cara(1).energia = cara(1).energia + 3
 cara(1).expe = pontsS
FOR j = 1 TO 6
 IF cara(1).level = 10 * j THEN
  SELECT CASE Perso
   CASE 1: At = 4: Df = 3: Ag = 2: Mg = 1
   CASE 2: At = 3: Df = 1: Ag = 4: Mg = 2
   CASE 3: At = 2: Df = 4: Ag = 1: Mg = 3
   CASE 4: At = 1: Df = 2: Ag = 3: Mg = 4
  END SELECT
 lv = cara(1).level / 10
 cara(1).ataque = cara(1).ataque + (At * lv)
 cara(1).defesa = cara(1).defesa + (Df * lv)
 cara(1).agilidade = cara(1).agilidade + (Ag * lv)
 cara(1).magia = cara(1).magia + (Mg * lv)
 END IF
NEXT j

 GOTO VerSePassou
 ELSE
cara(1).pp = cara(1).pp - cara(1).expe
END IF







END SUB

SUB fala (text$)

DIM Lazone AS INTEGER
DIM LaPart AS INTEGER
DIM LaMinp AS INTEGER
Lazone = Zona
LaMinp = MinPart
LaPart = Part
Ocerror = 0

DIM tipo AS INTEGER
DIM dinheiro AS LONG
DIM Condicao1 AS INTEGER, Condicao2 AS INTEGER, Condicao3  AS INTEGER
DIM Titem AS INTEGER, Nitem AS INTEGER
DIM inimigo AS INTEGER, level AS INTEGER, Experiencia AS INTEGER
DIM estatus AS STRING * 10
DIM Elixir AS INTEGER, Valor AS INTEGER, NovaPart AS INTEGER, NovaMinPart AS INTEGER
DIM NovaZona AS INTEGER
DIM NovaPerso AS INTEGER
DIM NovaX AS INTEGER
DIM NovaY AS INTEGER
DIM NC1 AS INTEGER, NC2 AS INTEGER, NC3 AS INTEGER
DIM Golpe AS STRING

OPEN lugar + "MAPAS\FALA" + LTRIM$(STR$(Zona)) + ".MAP" FOR INPUT AS #3

DO
 INPUT #3, tipo
 IF tipo = 0 THEN INPUT #3, tipo
 INPUT #3, p
 IF Ocerror = 1 THEN EXIT DO
 INPUT #3, m, x, y, Ant, Condicao1, VCondicao1, Condicao2, Vcondicao2
 INPUT #3, Condicao3, VCondicao3, Persois

SELECT CASE tipo
 CASE -1
 INPUT #3, falar$
 INPUT #3, Titem, Nitem
 INPUT #3, inimigo, Golpe, magia$, level, Experiencia, dinheiro
 INPUT #3, estatus$
 INPUT #3, Elixir, Valor, NovaPart, NovaMinPart
 INPUT #3, NovaZona, NovaPerso, NovaX, NovaY
 INPUT #3, NC1, NC2, NC3
 CASE 1
 INPUT #3, falar$
 INPUT #3, nome1$
 INPUT #3, Titem1, NItem1, Vitem1
 INPUT #3, nome2$
 INPUT #3, Titem2, NItem2, Vitem2
 INPUT #3, nome3$
 INPUT #3, Titem3, NItem3, Vitem3
 INPUT #3, nome4$
 INPUT #3, Titem4, NItem4, Vitem4
 INPUT #3, NC1, NC2, NC3
 CASE 2
 INPUT #3, nome1$
 INPUT #3, Titem1, NItem1
 INPUT #3, NC1, NC2, NC3
 CASE 3
 INPUT #3, NovaZona, NovaPart, NovaMinPart, NovaX, NovaY
 INPUT #3, NC1, NC2, NC3
 CASE 4
 INPUT #3, falar$
 INPUT #3, NC1, NC2, NC3
 CASE 5, 6
 INPUT #3, nome$
 INPUT #3, falar$
 INPUT #3, NC1, NC2, NC3
 IF tipo = 5 THEN INPUT #3, Titem, Nitem
 IF tipo = 6 THEN INPUT #3, numero%, level%, PremioT%, PremioN%, Varia%
END SELECT

IF Condicao(Condicao1) = VCondicao1 AND Condicao(Condicao2) = Vcondicao2 AND Condicao(Condicao3) = VCondicao3 AND p = Part AND m = MinPart AND (x = PosGh OR x = 0) AND (y = PosGv OR y = 0) AND Ant = cara(1).direcao AND (Perso = Persois OR (Persois < _
 1 AND Perso <> ABS(Persois))) THEN

IF Persois = -3 AND Perso <> 3 AND Zona = 2 THEN
 Apaga 22: LOCATE 16, 10: COLOR 15: PRINT "Quer trocar (S/N)?"
 LOCATE 17, 10: INPUT "", re$
 IF re$ = "S" OR re$ = "s" THEN
  Apaga 22
  cara(1).level = 15
  cara(1).pp = 1000: cara(1).energia = 110
  cara(1).energiaT = 110: cara(1).estatus = "OK"
  cara(1).dinheiro = 10
  Condicao(30) = Perso
  Perso = 3: PrintMap "": PutGuy Perso: Janela 0: GOTO 3
 END IF
END IF

 SELECT CASE tipo
  CASE -1, 4, 5, 6
    IF Condicao1 <> 0 AND tipo < 6 THEN Condicao(Condicao1) = NC1
    IF Condicao2 <> 0 AND tipo < 6 THEN Condicao(Condicao2) = NC2
    IF Condicao3 <> 0 AND tipo < 6 THEN Condicao(Condicao3) = NC3
    IF tipo = 5 THEN LOCATE 16, 10: COLOR 14: PRINT nome$
   IF falar$ <> "                                                               " THEN
    Apaga 22: COLOR 15
    IF tipo = 5 OR tipo = 6 THEN
    x = 17: COLOR 14: LOCATE 16, 10: PRINT RTRIM$(nome$); ":": COLOR 15
    ELSE
    x = 16
    END IF
 
    LOCATE x, 10
    PRINT LEFT$(falar$, 21): LOCATE x + 1, 10: PRINT RIGHT$(LEFT$(falar$, 42), 21): LOCATE x + 2, 10
    PRINT RIGHT$(RIGHT$(falar$, 42), 21)
    DO
    LOOP UNTIL INKEY$ <> ""
    END IF
   IF tipo = 4 THEN EXIT DO
   IF tipo = 6 THEN
     Luta numero%, level%, PremioT%, PremioN%, Varia%
    IF FightType = 1 THEN
     IF Condicao1 <> 0 THEN Condicao(Condicao1) = NC1
     IF Condicao2 <> 0 THEN Condicao(Condicao2) = NC2
     IF Condicao3 <> 0 THEN Condicao(Condicao3) = NC3
     FightType = 0
    END IF
     GOTO 3
   END IF
   IF Titem <> 0 THEN
     IF Nitem > 0 THEN cara(1).itens = cara(1).itens + 1: sons 16
     IF Nitem < 0 THEN cara(1).itens = cara(1).itens - 1: sons 17
    IF Nitem > 0 THEN
    SELECT CASE Titem
     CASE 1: Comida(Nitem) = Comida(Nitem) + 1
     CASE 2: Arma(Nitem) = Arma(Nitem) + 1
     CASE 3: Chave(Nitem) = Chave(Nitem) + 1
     CASE 4: Outro(Nitem) = Outro(Nitem) + 1
     CASE 5: cara(1).dinheiro = cara(1).dinheiro + Nitem
    END SELECT
    END IF
    IF Nitem < 0 THEN
    SELECT CASE Titem
     CASE 1: Comida(ABS(Nitem)) = Comida(ABS(Nitem)) - 1
     CASE 2: Arma(ABS(Nitem)) = Arma(ABS(Nitem)) - 1
     CASE 3: Chave(ABS(Nitem)) = Chave(ABS(Nitem)) - 1
     CASE 4: Outro(ABS(Nitem)) = Outro(ABS(Nitem)) - 1
     CASE 5: cara(1).dinheiro = cara(1).dinheiro + Nitem
    END SELECT
    END IF
   END IF
   IF tipo = 5 THEN EXIT DO
 IF estatus$ <> "          " THEN cara(1).estatus = estatus$
 IF Golpe <> "               " THEN Agolpe Golpe: Janela -1: Apaga 22
 cara(1).dinheiro = cara(1).dinheiro + dinheiro

 IF level <> 0 THEN
  cara(1).expe = cara(1).pp + 1: exper ""
  DO
  LOOP UNTIL INKEY$ <> ""
 END IF
 IF Experiencia <> 0 THEN
  Apaga 22: COLOR 15
  LOCATE 16, 10: PRINT LTRIM$(STR$(Experiencia)) + " de exp"
  cara(1).expe = cara(1).expe + Experiencia
  exper ""
 DO
 LOOP UNTIL INKEY$ <> ""
 END IF

  IF Elixir <> 0 THEN
    Apaga 22
    IF SGN(Valor) = 1 THEN LOCATE 16, 10: COLOR 14: PRINT "+"; LTRIM$(STR$(Valor)); " ";
    IF SGN(Valor) = -1 THEN LOCATE 16, 10: COLOR 14: PRINT Valor;
    COLOR 15
   SELECT CASE Elixir
    CASE 1: PRINT "de Ataque!": cara(1).ataque = cara(1).ataque + Valor
    CASE 2: PRINT "de Defesa!": cara(1).defesa = cara(1).defesa + Valor
    CASE 3: PRINT "de Magia!": cara(1).magia = cara(1).magia + Valor
    CASE 4: PRINT "de Agilidade!": cara(1).agilidade = cara(1).agilidade + Valor
    CASE 5: PRINT "de energia!": cara(1).energia = cara(1).energia + Valor: cara(1).energiaT = cara(1).energiaT + Valor
   END SELECT
   DO
   LOOP UNTIL INKEY$ <> ""
  END IF

 IF NovaPerso <> 0 THEN Perso = NovaPerso: PutGuy Perso
 IF NovaX <> 0 THEN APX% = PosGh: PosGh = NovaX
 IF NovaY <> 0 THEN APY% = PosGv: PosGv = NovaY
 IF APX% <> 0 OR APY% <> 0 THEN
  SELECT CASE APY%
   CASE 1: Putpic F1F(APX%), APY%, APX%
   CASE 2: Putpic F2F(APX%), APY%, APX%
   CASE 3: Putpic F3F(APX%), APY%, APX%
   CASE 4: Putpic F4F(APX%), APY%, APX%
   CASE 5: Putpic F5F(APX%), APY%, APX%
   CASE 6: Putpic F6F(APX%), APY%, APX%
  END SELECT
  PutGuy Perso
 END IF

 IF NovaMinPart <> MinPart AND NovaMinPart <> 0 THEN MinPart = NovaMinPart: CLS : PrintMap "": PrintMenu "": PutGuy Perso
 GOTO 3
 CASE 1
 IF Condicao1 <> 0 THEN Condicao(Condicao1) = NC1
 IF Condicao2 <> 0 THEN Condicao(Condicao2) = NC2
 IF Condicao3 <> 0 THEN Condicao(Condicao3) = NC3
EsProduto:
  Apaga 22: COLOR 12
  LOCATE 16, 10: PRINT falar$: COLOR 15
  COLOR 14: LOCATE 17, 10: PRINT "1)"; : COLOR 15: PRINT nome1$: LOCATE 17, 24: PRINT "R$"; : COLOR 10: PRINT Vitem1
  COLOR 14: LOCATE 18, 10: PRINT "2)"; : COLOR 15: PRINT nome2$: LOCATE 18, 24: PRINT "R$"; : COLOR 10: PRINT Vitem2
  COLOR 14: LOCATE 19, 10: PRINT "3)"; : COLOR 15: PRINT nome3$: LOCATE 19, 24: PRINT "R$"; : COLOR 10: PRINT Vitem3
  COLOR 14: LOCATE 20, 10: PRINT "4)"; : COLOR 15: PRINT nome4$: LOCATE 20, 24: PRINT "R$"; : COLOR 10: PRINT Vitem4
  COLOR 14: LOCATE 21, 10: PRINT "5)"; : COLOR 15: PRINT "Nada"
  LOCATE 22, 10: COLOR 9: PRINT "Quero o nß:";
  DO
   LOCATE 22, 23
   SELECT CASE INKEY$
    CASE "1": PRINT "1": ItemEs = 1: Vitem = Vitem1: Titem = Titem1: Nitem = NItem1: EXIT DO
    CASE "2": PRINT "2": ItemEs = 2: Vitem = Vitem2: Titem = Titem2: Nitem = NItem2: EXIT DO
    CASE "3": PRINT "3": ItemEs = 3: Vitem = Vitem3: Titem = Titem3: Nitem = NItem3: EXIT DO
    CASE "4": PRINT "4": ItemEs = 4: Vitem = Vitem4: Titem = Titem4: Nitem = NItem4: EXIT DO
    CASE "5": PRINT "5": ItemEs = 5: EXIT DO
   END SELECT
  LOOP
  DO
   SELECT CASE INKEY$
     CASE CHR$(8): COLOR 0: LOCATE 22, 23: PRINT "€": GOTO EsProduto
     CASE CHR$(13)
    IF ItemEs = 5 THEN EXIT DO
    IF cara(1).dinheiro >= Vitem THEN
     SELECT CASE Titem
      CASE 1: Comida(Nitem) = Comida(Nitem) + 1
      CASE 2: Arma(Nitem) = Arma(Nitem) + 1
      CASE 3: Chave(Nitem) = Chave(Nitem) + 1
      CASE 4: Outro(Nitem) = Outro(Nitem) + 1
     END SELECT
    
      cara(1).dinheiro = cara(1).dinheiro - Vitem: cara(1).itens = cara(1).itens + 1
    ELSE
     Apaga 22: COLOR 4: LOCATE 16, 10: PRINT "Sem dinheiro!"
     DO
     LOOP UNTIL INKEY$ <> ""
    END IF
     GOTO EsProduto
   END SELECT
  LOOP
GOTO 3
CASE 2
 IF Condicao1 <> 0 THEN Condicao(Condicao1) = NC1
 IF Condicao2 <> 0 THEN Condicao(Condicao2) = NC2
 IF Condicao3 <> 0 THEN Condicao(Condicao3) = NC3

Apaga 22
LOCATE 16, 10: COLOR 15: PRINT "Voce achou...."
LOCATE 17, 10: COLOR 14: PRINT nome1$
     cara(1).itens = cara(1).itens + 1: sons 16
    SELECT CASE Titem1
     CASE 1: Comida(NItem1) = Comida(NItem1) + 1
     CASE 2: Arma(NItem1) = Arma(NItem1) + 1
     CASE 3: Chave(NItem1) = Chave(NItem1) + 1
     CASE 4: Outro(NItem1) = Outro(NItem1) + 1
    END SELECT
DO
LOOP UNTIL INKEY$ <> ""
EXIT DO

CASE 3
 IF Condicao1 <> 0 THEN Condicao(Condicao1) = NC1
 IF Condicao2 <> 0 THEN Condicao(Condicao2) = NC2
 IF Condicao3 <> 0 THEN Condicao(Condicao3) = NC3
 IF NovaX <> 0 THEN APX% = PosGh: PosGh = NovaX
 IF NovaY <> 0 THEN APY% = PosGv: PosGv = NovaY
 IF APX% <> 0 OR APY% <> 0 THEN
  SELECT CASE APY%
   CASE 1: Putpic F1F(APX%), APY%, APX%
   CASE 2: Putpic F2F(APX%), APY%, APX%
   CASE 3: Putpic F3F(APX%), APY%, APX%
   CASE 4: Putpic F4F(APX%), APY%, APX%
   CASE 5: Putpic F5F(APX%), APY%, APX%
   CASE 6: Putpic F6F(APX%), APY%, APX%
  END SELECT
  PutGuy Perso
 END IF
IF NovaZona <> 0 THEN
 FOR i = 1 TO 30
  Condicao(i) = 0
 NEXT i
Zona = NovaZona: CLS : LoadAll ""
END IF
IF NovaPart <> 0 THEN Part = NovaPart
IF NovaMinPart <> 0 THEN MinPart = NovaMinPart: CLS : PrintMap "": PrintMenu "": PutGuy Perso
EXIT DO

END SELECT
END IF

LOOP

IF Ocerror = 1 THEN
Apaga 22: Ocerror = 0
COLOR 15
LOCATE 16, 10: PRINT "Nada interessante."
DO
LOOP UNTIL INKEY$ <> ""
END IF
3 :
CLOSE #3
IF Zona = Lazone AND MinPart = LaMinp AND Part = LaPart THEN PrintMenu ""

END SUB

SUB fprint (text$, textx%, texty%, colour%, file%)
  GET file%, 1, lpi%
  GET file%, 2, fws%
  GET file%, 3, fls%
  FOR count% = 1 TO LEN(text$)
    m% = ASC(MID$(text$, count%, 1)) - 29
    IF m% > 3 THEN
      GET file%, m%, a1%
      GET file%, m% + 1, a2%
      FOR N% = a1% TO a2% - 1 STEP lpi%
        FOR z% = 0 TO lpi% - 1
          GET file%, N% + z%, l%
          LINE (p% + textx%, (16 * z%) + texty%)-(p% + textx%, (16 * z%) + 15 + texty%), colour%, , l%
        NEXT z%
        p% = p% + 1
      NEXT N%
      p% = p% + fls%
    ELSE
      p% = p% + fws%
    END IF
  NEXT count%

END SUB



SUB Item (text$)

DIM Tipe AS INTEGER
DIM flecx AS INTEGER
DIM flecy AS INTEGER
DIM ItemE(1 TO 16) AS it

Tipe = 1
flecx = 1: flecy = 1
CLS

inicio:
OPEN lugar + "MAPAS\ITENS.MAP" FOR INPUT AS #2
IF Tipe <> 1 THEN
FOR i = 1 TO Tipe - 1
 FOR x = 1 TO 16
  INPUT #2, ItemE(x).nome
  INPUT #2, ItemE(x).Golpe
  INPUT #2, ItemE(x).energia
  INPUT #2, ItemE(x).EEnergia
  INPUT #2, ItemE(x).Elixir
  INPUT #2, ItemE(x).Valor
  INPUT #2, ItemE(x).Condicao
  INPUT #2, ItemE(x).NCondicao
 NEXT x
NEXT i
END IF
  FOR x = 1 TO 16
  INPUT #2, ItemE(x).nome
  INPUT #2, ItemE(x).Golpe
  INPUT #2, ItemE(x).energia
  INPUT #2, ItemE(x).EEnergia
  INPUT #2, ItemE(x).Elixir
  INPUT #2, ItemE(x).Valor
  INPUT #2, ItemE(x).Condicao
  INPUT #2, ItemE(x).NCondicao
  NEXT x
CLOSE #2

design:
itpos = flecy + ((flecx - 1) * 4)

COLOR 0: LOCATE 18, 21: PRINT ">>"
COLOR 0: LOCATE 18, 1: PRINT "<<"

FOR x = 5 TO 14
 LOCATE x, 21: COLOR 0: PRINT "123456789012345678"
NEXT x
FOR x = 1 TO 4
FOR y = 1 TO 4
LINE (x * 30 + 2, y * 30 + 2)-(x * 30 + 28, y * 30 + 28), 0, B
NEXT: NEXT
IF Tipe <> 4 THEN COLOR 14: LOCATE 18, 21: PRINT ">>"
IF Tipe <> 1 THEN COLOR 14: LOCATE 18, 1: PRINT "<<"

FOR x = 30 TO 120 STEP 30
FOR y = 30 TO 120 STEP 30
LINE (x, y)-(x + 30, y + 30), 9, B
NEXT y: NEXT x

IF flecy <> 5 THEN LINE (flecx * 30 + 2, flecy * 30 + 2)-(flecx * 30 + 28, flecy * 30 + 28), 14, B
IF flecy = 5 THEN LINE (25, 155)-(70, 170), 14, B
FOR x = 1 TO 16
CIRCLE (45 + INT(x / 4.2) * 30, 45 + (x - (4 * INT(x / 4.2)) - 1) * 30), 12, 0
NEXT x

LOCATE 21, 5: COLOR 12: PRINT "S"; : COLOR 15: PRINT "air"
LOCATE 1, 10: COLOR 54: PRINT "Energia: "; cara(1).energia; : PRINT "/"; cara(1).energiaT
FOR x = 1 TO 16
 SELECT CASE Tipe
  CASE 1
  IF Comida(x) <> 0 THEN CIRCLE (45 + INT(x / 4.2) * 30, 45 + (x - (4 * INT(x / 4.2)) - 1) * 30), 12, 10
  IF flecy <> 5 THEN LOCATE 6, 22: COLOR 15: PRINT "X"; : COLOR 10: PRINT Comida(itpos)
  CASE 2
  IF Arma(x) <> 0 THEN CIRCLE (45 + INT(x / 4.2) * 30, 45 + (x - (4 * INT(x / 4.2)) - 1) * 30), 12, 10
  IF flecy <> 5 THEN LOCATE 6, 22: COLOR 15: PRINT "X"; : COLOR 10: PRINT Arma(itpos)
  CASE 3
  IF Chave(x) <> 0 THEN CIRCLE (45 + INT(x / 4.2) * 30, 45 + (x - (4 * INT(x / 4.2)) - 1) * 30), 12, 10
  IF flecy <> 5 THEN LOCATE 6, 22: COLOR 15: PRINT "X"; : COLOR 10: PRINT Chave(itpos)
  CASE 4
  IF Outro(x) <> 0 THEN CIRCLE (45 + INT(x / 4.2) * 30, 45 + (x - (4 * INT(x / 4.2)) - 1) * 30), 12, 10
  IF flecy <> 5 THEN LOCATE 6, 22: COLOR 15: PRINT "X"; : COLOR 10: PRINT Outro(itpos)
  END SELECT
NEXT x

COLOR 15
IF flecy <> 5 THEN
LOCATE 5, 21: PRINT ItemE(itpos).nome
IF ItemE(itpos).Golpe <> "               " THEN LOCATE 7, 22: PRINT ItemE(itpos).Golpe
IF ItemE(itpos).energia <> 0 THEN LOCATE 8, 21: COLOR 9: PRINT ItemE(itpos).energia; : COLOR 15: PRINT "de Energia   "
IF ItemE(itpos).EEnergia <> 0 THEN LOCATE 9, 21: COLOR 9: PRINT ItemE(itpos).EEnergia; : COLOR 15: PRINT "pro inimigo   "
IF ItemE(itpos).Elixir <> 0 THEN LOCATE 10, 21: COLOR 9: PRINT ItemE(itpos).Valor;
COLOR 15
SELECT CASE ItemE(itpos).Elixir
 CASE 1: PRINT "de Ataque    "
 CASE 2: PRINT "de defesa    "
 CASE 3: PRINT "de magia     "
 CASE 4: PRINT "de agilidade "
 CASE 5: PRINT "energia m†x. "
END SELECT
END IF

DO
SELECT CASE INKEY$
 CASE CHR$(0) + "H"
 IF flecy = 5 THEN LINE (25, 155)-(70, 170), 0, B
 IF flecy > 1 THEN flecy = flecy - 1: GOTO design
 CASE CHR$(0) + "P"
 IF flecy < 5 THEN flecy = flecy + 1: GOTO design
 CASE CHR$(0) + "K"
 IF flecx > 1 AND flecy <> 5 THEN flecx = flecx - 1: GOTO design
 IF flecx = 1 AND Tipe <> 1 THEN Tipe = Tipe - 1: flecx = 4: GOTO inicio
 CASE CHR$(0) + "M"
 IF flecx < 4 AND flecy <> 5 THEN flecx = flecx + 1: GOTO design
 IF flecx = 4 AND Tipe <> 4 THEN Tipe = Tipe + 1: flecx = 1: GOTO inicio
 CASE "S", "s", CHR$(27): EXIT DO
 CASE CHR$(13), CHR$(32)
  IF flecy <> 5 THEN
  x = (itpos)
  SELECT CASE Tipe
  CASE 1
   IF Comida(x) > 0 THEN Comida(x) = Comida(x) - 1: GOTO usando
  CASE 2
   IF Arma(x) > 0 THEN Arma(x) = Arma(x) - 1: GOTO usando
  CASE 3
   IF Chave(x) > 0 THEN Chave(x) = Chave(x) - 1: GOTO usando
  CASE 4
   IF Outro(x) > 0 THEN Outro(x) = Outro(x) - 1: GOTO usando
  END SELECT
 ELSE
  EXIT DO
 END IF
END SELECT
LOOP
GOTO depoisduso
usando:
cara(1).itens = cara(1).itens - 1
cara(1).energia = cara(1).energia + ItemE(itpos).energia
PEI = PEI + ItemE(itpos).EEnergia
SELECT CASE ItemE(itpos).Elixir
 CASE 1: cara(1).ataque = cara(1).ataque + ItemE(itpos).Valor
 CASE 2: cara(1).defesa = cara(1).defesa + ItemE(itpos).Valor
 CASE 3: cara(1).magia = cara(1).magia + ItemE(itpos).Valor
 CASE 4: cara(1).agilidade = cara(1).agilidade + ItemE(itpos).Valor
 CASE 5
 x = (cara(1).energia / cara(1).energiaT)
 cara(1).energiaT = cara(1).energiaT + ItemE(itpos).Valor
 cara(1).energia = INT(cara(1).energiaT * x)
END SELECT
IF cara(1).energia > cara(1).energiaT THEN cara(1).energia = cara(1).energiaT
IF ItemE(itpos).Golpe <> "               " THEN Agolpe ItemE(itpos).Golpe: Janela -1: Apaga 22


SELECT CASE Tipe
 CASE 4
  SELECT CASE itpos
   CASE 1
     cara(1).itens = cara(1).itens + 1
     Outro(1) = Outro(1) + 1
     LOCATE 9, 21: PRINT "Qual n£mero"
     LOCATE 10, 21: INPUT "", numero$
   IF numero$ = "190" THEN
    cara(1).expe = 1000: exper ""
    LOCATE 11, 21: PRINT "!"
    DO
    LOOP UNTIL INKEY$ <> ""
    CLS : GOTO design
   ELSEIF numero$ = "193" THEN
    cara(1).energia = cara(1).energiaT: LOCATE 11, 21: PRINT "!"
   ELSEIF numero$ = "130" THEN
   LOCATE 11, 21: PRINT TIME$
   ELSE
    LOCATE 11, 21: PRINT "Ocupado..."
   END IF
   DO
   LOOP UNTIL INKEY$ <> ""
   CASE 2
    Outro(2) = Outro(2) + 1
    cara(1).itens = cara(1).itens + 1
   CASE 5
    IF cara(1).estatus = "Envenenado" THEN cara(1).estatus = "OK"
   CASE 3, 7
    CLS : GOTO design
 
  END SELECT
END SELECT
GOTO design
depoisduso:





END SUB



SUB Janela (colour%)

IF colour% = 0 THEN
 SELECT CASE Perso
  CASE 1: colour% = 40
  CASE 2: colour% = 49
  CASE 4: colour% = 60
  CASE 3: colour% = 32
 END SELECT
END IF

cr = colour%

IF cr <> -1 THEN
LINE (68, 116)-(240, 180), cr, B
LINE (65, 113)-(243, 183), cr + 3, B
LINE (67, 115)-(241, 181), cr + 1, B
LINE (66, 114)-(242, 182), cr + 2, B
PAINT (100, 150), 0, cr
ELSE
LINE (68, 116)-(240, 180), 0, B
LINE (65, 113)-(243, 183), 0, B
LINE (67, 115)-(241, 181), 0, B
LINE (66, 114)-(242, 182), 0, B
END IF

END SUB

SUB LoadAll (text$)


LOCATE 12, 1: PRINT "Loading..."
LOCATE 15, 1: PRINT "000%"

DEF SEG = VARSEG(Allpic(1))
 BLOAD lugar + "FIGURAS\RKO.ADC", VARPTR(Allpic(1))
DEF SEG
PUT (1, 1), Allpic
GET (1, 1)-(16, 17), Rodrigo1
GET (17, 1)-(32, 17), Rodrigo2
GET (33, 1)-(48, 17), Rodrigo3
GET (49, 1)-(49 + 15, 17), Rodrigo4
LOCATE 15, 1: PRINT "010%"
DEF SEG = VARSEG(Allpic(1))
 BLOAD lugar + "FIGURAS\MHW.ADC", VARPTR(Allpic(1))
DEF SEG
PUT (1, 1), Allpic, PSET
GET (1, 1)-(16, 17), Mayron1
GET (17, 1)-(32, 17), Mayron2
GET (33, 1)-(48, 17), Mayron3
GET (49, 1)-(49 + 15, 17), Mayron4
LOCATE 15, 1: PRINT "020%"
DEF SEG = VARSEG(Allpic(1))
 BLOAD lugar + "FIGURAS\RON.ADC", VARPTR(Allpic(1))
DEF SEG

PUT (1, 1), Allpic, PSET
GET (1, 1)-(16, 17), Ronald1
GET (17, 1)-(32, 17), Ronald2
GET (33, 1)-(48, 17), Ronald3
GET (49, 1)-(49 + 15, 17), Ronald4
LOCATE 15, 1: PRINT "030%"
DEF SEG = VARSEG(Allpic(1))
 BLOAD lugar + "FIGURAS\TRW.ADC", VARPTR(Allpic(1))
DEF SEG
PUT (1, 1), Allpic, PSET
GET (1, 1)-(16, 17), Thayse1
GET (17, 1)-(32, 17), Thayse2
GET (33, 1)-(48, 17), Thayse3
GET (49, 1)-(49 + 15, 17), Thayse4
LOCATE 15, 1: PRINT "040%"

DEF SEG = VARSEG(Allpic2(1))
 BLOAD lugar + "FIGURAS\ZONA" + LTRIM$(STR$(Zona)) + ".ADC", VARPTR(Allpic2(1))
DEF SEG
PUT (76, 106), Allpic2
GET (76, 106)-(91, 122), Mapa1
GET (92, 106)-(107, 122), Mapa2
GET (108, 106)-(123, 122), Mapa3
GET (124, 106)-(139, 122), Mapa4
GET (140, 106)-(155, 122), Mapa5
GET (156, 106)-(171, 122), Mapa6
GET (172, 106)-(187, 122), Mapa7
GET (188, 106)-(203, 122), Mapa8
GET (204, 106)-(219, 122), Mapa9
GET (220, 106)-(235, 122), Mapa10
GET (76, 123)-(91, 139), Mapa11
GET (92, 123)-(107, 139), Mapa12
GET (108, 123)-(123, 139), Mapa13
GET (124, 123)-(139, 139), Mapa14
GET (140, 123)-(155, 139), Mapa15
GET (156, 123)-(171, 139), Mapa16
GET (172, 123)-(187, 139), Mapa17
GET (188, 123)-(203, 139), Mapa18
GET (204, 123)-(219, 139), Mapa19
GET (220, 123)-(235, 139), Mapa20
GET (76, 140)-(91, 156), Mapa21
GET (92, 140)-(107, 156), Mapa22
GET (108, 140)-(123, 156), Tijol1
GET (124, 140)-(139, 156), Tijol2
GET (140, 140)-(155, 156), Tijol3
GET (156, 140)-(171, 156), Pessoa1
GET (172, 140)-(187, 156), Pessoa2
GET (188, 140)-(203, 156), Pessoa3
GET (204, 140)-(219, 156), Pessoa4
GET (220, 140)-(235, 156), Pessoa5
GET (76, 157)-(91, 173), Mapa23
GET (92, 157)-(107, 173), Mapa24
GET (108, 157)-(123, 173), Mapa25

LOCATE 15, 1: PRINT "070%"

DEF SEG = VARSEG(Allpic3(1))
 BLOAD lugar + "FIGURAS\ZONA" + LTRIM$(STR$(Zona)) + "F.ADC", VARPTR(Allpic3(1))
DEF SEG
PUT (76, 106), Allpic3, PSET
GET (76, 106)-(91, 122), Luta1
GET (92, 106)-(107, 122), Luta2
GET (108, 106)-(123, 122), Luta3
GET (124, 106)-(139, 122), Luta4
GET (140, 106)-(155, 122), Luta5
GET (156, 106)-(171, 122), Luta6
GET (172, 106)-(187, 122), Luta7
GET (188, 106)-(203, 122), Luta8
GET (204, 106)-(219, 122), Luta9
GET (220, 106)-(235, 122), Luta10
LOCATE 15, 1: PRINT "100%"

END SUB

SUB LoadPlayer (text$)
 Janela 0: Apaga 22: COLOR 15
 LOCATE 16, 10: PRINT "Qual a senha?"
 LOCATE 17, 10: INPUT "", senha$

OPEN lugar + "SAVES\" + senha$ + ".SAV" FOR INPUT AS #1
 IF Ocerror = 1 THEN
  LOCATE 19, 10: COLOR 4: PRINT "N∆o encontrado!"
  LOCATE 20, 10: COLOR 15: PRINT "Verifique sua senha."
  DO
  LOOP UNTIL INKEY$ <> ""
 ELSE
  INPUT #1, Perso, cara(1).level, cara(1).energia, cara(1).energiaT, cara(1).ataque, cara(1).defesa, cara(1).magia, cara(1).agilidade
  INPUT #1, cara(1).estatus, cara(1).golpe1, cara(1).golpe2, cara(1).golpe3, cara(1).golpe4
  INPUT #1, cara(1).itens, cara(1).dinheiro, cara(1).direcao, cara(1).pp
  INPUT #1, NZona, Part, MinPart, PosGv, PosGh
  FOR i = 1 TO 30
   INPUT #1, Condicao(i)
  NEXT i
  FOR i = 1 TO 16
   INPUT #1, Comida(i)
  NEXT i
  FOR i = 1 TO 16
   INPUT #1, Arma(i)
  NEXT i
  FOR i = 1 TO 16
   INPUT #1, Chave(i)
  NEXT i
  FOR i = 1 TO 16
   INPUT #1, Outro(i)
  NEXT i
  CLOSE #1
  LOCATE 19, 10: COLOR 9: PRINT "Jogo Carregado!"
  LOCATE 20, 10: COLOR 15: PRINT "Pressione qualquer"
  LOCATE 21, 10: PRINT "tecla"
  DO
  LOOP UNTIL INKEY$ <> ""
  IF NZona <> Zona THEN Zona = NZona: CLS : LoadAll ""
  CLS
  PrintMap ""
  PrintMenu ""
  PutGuy Perso

END IF

CLOSE #1

END SUB

SUB logo (text$)

OPEN "lucidaha.qbf" FOR RANDOM AS #1 LEN = 2
fprint "Microbasic ADC", 0, 30, 9, 1

CLOSE #1
DO
LOOP UNTIL INKEY$ <> ""
LOCATE 10, 15
COLOR 9: PRINT "N"; : COLOR 15: PRINT "ovo jogo"
LOCATE 12, 15
COLOR 9: PRINT "J"; : COLOR 15: PRINT "ogo salvo"
LOCATE 14, 15
COLOR 4: PRINT "S"; : COLOR 12: PRINT "air "


END SUB

SUB Luta (Ti%, Ilevel%, IPT%, ipn%, Variante%)

FightType = 0
DIM ItemE(1 TO 16) AS it
DIM inimigo(1) AS enemyType
PEI = 0
OPEN lugar + "FIGURAS\INIMIGO" + LTRIM$(STR$(Ti%)) + ".INF" FOR INPUT AS #5
 INPUT #5, name$, InN, Iataque%, Idefesa%, Imagia%
 INPUT #5, Iagilidade%, Inienergia%
 INPUT #5, inimigo(1).golpe1, inimigo(1).golpe2
 INPUT #5, inimigo(1).golpe3, inimigo(1).golpe4
 CLOSE #5
 COLOR 15: LOCATE 1, 1
 Vx = 1 + Variante% / 100
 Vn = 1 - Variante% / 100
 IF Ilevel% < 0 THEN inimigo(1).level = cara(1).level + ABS(Ilevel%) ELSE inimigo(1).level = INT((Ilevel% * Vx - Ilevel% * Vn + 1) * RND + Ilevel% * Vn)
 inimigo(1).ataque = INT((inimigo(1).level * Iataque%) / 100)
 inimigo(1).defesa = INT((inimigo(1).level * Idefesa%) / 100)
 inimigo(1).magia = INT((inimigo(1).level * Imagia%) / 100)
 inimigo(1).agilidade = INT((inimigo(1).level * Iagilidade%) / 100)
 inimigo(1).energia = Inienergia% * inimigo(1).level
 inimigo(1).energiaT = inimigo(1).energia

PrintLuta ""
LOCATE 16, 10: COLOR 9: PRINT name$; : COLOR 15: PRINT " apareceu!"
 DO
 LOOP UNTIL INKEY$ <> ""
 Apaga 16

LOCATE 16, 10: COLOR 12: PRINT name$
LOCATE 17, 10: COLOR 9: PRINT "Lv."; inimigo(1).level
Putener2 inimigo(1).energia, inimigo(1).energiaT, 2
                                             
LOCATE 16, 22: COLOR cr
SELECT CASE Perso
 CASE 1: PRINT "Rodrigo"
 CASE 2: PRINT "Mayron"
 CASE 4: PRINT "Thayse"
END SELECT

LOCATE 17, 22: COLOR 9: PRINT "Lv."; cara(1).level
Putener2 cara(1).energia, cara(1).energiaT, 1
LOCATE 22, 21: COLOR 15: PRINT RTRIM$(cara(1).estatus)
DO
LOOP UNTIL INKEY$ <> ""

CaraGolpe:
Apaga 22
LOCATE 22, 12: COLOR 14: PRINT "Ataque": COLOR 15
LOCATE 16, 12: PRINT cara(1).golpe1
LOCATE 17, 12: PRINT cara(1).golpe2
LOCATE 18, 12: PRINT cara(1).golpe3
LOCATE 19, 12: PRINT cara(1).golpe4
LOCATE 20, 12: COLOR 53: PRINT "Item"
LOCATE 21, 12: COLOR 40: PRINT "Fugir"
flecha = 1
DO
 COLOR 0
 FOR i = 16 TO 21
   LOCATE i, 11: PRINT ">"
 NEXT
 COLOR 14: LOCATE (15 + flecha), 11: PRINT ">"
 FOR x = 1 TO 15
   SELECT CASE INKEY$
   END SELECT
 NEXT x
DO
 SELECT CASE INKEY$
  CASE CHR$(0) + "H": IF flecha <> 1 THEN flecha = flecha - 1: EXIT DO
  CASE CHR$(0) + "P": IF flecha <> 6 THEN flecha = flecha + 1: EXIT DO
  CASE CHR$(32): GOTO ExecutaAcao
 END SELECT
LOOP
LOOP
ExecutaAcao:

SELECT CASE flecha
 CASE 1: Golpe$ = cara(1).golpe1
 CASE 2: Golpe$ = cara(1).golpe2
 CASE 3: Golpe$ = cara(1).golpe3
 CASE 4: Golpe$ = cara(1).golpe4
 CASE 5: Item ""
  inimigo(1).energia = inimigo(1).energia + PEI: PEI = 0
  PrintLuta ""
  IF inimigo(1).energia <= 0 THEN GOTO InimigoMorreu
  GOTO CaraGolpe
 CASE 6: GOTO desistiu
END SELECT

SOM = 0
GolpeT = "ND"
ForcadoAtaque = 0
EscGlp Golpe$
 SELECT CASE RTRIM$(Golpe$)
  CASE "Choque": Animation 2
  CASE "Peido": Animation 6
  CASE "Arroto": Animation 8
 END SELECT

Escapa = INT(RND * 5) + 1

IF cara(1).agilidade < inimigo(1).agilidade / Escapa THEN
 COLOR 14: LOCATE 22, 12: PRINT "!Desviou!"
ELSE
 IF SOM <> 0 THEN sons SOM
 Apaga 22
 LOCATE 16, 10: COLOR 12: PRINT name$
 LOCATE 17, 10: COLOR 9: PRINT "Lv."; inimigo(1).level
 Putener2 inimigo(1).energia, inimigo(1).energiaT, 2
 SLEEP 1
 IF GolpeT = "AT" THEN ForcadoAtaque = cara(1).ataque + GolpeF
 IF GolpeT = "MG" THEN ForcadoAtaque = cara(1).magia + GolpeF
 IF GolpeT = "DF" THEN cara(1).defesa = cara(1).defesa + GolpeF: inimigo(1).defesa = inimigo(1).defesa - GolpeF
 IF GolpeT = "AG" THEN ForcadoAtaque = inimigo(1).defesa + 30
 IF Ti% = 2 AND GolpeT = "MG" THEN ForcadoAtaque = ForcadoAtaque * 5
 IF (ForcadoAtaque > inimigo(1).defesa) THEN
   EnerAntes = inimigo(1).energia
   inimigo(1).energia = inimigo(1).energia - (ForcadoAtaque - inimigo(1).defesa)
  
  FOR iniener% = EnerAntes TO inimigo(1).energia STEP -1
   FOR z = 1 TO 5000: NEXT
   Putener2 iniener%, inimigo(1).energiaT, 2
   IF iniener% = 5 AND Ti% = 2 THEN
    Apaga 22: COLOR 15: LOCATE 16, 10: PRINT "Ele fugiu!"
    GOTO InimigoMorreu
   END IF
   IF iniener% = 0 THEN GOTO InimigoMorreu
  NEXT
 END IF
END IF
 SLEEP 1

AtaqueRobo:
Apaga 22
LOCATE 22, 12: COLOR 14: PRINT "...": COLOR 15
LOCATE 16, 12: PRINT inimigo(1).golpe1
LOCATE 17, 12: PRINT inimigo(1).golpe2
LOCATE 18, 12: PRINT inimigo(1).golpe3
LOCATE 19, 12: PRINT inimigo(1).golpe4
LOCATE 20, 12: COLOR 53: PRINT "Item"
LOCATE 21, 12: COLOR 40: PRINT "Fugir"
SLEEP 1
IF RTRIM$(inimigo(1).golpe4) <> "- - -" THEN AtaqueEscolhido = INT(RND * 4) + 1: GOTO Dano
IF RTRIM$(inimigo(1).golpe3) <> "- - -" THEN AtaqueEscolhido = INT(RND * 3) + 1: GOTO Dano
AtaqueEscolhido = INT(RND * 2) + 1

Dano:
COLOR 14
SELECT CASE AtaqueEscolhido
 CASE 1: Golpe$ = inimigo(1).golpe1: LOCATE 16, 11
 CASE 2: Golpe$ = inimigo(1).golpe2: LOCATE 17, 11
 CASE 3: Golpe$ = inimigo(1).golpe3: LOCATE 18, 11
 CASE 4: Golpe$ = inimigo(1).golpe4: LOCATE 19, 11
END SELECT
PRINT ">"
SLEEP 1
SOM = 0
EscGlp Golpe$
 SELECT CASE RTRIM$(Golpe$)
  CASE "Choque": Animation 1
 END SELECT

Escapa = INT(RND * 5) + 1

IF inimigo(1).agilidade < cara(1).agilidade / Escapa THEN
 COLOR 14: LOCATE 22, 12: PRINT "!Desviou!"
ELSE
 IF SOM <> 0 THEN sons SOM
 Apaga 22: LOCATE 16, 22: COLOR cr
 IF Perso = 1 THEN PRINT "Rodrigo"
 IF Perso = 2 THEN PRINT "Mayron"
 IF Perso = 4 THEN PRINT "Thayse"
 LOCATE 17, 22: COLOR 9: PRINT "Lv."; cara(1).level
 Putener2 cara(1).energia, cara(1).energiaT, 1
 LOCATE 22, 21: COLOR 15: PRINT RTRIM$(cara(1).estatus)

 SLEEP 1
 IF GolpeT = "AT" THEN ForcadoAtaque = inimigo(1).ataque + GolpeF
 IF GolpeT = "MG" THEN ForcadoAtaque = inimigo(1).magia + GolpeF

 IF (ForcadoAtaque > cara(1).defesa) THEN
   enerA = cara(1).energia
   cara(1).energia = cara(1).energia - (ForcadoAtaque - cara(1).defesa)
  FOR iniener% = enerA TO cara(1).energia STEP -1
   FOR i = 1 TO 10000: NEXT
   IF cara(1).energia < 0 THEN cara(1).energia = 0
  Putener2 iniener%, cara(1).energiaT, 1
  NEXT
 ELSE
  cara(1).energia = cara(1).energia - 1
 END IF
END IF
   SLEEP 1
   IF cara(1).energia = 0 THEN CLS : COLOR 4: LOCATE 15, 15: PRINT "GAME OVER": END
GOTO CaraGolpe

InimigoMorreu:
IF Ti% = 8 THEN
CLS : COLOR 9: PRINT "ParabÇns! Vocà fechou o jogo (ê, n∆o fiz final)!"
DO
LOOP UNTIL INKEY$ <> ""
END
END IF
FightType = 1
ponts = INT((inimigo(1).ataque + inimigo(1).defesa + inimigo(1).magia + inimigo(1).agilidade) * inimigo(1).energiaT / 2)
cara(1).expe = ponts
Apaga 22
exper ""
LOCATE 16, 10: COLOR 15: PRINT "Vocà ganhou"; ponts; "exp"
DO
LOOP UNTIL INKEY$ <> ""
IF IPT% <> 0 THEN
 OPEN lugar + "MAPAS\ITENS.MAP" FOR INPUT AS #2
 IF IPT% <> 1 THEN
 FOR i = 1 TO IPT% - 1
  FOR x = 1 TO 16
   INPUT #2, ItemE(x).nome
   INPUT #2, ItemE(x).Golpe
   INPUT #2, ItemE(x).energia
   INPUT #2, ItemE(x).EEnergia
   INPUT #2, ItemE(x).Elixir
   INPUT #2, ItemE(x).Valor
   INPUT #2, ItemE(x).Condicao
   INPUT #2, ItemE(x).NCondicao
  NEXT x
 NEXT i
 END IF
   FOR x = 1 TO 16
   INPUT #2, ItemE(x).nome
   INPUT #2, ItemE(x).Golpe
   INPUT #2, ItemE(x).energia
   INPUT #2, ItemE(x).EEnergia
   INPUT #2, ItemE(x).Elixir
   INPUT #2, ItemE(x).Valor
   INPUT #2, ItemE(x).Condicao
   INPUT #2, ItemE(x).NCondicao
   NEXT x
 CLOSE #2
Apaga 22: COLOR 15
LOCATE 16, 10: PRINT "Vocà ganhou um(a)..."
LOCATE 17, 10: COLOR 14: PRINT ItemE(ipn%).nome
    cara(1).itens = cara(1).itens + 1
    SELECT CASE IPT%
     CASE 1: Comida(ipn%) = Comida(ipn%) + 1
     CASE 2: Arma(ipn%) = Arma(ipn%) + 1
     CASE 3: Chave(ipn%) = Chave(ipn%) + 1
     CASE 4: Outro(ipn%) = Outro(ipn%) + 1
    END SELECT
DO
LOOP UNTIL INKEY$ <> ""
END IF

desistiu:

CLS
PrintMap "": PutGuy Perso

END SUB

SUB minimenu (text$)

MiniStart:
Apaga 22
LOCATE 16, 10: COLOR 9: PRINT "I"; : COLOR 15: PRINT "tens"
LOCATE 17, 10: COLOR 9: PRINT "S"; : COLOR 15: PRINT "alvar"
LOCATE 18, 10: COLOR 9: PRINT "E"; : COLOR 15: PRINT "status"
LOCATE 19, 10: COLOR 9: PRINT "T"; : COLOR 15: PRINT "erminar"
LOCATE 20, 10: COLOR 9: PRINT "C"; : COLOR 15: PRINT "ancelar"
LOCATE 21, 10: COLOR 9: PRINT "L"; : COLOR 15: PRINT "oad"

DO
IF Ocerror = 1 THEN Ocerror = 0
SELECT CASE INKEY$
 CASE "I", "i": Item "": CLS : PrintMap "": PrintMenu "": PutGuy Perso: EXIT DO
 CASE "T", "t": END
 CASE "S", "s": Salvar "": EXIT DO
 CASE "L", "l": LoadPlayer "": IF Ocerror <> 1 THEN EXIT DO ELSE GOTO MiniStart
 CASE "C", "c": EXIT DO
 CASE "E", "e": PutEstatus "": EXIT DO
END SELECT
LOOP


PrintMenu ""

END SUB

SUB PrintLuta (text$)

CLS
PAINT (1, 1), 15
SELECT CASE Perso
  CASE 1: PUT (200, 40), Rodrigo4, PSET: cr = 40
  CASE 2: PUT (200, 40), Mayron4, PSET: cr = 49
  CASE 3: PUT (200, 40), Ronald4, PSET: cr = 32
  CASE 4: PUT (200, 40), Thayse4, PSET: cr = 60
END SELECT
Janela 0: Apaga 22
SELECT CASE InN
 CASE 1: PUT (80, 40), Luta1, PSET
 CASE 4: PUT (80, 40), Luta4, PSET
 CASE 7: PUT (80, 40), Luta7, PSET
 CASE 8: PUT (80, 40), Luta8, PSET
 CASE 9: PUT (80, 40), Luta9, PSET
 CASE 10: PUT (80, 40), Luta10, PSET
END SELECT


END SUB

SUB PrintMap (text$)

OPEN lugar + "MAPAS\ZONE" + LTRIM$(STR$(Zona)) + ".MAP" FOR INPUT AS #1
  DO
  INPUT #1, x
  IF x = 0 THEN INPUT #1, x
  INPUT #1, y
   IF x = Part AND y = MinPart THEN
    FOR i% = 1 TO 19
    INPUT #1, F1F(i%)
    Putpic F1F(i%), 1, i%
    IF F1F(i%) > 30 AND F1F(i%) < 35 AND Perso = 1 THEN F1F(i%) = 25
    NEXT i%
    FOR i% = 1 TO 19
    INPUT #1, F2F(i%)
    Putpic F2F(i%), 2, i%
    IF F2F(i%) > 30 AND F2F(i%) < 35 AND Perso = 1 THEN F2F(i%) = 25
    NEXT i%
    FOR i% = 1 TO 19
    INPUT #1, F3F(i%)
    Putpic F3F(i%), 3, i%
    IF F3F(i%) > 30 AND F3F(i%) < 35 AND Perso = 1 THEN F3F(i%) = 25
    NEXT
    FOR i% = 1 TO 19
    INPUT #1, F4F(i%)
    Putpic F4F(i%), 4, i%
    IF F4F(i%) > 30 AND F4F(i%) < 35 AND Perso = 1 THEN F4F(i%) = 25
    NEXT
    FOR i% = 1 TO 19
    INPUT #1, F5F(i%)
    Putpic F5F(i%), 5, i%
    IF F5F(i%) > 30 AND F5F(i%) < 35 AND Perso = 1 THEN F5F(i%) = 25
    NEXT
    FOR i% = 1 TO 19
    INPUT #1, F6F(i%)
    Putpic F6F(i%), 6, i%
    IF F6F(i%) > 30 AND F6F(i%) < 35 AND Perso = 1 THEN F6F(i%) = 25
    NEXT
  EXIT DO
  ELSE
   FOR i = 1 TO 114
   INPUT #1, nada%
   NEXT
  END IF
LOOP

CLOSE #1



END SUB

SUB PrintMenu (text$)

Janela 0

Apaga 22
COLOR 15
LOCATE 16, 10: PRINT "Itens   ="; cara(1).itens
LOCATE 17, 10: PRINT "Energia ="; cara(1).energia; : PRINT "/"; cara(1).energiaT
LOCATE 18, 10: PRINT "Estatus = "; cara(1).estatus
LOCATE 19, 10: COLOR 10: PRINT "Dinheiro = R$"; cara(1).dinheiro

END SUB

SUB Putener2 (Bener%, Tener%, tipo%)

IF tipo% = 2 THEN x = 73
IF tipo% = 1 THEN x = 168

LINE (x, 150)-(x + 70, 160), 15, B

IF Bener% = Tener% THEN
 cor = 9
 ELSEIF Bener% < Tener% AND Bener% >= INT(Tener% * .5) THEN
 cor = 2
 ELSEIF Bener% < INT(Tener% * .5) AND Bener% >= INT(Tener% * .2) THEN
 cor = 14
 ELSEIF Bener% = 0 THEN
 cor = 15
 ELSE
 cor = 12
END IF

egz = INT((69 * Bener% + Tener% * x) / Tener%)
LINE (x + 1, 151)-(egz, 159), cor, BF
IF Bener% <> Tener% THEN LINE (egz + 1, 151)-(x + 69, 159), 0, BF




END SUB

SUB PutEstatus (text$)
   
    FOR j = 16 TO 22
    LOCATE j, 10: COLOR 0: PRINT "XXXXXXXXXXXXXXXXXXXXX"
    NEXT j
COLOR 15
LOCATE 16, 10: PRINT "Estatus: "; cara(1).estatus
LOCATE 17, 10: PRINT "Level: "; cara(1).level
LOCATE 18, 10: PRINT "P.P: "; cara(1).pp
LOCATE 19, 10: PRINT "Ener: "; cara(1).energia; "/"; cara(1).energiaT
     DO
     LOOP UNTIL INKEY$ <> ""

Apaga 22
COLOR 15
LOCATE 16, 10: PRINT "Ataque:"; cara(1).ataque
LOCATE 17, 10: PRINT "Defesa:"; cara(1).defesa
LOCATE 18, 10: PRINT "Agilidade:"; cara(1).agilidade
LOCATE 19, 10: PRINT "Magia:"; cara(1).magia
DO
LOOP UNTIL INKEY$ <> ""
Apaga 22
COLOR 15
LOCATE 16, 10: PRINT cara(1).golpe1
LOCATE 17, 10: PRINT cara(1).golpe2
LOCATE 18, 10: PRINT cara(1).golpe3
LOCATE 19, 10: PRINT cara(1).golpe4

     DO
     LOOP UNTIL INKEY$ <> ""

    FOR j = 16 TO 22
    LOCATE j, 10: COLOR 0: PRINT "XXXXXXXXXXXXXXXXXXXXX"
    NEXT j

COLOR 15
LOCATE 16, 10: PRINT "Itens   ="; cara(1).itens
LOCATE 17, 10: PRINT "Energia ="; cara(1).energia; : PRINT "/"; cara(1).energiaT
LOCATE 18, 10: PRINT "Estatus = "; cara(1).estatus
LOCATE 19, 10: COLOR 10: PRINT "Dinheiro = R$"; cara(1).dinheiro

END SUB

SUB PutGuy (Guy%)

SELECT CASE Guy%
 CASE 1
  SELECT CASE cara(1).direcao
  CASE 1: PUT (2 + (PosGh - 1) * 16, 2 + (PosGv - 1) * 17), Rodrigo2, PSET
  CASE 2: PUT (2 + (PosGh - 1) * 16, 2 + (PosGv - 1) * 17), Rodrigo3, PSET
  CASE 3: PUT (2 + (PosGh - 1) * 16, 2 + (PosGv - 1) * 17), Rodrigo1, PSET
  CASE 4: PUT (2 + (PosGh - 1) * 16, 2 + (PosGv - 1) * 17), Rodrigo4, PSET
  END SELECT
  CASE 2
  SELECT CASE cara(1).direcao
  CASE 1: PUT (2 + (PosGh - 1) * 16, 2 + (PosGv - 1) * 17), Mayron2, PSET
  CASE 2: PUT (2 + (PosGh - 1) * 16, 2 + (PosGv - 1) * 17), Mayron3, PSET
  CASE 3: PUT (2 + (PosGh - 1) * 16, 2 + (PosGv - 1) * 17), Mayron1, PSET
  CASE 4: PUT (2 + (PosGh - 1) * 16, 2 + (PosGv - 1) * 17), Mayron4, PSET
  END SELECT
 CASE 3
  SELECT CASE cara(1).direcao
  CASE 1: PUT (2 + (PosGh - 1) * 16, 2 + (PosGv - 1) * 17), Ronald2, PSET
  CASE 2: PUT (2 + (PosGh - 1) * 16, 2 + (PosGv - 1) * 17), Ronald3, PSET
  CASE 3: PUT (2 + (PosGh - 1) * 16, 2 + (PosGv - 1) * 17), Ronald1, PSET
  CASE 4: PUT (2 + (PosGh - 1) * 16, 2 + (PosGv - 1) * 17), Ronald4, PSET
  END SELECT

 CASE 4
 SELECT CASE cara(1).direcao
  CASE 1: PUT (2 + (PosGh - 1) * 16, 2 + (PosGv - 1) * 17), Thayse2, PSET
  CASE 2: PUT (2 + (PosGh - 1) * 16, 2 + (PosGv - 1) * 17), Thayse3, PSET
  CASE 3: PUT (2 + (PosGh - 1) * 16, 2 + (PosGv - 1) * 17), Thayse1, PSET
  CASE 4: PUT (2 + (PosGh - 1) * 16, 2 + (PosGv - 1) * 17), Thayse4, PSET
 END SELECT


END SELECT

END SUB

SUB Putpic (Picture%, ColunaY%, LinhaX%)

 SELECT CASE Picture%
  CASE 1: PUT (2 + (LinhaX% - 1) * 16, 2 + (ColunaY% - 1) * 17), Mapa1, PSET
  CASE 2: PUT (2 + (LinhaX% - 1) * 16, 2 + (ColunaY% - 1) * 17), Mapa2, PSET
  CASE 3: PUT (2 + (LinhaX% - 1) * 16, 2 + (ColunaY% - 1) * 17), Mapa3, PSET
  CASE 4: PUT (2 + (LinhaX% - 1) * 16, 2 + (ColunaY% - 1) * 17), Mapa4, PSET
  CASE 5: PUT (2 + (LinhaX% - 1) * 16, 2 + (ColunaY% - 1) * 17), Mapa5, PSET
  CASE 6: PUT (2 + (LinhaX% - 1) * 16, 2 + (ColunaY% - 1) * 17), Mapa6, PSET
  CASE 7: PUT (2 + (LinhaX% - 1) * 16, 2 + (ColunaY% - 1) * 17), Mapa7, PSET
  CASE 8: PUT (2 + (LinhaX% - 1) * 16, 2 + (ColunaY% - 1) * 17), Mapa8, PSET
  CASE 9: PUT (2 + (LinhaX% - 1) * 16, 2 + (ColunaY% - 1) * 17), Mapa9, PSET
 CASE 10: PUT (2 + (LinhaX% - 1) * 16, 2 + (ColunaY% - 1) * 17), Mapa10, PSET
 CASE 11: PUT (2 + (LinhaX% - 1) * 16, 2 + (ColunaY% - 1) * 17), Mapa11, PSET
 CASE 12: PUT (2 + (LinhaX% - 1) * 16, 2 + (ColunaY% - 1) * 17), Mapa12, PSET
 CASE 13: PUT (2 + (LinhaX% - 1) * 16, 2 + (ColunaY% - 1) * 17), Mapa13, PSET
 CASE 14: PUT (2 + (LinhaX% - 1) * 16, 2 + (ColunaY% - 1) * 17), Mapa14, PSET
 CASE 15: PUT (2 + (LinhaX% - 1) * 16, 2 + (ColunaY% - 1) * 17), Mapa15, PSET
 CASE 16: PUT (2 + (LinhaX% - 1) * 16, 2 + (ColunaY% - 1) * 17), Mapa16, PSET
 CASE 17: PUT (2 + (LinhaX% - 1) * 16, 2 + (ColunaY% - 1) * 17), Mapa17, PSET
 CASE 18: PUT (2 + (LinhaX% - 1) * 16, 2 + (ColunaY% - 1) * 17), Mapa18, PSET
 CASE 19: PUT (2 + (LinhaX% - 1) * 16, 2 + (ColunaY% - 1) * 17), Mapa19, PSET
 CASE 20: PUT (2 + (LinhaX% - 1) * 16, 2 + (ColunaY% - 1) * 17), Mapa20, PSET
 CASE 21: PUT (2 + (LinhaX% - 1) * 16, 2 + (ColunaY% - 1) * 17), Mapa21, PSET
 CASE 22: PUT (2 + (LinhaX% - 1) * 16, 2 + (ColunaY% - 1) * 17), Mapa22, PSET
 CASE 23: PUT (2 + (LinhaX% - 1) * 16, 2 + (ColunaY% - 1) * 17), Tijol1, PSET
 CASE 24: PUT (2 + (LinhaX% - 1) * 16, 2 + (ColunaY% - 1) * 17), Tijol2, PSET
 CASE 25: PUT (2 + (LinhaX% - 1) * 16, 2 + (ColunaY% - 1) * 17), Tijol3, PSET
 CASE 26: PUT (2 + (LinhaX% - 1) * 16, 2 + (ColunaY% - 1) * 17), Pessoa1, PSET
 CASE 27: PUT (2 + (LinhaX% - 1) * 16, 2 + (ColunaY% - 1) * 17), Pessoa2, PSET
 CASE 28: PUT (2 + (LinhaX% - 1) * 16, 2 + (ColunaY% - 1) * 17), Pessoa3, PSET
 CASE 29: PUT (2 + (LinhaX% - 1) * 16, 2 + (ColunaY% - 1) * 17), Pessoa4, PSET
 CASE 30: PUT (2 + (LinhaX% - 1) * 16, 2 + (ColunaY% - 1) * 17), Pessoa5, PSET
 CASE 35: PUT (2 + (LinhaX% - 1) * 16, 2 + (ColunaY% - 1) * 17), Mapa23, PSET
 CASE 36: PUT (2 + (LinhaX% - 1) * 16, 2 + (ColunaY% - 1) * 17), Mapa24, PSET
 CASE 37: PUT (2 + (LinhaX% - 1) * 16, 2 + (ColunaY% - 1) * 17), Mapa25, PSET
 CASE 31
 IF Perso <> 1 THEN PUT (2 + (LinhaX% - 1) * 16, 2 + (ColunaY% - 1) * 17), Rodrigo1, PSET ELSE PUT (2 + (LinhaX% - 1) * 16, 2 + (ColunaY% - 1) * 17), Tijol3, PSET
 CASE 32
 IF Perso <> 1 THEN PUT (2 + (LinhaX% - 1) * 16, 2 + (ColunaY% - 1) * 17), Rodrigo2, PSET ELSE PUT (2 + (LinhaX% - 1) * 16, 2 + (ColunaY% - 1) * 17), Tijol3, PSET
 CASE 33
 IF Perso <> 1 THEN PUT (2 + (LinhaX% - 1) * 16, 2 + (ColunaY% - 1) * 17), Rodrigo3, PSET ELSE PUT (2 + (LinhaX% - 1) * 16, 2 + (ColunaY% - 1) * 17), Tijol3, PSET
 CASE 34
 IF Perso <> 1 THEN PUT (2 + (LinhaX% - 1) * 16, 2 + (ColunaY% - 1) * 17), Rodrigo4, PSET ELSE PUT (2 + (LinhaX% - 1) * 16, 2 + (ColunaY% - 1) * 17), Tijol3, PSET
 CASE 41
 IF Perso <> 2 THEN PUT (2 + (LinhaX% - 1) * 16, 2 + (ColunaY% - 1) * 17), Mayron1, PSET ELSE PUT (2 + (LinhaX% - 1) * 16, 2 + (ColunaY% - 1) * 17), Tijol3, PSET
 CASE 51
 SELECT CASE Condicao(30)
   CASE 0: PUT (2 + (LinhaX% - 1) * 16, 2 + (ColunaY% - 1) * 17), Ronald1, PSET
   CASE 1: PUT (2 + (LinhaX% - 1) * 16, 2 + (ColunaY% - 1) * 17), Rodrigo1, PSET
   CASE 2: PUT (2 + (LinhaX% - 1) * 16, 2 + (ColunaY% - 1) * 17), Mayron1, PSET
   CASE 4: PUT (2 + (LinhaX% - 1) * 16, 2 + (ColunaY% - 1) * 17), Thayse1, PSET
 END SELECT

END SELECT

END SUB

SUB Salvar (text$)

Apaga 22
LOCATE 16, 10: COLOR 14: PRINT "Salvar jogo"
COLOR 15: LOCATE 17, 10: PRINT "Qual a sua senha?"
LOCATE 18, 10: INPUT "", senha$
OPEN lugar + "SAVES\" + senha$ + ".SAV" FOR OUTPUT AS #1
 PRINT #1, Perso; cara(1).level; cara(1).energia; cara(1).energiaT; cara(1).ataque; cara(1).defesa; cara(1).magia; cara(1).agilidade
 WRITE #1, cara(1).estatus, cara(1).golpe1, cara(1).golpe2
 WRITE #1, cara(1).golpe3, cara(1).golpe4
 PRINT #1, cara(1).itens; cara(1).dinheiro; cara(1).direcao; cara(1).pp
 PRINT #1, Zona; Part; MinPart; PosGv; PosGh
 FOR i = 1 TO 29
  PRINT #1, Condicao(i);
 NEXT i
  PRINT #1, Condicao(30)
 FOR i = 1 TO 15
  PRINT #1, Comida(i);
 NEXT i
  PRINT #1, Comida(16)
 FOR i = 1 TO 15
  PRINT #1, Arma(i);
 NEXT i
  PRINT #1, Arma(16)
 FOR i = 1 TO 15
  PRINT #1, Chave(i);
 NEXT i
  PRINT #1, Chave(16)
 FOR i = 1 TO 15
  PRINT #1, Outro(i);
 NEXT i
  PRINT #1, Outro(16)

CLOSE #1

LOCATE 19, 10: COLOR 9: PRINT "Jogo Salvo!"
DO
LOOP UNTIL INKEY$ <> ""

END SUB

SUB sons (numero%)
DIM sfx$(25)
OPEN lugar + "SONS\Various.sfx" FOR INPUT AS #1
FOR fxnum% = 0 TO 25
 INPUT #1, sfx$(fxnum%)
NEXT
CLOSE #1
sfxnum% = numero%
 chan% = VAL(MID$(sfx$(sfxnum%), 61, 4))
  FOR in = 1 TO 60 STEP 4
    reg$ = MID$(c$(chan%), in, 4): reg% = VAL(reg$)
    dat$ = MID$(sfx$(sfxnum%), in, 4): dat% = VAL(dat$)
    OUT &H220, reg%: FOR D% = 1 TO 6: B% = INP(&H22F): NEXT
    OUT &H220, dat%: FOR D% = 1 TO 35: B% = INP(&H22F): NEXT
  NEXT


END SUB

SUB zona1 (text$)

CLS
PrintMap ""
PrintMenu ""
PutGuy Perso

DO
SELECT CASE INKEY$
 CASE CHR$(0) + "P"
  cara(1).direcao = 3
  SELECT CASE PosGv
   CASE 1
    IF F2F(PosGh) = 23 OR F2F(PosGh) = 24 OR F2F(PosGh) = 25 THEN Putpic F1F(PosGh), PosGv, PosGh: PosGv = 2
   CASE 2
    IF F3F(PosGh) = 23 OR F3F(PosGh) = 24 OR F3F(PosGh) = 25 THEN Putpic F2F(PosGh), PosGv, PosGh: PosGv = 3
   CASE 3
    IF F4F(PosGh) = 23 OR F4F(PosGh) = 24 OR F4F(PosGh) = 25 THEN Putpic F3F(PosGh), PosGv, PosGh: PosGv = 4
   CASE 4
    IF F5F(PosGh) = 23 OR F5F(PosGh) = 24 OR F5F(PosGh) = 25 THEN Putpic F4F(PosGh), PosGv, PosGh: PosGv = 5
   CASE 5
    IF F6F(PosGh) = 23 OR F6F(PosGh) = 24 OR F6F(PosGh) = 25 THEN Putpic F5F(PosGh), PosGv, PosGh: PosGv = 6
  END SELECT
 PutGuy Perso
 CASE CHR$(0) + "K"
  cara(1).direcao = 4
  SELECT CASE PosGv
   CASE 1
    IF F1F(PosGh - 1) = 23 OR F1F(PosGh - 1) = 24 OR F1F(PosGh - 1) = 25 THEN Putpic F1F(PosGh), PosGv, PosGh: PosGh = PosGh - 1
   CASE 2
    IF F2F(PosGh - 1) = 23 OR F2F(PosGh - 1) = 24 OR F2F(PosGh - 1) = 25 THEN Putpic F2F(PosGh), PosGv, PosGh: PosGh = PosGh - 1
   CASE 3
    IF F3F(PosGh - 1) = 23 OR F3F(PosGh - 1) = 24 OR F3F(PosGh - 1) = 25 THEN Putpic F3F(PosGh), PosGv, PosGh: PosGh = PosGh - 1
   CASE 4
    IF F4F(PosGh - 1) = 23 OR F4F(PosGh - 1) = 24 OR F4F(PosGh - 1) = 25 THEN Putpic F4F(PosGh), PosGv, PosGh: PosGh = PosGh - 1
   CASE 5
    IF F5F(PosGh - 1) = 23 OR F5F(PosGh - 1) = 24 OR F5F(PosGh - 1) = 25 THEN Putpic F5F(PosGh), PosGv, PosGh: PosGh = PosGh - 1
   CASE 6
    IF F6F(PosGh - 1) = 23 OR F6F(PosGh - 1) = 24 OR F6F(PosGh - 1) = 25 THEN Putpic F6F(PosGh), PosGv, PosGh: PosGh = PosGh - 1
  END SELECT
 PutGuy Perso
 CASE CHR$(0) + "M"
  cara(1).direcao = 2
  SELECT CASE PosGv
   CASE 1
    IF F1F(PosGh + 1) = 23 OR F1F(PosGh + 1) = 24 OR F1F(PosGh + 1) = 25 THEN Putpic F1F(PosGh), PosGv, PosGh: PosGh = PosGh + 1
   CASE 2
    IF F2F(PosGh + 1) = 23 OR F2F(PosGh + 1) = 24 OR F2F(PosGh + 1) = 25 THEN Putpic F2F(PosGh), PosGv, PosGh: PosGh = PosGh + 1
   CASE 3
    IF F3F(PosGh + 1) = 23 OR F3F(PosGh + 1) = 24 OR F3F(PosGh + 1) = 25 THEN Putpic F3F(PosGh), PosGv, PosGh: PosGh = PosGh + 1
   CASE 4
    IF F4F(PosGh + 1) = 23 OR F4F(PosGh + 1) = 24 OR F4F(PosGh + 1) = 25 THEN Putpic F4F(PosGh), PosGv, PosGh: PosGh = PosGh + 1
   CASE 5
    IF F5F(PosGh + 1) = 23 OR F5F(PosGh + 1) = 24 OR F5F(PosGh + 1) = 25 THEN Putpic F5F(PosGh), PosGv, PosGh: PosGh = PosGh + 1
   CASE 6
    IF F6F(PosGh + 1) = 23 OR F6F(PosGh + 1) = 24 OR F6F(PosGh + 1) = 25 THEN Putpic F6F(PosGh), PosGv, PosGh: PosGh = PosGh + 1
  END SELECT
  PutGuy Perso
 CASE CHR$(0) + "H"
  cara(1).direcao = 1
  SELECT CASE PosGv
   CASE 2
    IF F1F(PosGh) = 23 OR F1F(PosGh) = 24 OR F1F(PosGh) = 25 THEN Putpic F2F(PosGh), PosGv, PosGh: PosGv = 1
   CASE 3
    IF F2F(PosGh) = 23 OR F2F(PosGh) = 24 OR F2F(PosGh) = 25 THEN Putpic F3F(PosGh), PosGv, PosGh: PosGv = 2
   CASE 4
    IF F3F(PosGh) = 23 OR F3F(PosGh) = 24 OR F3F(PosGh) = 25 THEN Putpic F4F(PosGh), PosGv, PosGh: PosGv = 3
   CASE 5
    IF F4F(PosGh) = 23 OR F4F(PosGh) = 24 OR F4F(PosGh) = 25 THEN Putpic F5F(PosGh), PosGv, PosGh: PosGv = 4
   CASE 6
    IF F5F(PosGh) = 23 OR F5F(PosGh) = 24 OR F5F(PosGh) = 25 THEN Putpic F6F(PosGh), PosGv, PosGh: PosGv = 5
  END SELECT
 PutGuy Perso
 CASE CHR$(13): minimenu ""
 CASE CHR$(32): fala ""
END SELECT
LOOP

END
END SUB

