#define RETURN_HOME 0B00000010
#define CLEAR_DISPLAY 0B00000001
#define NEXT_LINE 0B11000000


unsigned int DCR0, DCR1, LEFT, RIGHT, UP, DOWN, VOLTAGE, CURRENT, POWER;
unsigned char i, POWER_ASCII[5], VOLTAGE_ASCII[5];



//Functions
void LCD_POWER_ON_INITIALIZATION();
void LCD_COMMAND(unsigned char D);
void DDRAM_ID_WRIGHT(unsigned char D);
void LCD_DISPLAY(unsigned char c[]);
unsigned int ADC_READ();
void SERVO_50HZ_PWM_SETUP();
void ADC_SETUP();
void LCD_POWER_ON_INITIALIZATION();
void Delay_us(unsigned int us);
void Delay_ms(unsigned int ms);
void interrupt(void);
void LCD_DDRAM_ADDRESS_DISPLAY(unsigned char c, unsigned char address);
void POWER_VOLTAGE_LCD_DISPLAY();
void ILLUMINANCE_LCD_DISPLAY();




void main() {
//Initializations:
//timer0 and option reg initialization
OPTION_REG = 0B11011111;// Prescaler = 1:128
INTCON = 0B11010000;//Interrupt enable


LCD_POWER_ON_INITIALIZATION();

//4-Bits(DL=0), 2-Lines(N=1), 5X8 Dots(F=0)
//FUNCTION_SET_COMMAND
LCD_COMMAND(0B00101000);

//Display OFF(D=0), Cursor Off(C=0), Blinking Of Cursor Position Character(B=0)
//DISPLAY_OFF_COMMAND
LCD_COMMAND(0B00000100);

LCD_COMMAND(CLEAR_DISPLAY);

//Cursor Increment(I/D=1), Disable Display Shift(S=0)
//ENTRY_MODE_SET_COMMAND
LCD_COMMAND(0B00000110);

LCD_COMMAND(RETURN_HOME);

//Display On(D=1), Cursor ON(C=1), Blinking Of Cursor Position Character(B=0)
//DISPLAY_ON_COMMAND
LCD_COMMAND(0B00001100);

ADC_SETUP();
//PROGRAM_START
while(1){

SERVO_50HZ_PWM_SETUP();

//POSITION0
DCR0 = 3000;
DCR1 = 3000;
Delay_ms(3000);


LCD_COMMAND(CLEAR_DISPLAY);

LCD_COMMAND(RETURN_HOME);

//LINE1
LCD_DISPLAY("OPERATION MODE:");

LCD_COMMAND(NEXT_LINE);

//LINE2
LCD_DISPLAY("A)PORCEED");


while(!(PORTB & 0B10000000)){}


LCD_COMMAND(CLEAR_DISPLAY);

LCD_COMMAND(RETURN_HOME);

LCD_DISPLAY("A)SUN TRACKING");

LCD_COMMAND(NEXT_LINE);

LCD_DISPLAY("B)MANUAL CONTROL");

Delay_ms(300);



while(1){

//SUN TRACKING
if((PORTB & 0B10000000)){

LCD_COMMAND(CLEAR_DISPLAY);
LCD_COMMAND(RETURN_HOME);
LCD_DISPLAY("POWER=  .  W");
LCD_COMMAND(NEXT_LINE);
LCD_DISPLAY("VOLTAGE=  .  V");

while(1){
//CHANNEL0_READ
//Channel 0 (RA0/AN0) reades the upper left LDR voltage reading
ADCON0 = ADCON0 & 0B11000111;
LEFT = ADC_READ();


//Channel 1 (RA1/AN1) reades the upper right LDR voltage reading
//CHANNEL1_READ
ADCON0 = ADCON0 & 0B11000111;
ADCON0 = ADCON0 | 0B00001000;
RIGHT = ADC_READ();


//Channel 2 (RA2/AN2) reades the lower left LDR voltage reading
//CHANNEL2_READ
ADCON0 = ADCON0 & 0B11000111;
ADCON0 = ADCON0 | 0B00010000;
UP = ADC_READ();



//Channel 4 (RA5/AN4) reades the lower right LDR voltage reading
//CHANNEL3_READ
ADCON0 = ADCON0 & 0B11000111;
ADCON0 = ADCON0 | 0B00100000;
DOWN = ADC_READ();

//Channel 5 (RE0/AN5) reades the voltage across the solar panel
//CHANNEL5_READ
ADCON0 = ADCON0 & 0B11000111;
ADCON0 = ADCON0 | 0B00101000;
VOLTAGE = ADC_READ();


//Channel 6 (RE1/AN6) reades the current leaving the solar panel
//CHANNEL6_READ
ADCON0 = ADCON0 & 0B11000111;
ADCON0 = ADCON0 | 0B00110000;
CURRENT = ADC_READ();

//AZIMUTH_MOVEMENT
if((RIGHT > LEFT) && (DCR0 < 5000)){
DCR0 += 10;
}

if((LEFT > RIGHT) && (DCR0 > 1200)){
DCR0 -= 10;
}


//ALTITUDE_MOVEMENT

if((DOWN > UP) && (DCR1 < 5000)){
DCR1 += 10;
}

if((UP > DOWN) && (DCR1 > 1200)){
DCR1 -= 10;
}

Delay_us(150);


VOLTAGE = ((unsigned long)VOLTAGE * 1200) / 1023;
CURRENT = ((unsigned long)CURRENT * 100) / 1023;
POWER = (VOLTAGE / 10) * CURRENT;

for(i = 0; i < 5; i++){
POWER_ASCII[i] = (POWER % 10) + 48;
POWER = POWER / 10;
VOLTAGE_ASCII[i] = (VOLTAGE % 10) + 48;
VOLTAGE = VOLTAGE / 10;
}

LCD_DDRAM_ADDRESS_DISPLAY(POWER_ASCII[4], 6);
LCD_DDRAM_ADDRESS_DISPLAY(POWER_ASCII[3], 7);
LCD_DDRAM_ADDRESS_DISPLAY(POWER_ASCII[2], 9);
LCD_DDRAM_ADDRESS_DISPLAY(POWER_ASCII[1], 10);
LCD_DDRAM_ADDRESS_DISPLAY(VOLTAGE_ASCII[3], 72);
LCD_DDRAM_ADDRESS_DISPLAY(VOLTAGE_ASCII[2], 73);
LCD_DDRAM_ADDRESS_DISPLAY(VOLTAGE_ASCII[1], 75);
LCD_DDRAM_ADDRESS_DISPLAY(VOLTAGE_ASCII[0], 76);

}
}



//MANUAL CONTROL
if(PORTB & 0B01000000){

LCD_COMMAND(CLEAR_DISPLAY);
LCD_COMMAND(RETURN_HOME);
LCD_DISPLAY("POWER=  .  W");
LCD_COMMAND(NEXT_LINE);
LCD_DISPLAY("VOLTAGE=  .  V");

while(1){

if((PORTB & 0B00010000) && (DCR1 < 5000)){//UP
DCR1 += 10;
}

if((PORTB & 0B00001000) && (DCR0 < 5000)){//LEFT
DCR0 += 10;
}

if((PORTB & 0B00000100) && (DCR1 > 1200)){//DOWN
DCR1 -= 10;
}

if((PORTB & 0B00000010) && (DCR0 > 1200)){//RIGHT
DCR0 -= 10;
}

Delay_us(500);

//Channel 5 (RE0/AN5) reades the voltage across the solar panel
//CHANNEL5_READ
ADCON0 = ADCON0 & 0B11000111;
ADCON0 = ADCON0 | 0B00101000;
VOLTAGE = ADC_READ();


//Channel 6 (RE1/AN6) reades the current leaving the solar panel
//CHANNEL6_READ
ADCON0 = ADCON0 & 0B11000111;
ADCON0 = ADCON0 | 0B00110000;
CURRENT = ADC_READ();

VOLTAGE = ((unsigned long)VOLTAGE * 1200) / 1023;
CURRENT = ((unsigned long)CURRENT * 100) / 1023;
POWER = (VOLTAGE / 10) * CURRENT;

for(i = 0; i < 5; i++){
POWER_ASCII[i] = (POWER % 10) + 48;
POWER = POWER / 10;
VOLTAGE_ASCII[i] = (VOLTAGE % 10) + 48;
VOLTAGE = VOLTAGE / 10;
}

LCD_DDRAM_ADDRESS_DISPLAY(POWER_ASCII[4], 6);
LCD_DDRAM_ADDRESS_DISPLAY(POWER_ASCII[3], 7);
LCD_DDRAM_ADDRESS_DISPLAY(POWER_ASCII[2], 9);
LCD_DDRAM_ADDRESS_DISPLAY(POWER_ASCII[1], 10);
LCD_DDRAM_ADDRESS_DISPLAY(VOLTAGE_ASCII[3], 72);
LCD_DDRAM_ADDRESS_DISPLAY(VOLTAGE_ASCII[2], 73);
LCD_DDRAM_ADDRESS_DISPLAY(VOLTAGE_ASCII[1], 75);
LCD_DDRAM_ADDRESS_DISPLAY(VOLTAGE_ASCII[0], 76);


}
}
}
}
}

void interrupt(){

if(INTCON & 0B00000010){
INTCON = INTCON & 0B11111101;
asm{
CLRF PCLATH
GOTO 0x0000
}
}



//PWM SETUP
if((PIR1 & 4) || (PIR2 & 1)){

if((CCPR1L == 0x40) && (CCPR1H == 0x9C) && (CCPR2L == 0x40) && (CCPR2H == 0x9C)){
PORTC = PORTC | 4;
CCPR1L = (DCR0 & 0B0000000011111111);
CCPR1H = (DCR0 >> 8);
PORTC = PORTC | 2;
CCPR2L = (DCR1 & 0B0000000011111111);
CCPR2H = (DCR1>>8);
PIR1 = PIR1 & 0B11111011;
PIR2 = PIR2 & 0B11111110;
TMR1L = 0;
TMR1H = 0;
}else{
if(PIR1 & 4){
PORTC = PORTC & 0B11111011;
CCPR1L = 0B01000000;
CCPR1H = 0B10011100;
PIR1 = PIR1 & 0B11111011;
}
if(PIR2 & 1){
PORTC = PORTC & 0B11111101;
CCPR2L = 0B01000000;
CCPR2H = 0B10011100;
PIR2 = PIR2 & 0B11111110;
}
}

}

}

void LCD_COMMAND(unsigned char D){
PORTD = PORTD & 0B11001111;
PORTD = (PORTD & 0B11110000) | ((D >> 4) & 0B00001111);
PORTD = PORTD | 0B01000000;
PORTD = PORTD & 0B10111111;
PORTD = (PORTD & 0B11110000) | (D & 0B00001111);
PORTD = PORTD | 0B01000000;
PORTD = PORTD & 0B10111111;
Delay_ms(3);
}

void DDRAM_ID_WRIGHT(unsigned char D){
PORTD = PORTD & 0B11011111;
PORTD = PORTD | 0B00010000;
PORTD = (PORTD & 0B11110000) | ((D >> 4) & 0B00001111);
PORTD = PORTD | 0B01000000;
PORTD = PORTD & 0B10111111;
PORTD = (PORTD & 0B11110000) | (D & 0B00001111);
PORTD = PORTD | 0B01000000;
PORTD = PORTD & 0B10111111;
Delay_ms(3);
}

unsigned int ADC_READ(){
Delay_us(30);
ADCON0 = ADCON0 | 0B00000100;
while(ADCON0 & 0B00000100){}
return ((ADRESH<<8) | ADRESL);
}

void SERVO_50HZ_PWM_SETUP(){
PIE1 = PIE1 | 0B00000100;//CCP1 ENABLED
PIE2 = PIE2 | 1;//CCP2 ENABLED
TRISC = TRISC & 0B11111001;
CCP1CON = CCP1CON | 0B00001010;//CCP1 is in compare mode, output does not change(software interrupt).
CCP2CON = CCP2CON | 0B00001010;//CCP2 is in compare mode, output does not change(software interrupt).
T1CON = T1CON | 1;
//For 50 Hz frequency, Timer1 should reset every 20.00 ms (Timer value equal 40,000), and for 1 ms to 2 ms duty cycle range, timer1 shoud count 2,000 to 4,000 range.
//Setting period equal to 20.00 ms (Interrupt when timer1 reach 40,000)
CCPR1L = 0x40;
CCPR2L = 0x40;
CCPR1H = 0x9C;
CCPR2H = 0x9C;
//Timer1 starts counting
TMR1L = 0;
TMR1H = 0;
}

void ADC_SETUP(){
//ADC SETUP
ADCON1 = ADCON1 | 0B11000001;// Vref is 3 volts
ADCON0 = ADCON0 | 0B01000001;
//The A/D conversion clock is chosen to be 500.00 kHz (Fose/16) and the result to be right justified (we will deal only 10 bits)
}

void LCD_POWER_ON_INITIALIZATION(){
//LCD_DATA_BITS_CONFIGRATION
TRISD = 0;
//LCD_POWER_ON_INITIALIZATION
PORTD = 0B00000011;
PORTD = PORTD | 0B01000000;
PORTD = PORTD & 0B10111111;
Delay_ms(5);
PORTD = PORTD | 0B01000000;
PORTD = PORTD & 0B10111111;
Delay_us(110);
PORTD = 0B00000010;
PORTD = PORTD | 0B01000000;
PORTD = PORTD & 0B10111111;
Delay_ms(10);

}

void Delay_us(unsigned int us){
int i;
for(i = 1; i < us; i++){
asm nop;
asm nop;
}
}

void Delay_ms(unsigned int ms){
int i;
for(i = 1; i < ms; i++){
Delay_us(1000);
}
}

void LCD_DISPLAY(unsigned char c[]){
char i;
for(i = 0; c[i] != 0; i++){
DDRAM_ID_WRIGHT(c[i]);
}
}

void LCD_DDRAM_ADDRESS_DISPLAY(unsigned char c, unsigned char address){
LCD_COMMAND(address | 0B10000000);
DDRAM_ID_WRIGHT(c);
}



