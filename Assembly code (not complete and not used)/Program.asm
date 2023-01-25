#include <My_Library.inc>



ADDRESS0	ORG 0x0000
			GOTO MY_MAIN



;//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

;Interrupts


INTERRUPT_SERVICE_ROUTINE
			ORG 0x0004
			BANK0; Ensuring that we are operating at bank 1
ETERNAL		BTFSC INTCON,INTF
			GOTO HOME
			GOTO TEST000

HOME		BCF INTCON,INTF
			GOTO INTERRUPT_ENABLE_SETUP

TEST000		BTFSC PIR1,CCP1IF; Checking if CCP1 interrupt flag is set
			GOTO PWM1

TEST001		BTFSC PIR2,CCP2IF; Checking if CCP2 interrupt flag is set
			GOTO PWM2

			RETFIE

;Checking if timer1 has reached 40,000 (20.00 ms point), if yes, we go to DUTY_CYCLE_SETUP_1, if no, we go to PWM1_PRESET
PWM1		XORLFTOW 0x40,CCPR1L
			BTFSS STATUS,Z
			GOTO PWM1_PRESET
			XORLFTOW 0x9C,CCPR1H
			BTFSS STATUS,Z
			GOTO PWM1_PRESET
			GOTO DUTY_CYCLE_SETUP_1


;Checking if timer1 has reached 40,000 (20.00 ms point), if yes, we go to DUTY_CYCLE_SETUP_2, if no, we go to PWM2_PRESET
PWM2		XORLFTOW 0x40,CCPR2L
			BTFSS STATUS,Z
			GOTO PWM2_PRESET
			XORLFTOW 0x9C,CCPR2H
			BTFSS STATUS,Z
			GOTO PWM2_PRESET
			GOTO DUTY_CYCLE_SETUP_2
			
;When timer1 reaches the duty cycle value, we preset the output port pin and move 40,000 to the CCPR1 registers, so it reaches its PWM period
PWM1_PRESET	BCF PORTC,2
			MOVLF B'01000000',CCPR1L
			MOVLF B'10011100',CCPR1H
			BCF PIR1,CCP1IF
			GOTO TEST001

;When timer1 reaches the duty cycle value, we preset the output port pin and move 40,000 to the CCPR2 registers, so it reaches its PWM period
PWM2_PRESET	BCF PORTC,1
			MOVLF B'01000000',CCPR2L
			MOVLF B'10011100',CCPR2H
			BCF PIR2,CCP2IF
			RETFIE


;When timer1 reaches 40,000 (20.00 ms point), we clear timer1, set the output port pin and move the duty cycle value to the CCPR1 registers
DUTY_CYCLE_SETUP_1
			BSF PORTC,2
			MOVF1F2 CCPR1L,DCR0L
			MOVF1F2 CCPR1H,DCR0H
			BCF PIR1,CCP1IF
			CLRF TMR1L
			CLRF TMR1H
			GOTO TEST001


;When timer1 reaches 40,000 (20.00 ms point), we clear timer1, set the output port and move the duty cycle value to the CCPR2 registers
DUTY_CYCLE_SETUP_2
			BSF PORTC,1
			MOVF1F2 CCPR2L,DCR1L
			MOVF1F2 CCPR2H,DCR1H
			BCF PIR2,CCP2IF
			CLRF TMR1L
			CLRF TMR1H
			RETFIE






;//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

;Tables

ADDRESS1	ORG 0x1001

TABLE		ADDWF PCL,1
			RETLW A'O';0
			RETLW A'P';1
			RETLW A'E';2
			RETLW A'R';3
			RETLW A'A';4
			RETLW A'T';5
			RETLW A'I';6
			RETLW A'O';7
			RETLW A'I';8
			RETLW A'N';9
			RETLW A' ';10
			RETLW A'M';11
			RETLW A'O';12
			RETLW A'D';13
			RETLW A'E';14
			RETLW A':';15

			RETLW A'A';16
			RETLW A')';17
			RETLW A'P';18
			RETLW A'R';19
			RETLW A'O';20
			RETLW A'C';21
			RETLW A'E';22
			RETLW A'E';23
			RETLW A'D';24

			RETLW A'A';25
			RETLW A')';26
			RETLW A'S';27
			RETLW A'U';28
			RETLW A'N';29
			RETLW A' ';30
			RETLW A'T';31
			RETLW A'R';32
			RETLW A'A';33
			RETLW A'C';34
			RETLW A'K';35
			RETLW A'I';36
			RETLW A'N';37
			RETLW A'G';38

			RETLW A'B';39
			RETLW A')';40
			RETLW A'M';41
			RETLW A'A';42
			RETLW A'N';43
			RETLW A'U';44
			RETLW A'A';45
			RETLW A'L';46
			RETLW A' ';47
			RETLW A'C';48
			RETLW A'O';49
			RETLW A'N';50
			RETLW A'T';51
			RETLW A'R';52
			RETLW A'O';53
			RETLW A'L';54


			RETLW A'P';55
			RETLW A'O';56
			RETLW A'W';57
			RETLW A'E';58
			RETLW A'R';59
			RETLW A'=';60
			RETLW A' ';61
			RETLW A' ';62
			RETLW A'.';63
			RETLW A' ';64
			RETLW A' ';65
			RETLW A'W';66


			RETLW A'V';67
			RETLW A'O';68
			RETLW A'L';69
			RETLW A'T';70
			RETLW A'A';71
			RETLW A'G';72
			RETLW A'E';73
			RETLW A'=';74
			RETLW A' ';75
			RETLW A' ';76
			RETLW A'.';77
			RETLW A' ';78
			RETLW A' ';79
			RETLW A'V';80


;//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


MY_MAIN		ORG 0x0050

;Initialtizations

LCD_DATA_BITS_CONFIGRATION
			BANK1
			CLRF TRISD; PORTD[0 to 3] = D4 TO D7, RD4 to RS, RD5 to R/W and RD6 to E
			BANK0



LCD_POWER_ON_INITIALIZATION
			
			MOVLF B'00000011',PORTD
			BSF PORTD,6
			NOP
			BCF PORTD,6
			MY_DELAY 0x01,0x2C
			BSF PORTD,6
			NOP
			BCF PORTD,6
			MY_DELAY 0x00,0x96
			BSF PORTD,6
			NOP
			BCF PORTD,6
			
			MY_DELAY 0x00,0x96

			MOVLF B'00000010',PORTD
			BSF PORTD,6
			NOP
			BCF PORTD,6

			MY_DELAY 0x00,0x96

;4-Bits(DL=0), 2-Lines(N=1), 5X8 Dots(F=0)
FUNCTION_SET_COMMAND			
			MOVLF B'00101000',DV
			CALL GENERAL_COMMAND

;Display OFF(D=0), Cursor Off(C=0), Blinking Of Cursor Position Character(B=0)
DISPLAY_OFF_COMMAND
			MOVLF B'00000100',DV
			CALL GENERAL_COMMAND
			
CLEAR_DISPLAY_COMMAND
			MOVLF B'00000001',DV
			CALL GENERAL_COMMAND

;Cursor Increment(I/D=1), Disable Display Shift(S=0)
ENTRY_MODE_SET_COMMAND
			MOVLF B'00000110',DV
			CALL GENERAL_COMMAND

RETURN_HOME_COMMAND
			MOVLF B'00000010',DV
			CALL GENERAL_COMMAND

;Display On(D=1), Cursor ON(C=1), Blinking Of Cursor Position Character(B=0)
DISPLAY_OFF_COMMAND_2
			MOVLF B'00001100',DV
			CALL GENERAL_COMMAND


ADC_SETUP	BANK1
			BSF ADCON1,6
			BSF ADCON1,7
			BANK0
			BSF ADCON0,0; The A/D unit is enabled
			BSF ADCON0,6
; The A/D conversion clock is chosen to be 500.00 kHz (Fose/16) and the result to be right justified (we will deal only 10 bits)

INTERRUPT_ENABLE_SETUP
			BSF INTCON,GIE; Global interrupt enable.
			BSF INTCON,PEIE; Peripheral interrupt enable.
			BANK1; To bank 1.
			BSF PIE1,CCP1IE; CCP1 interrupt enable.
			BSF PIE2,CCP2IE; CCP2 interrupt enable.

SERVO_50HZ_PWM_SETUP
			;Ports RC1/CCP2 and RC2/CCP1 are outputs.
			BCF TRISC,1
			BCF TRISC,2
			BANK0; Back to bank 0.
			;CCP1 is in compare mode, output does not change(software interrupt).
			BSF CCP1CON,1
			BSF CCP1CON,3
			;CCP2 is in compare mode, output does not change(software interrupt).
			BSF CCP2CON,1
			BSF CCP2CON,3
			;Timer1 is configured, prescaler is 1:1, overflowes every 32.768 ms.
			BSF T1CON,0
			;For 50 Hz frequency, Timer1 should reset every 20.00 ms (Timer value equal 40,000), and for 1 ms to 2 ms duty cycle range, timer1 shoud count 2,000 to 4,000 range.
			;Setting period equal to 20.00 ms (Interrupt when timer1 reach 40,000)
			MOVLF 0x40,CCPR1L
			MOVLF 0x40,CCPR2L
			MOVLF 0x9C,CCPR1H
			MOVLF 0x9C,CCPR2H
			;Timer1 starts counting
			CLRF TMR1L
			CLRF TMR1H

EXTERNAL_INTURRUPT
			BSF INTCON,INTE


;//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

PROGRAM_START

POSITION0	MOVLF 0xB8,DCR0L
			MOVLF 0x0B,DCR0H
			MOVLF 0xB8,DCR1L
			MOVLF 0x0B,DCR1H

			MY_DELAY 0x01,0x2C


CLEAR_DISPLAY_COMMAND11
			MOVLF B'00000001',DV
			CALL GENERAL_COMMAND

RETURN_HOME_COMMAND11
			MOVLF B'00000010',DV
			CALL GENERAL_COMMAND


DISPLAY_PRINTING0
			CLRF TABLE_VALUE
CALL_TABLE0	MOVF TABLE_VALUE,0
			BSF PCLATH,4
			CALL TABLE
			MOVWF DV
			BCF PCLATH,4
			CALL DDRAM_ID_WRIGHT
			INCF TABLE_VALUE,1
			XORLFTOW D'16',TABLE_VALUE
			BTFSS STATUS,Z
			GOTO CALL_TABLE0



NEXT_LINE	MOVLF B'11000000',DV
			CALL GENERAL_COMMAND


DISPLAY_PRINTING1
			MOVLF D'16',TABLE_VALUE
CALL_TABLE1	MOVF TABLE_VALUE,0
			BSF PCLATH,4
			CALL TABLE
			MOVWF DV
			BCF PCLATH,4
			CALL DDRAM_ID_WRIGHT
			INCF TABLE_VALUE,1
			XORLFTOW D'25',TABLE_VALUE
			BTFSS STATUS,Z
			GOTO CALL_TABLE1



BUTTON      BTFSS PORTB,7
			GOTO BUTTON

CLEAR_DISPLAY_COMMAND1
			MOVLF B'00000001',DV
			CALL GENERAL_COMMAND

RETURN_HOME_COMMAND1
			MOVLF B'00000010',DV
			CALL GENERAL_COMMAND


DISPLAY_PRINTING2
			MOVLF D'25',TABLE_VALUE
CALL_TABLE2	MOVF TABLE_VALUE,0
			BSF PCLATH,4
			CALL TABLE
			MOVWF DV
			BCF PCLATH,4
			CALL DDRAM_ID_WRIGHT
			INCF TABLE_VALUE,1
			XORLFTOW D'39',TABLE_VALUE
			BTFSS STATUS,Z
			GOTO CALL_TABLE2


NEXT_LINE1	MOVLF B'11000000',DV
			CALL GENERAL_COMMAND


DISPLAY_PRINTING3
			MOVLF D'39',TABLE_VALUE
CALL_TABLE3	MOVF TABLE_VALUE,0
			BSF PCLATH,4
			CALL TABLE
			MOVWF DV
			BCF PCLATH,4
			CALL DDRAM_ID_WRIGHT
			INCF TABLE_VALUE,1
			XORLFTOW D'55',TABLE_VALUE
			BTFSS STATUS,Z
			GOTO CALL_TABLE3

			MY_DELAY 0x03,0x96

BUTTON_CHECK
			BTFSC PORTB,7
			GOTO SUN_TRACKING
			BTFSC PORTB,6
			GOTO MANUAL_CONTROL
			GOTO BUTTON_CHECK
			

;//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

SUN_TRACKING


CLEAR_DISPLAY_COMMAND100
			MOVLF B'00000001',DV
			CALL GENERAL_COMMAND

RETURN_HOME_COMMAND100
			MOVLF B'00000010',DV
			CALL GENERAL_COMMAND

DISPLAY_PRINTING6
			MOVLF D'55',TABLE_VALUE
CALL_TABLE6	MOVF TABLE_VALUE,0
			BSF PCLATH,4
			CALL TABLE
			MOVWF DV
			BCF PCLATH,4
			CALL DDRAM_ID_WRIGHT
			INCF TABLE_VALUE,1
			XORLFTOW D'67',TABLE_VALUE
			BTFSS STATUS,Z
			GOTO CALL_TABLE6

NEXT_LINE3	MOVLF B'11000000',DV
			CALL GENERAL_COMMAND


DISPLAY_PRINTING7
			MOVLF D'67',TABLE_VALUE
CALL_TABLE7	MOVF TABLE_VALUE,0
			BSF PCLATH,4
			CALL TABLE
			MOVWF DV
			BCF PCLATH,4
			CALL DDRAM_ID_WRIGHT
			INCF TABLE_VALUE,1
			XORLFTOW D'81',TABLE_VALUE
			BTFSS STATUS,Z
			GOTO CALL_TABLE7



SUN_TRACKING_START



;Channel 0 (RA0/AN0) reades the upper left LDR voltage reading
CHANNEL0_READ  
			BCF ADCON0,3
			BCF ADCON0,4
			BCF ADCON0,5
			CALL DELAY_20_MICRO_SECONDS; A 20 micro seconds delay for the acquisition time
			BSF ADCON0,2
DONE0		BTFSC ADCON0,2
			GOTO DONE0
			MOVF1F2 ULH,ADRESH
			BANK1
			MOVF ADRESL,0
			BANK0
			MOVWF ULL


;Channel 1 (RA1/AN1) reades the upper right LDR voltage reading
CHANNEL1_READ  
			BSF ADCON0,3
			BCF ADCON0,4
			BCF ADCON0,5
			CALL DELAY_20_MICRO_SECONDS 
			BSF ADCON0,2
DONE1		BTFSC ADCON0,2
			GOTO DONE1
			MOVF1F2 URH,ADRESH
			BANK1
			MOVF ADRESL,0
			BANK0
			MOVWF URL


;Channel 2 (RA2/AN2) reades the lower left LDR voltage reading
CHANNEL2_READ  
			BCF ADCON0,3
			BSF ADCON0,4
			BCF ADCON0,5
			CALL DELAY_20_MICRO_SECONDS 
			BSF ADCON0,2
DONE2		BTFSC ADCON0,2
			GOTO DONE2
			MOVF1F2 LLH,ADRESH
			BANK1
			MOVF ADRESL,0
			BANK0
			MOVWF LLL


;Channel 3 (RA3/AN3) reades the lower right LDR voltage reading
CHANNEL3_READ  
			BSF ADCON0,3
			BSF ADCON0,4
			BCF ADCON0,5
			CALL DELAY_20_MICRO_SECONDS 
			BSF ADCON0,2
DONE3		BTFSC ADCON0,2
			GOTO DONE3
			MOVF1F2 LRH,ADRESH
			BANK1
			MOVF ADRESL,0
			BANK0
			MOVWF LRL


;Channel 4 (RA5/AN4) reades the voltage across the solar panel
CHANNEL4_READ  
			BCF ADCON0,3
			BCF ADCON0,4
			BSF ADCON0,5
			CALL DELAY_20_MICRO_SECONDS 
			BSF ADCON0,2
DONE4		BTFSC ADCON0,2
			GOTO DONE4
			MOVF1F2 VOLTAGE,ADRESH

;Channel 5 (RE0/AN5) reades the current leaving the solar panel
CHANNEL5_READ  
			BSF ADCON0,3
			BCF ADCON0,4
			BSF ADCON0,5
			CALL DELAY_20_MICRO_SECONDS 
			BSF ADCON0,2
DONE5		BTFSC ADCON0,2
			GOTO DONE5
			MOVF1F2 CURRENT,ADRESH


AZIMUTH_MOVEMENT

			;Azimuth movment calculations
			ADDF1F2TOF3_16_BITS ULL,ULH,LLL,LLH,LEFTL,LEFTH; Summing the left LDRs voltage readings and storing it in the left register
			ADDF1F2TOF3_16_BITS URL,URH,LRL,LRH,RIGHTL,RIGHTH; Summing the right LDRs voltage readings and storing it in the right register


AZIMUTH_MOVEMENT_DECISION
;Subtracting the right regiter value from the left register value and storing it in the result register
			SUBF1F2TOF3_16_BITS LEFTL,LEFTH,RIGHTL,RIGHTH,RESULTL,RESULTH
			

			BTFSC RESULTH,7
			GOTO T11R
			XORLFTOW D'0',RESULTL
			BTFSS STATUS,Z
			GOTO T12R
			XORLFTOW D'0',RESULTH
			BTFSC STATUS,Z; If the result is zero, the left is equal to the right, so no azmimuth movment
			GOTO ALTITUDE_MOVEMENT
			GOTO T12R





			;Decision
;Moving from right to left (Clockwise)
T11R		ADDLF D'150',RESULTL
			BTFSC STATUS,C
			INCF RESULTH,1
			BTFSS RESULTH,7
			GOTO ALTITUDE_MOVEMENT
LEFT_SUN	XORLFTOW 0x80,DCR0L; Checking if the position is 180 degrees
			BTFSS STATUS,Z
			GOTO LS2
			XORLFTOW 0x13,DCR0H
			BTFSC STATUS,Z
			GOTO ALTITUDE_MOVEMENT
LS2			INCF DCR0L,1
			BTFSC STATUS,Z
			INCF DCR0H,1
			MY_DELAY 0x00,0x1E; Calling a delay to enable the servo motor to move before executing the next commad
			GOTO ALTITUDE_MOVEMENT

;Moving from left to right (Counterclockwise)
T12R		SUBLF D'150',RESULTL
			BTFSS STATUS,C
			DECF RESULTH,1
			BTFSC RESULTH,7
			GOTO ALTITUDE_MOVEMENT
RIGHT_SUN	XORLFTOW 0xB9,DCR0L
			BTFSS STATUS,Z
			GOTO RS2
			XORLFTOW 0x04,DCR0H
			BTFSC STATUS,Z
			GOTO ALTITUDE_MOVEMENT
RS2			MOVLW D'1'
			SUBWF DCR0L,1
			BTFSS STATUS,C
			DECF DCR0H,1
			MY_DELAY 0x00,0x1E; Calling a delay to enable the servo motor to move before executing the next commad
			GOTO ALTITUDE_MOVEMENT




ALTITUDE_MOVEMENT
			;Altitude movment calculations 
			ADDF1F2TOF3_16_BITS ULL,ULH,URL,URH,UPL,UPH; Summing the up LDRs voltage readings and storing it in the up register
			ADDF1F2TOF3_16_BITS LLL,LLH,LRL,LRH,DOWNL,DOWNH

			
ALTITUDE_MOVEMENT_DECISION
;Subtracting the down regiter value from the up register value and storing it in the result register
			SUBF1F2TOF3_16_BITS UPL,UPH,DOWNL,DOWNH,RESULTL,RESULTH


			BTFSC RESULTH,7
			GOTO T21R
			XORLFTOW D'0',RESULTL
			BTFSS STATUS,Z
			GOTO T22R
			XORLFTOW D'0',RESULTH
			BTFSC STATUS,Z; If the result is zero, the left is equal to the right, so no azmimuth movment
			GOTO SUN_TRACKING_END
			GOTO T22R


T21R		ADDLF D'150',RESULTL
			BTFSC STATUS,C
			INCF RESULTH,1
			BTFSS RESULTH,7
			GOTO SUN_TRACKING_END
UP_SUN		XORLFTOW 0x80,DCR1L
			BTFSS STATUS,Z
			GOTO US2
			XORLFTOW 0x13,DCR1H
			BTFSC STATUS,Z
			GOTO SUN_TRACKING_END
US2			INCF DCR1L,1
			BTFSC STATUS,Z
			INCF DCR1H,1
			MY_DELAY 0x00,0x1E; Calling a delay to enable the servo motor to move before executing the next commad
			GOTO SUN_TRACKING_END

T22R		SUBLF D'150',RESULTL
			BTFSS STATUS,C
			DECF RESULTH,1
			BTFSC RESULTH,7
			GOTO SUN_TRACKING_END
DOWN_SUN	XORLFTOW 0xB9,DCR1L
			BTFSS STATUS,Z
			GOTO DS2
			XORLFTOW 0x04,DCR1H
			BTFSC STATUS,Z
			GOTO SUN_TRACKING_END
DS2			MOVLW D'1'
			SUBWF DCR1L,1
			BTFSS STATUS,C
			DECF DCR1H,1
			MY_DELAY 0x00,0x1E; Calling a delay to enable the servo motor to move before executing the next commad
			GOTO SUN_TRACKING_END


SUN_TRACKING_END
			GOTO SUN_TRACKING_START


;//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

MANUAL_CONTROL


CLEAR_DISPLAY_COMMAND10
			MOVLF B'00000001',DV
			CALL GENERAL_COMMAND

RETURN_HOME_COMMAND10
			MOVLF B'00000010',DV
			CALL GENERAL_COMMAND

DISPLAY_PRINTING4
			MOVLF D'55',TABLE_VALUE
CALL_TABLE4	MOVF TABLE_VALUE,0
			BSF PCLATH,4
			CALL TABLE
			MOVWF DV
			BCF PCLATH,4
			CALL DDRAM_ID_WRIGHT
			INCF TABLE_VALUE,1
			XORLFTOW D'67',TABLE_VALUE
			BTFSS STATUS,Z
			GOTO CALL_TABLE4

NEXT_LINE2	MOVLF B'11000000',DV
			CALL GENERAL_COMMAND


DISPLAY_PRINTING5
			MOVLF D'67',TABLE_VALUE
CALL_TABLE5	MOVF TABLE_VALUE,0
			BSF PCLATH,4
			CALL TABLE
			MOVWF DV
			BCF PCLATH,4
			CALL DDRAM_ID_WRIGHT
			INCF TABLE_VALUE,1
			XORLFTOW D'81',TABLE_VALUE
			BTFSS STATUS,Z
			GOTO CALL_TABLE5




MANUAL_CONTROL_START
			BTFSC PORTB,4; UP
			GOTO CONDITION0
			BTFSC PORTB,3; LEFT
			GOTO CONDITION1
			BTFSC PORTB,2; DOWN
			GOTO CONDITION2
			BTFSC PORTB,1; RIGHT
			GOTO CONDITION3
			GOTO MANUAL_CONTROL_START


CONDITION0	
UP			XORLFTOW 0x80,DCR1L
			BTFSS STATUS,Z
			GOTO US
			XORLFTOW 0x13,DCR1H
			BTFSC STATUS,Z
			GOTO T4
US			INCF DCR1L,1
			BTFSC STATUS,Z
			INCF DCR1H,1
T4			BTFSC PORTB,3; LEFT
			GOTO LEFT0
T5			BTFSC PORTB,1; RIGHT
			GOTO RIGHT0
			MY_DELAY 0x00,0x1E
			GOTO MANUAL_CONTROL_START


CONDITION1	
LEFT		XORLFTOW 0x80,DCR0L; Checking if the position is 180 degrees
			BTFSS STATUS,Z
			GOTO LS0
			XORLFTOW 0x13,DCR0H
			BTFSC STATUS,Z
			GOTO T0
LS			INCF DCR0L,1
			BTFSC STATUS,Z
			INCF DCR0H,1
T0			BTFSC PORTB,4; UP
			GOTO UP0
T1			BTFSC PORTB,2; DOWN
			GOTO DOWN0
			MY_DELAY 0x00,0x1E
			GOTO MANUAL_CONTROL_START





CONDITION2	
DOWN		XORLFTOW 0xB9,DCR1L
			BTFSS STATUS,Z
			GOTO DS
			XORLFTOW 0x04,DCR1H
			BTFSC STATUS,Z
			GOTO T6
DS			MOVLW D'1'
			SUBWF DCR1L,1
			BTFSS STATUS,C
			DECF DCR1H,1
T6			BTFSC PORTB,3; LEFT
			GOTO LEFT0
T7			BTFSC PORTB,1; RIGHT
			GOTO RIGHT0
			MY_DELAY 0x00,0x1E
			GOTO MANUAL_CONTROL_START


CONDITION3	
RIGHT		XORLFTOW 0xB9,DCR0L
			BTFSS STATUS,Z
			GOTO RS
			XORLFTOW 0x04,DCR0H
			BTFSC STATUS,Z
			GOTO T2
RS			MOVLW D'1'
			SUBWF DCR0L,1
			BTFSS STATUS,C
			DECF DCR0H,1
T2			BTFSC PORTB,4; UP
			GOTO UP0
T3			BTFSC PORTB,2; DOWN
			GOTO DOWN0
			MY_DELAY 0x00,0x1E
			GOTO MANUAL_CONTROL_START



UP0			XORLFTOW 0x80,DCR1L
			BTFSS STATUS,Z
			GOTO US0
			XORLFTOW 0x13,DCR1H
			BTFSC STATUS,Z
			GOTO END0
US0			INCF DCR1L,1
			BTFSC STATUS,Z
			INCF DCR1H,1
END0		MY_DELAY 0x00,0x1E
			GOTO MANUAL_CONTROL_START





DOWN0		XORLFTOW 0xB9,DCR1L
			BTFSS STATUS,Z
			GOTO DS0
			XORLFTOW 0x04,DCR1H
			BTFSC STATUS,Z
			GOTO END1
DS0			MOVLW D'1'
			SUBWF DCR1L,1
			BTFSS STATUS,C
			DECF DCR1H,1
END1		MY_DELAY 0x00,0x1E
			GOTO MANUAL_CONTROL_START






LEFT0		XORLFTOW 0x80,DCR0L
			BTFSS STATUS,Z
			GOTO US0
			XORLFTOW 0x13,DCR0H
			BTFSC STATUS,Z
			GOTO END2
LS0			INCF DCR0L,1
			BTFSC STATUS,Z
			INCF DCR0H,1
END2		MY_DELAY 0x00,0x1E
			GOTO MANUAL_CONTROL_START






RIGHT0		XORLFTOW 0xB9,DCR0L
			BTFSS STATUS,Z
			GOTO DS0
			XORLFTOW 0x04,DCR0H
			BTFSC STATUS,Z
			GOTO END3
RS0			MOVLW D'1'
			SUBWF DCR0L,1
			BTFSS STATUS,C
			DECF DCR0H,1
END3		MY_DELAY 0x00,0x1E
			GOTO MANUAL_CONTROL_START



;//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

;Subroutines

DDRAM_ID_WRIGHT
			BSF PORTD,4
			BCF PORTD,5
			MOVF1F2 OP0,DV
			SWAPF DV,1
			ANDLF B'11110000',PORTD
			ANDLF B'00001111',DV
			ADDF1F2 PORTD,DV
			BSF PORTD,6
			BCF PORTD,6
			ANDLF B'11110000',PORTD
			ANDLF B'00001111',OP0
			ADDF1F2 PORTD,OP0
			BSF PORTD,6
			BCF PORTD,6
			MY_DELAY 0x00,0x96
			RETURN

GENERAL_COMMAND
			BANK0
			BCF PORTD,4
			BCF PORTD,5
			MOVF1F2 OP0,DV
			SWAPF DV,1
			ANDLF B'11110000',PORTD
			ANDLF B'00001111',DV
			ADDF1F2 PORTD,DV
			BSF PORTD,6
			BCF PORTD,6
			ANDLF B'11110000',PORTD
			ANDLF B'00001111',OP0
			ADDF1F2 PORTD,OP0
			BSF PORTD,6
			BCF PORTD,6
			MY_DELAY 0x00,0x96
			RETURN


DELAY_20_MICRO_SECONDS 
			MOVLF D'10',DEL0
DELL0		NOP; 0.5 micro seconds
			DECFSZ DEL0,1; 0.5 micro seconds
			GOTO DELL0; 1 micro seconds
			RETURN


DELAY_1_MILLI_SECOND
			MOVLF D'50',DEL1
DELL1		CALL DELAY_20_MICRO_SECONDS 
			DECFSZ DEL1,1; 0.5 micro seconds
			GOTO DELL1; 1 micro seconds
			RETURN

GENERAL_DELAY
START_DELAY	CALL DELAY_1_MILLI_SECOND
			MOVLW D'1'
			SUBWF DELL,1
			BTFSS STATUS,C
			DECF DELH,1
			XORLFTOW D'0',DELL
			BTFSC STATUS,Z
			GOTO START_DELAY
			XORLFTOW D'0',DELH
			BTFSS STATUS,Z
			GOTO START_DELAY
			RETURN


			END



