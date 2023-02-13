
_send_to_modem:

;THERMAL_PRINTER.c,2 :: 		void send_to_modem(char *s){
;THERMAL_PRINTER.c,3 :: 		while(*s){
L_send_to_modem0:
	MOVFF       FARG_send_to_modem_s+0, FSR0L+0
	MOVFF       FARG_send_to_modem_s+1, FSR0H+0
	MOVF        POSTINC0+0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_send_to_modem1
;THERMAL_PRINTER.c,4 :: 		SOFT_UART_WRITE(*s++);
	MOVFF       FARG_send_to_modem_s+0, FSR0L+0
	MOVFF       FARG_send_to_modem_s+1, FSR0H+0
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_Soft_UART_Write_udata+0 
	CALL        _Soft_UART_Write+0, 0
	INFSNZ      FARG_send_to_modem_s+0, 1 
	INCF        FARG_send_to_modem_s+1, 1 
;THERMAL_PRINTER.c,5 :: 		}
	GOTO        L_send_to_modem0
L_send_to_modem1:
;THERMAL_PRINTER.c,6 :: 		SOFT_UART_WRITE(0X0D);
	MOVLW       13
	MOVWF       FARG_Soft_UART_Write_udata+0 
	CALL        _Soft_UART_Write+0, 0
;THERMAL_PRINTER.c,7 :: 		}
L_end_send_to_modem:
	RETURN      0
; end of _send_to_modem

_send_to_modem1:

;THERMAL_PRINTER.c,8 :: 		void send_to_modem1(char *s){
;THERMAL_PRINTER.c,9 :: 		while(*s){
L_send_to_modem12:
	MOVFF       FARG_send_to_modem1_s+0, FSR0L+0
	MOVFF       FARG_send_to_modem1_s+1, FSR0H+0
	MOVF        POSTINC0+0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_send_to_modem13
;THERMAL_PRINTER.c,10 :: 		SOFT_UART_WRITE(*s++);
	MOVFF       FARG_send_to_modem1_s+0, FSR0L+0
	MOVFF       FARG_send_to_modem1_s+1, FSR0H+0
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_Soft_UART_Write_udata+0 
	CALL        _Soft_UART_Write+0, 0
	INFSNZ      FARG_send_to_modem1_s+0, 1 
	INCF        FARG_send_to_modem1_s+1, 1 
;THERMAL_PRINTER.c,11 :: 		}
	GOTO        L_send_to_modem12
L_send_to_modem13:
;THERMAL_PRINTER.c,12 :: 		}
L_end_send_to_modem1:
	RETURN      0
; end of _send_to_modem1

_main:

;THERMAL_PRINTER.c,13 :: 		void main() {
;THERMAL_PRINTER.c,14 :: 		do{
L_main4:
;THERMAL_PRINTER.c,15 :: 		if(i==1){
	MOVLW       0
	XORWF       _i+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main14
	MOVLW       1
	XORWF       _i+0, 0 
L__main14:
	BTFSS       STATUS+0, 2 
	GOTO        L_main7
;THERMAL_PRINTER.c,16 :: 		SOFT_UART_INIT(&PORTC, 2, 1, 9600, 0);
	MOVLW       PORTC+0
	MOVWF       FARG_Soft_UART_Init_port+0 
	MOVLW       hi_addr(PORTC+0)
	MOVWF       FARG_Soft_UART_Init_port+1 
	MOVLW       2
	MOVWF       FARG_Soft_UART_Init_rx_pin+0 
	MOVLW       1
	MOVWF       FARG_Soft_UART_Init_tx_pin+0 
	MOVLW       128
	MOVWF       FARG_Soft_UART_Init_baud_rate+0 
	MOVLW       37
	MOVWF       FARG_Soft_UART_Init_baud_rate+1 
	MOVLW       0
	MOVWF       FARG_Soft_UART_Init_baud_rate+2 
	MOVWF       FARG_Soft_UART_Init_baud_rate+3 
	CLRF        FARG_Soft_UART_Init_inverted+0 
	CALL        _Soft_UART_Init+0, 0
;THERMAL_PRINTER.c,17 :: 		send_to_modem("HELLO WORLD!");
	MOVLW       ?lstr1_THERMAL_PRINTER+0
	MOVWF       FARG_send_to_modem_s+0 
	MOVLW       hi_addr(?lstr1_THERMAL_PRINTER+0)
	MOVWF       FARG_send_to_modem_s+1 
	CALL        _send_to_modem+0, 0
;THERMAL_PRINTER.c,18 :: 		delay_ms(1000);
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
;THERMAL_PRINTER.c,19 :: 		}
L_main7:
;THERMAL_PRINTER.c,20 :: 		if(i==2){
	MOVLW       0
	XORWF       _i+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main15
	MOVLW       2
	XORWF       _i+0, 0 
L__main15:
	BTFSS       STATUS+0, 2 
	GOTO        L_main9
;THERMAL_PRINTER.c,21 :: 		SOFT_UART_INIT(&PORTC, 5, 4, 9600, 0);
	MOVLW       PORTC+0
	MOVWF       FARG_Soft_UART_Init_port+0 
	MOVLW       hi_addr(PORTC+0)
	MOVWF       FARG_Soft_UART_Init_port+1 
	MOVLW       5
	MOVWF       FARG_Soft_UART_Init_rx_pin+0 
	MOVLW       4
	MOVWF       FARG_Soft_UART_Init_tx_pin+0 
	MOVLW       128
	MOVWF       FARG_Soft_UART_Init_baud_rate+0 
	MOVLW       37
	MOVWF       FARG_Soft_UART_Init_baud_rate+1 
	MOVLW       0
	MOVWF       FARG_Soft_UART_Init_baud_rate+2 
	MOVWF       FARG_Soft_UART_Init_baud_rate+3 
	CLRF        FARG_Soft_UART_Init_inverted+0 
	CALL        _Soft_UART_Init+0, 0
;THERMAL_PRINTER.c,22 :: 		send_to_modem("HELLO WORLD!");
	MOVLW       ?lstr2_THERMAL_PRINTER+0
	MOVWF       FARG_send_to_modem_s+0 
	MOVLW       hi_addr(?lstr2_THERMAL_PRINTER+0)
	MOVWF       FARG_send_to_modem_s+1 
	CALL        _send_to_modem+0, 0
;THERMAL_PRINTER.c,23 :: 		delay_ms(1000);
	MOVLW       6
	MOVWF       R11, 0
	MOVLW       19
	MOVWF       R12, 0
	MOVLW       173
	MOVWF       R13, 0
L_main10:
	DECFSZ      R13, 1, 1
	BRA         L_main10
	DECFSZ      R12, 1, 1
	BRA         L_main10
	DECFSZ      R11, 1, 1
	BRA         L_main10
	NOP
	NOP
;THERMAL_PRINTER.c,24 :: 		}
L_main9:
;THERMAL_PRINTER.c,26 :: 		}while(1);
	GOTO        L_main4
;THERMAL_PRINTER.c,27 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
