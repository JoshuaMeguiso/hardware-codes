#line 1 "D:/MikroC/All Files/GSM_MODULE/GSM.c"

void send_to_modem(char *s){
 while(*s){
 UART1_WRITE(*s++);
 }
 UART1_WRITE(0X0D);
}
void send_to_modem1(char *s){
 while(*s){
 UART1_WRITE(*s++);
 }
}
void main(){
 do{
 UART1_INIT(9600);
 send_to_modem("AT+CMGF=1");
 delay_ms(1000);
 send_to_modem1("AT+CMGS=\"");
 send_to_modem1("09614680406");
 send_to_modem1("\"\x0D");
 delay_ms(1000);
 send_to_modem("Monthly Due: 1000");
 delay_ms(1000);
 UART1_WRITE(0x1A);
 delay_ms(8000);
 }while(1);
}
