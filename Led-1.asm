        LIST		p=16F887		; Tipo de microcontrolador
	INCLUDE 	P16F887.INC		; Define los SFRs y bits P16F887

	__CONFIG _CONFIG1, _CP_OFF&_WDT_OFF&_XT_OSC	
						; Ingresa parámetros de configuración

	errorlevel	 -302			; Deshabilita mensajes de Advertencia por cambio Bancos
			
; INICIO DEL PROGRAMA 

	ORG 	0x00			; Comienzo del programa (Vector de Reset)
	
; SETEO DE PUERTOS
	BANKSEL 	TRISA		; selecciona el banco conteniendo TRISA
	CLRF		TRISA		; puerto A configurado como salida
	BANKSEL	        ANSEL
	CLRF		ANSEL	              ; configura puertos con entradas digitales
	CLRF		ANSELH	              ; configura puertos con entradas digitales
	BANKSEL 	PORTA	              ; selecciona el puerto A como salida
	CLRF		PORTA
	CLRF		PORTB
	
; DESARROLLO DEL PROGRAMA
;1
VALOR
	BTFSS	PORTB,0 		; prueba del bit 0 del puerto B
	GOTO		NUEVO_VALOR
	MOVLW	B'00000000' 		; mueve 0xAA al registro W
	MOVWF	PORTA			; pasa el valor al puerto A
	GOTO		VALOR
NUEVO_VALOR
	MOVLW	B'00000001' 		; mueve 0x55 al registro W
	MOVWF	PORTA			; pasa el valor al puerto A
	GOTO    VALOR2
VALOR2
	BTFSS	PORTB,0
	GOTO		NUEVO_VALOR
	MOVLW	B'00000000' 		
	MOVWF	PORTA
	GOTO VALOR


	END