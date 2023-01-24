
_main:

;Project.c,30 :: 		void main() {
;Project.c,33 :: 		OPTION_REG = 0B11011111;// Prescaler = 1:128
	MOVLW      223
	MOVWF      OPTION_REG+0
;Project.c,34 :: 		INTCON = 0B11010000;//Interrupt enable
	MOVLW      208
	MOVWF      INTCON+0
;Project.c,37 :: 		LCD_POWER_ON_INITIALIZATION();
	CALL       _LCD_POWER_ON_INITIALIZATION+0
;Project.c,41 :: 		LCD_COMMAND(0B00101000);
	MOVLW      40
	MOVWF      FARG_LCD_COMMAND_D+0
	CALL       _LCD_COMMAND+0
;Project.c,45 :: 		LCD_COMMAND(0B00000100);
	MOVLW      4
	MOVWF      FARG_LCD_COMMAND_D+0
	CALL       _LCD_COMMAND+0
;Project.c,47 :: 		LCD_COMMAND(CLEAR_DISPLAY);
	MOVLW      1
	MOVWF      FARG_LCD_COMMAND_D+0
	CALL       _LCD_COMMAND+0
;Project.c,51 :: 		LCD_COMMAND(0B00000110);
	MOVLW      6
	MOVWF      FARG_LCD_COMMAND_D+0
	CALL       _LCD_COMMAND+0
;Project.c,53 :: 		LCD_COMMAND(RETURN_HOME);
	MOVLW      2
	MOVWF      FARG_LCD_COMMAND_D+0
	CALL       _LCD_COMMAND+0
;Project.c,57 :: 		LCD_COMMAND(0B00001100);
	MOVLW      12
	MOVWF      FARG_LCD_COMMAND_D+0
	CALL       _LCD_COMMAND+0
;Project.c,59 :: 		ADC_SETUP();
	CALL       _ADC_SETUP+0
;Project.c,63 :: 		SERVO_50HZ_PWM_SETUP();
	CALL       _SERVO_50HZ_PWM_SETUP+0
;Project.c,66 :: 		DCR0 = 3000;
	MOVLW      184
	MOVWF      _DCR0+0
	MOVLW      11
	MOVWF      _DCR0+1
;Project.c,67 :: 		DCR1 = 3000;
	MOVLW      184
	MOVWF      _DCR1+0
	MOVLW      11
	MOVWF      _DCR1+1
;Project.c,68 :: 		Delay_ms(3000);
	MOVLW      31
	MOVWF      R11+0
	MOVLW      113
	MOVWF      R12+0
	MOVLW      30
	MOVWF      R13+0
L_main2:
	DECFSZ     R13+0, 1
	GOTO       L_main2
	DECFSZ     R12+0, 1
	GOTO       L_main2
	DECFSZ     R11+0, 1
	GOTO       L_main2
	NOP
;Project.c,71 :: 		LCD_COMMAND(CLEAR_DISPLAY);
	MOVLW      1
	MOVWF      FARG_LCD_COMMAND_D+0
	CALL       _LCD_COMMAND+0
;Project.c,73 :: 		LCD_COMMAND(RETURN_HOME);
	MOVLW      2
	MOVWF      FARG_LCD_COMMAND_D+0
	CALL       _LCD_COMMAND+0
;Project.c,76 :: 		LCD_DISPLAY("OPERATION MODE:");
	MOVLW      ?lstr1_Project+0
	MOVWF      FARG_LCD_DISPLAY_c+0
	CALL       _LCD_DISPLAY+0
;Project.c,78 :: 		LCD_COMMAND(NEXT_LINE);
	MOVLW      192
	MOVWF      FARG_LCD_COMMAND_D+0
	CALL       _LCD_COMMAND+0
;Project.c,81 :: 		LCD_DISPLAY("A)PORCEED");
	MOVLW      ?lstr2_Project+0
	MOVWF      FARG_LCD_DISPLAY_c+0
	CALL       _LCD_DISPLAY+0
;Project.c,84 :: 		while(!(PORTB & 0B10000000)){}
L_main3:
	BTFSC      PORTB+0, 7
	GOTO       L_main4
	GOTO       L_main3
L_main4:
;Project.c,87 :: 		LCD_COMMAND(CLEAR_DISPLAY);
	MOVLW      1
	MOVWF      FARG_LCD_COMMAND_D+0
	CALL       _LCD_COMMAND+0
;Project.c,89 :: 		LCD_COMMAND(RETURN_HOME);
	MOVLW      2
	MOVWF      FARG_LCD_COMMAND_D+0
	CALL       _LCD_COMMAND+0
;Project.c,91 :: 		LCD_DISPLAY("A)SUN TRACKING");
	MOVLW      ?lstr3_Project+0
	MOVWF      FARG_LCD_DISPLAY_c+0
	CALL       _LCD_DISPLAY+0
;Project.c,93 :: 		LCD_COMMAND(NEXT_LINE);
	MOVLW      192
	MOVWF      FARG_LCD_COMMAND_D+0
	CALL       _LCD_COMMAND+0
;Project.c,95 :: 		LCD_DISPLAY("B)MANUAL CONTROL");
	MOVLW      ?lstr4_Project+0
	MOVWF      FARG_LCD_DISPLAY_c+0
	CALL       _LCD_DISPLAY+0
;Project.c,97 :: 		Delay_ms(300);
	MOVLW      4
	MOVWF      R11+0
	MOVLW      12
	MOVWF      R12+0
	MOVLW      51
	MOVWF      R13+0
L_main5:
	DECFSZ     R13+0, 1
	GOTO       L_main5
	DECFSZ     R12+0, 1
	GOTO       L_main5
	DECFSZ     R11+0, 1
	GOTO       L_main5
	NOP
	NOP
;Project.c,101 :: 		while(1){
L_main6:
;Project.c,104 :: 		if((PORTB & 0B10000000)){
	BTFSS      PORTB+0, 7
	GOTO       L_main8
;Project.c,106 :: 		LCD_COMMAND(CLEAR_DISPLAY);
	MOVLW      1
	MOVWF      FARG_LCD_COMMAND_D+0
	CALL       _LCD_COMMAND+0
;Project.c,107 :: 		LCD_COMMAND(RETURN_HOME);
	MOVLW      2
	MOVWF      FARG_LCD_COMMAND_D+0
	CALL       _LCD_COMMAND+0
;Project.c,108 :: 		LCD_DISPLAY("POWER=  .  W");
	MOVLW      ?lstr5_Project+0
	MOVWF      FARG_LCD_DISPLAY_c+0
	CALL       _LCD_DISPLAY+0
;Project.c,109 :: 		LCD_COMMAND(NEXT_LINE);
	MOVLW      192
	MOVWF      FARG_LCD_COMMAND_D+0
	CALL       _LCD_COMMAND+0
;Project.c,110 :: 		LCD_DISPLAY("VOLTAGE=  .  V");
	MOVLW      ?lstr6_Project+0
	MOVWF      FARG_LCD_DISPLAY_c+0
	CALL       _LCD_DISPLAY+0
;Project.c,112 :: 		while(1){
L_main9:
;Project.c,115 :: 		ADCON0 = ADCON0 & 0B11000111;
	MOVLW      199
	ANDWF      ADCON0+0, 1
;Project.c,116 :: 		LEFT = ADC_READ();
	CALL       _ADC_READ+0
	MOVF       R0+0, 0
	MOVWF      _LEFT+0
	MOVF       R0+1, 0
	MOVWF      _LEFT+1
;Project.c,121 :: 		ADCON0 = ADCON0 & 0B11000111;
	MOVLW      199
	ANDWF      ADCON0+0, 1
;Project.c,122 :: 		ADCON0 = ADCON0 | 0B00001000;
	BSF        ADCON0+0, 3
;Project.c,123 :: 		RIGHT = ADC_READ();
	CALL       _ADC_READ+0
	MOVF       R0+0, 0
	MOVWF      _RIGHT+0
	MOVF       R0+1, 0
	MOVWF      _RIGHT+1
;Project.c,128 :: 		ADCON0 = ADCON0 & 0B11000111;
	MOVLW      199
	ANDWF      ADCON0+0, 1
;Project.c,129 :: 		ADCON0 = ADCON0 | 0B00010000;
	BSF        ADCON0+0, 4
;Project.c,130 :: 		UP = ADC_READ();
	CALL       _ADC_READ+0
	MOVF       R0+0, 0
	MOVWF      _UP+0
	MOVF       R0+1, 0
	MOVWF      _UP+1
;Project.c,136 :: 		ADCON0 = ADCON0 & 0B11000111;
	MOVLW      199
	ANDWF      ADCON0+0, 1
;Project.c,137 :: 		ADCON0 = ADCON0 | 0B00100000;
	BSF        ADCON0+0, 5
;Project.c,138 :: 		DOWN = ADC_READ();
	CALL       _ADC_READ+0
	MOVF       R0+0, 0
	MOVWF      _DOWN+0
	MOVF       R0+1, 0
	MOVWF      _DOWN+1
;Project.c,142 :: 		ADCON0 = ADCON0 & 0B11000111;
	MOVLW      199
	ANDWF      ADCON0+0, 1
;Project.c,143 :: 		ADCON0 = ADCON0 | 0B00101000;
	MOVLW      40
	IORWF      ADCON0+0, 1
;Project.c,144 :: 		VOLTAGE = ADC_READ();
	CALL       _ADC_READ+0
	MOVF       R0+0, 0
	MOVWF      _VOLTAGE+0
	MOVF       R0+1, 0
	MOVWF      _VOLTAGE+1
;Project.c,149 :: 		ADCON0 = ADCON0 & 0B11000111;
	MOVLW      199
	ANDWF      ADCON0+0, 1
;Project.c,150 :: 		ADCON0 = ADCON0 | 0B00110000;
	MOVLW      48
	IORWF      ADCON0+0, 1
;Project.c,151 :: 		CURRENT = ADC_READ();
	CALL       _ADC_READ+0
	MOVF       R0+0, 0
	MOVWF      _CURRENT+0
	MOVF       R0+1, 0
	MOVWF      _CURRENT+1
;Project.c,154 :: 		if((RIGHT > LEFT) && (DCR0 < 5000)){
	MOVF       _RIGHT+1, 0
	SUBWF      _LEFT+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main85
	MOVF       _RIGHT+0, 0
	SUBWF      _LEFT+0, 0
L__main85:
	BTFSC      STATUS+0, 0
	GOTO       L_main13
	MOVLW      19
	SUBWF      _DCR0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main86
	MOVLW      136
	SUBWF      _DCR0+0, 0
L__main86:
	BTFSC      STATUS+0, 0
	GOTO       L_main13
L__main81:
;Project.c,155 :: 		DCR0 += 10;
	MOVLW      10
	ADDWF      _DCR0+0, 1
	BTFSC      STATUS+0, 0
	INCF       _DCR0+1, 1
;Project.c,156 :: 		}
L_main13:
;Project.c,158 :: 		if((LEFT > RIGHT) && (DCR0 > 1200)){
	MOVF       _LEFT+1, 0
	SUBWF      _RIGHT+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main87
	MOVF       _LEFT+0, 0
	SUBWF      _RIGHT+0, 0
L__main87:
	BTFSC      STATUS+0, 0
	GOTO       L_main16
	MOVF       _DCR0+1, 0
	SUBLW      4
	BTFSS      STATUS+0, 2
	GOTO       L__main88
	MOVF       _DCR0+0, 0
	SUBLW      176
L__main88:
	BTFSC      STATUS+0, 0
	GOTO       L_main16
L__main80:
;Project.c,159 :: 		DCR0 -= 10;
	MOVLW      10
	SUBWF      _DCR0+0, 1
	BTFSS      STATUS+0, 0
	DECF       _DCR0+1, 1
;Project.c,160 :: 		}
L_main16:
;Project.c,165 :: 		if((DOWN > UP) && (DCR1 < 5000)){
	MOVF       _DOWN+1, 0
	SUBWF      _UP+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main89
	MOVF       _DOWN+0, 0
	SUBWF      _UP+0, 0
L__main89:
	BTFSC      STATUS+0, 0
	GOTO       L_main19
	MOVLW      19
	SUBWF      _DCR1+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main90
	MOVLW      136
	SUBWF      _DCR1+0, 0
L__main90:
	BTFSC      STATUS+0, 0
	GOTO       L_main19
L__main79:
;Project.c,166 :: 		DCR1 += 10;
	MOVLW      10
	ADDWF      _DCR1+0, 1
	BTFSC      STATUS+0, 0
	INCF       _DCR1+1, 1
;Project.c,167 :: 		}
L_main19:
;Project.c,169 :: 		if((UP > DOWN) && (DCR1 > 1200)){
	MOVF       _UP+1, 0
	SUBWF      _DOWN+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main91
	MOVF       _UP+0, 0
	SUBWF      _DOWN+0, 0
L__main91:
	BTFSC      STATUS+0, 0
	GOTO       L_main22
	MOVF       _DCR1+1, 0
	SUBLW      4
	BTFSS      STATUS+0, 2
	GOTO       L__main92
	MOVF       _DCR1+0, 0
	SUBLW      176
L__main92:
	BTFSC      STATUS+0, 0
	GOTO       L_main22
L__main78:
;Project.c,170 :: 		DCR1 -= 10;
	MOVLW      10
	SUBWF      _DCR1+0, 1
	BTFSS      STATUS+0, 0
	DECF       _DCR1+1, 1
;Project.c,171 :: 		}
L_main22:
;Project.c,173 :: 		Delay_us(150);
	MOVLW      99
	MOVWF      R13+0
L_main23:
	DECFSZ     R13+0, 1
	GOTO       L_main23
	NOP
	NOP
;Project.c,176 :: 		VOLTAGE = ((unsigned long)VOLTAGE * 1200) / 1023;
	MOVF       _VOLTAGE+0, 0
	MOVWF      R0+0
	MOVF       _VOLTAGE+1, 0
	MOVWF      R0+1
	CLRF       R0+2
	CLRF       R0+3
	MOVLW      176
	MOVWF      R4+0
	MOVLW      4
	MOVWF      R4+1
	CLRF       R4+2
	CLRF       R4+3
	CALL       _Mul_32x32_U+0
	MOVLW      255
	MOVWF      R4+0
	MOVLW      3
	MOVWF      R4+1
	CLRF       R4+2
	CLRF       R4+3
	CALL       _Div_32x32_U+0
	MOVF       R0+0, 0
	MOVWF      FLOC__main+4
	MOVF       R0+1, 0
	MOVWF      FLOC__main+5
	MOVF       R0+2, 0
	MOVWF      FLOC__main+6
	MOVF       R0+3, 0
	MOVWF      FLOC__main+7
	MOVF       FLOC__main+4, 0
	MOVWF      _VOLTAGE+0
	MOVF       FLOC__main+5, 0
	MOVWF      _VOLTAGE+1
;Project.c,177 :: 		CURRENT = ((unsigned long)CURRENT * 100) / 1023;
	MOVF       _CURRENT+0, 0
	MOVWF      R0+0
	MOVF       _CURRENT+1, 0
	MOVWF      R0+1
	CLRF       R0+2
	CLRF       R0+3
	MOVLW      100
	MOVWF      R4+0
	CLRF       R4+1
	CLRF       R4+2
	CLRF       R4+3
	CALL       _Mul_32x32_U+0
	MOVLW      255
	MOVWF      R4+0
	MOVLW      3
	MOVWF      R4+1
	CLRF       R4+2
	CLRF       R4+3
	CALL       _Div_32x32_U+0
	MOVF       R0+0, 0
	MOVWF      FLOC__main+0
	MOVF       R0+1, 0
	MOVWF      FLOC__main+1
	MOVF       R0+2, 0
	MOVWF      FLOC__main+2
	MOVF       R0+3, 0
	MOVWF      FLOC__main+3
	MOVF       FLOC__main+0, 0
	MOVWF      _CURRENT+0
	MOVF       FLOC__main+1, 0
	MOVWF      _CURRENT+1
;Project.c,178 :: 		POWER = (VOLTAGE / 10) * CURRENT;
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       FLOC__main+4, 0
	MOVWF      R0+0
	MOVF       FLOC__main+5, 0
	MOVWF      R0+1
	CALL       _Div_16X16_U+0
	MOVF       FLOC__main+0, 0
	MOVWF      R4+0
	MOVF       FLOC__main+1, 0
	MOVWF      R4+1
	CALL       _Mul_16X16_U+0
	MOVF       R0+0, 0
	MOVWF      _POWER+0
	MOVF       R0+1, 0
	MOVWF      _POWER+1
;Project.c,180 :: 		for(i = 0; i < 5; i++){
	CLRF       _i+0
L_main24:
	MOVLW      5
	SUBWF      _i+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_main25
;Project.c,181 :: 		POWER_ASCII[i] = (POWER % 10) + 48;
	MOVF       _i+0, 0
	ADDLW      _POWER_ASCII+0
	MOVWF      FLOC__main+0
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       _POWER+0, 0
	MOVWF      R0+0
	MOVF       _POWER+1, 0
	MOVWF      R0+1
	CALL       _Div_16X16_U+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVLW      48
	ADDWF      R0+0, 1
	MOVF       FLOC__main+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
;Project.c,182 :: 		POWER = POWER / 10;
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       _POWER+0, 0
	MOVWF      R0+0
	MOVF       _POWER+1, 0
	MOVWF      R0+1
	CALL       _Div_16X16_U+0
	MOVF       R0+0, 0
	MOVWF      _POWER+0
	MOVF       R0+1, 0
	MOVWF      _POWER+1
;Project.c,183 :: 		VOLTAGE_ASCII[i] = (VOLTAGE % 10) + 48;
	MOVF       _i+0, 0
	ADDLW      _VOLTAGE_ASCII+0
	MOVWF      FLOC__main+0
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       _VOLTAGE+0, 0
	MOVWF      R0+0
	MOVF       _VOLTAGE+1, 0
	MOVWF      R0+1
	CALL       _Div_16X16_U+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVLW      48
	ADDWF      R0+0, 1
	MOVF       FLOC__main+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
;Project.c,184 :: 		VOLTAGE = VOLTAGE / 10;
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       _VOLTAGE+0, 0
	MOVWF      R0+0
	MOVF       _VOLTAGE+1, 0
	MOVWF      R0+1
	CALL       _Div_16X16_U+0
	MOVF       R0+0, 0
	MOVWF      _VOLTAGE+0
	MOVF       R0+1, 0
	MOVWF      _VOLTAGE+1
;Project.c,180 :: 		for(i = 0; i < 5; i++){
	INCF       _i+0, 1
;Project.c,185 :: 		}
	GOTO       L_main24
L_main25:
;Project.c,187 :: 		LCD_DDRAM_ADDRESS_DISPLAY(POWER_ASCII[4], 6);
	MOVF       _POWER_ASCII+4, 0
	MOVWF      FARG_LCD_DDRAM_ADDRESS_DISPLAY_c+0
	MOVLW      6
	MOVWF      FARG_LCD_DDRAM_ADDRESS_DISPLAY_address+0
	CALL       _LCD_DDRAM_ADDRESS_DISPLAY+0
;Project.c,188 :: 		LCD_DDRAM_ADDRESS_DISPLAY(POWER_ASCII[3], 7);
	MOVF       _POWER_ASCII+3, 0
	MOVWF      FARG_LCD_DDRAM_ADDRESS_DISPLAY_c+0
	MOVLW      7
	MOVWF      FARG_LCD_DDRAM_ADDRESS_DISPLAY_address+0
	CALL       _LCD_DDRAM_ADDRESS_DISPLAY+0
;Project.c,189 :: 		LCD_DDRAM_ADDRESS_DISPLAY(POWER_ASCII[2], 9);
	MOVF       _POWER_ASCII+2, 0
	MOVWF      FARG_LCD_DDRAM_ADDRESS_DISPLAY_c+0
	MOVLW      9
	MOVWF      FARG_LCD_DDRAM_ADDRESS_DISPLAY_address+0
	CALL       _LCD_DDRAM_ADDRESS_DISPLAY+0
;Project.c,190 :: 		LCD_DDRAM_ADDRESS_DISPLAY(POWER_ASCII[1], 10);
	MOVF       _POWER_ASCII+1, 0
	MOVWF      FARG_LCD_DDRAM_ADDRESS_DISPLAY_c+0
	MOVLW      10
	MOVWF      FARG_LCD_DDRAM_ADDRESS_DISPLAY_address+0
	CALL       _LCD_DDRAM_ADDRESS_DISPLAY+0
;Project.c,191 :: 		LCD_DDRAM_ADDRESS_DISPLAY(VOLTAGE_ASCII[3], 72);
	MOVF       _VOLTAGE_ASCII+3, 0
	MOVWF      FARG_LCD_DDRAM_ADDRESS_DISPLAY_c+0
	MOVLW      72
	MOVWF      FARG_LCD_DDRAM_ADDRESS_DISPLAY_address+0
	CALL       _LCD_DDRAM_ADDRESS_DISPLAY+0
;Project.c,192 :: 		LCD_DDRAM_ADDRESS_DISPLAY(VOLTAGE_ASCII[2], 73);
	MOVF       _VOLTAGE_ASCII+2, 0
	MOVWF      FARG_LCD_DDRAM_ADDRESS_DISPLAY_c+0
	MOVLW      73
	MOVWF      FARG_LCD_DDRAM_ADDRESS_DISPLAY_address+0
	CALL       _LCD_DDRAM_ADDRESS_DISPLAY+0
;Project.c,193 :: 		LCD_DDRAM_ADDRESS_DISPLAY(VOLTAGE_ASCII[1], 75);
	MOVF       _VOLTAGE_ASCII+1, 0
	MOVWF      FARG_LCD_DDRAM_ADDRESS_DISPLAY_c+0
	MOVLW      75
	MOVWF      FARG_LCD_DDRAM_ADDRESS_DISPLAY_address+0
	CALL       _LCD_DDRAM_ADDRESS_DISPLAY+0
;Project.c,194 :: 		LCD_DDRAM_ADDRESS_DISPLAY(VOLTAGE_ASCII[0], 76);
	MOVF       _VOLTAGE_ASCII+0, 0
	MOVWF      FARG_LCD_DDRAM_ADDRESS_DISPLAY_c+0
	MOVLW      76
	MOVWF      FARG_LCD_DDRAM_ADDRESS_DISPLAY_address+0
	CALL       _LCD_DDRAM_ADDRESS_DISPLAY+0
;Project.c,196 :: 		}
	GOTO       L_main9
;Project.c,197 :: 		}
L_main8:
;Project.c,202 :: 		if(PORTB & 0B01000000){
	BTFSS      PORTB+0, 6
	GOTO       L_main27
;Project.c,204 :: 		LCD_COMMAND(CLEAR_DISPLAY);
	MOVLW      1
	MOVWF      FARG_LCD_COMMAND_D+0
	CALL       _LCD_COMMAND+0
;Project.c,205 :: 		LCD_COMMAND(RETURN_HOME);
	MOVLW      2
	MOVWF      FARG_LCD_COMMAND_D+0
	CALL       _LCD_COMMAND+0
;Project.c,206 :: 		LCD_DISPLAY("POWER=  .  W");
	MOVLW      ?lstr7_Project+0
	MOVWF      FARG_LCD_DISPLAY_c+0
	CALL       _LCD_DISPLAY+0
;Project.c,207 :: 		LCD_COMMAND(NEXT_LINE);
	MOVLW      192
	MOVWF      FARG_LCD_COMMAND_D+0
	CALL       _LCD_COMMAND+0
;Project.c,208 :: 		LCD_DISPLAY("VOLTAGE=  .  V");
	MOVLW      ?lstr8_Project+0
	MOVWF      FARG_LCD_DISPLAY_c+0
	CALL       _LCD_DISPLAY+0
;Project.c,210 :: 		while(1){
L_main28:
;Project.c,212 :: 		if((PORTB & 0B00010000) && (DCR1 < 5000)){//UP
	BTFSS      PORTB+0, 4
	GOTO       L_main32
	MOVLW      19
	SUBWF      _DCR1+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main93
	MOVLW      136
	SUBWF      _DCR1+0, 0
L__main93:
	BTFSC      STATUS+0, 0
	GOTO       L_main32
L__main77:
;Project.c,213 :: 		DCR1 += 10;
	MOVLW      10
	ADDWF      _DCR1+0, 1
	BTFSC      STATUS+0, 0
	INCF       _DCR1+1, 1
;Project.c,214 :: 		}
L_main32:
;Project.c,216 :: 		if((PORTB & 0B00001000) && (DCR0 < 5000)){//LEFT
	BTFSS      PORTB+0, 3
	GOTO       L_main35
	MOVLW      19
	SUBWF      _DCR0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main94
	MOVLW      136
	SUBWF      _DCR0+0, 0
L__main94:
	BTFSC      STATUS+0, 0
	GOTO       L_main35
L__main76:
;Project.c,217 :: 		DCR0 += 10;
	MOVLW      10
	ADDWF      _DCR0+0, 1
	BTFSC      STATUS+0, 0
	INCF       _DCR0+1, 1
;Project.c,218 :: 		}
L_main35:
;Project.c,220 :: 		if((PORTB & 0B00000100) && (DCR1 > 1200)){//DOWN
	BTFSS      PORTB+0, 2
	GOTO       L_main38
	MOVF       _DCR1+1, 0
	SUBLW      4
	BTFSS      STATUS+0, 2
	GOTO       L__main95
	MOVF       _DCR1+0, 0
	SUBLW      176
L__main95:
	BTFSC      STATUS+0, 0
	GOTO       L_main38
L__main75:
;Project.c,221 :: 		DCR1 -= 10;
	MOVLW      10
	SUBWF      _DCR1+0, 1
	BTFSS      STATUS+0, 0
	DECF       _DCR1+1, 1
;Project.c,222 :: 		}
L_main38:
;Project.c,224 :: 		if((PORTB & 0B00000010) && (DCR0 > 1200)){//RIGHT
	BTFSS      PORTB+0, 1
	GOTO       L_main41
	MOVF       _DCR0+1, 0
	SUBLW      4
	BTFSS      STATUS+0, 2
	GOTO       L__main96
	MOVF       _DCR0+0, 0
	SUBLW      176
L__main96:
	BTFSC      STATUS+0, 0
	GOTO       L_main41
L__main74:
;Project.c,225 :: 		DCR0 -= 10;
	MOVLW      10
	SUBWF      _DCR0+0, 1
	BTFSS      STATUS+0, 0
	DECF       _DCR0+1, 1
;Project.c,226 :: 		}
L_main41:
;Project.c,228 :: 		Delay_us(500);
	MOVLW      2
	MOVWF      R12+0
	MOVLW      75
	MOVWF      R13+0
L_main42:
	DECFSZ     R13+0, 1
	GOTO       L_main42
	DECFSZ     R12+0, 1
	GOTO       L_main42
;Project.c,232 :: 		ADCON0 = ADCON0 & 0B11000111;
	MOVLW      199
	ANDWF      ADCON0+0, 1
;Project.c,233 :: 		ADCON0 = ADCON0 | 0B00101000;
	MOVLW      40
	IORWF      ADCON0+0, 1
;Project.c,234 :: 		VOLTAGE = ADC_READ();
	CALL       _ADC_READ+0
	MOVF       R0+0, 0
	MOVWF      _VOLTAGE+0
	MOVF       R0+1, 0
	MOVWF      _VOLTAGE+1
;Project.c,239 :: 		ADCON0 = ADCON0 & 0B11000111;
	MOVLW      199
	ANDWF      ADCON0+0, 1
;Project.c,240 :: 		ADCON0 = ADCON0 | 0B00110000;
	MOVLW      48
	IORWF      ADCON0+0, 1
;Project.c,241 :: 		CURRENT = ADC_READ();
	CALL       _ADC_READ+0
	MOVF       R0+0, 0
	MOVWF      FLOC__main+0
	MOVF       R0+1, 0
	MOVWF      FLOC__main+1
	MOVF       FLOC__main+0, 0
	MOVWF      _CURRENT+0
	MOVF       FLOC__main+1, 0
	MOVWF      _CURRENT+1
;Project.c,243 :: 		VOLTAGE = ((unsigned long)VOLTAGE * 1200) / 1023;
	MOVF       _VOLTAGE+0, 0
	MOVWF      R0+0
	MOVF       _VOLTAGE+1, 0
	MOVWF      R0+1
	CLRF       R0+2
	CLRF       R0+3
	MOVLW      176
	MOVWF      R4+0
	MOVLW      4
	MOVWF      R4+1
	CLRF       R4+2
	CLRF       R4+3
	CALL       _Mul_32x32_U+0
	MOVLW      255
	MOVWF      R4+0
	MOVLW      3
	MOVWF      R4+1
	CLRF       R4+2
	CLRF       R4+3
	CALL       _Div_32x32_U+0
	MOVF       R0+0, 0
	MOVWF      FLOC__main+4
	MOVF       R0+1, 0
	MOVWF      FLOC__main+5
	MOVF       R0+2, 0
	MOVWF      FLOC__main+6
	MOVF       R0+3, 0
	MOVWF      FLOC__main+7
	MOVF       FLOC__main+4, 0
	MOVWF      _VOLTAGE+0
	MOVF       FLOC__main+5, 0
	MOVWF      _VOLTAGE+1
;Project.c,244 :: 		CURRENT = ((unsigned long)CURRENT * 100) / 1023;
	MOVF       FLOC__main+0, 0
	MOVWF      R0+0
	MOVF       FLOC__main+1, 0
	MOVWF      R0+1
	CLRF       R0+2
	CLRF       R0+3
	MOVLW      100
	MOVWF      R4+0
	CLRF       R4+1
	CLRF       R4+2
	CLRF       R4+3
	CALL       _Mul_32x32_U+0
	MOVLW      255
	MOVWF      R4+0
	MOVLW      3
	MOVWF      R4+1
	CLRF       R4+2
	CLRF       R4+3
	CALL       _Div_32x32_U+0
	MOVF       R0+0, 0
	MOVWF      FLOC__main+0
	MOVF       R0+1, 0
	MOVWF      FLOC__main+1
	MOVF       R0+2, 0
	MOVWF      FLOC__main+2
	MOVF       R0+3, 0
	MOVWF      FLOC__main+3
	MOVF       FLOC__main+0, 0
	MOVWF      _CURRENT+0
	MOVF       FLOC__main+1, 0
	MOVWF      _CURRENT+1
;Project.c,245 :: 		POWER = (VOLTAGE / 10) * CURRENT;
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       FLOC__main+4, 0
	MOVWF      R0+0
	MOVF       FLOC__main+5, 0
	MOVWF      R0+1
	CALL       _Div_16X16_U+0
	MOVF       FLOC__main+0, 0
	MOVWF      R4+0
	MOVF       FLOC__main+1, 0
	MOVWF      R4+1
	CALL       _Mul_16X16_U+0
	MOVF       R0+0, 0
	MOVWF      _POWER+0
	MOVF       R0+1, 0
	MOVWF      _POWER+1
;Project.c,247 :: 		for(i = 0; i < 5; i++){
	CLRF       _i+0
L_main43:
	MOVLW      5
	SUBWF      _i+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_main44
;Project.c,248 :: 		POWER_ASCII[i] = (POWER % 10) + 48;
	MOVF       _i+0, 0
	ADDLW      _POWER_ASCII+0
	MOVWF      FLOC__main+0
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       _POWER+0, 0
	MOVWF      R0+0
	MOVF       _POWER+1, 0
	MOVWF      R0+1
	CALL       _Div_16X16_U+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVLW      48
	ADDWF      R0+0, 1
	MOVF       FLOC__main+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
;Project.c,249 :: 		POWER = POWER / 10;
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       _POWER+0, 0
	MOVWF      R0+0
	MOVF       _POWER+1, 0
	MOVWF      R0+1
	CALL       _Div_16X16_U+0
	MOVF       R0+0, 0
	MOVWF      _POWER+0
	MOVF       R0+1, 0
	MOVWF      _POWER+1
;Project.c,250 :: 		VOLTAGE_ASCII[i] = (VOLTAGE % 10) + 48;
	MOVF       _i+0, 0
	ADDLW      _VOLTAGE_ASCII+0
	MOVWF      FLOC__main+0
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       _VOLTAGE+0, 0
	MOVWF      R0+0
	MOVF       _VOLTAGE+1, 0
	MOVWF      R0+1
	CALL       _Div_16X16_U+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVLW      48
	ADDWF      R0+0, 1
	MOVF       FLOC__main+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
;Project.c,251 :: 		VOLTAGE = VOLTAGE / 10;
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       _VOLTAGE+0, 0
	MOVWF      R0+0
	MOVF       _VOLTAGE+1, 0
	MOVWF      R0+1
	CALL       _Div_16X16_U+0
	MOVF       R0+0, 0
	MOVWF      _VOLTAGE+0
	MOVF       R0+1, 0
	MOVWF      _VOLTAGE+1
;Project.c,247 :: 		for(i = 0; i < 5; i++){
	INCF       _i+0, 1
;Project.c,252 :: 		}
	GOTO       L_main43
L_main44:
;Project.c,254 :: 		LCD_DDRAM_ADDRESS_DISPLAY(POWER_ASCII[4], 6);
	MOVF       _POWER_ASCII+4, 0
	MOVWF      FARG_LCD_DDRAM_ADDRESS_DISPLAY_c+0
	MOVLW      6
	MOVWF      FARG_LCD_DDRAM_ADDRESS_DISPLAY_address+0
	CALL       _LCD_DDRAM_ADDRESS_DISPLAY+0
;Project.c,255 :: 		LCD_DDRAM_ADDRESS_DISPLAY(POWER_ASCII[3], 7);
	MOVF       _POWER_ASCII+3, 0
	MOVWF      FARG_LCD_DDRAM_ADDRESS_DISPLAY_c+0
	MOVLW      7
	MOVWF      FARG_LCD_DDRAM_ADDRESS_DISPLAY_address+0
	CALL       _LCD_DDRAM_ADDRESS_DISPLAY+0
;Project.c,256 :: 		LCD_DDRAM_ADDRESS_DISPLAY(POWER_ASCII[2], 9);
	MOVF       _POWER_ASCII+2, 0
	MOVWF      FARG_LCD_DDRAM_ADDRESS_DISPLAY_c+0
	MOVLW      9
	MOVWF      FARG_LCD_DDRAM_ADDRESS_DISPLAY_address+0
	CALL       _LCD_DDRAM_ADDRESS_DISPLAY+0
;Project.c,257 :: 		LCD_DDRAM_ADDRESS_DISPLAY(POWER_ASCII[1], 10);
	MOVF       _POWER_ASCII+1, 0
	MOVWF      FARG_LCD_DDRAM_ADDRESS_DISPLAY_c+0
	MOVLW      10
	MOVWF      FARG_LCD_DDRAM_ADDRESS_DISPLAY_address+0
	CALL       _LCD_DDRAM_ADDRESS_DISPLAY+0
;Project.c,258 :: 		LCD_DDRAM_ADDRESS_DISPLAY(VOLTAGE_ASCII[3], 72);
	MOVF       _VOLTAGE_ASCII+3, 0
	MOVWF      FARG_LCD_DDRAM_ADDRESS_DISPLAY_c+0
	MOVLW      72
	MOVWF      FARG_LCD_DDRAM_ADDRESS_DISPLAY_address+0
	CALL       _LCD_DDRAM_ADDRESS_DISPLAY+0
;Project.c,259 :: 		LCD_DDRAM_ADDRESS_DISPLAY(VOLTAGE_ASCII[2], 73);
	MOVF       _VOLTAGE_ASCII+2, 0
	MOVWF      FARG_LCD_DDRAM_ADDRESS_DISPLAY_c+0
	MOVLW      73
	MOVWF      FARG_LCD_DDRAM_ADDRESS_DISPLAY_address+0
	CALL       _LCD_DDRAM_ADDRESS_DISPLAY+0
;Project.c,260 :: 		LCD_DDRAM_ADDRESS_DISPLAY(VOLTAGE_ASCII[1], 75);
	MOVF       _VOLTAGE_ASCII+1, 0
	MOVWF      FARG_LCD_DDRAM_ADDRESS_DISPLAY_c+0
	MOVLW      75
	MOVWF      FARG_LCD_DDRAM_ADDRESS_DISPLAY_address+0
	CALL       _LCD_DDRAM_ADDRESS_DISPLAY+0
;Project.c,261 :: 		LCD_DDRAM_ADDRESS_DISPLAY(VOLTAGE_ASCII[0], 76);
	MOVF       _VOLTAGE_ASCII+0, 0
	MOVWF      FARG_LCD_DDRAM_ADDRESS_DISPLAY_c+0
	MOVLW      76
	MOVWF      FARG_LCD_DDRAM_ADDRESS_DISPLAY_address+0
	CALL       _LCD_DDRAM_ADDRESS_DISPLAY+0
;Project.c,264 :: 		}
	GOTO       L_main28
;Project.c,265 :: 		}
L_main27:
;Project.c,266 :: 		}
	GOTO       L_main6
;Project.c,268 :: 		}
L_end_main:
	GOTO       $+0
; end of _main

_interrupt:
	MOVWF      R15+0
	SWAPF      STATUS+0, 0
	CLRF       STATUS+0
	MOVWF      ___saveSTATUS+0
	MOVF       PCLATH+0, 0
	MOVWF      ___savePCLATH+0
	CLRF       PCLATH+0

;Project.c,270 :: 		void interrupt(){
;Project.c,272 :: 		if(INTCON & 0B00000010){
	BTFSS      INTCON+0, 1
	GOTO       L_interrupt46
;Project.c,273 :: 		INTCON = INTCON & 0B11111101;
	MOVLW      253
	ANDWF      INTCON+0, 1
;Project.c,275 :: 		CLRF PCLATH
	CLRF       PCLATH+0
;Project.c,276 :: 		GOTO 0x0000
	GOTO       0
;Project.c,278 :: 		}
L_interrupt46:
;Project.c,283 :: 		if((PIR1 & 4) || (PIR2 & 1)){
	BTFSC      PIR1+0, 2
	GOTO       L__interrupt83
	BTFSC      PIR2+0, 0
	GOTO       L__interrupt83
	GOTO       L_interrupt49
L__interrupt83:
;Project.c,285 :: 		if((CCPR1L == 0x40) && (CCPR1H == 0x9C) && (CCPR2L == 0x40) && (CCPR2H == 0x9C)){
	MOVF       CCPR1L+0, 0
	XORLW      64
	BTFSS      STATUS+0, 2
	GOTO       L_interrupt52
	MOVF       CCPR1H+0, 0
	XORLW      156
	BTFSS      STATUS+0, 2
	GOTO       L_interrupt52
	MOVF       CCPR2L+0, 0
	XORLW      64
	BTFSS      STATUS+0, 2
	GOTO       L_interrupt52
	MOVF       CCPR2H+0, 0
	XORLW      156
	BTFSS      STATUS+0, 2
	GOTO       L_interrupt52
L__interrupt82:
;Project.c,286 :: 		PORTC = PORTC | 4;
	BSF        PORTC+0, 2
;Project.c,287 :: 		CCPR1L = (DCR0 & 0B0000000011111111);
	MOVLW      255
	ANDWF      _DCR0+0, 0
	MOVWF      CCPR1L+0
;Project.c,288 :: 		CCPR1H = (DCR0 >> 8);
	MOVF       _DCR0+1, 0
	MOVWF      R0+0
	CLRF       R0+1
	MOVF       R0+0, 0
	MOVWF      CCPR1H+0
;Project.c,289 :: 		PORTC = PORTC | 2;
	BSF        PORTC+0, 1
;Project.c,290 :: 		CCPR2L = (DCR1 & 0B0000000011111111);
	MOVLW      255
	ANDWF      _DCR1+0, 0
	MOVWF      CCPR2L+0
;Project.c,291 :: 		CCPR2H = (DCR1>>8);
	MOVF       _DCR1+1, 0
	MOVWF      R0+0
	CLRF       R0+1
	MOVF       R0+0, 0
	MOVWF      CCPR2H+0
;Project.c,292 :: 		PIR1 = PIR1 & 0B11111011;
	MOVLW      251
	ANDWF      PIR1+0, 1
;Project.c,293 :: 		PIR2 = PIR2 & 0B11111110;
	MOVLW      254
	ANDWF      PIR2+0, 1
;Project.c,294 :: 		TMR1L = 0;
	CLRF       TMR1L+0
;Project.c,295 :: 		TMR1H = 0;
	CLRF       TMR1H+0
;Project.c,296 :: 		}else{
	GOTO       L_interrupt53
L_interrupt52:
;Project.c,297 :: 		if(PIR1 & 4){
	BTFSS      PIR1+0, 2
	GOTO       L_interrupt54
;Project.c,298 :: 		PORTC = PORTC & 0B11111011;
	MOVLW      251
	ANDWF      PORTC+0, 1
;Project.c,299 :: 		CCPR1L = 0B01000000;
	MOVLW      64
	MOVWF      CCPR1L+0
;Project.c,300 :: 		CCPR1H = 0B10011100;
	MOVLW      156
	MOVWF      CCPR1H+0
;Project.c,301 :: 		PIR1 = PIR1 & 0B11111011;
	MOVLW      251
	ANDWF      PIR1+0, 1
;Project.c,302 :: 		}
L_interrupt54:
;Project.c,303 :: 		if(PIR2 & 1){
	BTFSS      PIR2+0, 0
	GOTO       L_interrupt55
;Project.c,304 :: 		PORTC = PORTC & 0B11111101;
	MOVLW      253
	ANDWF      PORTC+0, 1
;Project.c,305 :: 		CCPR2L = 0B01000000;
	MOVLW      64
	MOVWF      CCPR2L+0
;Project.c,306 :: 		CCPR2H = 0B10011100;
	MOVLW      156
	MOVWF      CCPR2H+0
;Project.c,307 :: 		PIR2 = PIR2 & 0B11111110;
	MOVLW      254
	ANDWF      PIR2+0, 1
;Project.c,308 :: 		}
L_interrupt55:
;Project.c,309 :: 		}
L_interrupt53:
;Project.c,311 :: 		}
L_interrupt49:
;Project.c,313 :: 		}
L_end_interrupt:
L__interrupt98:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of _interrupt

_LCD_COMMAND:

;Project.c,315 :: 		void LCD_COMMAND(unsigned char D){
;Project.c,316 :: 		PORTD = PORTD & 0B11001111;
	MOVLW      207
	ANDWF      PORTD+0, 1
;Project.c,317 :: 		PORTD = (PORTD & 0B11110000) | ((D >> 4) & 0B00001111);
	MOVLW      240
	ANDWF      PORTD+0, 0
	MOVWF      R2+0
	MOVF       FARG_LCD_COMMAND_D+0, 0
	MOVWF      R0+0
	RRF        R0+0, 1
	BCF        R0+0, 7
	RRF        R0+0, 1
	BCF        R0+0, 7
	RRF        R0+0, 1
	BCF        R0+0, 7
	RRF        R0+0, 1
	BCF        R0+0, 7
	MOVLW      15
	ANDWF      R0+0, 1
	MOVF       R0+0, 0
	IORWF      R2+0, 0
	MOVWF      PORTD+0
;Project.c,318 :: 		PORTD = PORTD | 0B01000000;
	BSF        PORTD+0, 6
;Project.c,319 :: 		PORTD = PORTD & 0B10111111;
	MOVLW      191
	ANDWF      PORTD+0, 1
;Project.c,320 :: 		PORTD = (PORTD & 0B11110000) | (D & 0B00001111);
	MOVLW      240
	ANDWF      PORTD+0, 0
	MOVWF      R1+0
	MOVLW      15
	ANDWF      FARG_LCD_COMMAND_D+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	IORWF      R1+0, 0
	MOVWF      PORTD+0
;Project.c,321 :: 		PORTD = PORTD | 0B01000000;
	BSF        PORTD+0, 6
;Project.c,322 :: 		PORTD = PORTD & 0B10111111;
	MOVLW      191
	ANDWF      PORTD+0, 1
;Project.c,323 :: 		Delay_ms(3);
	MOVLW      8
	MOVWF      R12+0
	MOVLW      201
	MOVWF      R13+0
L_LCD_COMMAND56:
	DECFSZ     R13+0, 1
	GOTO       L_LCD_COMMAND56
	DECFSZ     R12+0, 1
	GOTO       L_LCD_COMMAND56
	NOP
	NOP
;Project.c,324 :: 		}
L_end_LCD_COMMAND:
	RETURN
; end of _LCD_COMMAND

_DDRAM_ID_WRIGHT:

;Project.c,326 :: 		void DDRAM_ID_WRIGHT(unsigned char D){
;Project.c,327 :: 		PORTD = PORTD & 0B11011111;
	MOVLW      223
	ANDWF      PORTD+0, 1
;Project.c,328 :: 		PORTD = PORTD | 0B00010000;
	BSF        PORTD+0, 4
;Project.c,329 :: 		PORTD = (PORTD & 0B11110000) | ((D >> 4) & 0B00001111);
	MOVLW      240
	ANDWF      PORTD+0, 0
	MOVWF      R2+0
	MOVF       FARG_DDRAM_ID_WRIGHT_D+0, 0
	MOVWF      R0+0
	RRF        R0+0, 1
	BCF        R0+0, 7
	RRF        R0+0, 1
	BCF        R0+0, 7
	RRF        R0+0, 1
	BCF        R0+0, 7
	RRF        R0+0, 1
	BCF        R0+0, 7
	MOVLW      15
	ANDWF      R0+0, 1
	MOVF       R0+0, 0
	IORWF      R2+0, 0
	MOVWF      PORTD+0
;Project.c,330 :: 		PORTD = PORTD | 0B01000000;
	BSF        PORTD+0, 6
;Project.c,331 :: 		PORTD = PORTD & 0B10111111;
	MOVLW      191
	ANDWF      PORTD+0, 1
;Project.c,332 :: 		PORTD = (PORTD & 0B11110000) | (D & 0B00001111);
	MOVLW      240
	ANDWF      PORTD+0, 0
	MOVWF      R1+0
	MOVLW      15
	ANDWF      FARG_DDRAM_ID_WRIGHT_D+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	IORWF      R1+0, 0
	MOVWF      PORTD+0
;Project.c,333 :: 		PORTD = PORTD | 0B01000000;
	BSF        PORTD+0, 6
;Project.c,334 :: 		PORTD = PORTD & 0B10111111;
	MOVLW      191
	ANDWF      PORTD+0, 1
;Project.c,335 :: 		Delay_ms(3);
	MOVLW      8
	MOVWF      R12+0
	MOVLW      201
	MOVWF      R13+0
L_DDRAM_ID_WRIGHT57:
	DECFSZ     R13+0, 1
	GOTO       L_DDRAM_ID_WRIGHT57
	DECFSZ     R12+0, 1
	GOTO       L_DDRAM_ID_WRIGHT57
	NOP
	NOP
;Project.c,336 :: 		}
L_end_DDRAM_ID_WRIGHT:
	RETURN
; end of _DDRAM_ID_WRIGHT

_ADC_READ:

;Project.c,338 :: 		unsigned int ADC_READ(){
;Project.c,339 :: 		Delay_us(30);
	MOVLW      19
	MOVWF      R13+0
L_ADC_READ58:
	DECFSZ     R13+0, 1
	GOTO       L_ADC_READ58
	NOP
	NOP
;Project.c,340 :: 		ADCON0 = ADCON0 | 0B00000100;
	BSF        ADCON0+0, 2
;Project.c,341 :: 		while(ADCON0 & 0B00000100){}
L_ADC_READ59:
	BTFSS      ADCON0+0, 2
	GOTO       L_ADC_READ60
	GOTO       L_ADC_READ59
L_ADC_READ60:
;Project.c,342 :: 		return ((ADRESH<<8) | ADRESL);
	MOVF       ADRESH+0, 0
	MOVWF      R0+1
	CLRF       R0+0
	MOVF       ADRESL+0, 0
	IORWF      R0+0, 1
	MOVLW      0
	IORWF      R0+1, 1
;Project.c,343 :: 		}
L_end_ADC_READ:
	RETURN
; end of _ADC_READ

_SERVO_50HZ_PWM_SETUP:

;Project.c,345 :: 		void SERVO_50HZ_PWM_SETUP(){
;Project.c,346 :: 		PIE1 = PIE1 | 0B00000100;//CCP1 ENABLED
	BSF        PIE1+0, 2
;Project.c,347 :: 		PIE2 = PIE2 | 1;//CCP2 ENABLED
	BSF        PIE2+0, 0
;Project.c,348 :: 		TRISC = TRISC & 0B11111001;
	MOVLW      249
	ANDWF      TRISC+0, 1
;Project.c,349 :: 		CCP1CON = CCP1CON | 0B00001010;//CCP1 is in compare mode, output does not change(software interrupt).
	MOVLW      10
	IORWF      CCP1CON+0, 1
;Project.c,350 :: 		CCP2CON = CCP2CON | 0B00001010;//CCP2 is in compare mode, output does not change(software interrupt).
	MOVLW      10
	IORWF      CCP2CON+0, 1
;Project.c,351 :: 		T1CON = T1CON | 1;
	BSF        T1CON+0, 0
;Project.c,354 :: 		CCPR1L = 0x40;
	MOVLW      64
	MOVWF      CCPR1L+0
;Project.c,355 :: 		CCPR2L = 0x40;
	MOVLW      64
	MOVWF      CCPR2L+0
;Project.c,356 :: 		CCPR1H = 0x9C;
	MOVLW      156
	MOVWF      CCPR1H+0
;Project.c,357 :: 		CCPR2H = 0x9C;
	MOVLW      156
	MOVWF      CCPR2H+0
;Project.c,359 :: 		TMR1L = 0;
	CLRF       TMR1L+0
;Project.c,360 :: 		TMR1H = 0;
	CLRF       TMR1H+0
;Project.c,361 :: 		}
L_end_SERVO_50HZ_PWM_SETUP:
	RETURN
; end of _SERVO_50HZ_PWM_SETUP

_ADC_SETUP:

;Project.c,363 :: 		void ADC_SETUP(){
;Project.c,365 :: 		ADCON1 = ADCON1 | 0B11000001;// Vref is 3 volts
	MOVLW      193
	IORWF      ADCON1+0, 1
;Project.c,366 :: 		ADCON0 = ADCON0 | 0B01000001;
	MOVLW      65
	IORWF      ADCON0+0, 1
;Project.c,368 :: 		}
L_end_ADC_SETUP:
	RETURN
; end of _ADC_SETUP

_LCD_POWER_ON_INITIALIZATION:

;Project.c,370 :: 		void LCD_POWER_ON_INITIALIZATION(){
;Project.c,372 :: 		TRISD = 0;
	CLRF       TRISD+0
;Project.c,374 :: 		PORTD = 0B00000011;
	MOVLW      3
	MOVWF      PORTD+0
;Project.c,375 :: 		PORTD = PORTD | 0B01000000;
	BSF        PORTD+0, 6
;Project.c,376 :: 		PORTD = PORTD & 0B10111111;
	MOVLW      191
	ANDWF      PORTD+0, 1
;Project.c,377 :: 		Delay_ms(5);
	MOVLW      13
	MOVWF      R12+0
	MOVLW      251
	MOVWF      R13+0
L_LCD_POWER_ON_INITIALIZATION61:
	DECFSZ     R13+0, 1
	GOTO       L_LCD_POWER_ON_INITIALIZATION61
	DECFSZ     R12+0, 1
	GOTO       L_LCD_POWER_ON_INITIALIZATION61
	NOP
	NOP
;Project.c,378 :: 		PORTD = PORTD | 0B01000000;
	BSF        PORTD+0, 6
;Project.c,379 :: 		PORTD = PORTD & 0B10111111;
	MOVLW      191
	ANDWF      PORTD+0, 1
;Project.c,380 :: 		Delay_us(110);
	MOVLW      73
	MOVWF      R13+0
L_LCD_POWER_ON_INITIALIZATION62:
	DECFSZ     R13+0, 1
	GOTO       L_LCD_POWER_ON_INITIALIZATION62
;Project.c,381 :: 		PORTD = 0B00000010;
	MOVLW      2
	MOVWF      PORTD+0
;Project.c,382 :: 		PORTD = PORTD | 0B01000000;
	BSF        PORTD+0, 6
;Project.c,383 :: 		PORTD = PORTD & 0B10111111;
	MOVLW      191
	ANDWF      PORTD+0, 1
;Project.c,384 :: 		Delay_ms(10);
	MOVLW      26
	MOVWF      R12+0
	MOVLW      248
	MOVWF      R13+0
L_LCD_POWER_ON_INITIALIZATION63:
	DECFSZ     R13+0, 1
	GOTO       L_LCD_POWER_ON_INITIALIZATION63
	DECFSZ     R12+0, 1
	GOTO       L_LCD_POWER_ON_INITIALIZATION63
	NOP
;Project.c,386 :: 		}
L_end_LCD_POWER_ON_INITIALIZATION:
	RETURN
; end of _LCD_POWER_ON_INITIALIZATION

_Delay_us:

;Project.c,388 :: 		void Delay_us(unsigned int us){
;Project.c,390 :: 		for(i = 1; i < us; i++){
	MOVLW      1
	MOVWF      R1+0
	MOVLW      0
	MOVWF      R1+1
L_Delay_us64:
	MOVF       FARG_Delay_us_us+1, 0
	SUBWF      R1+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Delay_us106
	MOVF       FARG_Delay_us_us+0, 0
	SUBWF      R1+0, 0
L__Delay_us106:
	BTFSC      STATUS+0, 0
	GOTO       L_Delay_us65
;Project.c,391 :: 		asm nop;
	NOP
;Project.c,392 :: 		asm nop;
	NOP
;Project.c,390 :: 		for(i = 1; i < us; i++){
	INCF       R1+0, 1
	BTFSC      STATUS+0, 2
	INCF       R1+1, 1
;Project.c,393 :: 		}
	GOTO       L_Delay_us64
L_Delay_us65:
;Project.c,394 :: 		}
L_end_Delay_us:
	RETURN
; end of _Delay_us

_Delay_ms:

;Project.c,396 :: 		void Delay_ms(unsigned int ms){
;Project.c,398 :: 		for(i = 1; i < ms; i++){
	MOVLW      1
	MOVWF      R1+0
	MOVLW      0
	MOVWF      R1+1
L_Delay_ms67:
	MOVF       FARG_Delay_ms_ms+1, 0
	SUBWF      R1+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Delay_ms108
	MOVF       FARG_Delay_ms_ms+0, 0
	SUBWF      R1+0, 0
L__Delay_ms108:
	BTFSC      STATUS+0, 0
	GOTO       L_Delay_ms68
;Project.c,399 :: 		Delay_us(1000);
	MOVLW      3
	MOVWF      R12+0
	MOVLW      151
	MOVWF      R13+0
L_Delay_ms70:
	DECFSZ     R13+0, 1
	GOTO       L_Delay_ms70
	DECFSZ     R12+0, 1
	GOTO       L_Delay_ms70
	NOP
	NOP
;Project.c,398 :: 		for(i = 1; i < ms; i++){
	INCF       R1+0, 1
	BTFSC      STATUS+0, 2
	INCF       R1+1, 1
;Project.c,400 :: 		}
	GOTO       L_Delay_ms67
L_Delay_ms68:
;Project.c,401 :: 		}
L_end_Delay_ms:
	RETURN
; end of _Delay_ms

_LCD_DISPLAY:

;Project.c,403 :: 		void LCD_DISPLAY(unsigned char c[]){
;Project.c,405 :: 		for(i = 0; c[i] != 0; i++){
	CLRF       LCD_DISPLAY_i_L0+0
L_LCD_DISPLAY71:
	MOVF       LCD_DISPLAY_i_L0+0, 0
	ADDWF      FARG_LCD_DISPLAY_c+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L_LCD_DISPLAY72
;Project.c,406 :: 		DDRAM_ID_WRIGHT(c[i]);
	MOVF       LCD_DISPLAY_i_L0+0, 0
	ADDWF      FARG_LCD_DISPLAY_c+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      FARG_DDRAM_ID_WRIGHT_D+0
	CALL       _DDRAM_ID_WRIGHT+0
;Project.c,405 :: 		for(i = 0; c[i] != 0; i++){
	INCF       LCD_DISPLAY_i_L0+0, 1
;Project.c,407 :: 		}
	GOTO       L_LCD_DISPLAY71
L_LCD_DISPLAY72:
;Project.c,408 :: 		}
L_end_LCD_DISPLAY:
	RETURN
; end of _LCD_DISPLAY

_LCD_DDRAM_ADDRESS_DISPLAY:

;Project.c,410 :: 		void LCD_DDRAM_ADDRESS_DISPLAY(unsigned char c, unsigned char address){
;Project.c,411 :: 		LCD_COMMAND(address | 0B10000000);
	MOVLW      128
	IORWF      FARG_LCD_DDRAM_ADDRESS_DISPLAY_address+0, 0
	MOVWF      FARG_LCD_COMMAND_D+0
	CALL       _LCD_COMMAND+0
;Project.c,412 :: 		DDRAM_ID_WRIGHT(c);
	MOVF       FARG_LCD_DDRAM_ADDRESS_DISPLAY_c+0, 0
	MOVWF      FARG_DDRAM_ID_WRIGHT_D+0
	CALL       _DDRAM_ID_WRIGHT+0
;Project.c,413 :: 		}
L_end_LCD_DDRAM_ADDRESS_DISPLAY:
	RETURN
; end of _LCD_DDRAM_ADDRESS_DISPLAY
