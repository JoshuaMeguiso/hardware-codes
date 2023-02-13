
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
    SOFT_UART_INIT(&PORTC, 2, 1, 9600, 0);
    send_to_modem("HELLO WORLD!");
    delay_ms(1000);
  }while(1);
}