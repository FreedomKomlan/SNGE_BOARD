
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


Can_Init	movlw 			; envoyer le can (Vref-, Vref+ valent combien; Les entr�es analogic
	movwf ADCON1 		; et la justification du r�sultat soit � gauche soit � droite (ADRESH & ADRESL))
	
	movlw TRISA_IO_PORT 	; Configurer les ports concern�s en entr�es
	movwf TRISA
	
	bank0 			;/bank1/bank2/bank3 On se positionne � l'emplacement de l'entr�e Analogic � choisir
	
	movlw 			; On choisit le canal concern�, la fr�quence de conversion et on met
	movwf ADCON0 		; en marche le CAN
	
	Call Tempo 		; On attend quelque micro-secondes avant de commencer la conversion
				; c'est un sous programme
	
	bsf ADCON0,GO_Done 		; On d�marre la conversion proprement dite

test	btfsc ADCON0,GO_Done	; Tester si on est � la fin de la conversion
	goto test
	
	bcf PIR1,ADIF 		; Remettre le fanion � 0 � la fin de la conversion pour pr�parer une autre conversion
	
	; On stocke les donn�es dans la zone m�moire. Ceci d�pend de la configuration de ADRESH/ADRESL

	movf ADRESH,W 		; Envoyer les donn�es dans la m�moire RAM. Ici le registre ADRESH contient les bits forts
	movwf ADRESS_RAM_H 
	bank1
	movf ADRESL,W
	movwf ADRESS_RAM_L
	
	END
	
Tempo	Nop 			; La fonction Tempo
	


bank0	bcf STATUS,RP0
	bcf STATUS,RP1
	
bank1	bsf STATUS,RP0
	bcf STATUS,RP1
	
bank2	bcf STATUS,RP0
	bsf STATUS,RP1
	
bank3	bsf STATUS,RP0
	bsf STATUS,RP1
	
Tempo		
