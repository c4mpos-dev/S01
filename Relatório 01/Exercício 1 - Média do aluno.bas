10 INPUT "Digite a primeira nota: "; N1$
20 INPUT "Digite a segunda nota: "; N2$

30 N1 = VAL(N1$)
40 N2 = VAL(N2$)
50 MEDIA = (N1 + N2) / 2

60 IF MEDIA >= 60 THEN GOTO 200
70 IF MEDIA < 30 THEN GOTO 300

80 INPUT "Digite a nota da NP3: "; N3$
    
90 N3 = VAL(N3$)
100 MEDIA2 = (MEDIA + N3) / 2
    
110 IF MEDIA2 > 50 THEN GOTO 400 ELSE GOTO 500

200 PRINT "Aprovado direto"
210 END
300 PRINT "Reprovado direto"
310 END
400 PRINT "Aprovado pela NP3"
410 END
500 PRINT "Reprovado na NP3"
510 END