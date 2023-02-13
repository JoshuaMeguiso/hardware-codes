
_send_to_modem:

;GSM.c,2 :: 		void send_to_modem(char *s){
;GSM.c,3 :: 		while(*s){
L_send_to_modem0:
	MOVFF       FARG_send_to_modem_s+0, FSR0L+0
	MOVFF       FARG_send_to_modem_s+1, FSR0H+0
	MOVF        POSTINC0+0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_send_to_modem1
;GSM.c,4 :: 		UART1_WRITE(*s++);
	MOVFF       FARG_send_to_modem_s+0, FSR0L+0
	MOVFF       FARG_send_to_modem_s+1, FSR0H+0
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
	INFSNZ      FARG_send_to_modem_s+0, 1 
	INCF        FARG_send_to_modem_s+1, 1 
;GSM.c,5 :: 		}
	GOTO        L_send_to_modem0
L_send_to_modem1:
;GSM.c,6 :: 		UART1_WRITE(0X0D);
	MOVLW       13
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;GSM.c,7 :: 		}
L_end_send_to_modem:
	RETURN      0
; end of _send_to_modem

_send_to_modem1:

;GSM.c,8 :: 		void send_to_modem1(char *s){
;GSM.c,9 :: 		while(*s){
L_send_to_modem12:
	MOVFF       FARG_send_to_modem1_s+0, FSR0L+0
	MOVFF       FARG_send_to_modem1_s+1, FSR0H+0
	MOVF        POSTINC0+0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_send_to_modem13
;GSM.c,10 :: 		UART1_WRITE(*s++);
	MOVFF       FARG_send_to_modem1_s+0, FSR0L+0
	MOVFF       FARG_send_to_modem1_s+1, FSR0H+0
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
	INFSNZ      FARG_send_to_modem1_s+0, 1 
	INCF        FARG_send_to_modem1_s+1, 1 
;GSM.c,11 :: 		}
	GOTO        L_send_to_modem12
L_send_to_modem13:
;GSM.c,12 :: 		}
L_end_send_to_modem1:
	RETURN      0
; end of _send_to_modem1

_main:

;GSM.c,13 :: 		void main(){
;GSM.c,14 :: 		do{
L_main4:
;GSM.c,15 :: 		UART1_INIT(9600);
	BSF         BAUDCON+0, 3, 0
	CLRF        SPBRGH+0 
	MOVLW       103
	MOVWF       SPBRG+0 
	BSF         TXSTA+0, 2, 0
	CALL        _UART1_Init+0, 0
;GSM.c,16 :: 		send_to_modem("AT+CMGF=1");
	MOVLW       ?lstr1_GSM+0
	MOVWF       FARG_send_to_modem_s+0 
	MOVLW       hi_addr(?lstr1_GSM+0)
	MOVWF       FARG_send_to_modem_s+1 
	CALL        _send_to_modem+0, 0
;GSM.c,17 :: 		delay_ms(1000);
	MOVLW       6
	MOVWF       R11, 0
	MOVLW       19
	MOVWF       R12, 0
	MOVLW       173
	MOVWF       R13, 0
L_main7:
	DECFSZ      R13, 1, 1
	BRA         L_main7
	DECFSZ      R12, 1, 1
	BRA         L_main7
	DECFSZ      R11, 1, 1
	BRA         L_main7
	NOP
	NOP
;GSM.c,18 :: 		send_to_modem1("AT+CMGS=\"");
	MOVLW       ?lstr2_GSM+0
	MOVWF       FARG_send_to_modem1_s+0 
	MOVLW       hi_addr(?lstr2_GSM+0)
	MOVWF       FARG_send_to_modem1_s+1 
	CALL        _send_to_modem1+0, 0
;GSM.c,19 :: 		send_to_modem1("09614680406");
	MOVLW       ?lstr3_GSM+0
	MOVWF       FARG_send_to_modem1_s+0 
	MOVLW       hi_addr(?lstr3_GSM+0)
	MOVWF       FARG_send_to_modem1_s+1 
	CALL        _send_to_modem1+0, 0
;GSM.c,20 :: 		send_to_modem1("\"\x0D");
	MOVLW       ?lstr4_GSM+0
	MOVWF       FARG_send_to_modem1_s+0 
	MOVLW       hi_addr(?lstr4_GSM+0)
	MOVWF       FARG_send_to_modem1_s+1 
	CALL        _send_to_modem1+0, 0
;GSM.c,21 :: 		delay_ms(1000);
	MOVLW       6
	MOVWF       R11, 0
	MOVLW       19
	MOVWF       R12, 0
	MOVLW       173
	MOVWF       R13, 0
L_main8:
	DECFSZ      R13, 1, 1
	BRA         L_main8
	DECFSZ      R12, 1, 1
	BRA         L_main8
	DECFSZ      R11, 1, 1
	BRA         L_main8
	NOP
	NOP
;GSM.c,22 :: 		send_to_modem("Monthly Due: 1000");
	MOVLW       ?lstr5_GSM+0
	MOVWF       FARG_send_to_modem_s+0 
	MOVLW       hi_addr(?lstr5_GSM+0)
	MOVWF       FARG_send_to_modem_s+1 
	CALL        _send_to_modem+0, 0
;GSM.c,23 :: 		delay_ms(1000);
	MOVLW       6
	MOVWF       R11, 0
	MOVLW       19
	MOVWF       R12, 0
	MOVLW       173
	MOVWF       R13, 0
L_main9:
	DECFSZ      R13, 1, 1
	BRA         L_main9
	DECFSZ      R12, 1, 1
	BRA         L_main9
	DECFSZ      R11, 1, 1
	BRA         L_main9
	NOP
	NOP
;GSM.c,24 :: 		UART1_WRITE(0x1A);
	MOVLW       26
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;GSM.c,25 :: 		delay_ms(8000);
	MOVLW       41
	MOVWF       R11, 0
	MOVLW       150
	MOVWF       R12, 0
	MOVLW       127
	MOVWF       R13, 0
L_main10:
	DECFSZ      R13, 1, 1
	BRA         L_main10
	DECFSZ      R12, 1, 1
	BRA         L_main10
	DECFSZ      R11, 1, 1
	BRA         L_main10
;GSM.c,26 :: 		}while(1);
	GOTO        L_main4
;GSM.c,27 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
