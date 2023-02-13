#line 1 "D:/MikroC/All Files/THERMAL_PRINTER/THERMAL_PRINTER.c"
int i = 1;
void send_to_modem(char *s){
 while(*s){
 SOFT_UART_WRITE(*s++);
 }
 SOFT_UART_WRITE(0X0D);
}
void send_to_modem1(char *s){
 while(*s){
 SOFT_UART_WRITE(*s++);
 }
}
void main() {
 do{
 if(i==1){
 SOFT_UART_INIT(&PORTC, 2, 1, 9600, 0);
 send_to_modem("HELLO WORLD!");
 delay_ms(1000);
 }
 if(i==2){
 SOFT_UART_INIT(&PORTC, 5, 4, 9600, 0);
 send_to_modem("HELLO WORLD!");
 delay_ms(1000);
 }

 }while(1);
}
