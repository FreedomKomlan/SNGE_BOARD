;

; Configuration du microcontrôleur


; Définition des équivalences
EQU ADRESS_V1 0x30
EQU ADRESS_V2 0x15
EQU ADRESS_V3 28h
EQU ADRESS_I1 0x30
EQU ADRESS_I2 0x30
EQU ADRESS_I3 0x30
EQU ADRESS_freq 
EQU ADRESS_R1
EQU ADRESS_R2
EQU ADRESS_Ir
EQU ADRESS_Ib
EQU ADRESS_TEMP

; Début du programme princpal
start	movlw 26h
	
	
	END
	
; Les fonctions secondaires qui seront par appelées
	