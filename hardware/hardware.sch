EESchema Schematic File Version 2
LIBS:power
LIBS:device
LIBS:transistors
LIBS:conn
LIBS:linear
LIBS:regul
LIBS:74xx
LIBS:cmos4000
LIBS:adc-dac
LIBS:memory
LIBS:xilinx
LIBS:microcontrollers
LIBS:dsp
LIBS:microchip
LIBS:analog_switches
LIBS:motorola
LIBS:texas
LIBS:intel
LIBS:audio
LIBS:interface
LIBS:digital-audio
LIBS:philips
LIBS:display
LIBS:cypress
LIBS:siliconi
LIBS:opto
LIBS:atmel
LIBS:contrib
LIBS:valves
LIBS:ESP8266
LIBS:DataStorage
LIBS:hardware-cache
EELAYER 25 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L ESP-12E U1
U 1 1 56E7BC6E
P 4300 3700
F 0 "U1" H 4300 3600 50  0000 C CNN
F 1 "ESP-12E" H 4300 3800 50  0000 C CNN
F 2 "ESP8266:ESP-12E" H 4300 3700 50  0001 C CNN
F 3 "" H 4300 3700 50  0001 C CNN
	1    4300 3700
	1    0    0    -1  
$EndComp
$Comp
L CONN_01X06 P1
U 1 1 56E7D2E4
P 6050 1550
F 0 "P1" H 6050 1900 50  0000 C CNN
F 1 "FTDI ESP" V 6150 1550 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x06" H 6050 1550 60  0001 C CNN
F 3 "" H 6050 1550 60  0000 C CNN
	1    6050 1550
	1    0    0    1   
$EndComp
$Comp
L GND #PWR01
U 1 1 56E7D49D
P 5800 1850
F 0 "#PWR01" H 5800 1600 50  0001 C CNN
F 1 "GND" H 5800 1700 50  0000 C CNN
F 2 "" H 5800 1850 60  0000 C CNN
F 3 "" H 5800 1850 60  0000 C CNN
	1    5800 1850
	1    0    0    -1  
$EndComp
$Comp
L VCC #PWR02
U 1 1 56E7E323
P 5750 1200
F 0 "#PWR02" H 5750 1050 50  0001 C CNN
F 1 "VCC" H 5750 1350 50  0000 C CNN
F 2 "" H 5750 1200 60  0000 C CNN
F 3 "" H 5750 1200 60  0000 C CNN
	1    5750 1200
	1    0    0    -1  
$EndComp
$Comp
L VCC #PWR03
U 1 1 56E7F5FA
P 3200 4250
F 0 "#PWR03" H 3200 4100 50  0001 C CNN
F 1 "VCC" H 3200 4400 50  0000 C CNN
F 2 "" H 3200 4250 60  0000 C CNN
F 3 "" H 3200 4250 60  0000 C CNN
	1    3200 4250
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR04
U 1 1 56E7F6C3
P 5300 4200
F 0 "#PWR04" H 5300 3950 50  0001 C CNN
F 1 "GND" H 5300 4050 50  0000 C CNN
F 2 "" H 5300 4200 60  0000 C CNN
F 3 "" H 5300 4200 60  0000 C CNN
	1    5300 4200
	1    0    0    -1  
$EndComp
$Comp
L +9V #PWR05
U 1 1 56E7FAAE
P 1300 6450
F 0 "#PWR05" H 1300 6300 50  0001 C CNN
F 1 "+9V" H 1300 6590 50  0000 C CNN
F 2 "" H 1300 6450 60  0000 C CNN
F 3 "" H 1300 6450 60  0000 C CNN
	1    1300 6450
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR06
U 1 1 56E7FB47
P 2450 7150
F 0 "#PWR06" H 2450 6900 50  0001 C CNN
F 1 "GND" H 2450 7000 50  0000 C CNN
F 2 "" H 2450 7150 60  0000 C CNN
F 3 "" H 2450 7150 60  0000 C CNN
	1    2450 7150
	1    0    0    -1  
$EndComp
$Comp
L VCC #PWR07
U 1 1 56E7FB81
P 3450 6350
F 0 "#PWR07" H 3450 6200 50  0001 C CNN
F 1 "VCC" H 3450 6500 50  0000 C CNN
F 2 "" H 3450 6350 60  0000 C CNN
F 3 "" H 3450 6350 60  0000 C CNN
	1    3450 6350
	1    0    0    -1  
$EndComp
$Comp
L F_Small F1
U 1 1 56E7FBBB
P 1500 6550
F 0 "F1" H 1460 6610 50  0000 L CNN
F 1 "0.1A" H 1380 6490 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603_HandSoldering" H 1500 6550 60  0001 C CNN
F 3 "" H 1500 6550 60  0000 C CNN
	1    1500 6550
	1    0    0    -1  
$EndComp
$Comp
L CP C1
U 1 1 56E7FC01
P 1850 6850
F 0 "C1" H 1875 6950 50  0000 L CNN
F 1 "10µ" H 1875 6750 50  0000 L CNN
F 2 "Capacitors_SMD:c_elec_5x5.3" H 1888 6700 30  0001 C CNN
F 3 "" H 1850 6850 60  0000 C CNN
	1    1850 6850
	1    0    0    -1  
$EndComp
$Comp
L CP C2
U 1 1 56E7FC51
P 3100 6850
F 0 "C2" H 3125 6950 50  0000 L CNN
F 1 "10µ" H 3125 6750 50  0000 L CNN
F 2 "Capacitors_SMD:c_elec_5x5.3" H 3138 6700 30  0001 C CNN
F 3 "" H 3100 6850 60  0000 C CNN
	1    3100 6850
	1    0    0    -1  
$EndComp
$Comp
L VCC #PWR08
U 1 1 56EBCB30
P 6000 3350
F 0 "#PWR08" H 6000 3200 50  0001 C CNN
F 1 "VCC" H 6000 3500 50  0000 C CNN
F 2 "" H 6000 3350 60  0000 C CNN
F 3 "" H 6000 3350 60  0000 C CNN
	1    6000 3350
	1    0    0    -1  
$EndComp
$Comp
L R R5
U 1 1 56EBD648
P 5500 4250
F 0 "R5" V 5580 4250 50  0000 C CNN
F 1 "10k" V 5500 4250 50  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 5430 4250 30  0001 C CNN
F 3 "" H 5500 4250 30  0000 C CNN
	1    5500 4250
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR09
U 1 1 56EBD69F
P 5500 4500
F 0 "#PWR09" H 5500 4250 50  0001 C CNN
F 1 "GND" H 5500 4350 50  0000 C CNN
F 2 "" H 5500 4500 60  0000 C CNN
F 3 "" H 5500 4500 60  0000 C CNN
	1    5500 4500
	1    0    0    -1  
$EndComp
$Comp
L R R3
U 1 1 56EBD8A2
P 5850 3600
F 0 "R3" V 5930 3600 50  0000 C CNN
F 1 "10k" V 5850 3600 50  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 5780 3600 30  0001 C CNN
F 3 "" H 5850 3600 30  0000 C CNN
	1    5850 3600
	1    0    0    -1  
$EndComp
$Comp
L SW_PUSH SW2
U 1 1 56EBDC53
P 5850 4350
F 0 "SW2" H 6000 4460 50  0000 C CNN
F 1 "Flash" H 5850 4270 50  0000 C CNN
F 2 "Buttons_Switches_SMD:SW_SPST_EVPBF" H 5850 4350 60  0001 C CNN
F 3 "" H 5850 4350 60  0000 C CNN
	1    5850 4350
	0    1    1    0   
$EndComp
$Comp
L GND #PWR010
U 1 1 56EBDDBC
P 5850 4750
F 0 "#PWR010" H 5850 4500 50  0001 C CNN
F 1 "GND" H 5850 4600 50  0000 C CNN
F 2 "" H 5850 4750 60  0000 C CNN
F 3 "" H 5850 4750 60  0000 C CNN
	1    5850 4750
	1    0    0    -1  
$EndComp
$Comp
L R R1
U 1 1 56EBDF7B
P 3400 1600
F 0 "R1" V 3480 1600 50  0000 C CNN
F 1 "10k" V 3400 1600 50  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 3330 1600 30  0001 C CNN
F 3 "" H 3400 1600 30  0000 C CNN
	1    3400 1600
	1    0    0    -1  
$EndComp
$Comp
L SW_PUSH SW1
U 1 1 56EBDFFA
P 3400 2150
F 0 "SW1" H 3550 2260 50  0000 C CNN
F 1 "Reset" H 3400 2070 50  0000 C CNN
F 2 "Buttons_Switches_SMD:SW_SPST_EVPBF" H 3400 2150 60  0001 C CNN
F 3 "" H 3400 2150 60  0000 C CNN
	1    3400 2150
	0    1    1    0   
$EndComp
$Comp
L GND #PWR011
U 1 1 56EBE1D4
P 3400 2500
F 0 "#PWR011" H 3400 2250 50  0001 C CNN
F 1 "GND" H 3400 2350 50  0000 C CNN
F 2 "" H 3400 2500 60  0000 C CNN
F 3 "" H 3400 2500 60  0000 C CNN
	1    3400 2500
	1    0    0    -1  
$EndComp
$Comp
L VCC #PWR012
U 1 1 56EBE2DB
P 3400 1400
F 0 "#PWR012" H 3400 1250 50  0001 C CNN
F 1 "VCC" H 3400 1550 50  0000 C CNN
F 2 "" H 3400 1400 60  0000 C CNN
F 3 "" H 3400 1400 60  0000 C CNN
	1    3400 1400
	1    0    0    -1  
$EndComp
$Comp
L R R2
U 1 1 56EBE569
P 2950 3400
F 0 "R2" V 3030 3400 50  0000 C CNN
F 1 "10k" V 2950 3400 50  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 2880 3400 30  0001 C CNN
F 3 "" H 2950 3400 30  0000 C CNN
	1    2950 3400
	1    0    0    -1  
$EndComp
$Comp
L VCC #PWR013
U 1 1 56EBE5C9
P 2950 3200
F 0 "#PWR013" H 2950 3050 50  0001 C CNN
F 1 "VCC" H 2950 3350 50  0000 C CNN
F 2 "" H 2950 3200 60  0000 C CNN
F 3 "" H 2950 3200 60  0000 C CNN
	1    2950 3200
	1    0    0    -1  
$EndComp
$Comp
L CONN_01X05 P2
U 1 1 5755B2C6
P 1450 3000
F 0 "P2" H 1450 3300 50  0000 C CNN
F 1 "PPD42NS" V 1550 3000 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x05" H 1450 3000 60  0001 C CNN
F 3 "" H 1450 3000 60  0000 C CNN
	1    1450 3000
	-1   0    0    1   
$EndComp
$Comp
L CONN_01X03 P3
U 1 1 5755B3C6
P 1450 4100
F 0 "P3" H 1450 4300 50  0000 C CNN
F 1 "DHT22" V 1550 4100 50  0000 C CNN
F 2 "Connect:PINHEAD1-3" H 1450 4100 60  0001 C CNN
F 3 "" H 1450 4100 60  0000 C CNN
	1    1450 4100
	-1   0    0    -1  
$EndComp
$Comp
L CONN_01X03 P4
U 1 1 5755B535
P 1450 5300
F 0 "P4" H 1450 5500 50  0000 C CNN
F 1 "Fan" V 1550 5300 50  0000 C CNN
F 2 "Connect:PINHEAD1-3" H 1450 5300 60  0001 C CNN
F 3 "" H 1450 5300 60  0000 C CNN
	1    1450 5300
	-1   0    0    1   
$EndComp
$Comp
L IRF7607PBF Q1
U 1 1 5755B5B8
P 2900 5400
F 0 "Q1" H 2700 5700 50  0000 L CNN
F 1 "IRF7401" H 2700 5150 50  0000 L CNN
F 2 "SMD_Packages:SOIC-8-N" H 2900 5600 50  0001 C CIN
F 3 "" V 2900 5400 50  0000 L CNN
	1    2900 5400
	0    -1   -1   0   
$EndComp
$Comp
L D D1
U 1 1 5755B74D
P 2100 5200
F 0 "D1" H 2100 5300 50  0000 C CNN
F 1 "D" H 2100 5100 50  0000 C CNN
F 2 "Diodes_SMD:MELF_Handsoldering" H 2100 5200 60  0001 C CNN
F 3 "" H 2100 5200 60  0000 C CNN
	1    2100 5200
	1    0    0    -1  
$EndComp
$Comp
L VCC #PWR014
U 1 1 5755BA5B
P 1900 2700
F 0 "#PWR014" H 1900 2550 50  0001 C CNN
F 1 "VCC" H 1900 2850 50  0000 C CNN
F 2 "" H 1900 2700 60  0000 C CNN
F 3 "" H 1900 2700 60  0000 C CNN
	1    1900 2700
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR015
U 1 1 5755BA88
P 1900 3350
F 0 "#PWR015" H 1900 3100 50  0001 C CNN
F 1 "GND" H 1900 3200 50  0000 C CNN
F 2 "" H 1900 3350 60  0000 C CNN
F 3 "" H 1900 3350 60  0000 C CNN
	1    1900 3350
	1    0    0    -1  
$EndComp
$Comp
L VCC #PWR016
U 1 1 5755BCCC
P 1900 3900
F 0 "#PWR016" H 1900 3750 50  0001 C CNN
F 1 "VCC" H 1900 4050 50  0000 C CNN
F 2 "" H 1900 3900 60  0000 C CNN
F 3 "" H 1900 3900 60  0000 C CNN
	1    1900 3900
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR017
U 1 1 5755BD4E
P 1900 4300
F 0 "#PWR017" H 1900 4050 50  0001 C CNN
F 1 "GND" H 1900 4150 50  0000 C CNN
F 2 "" H 1900 4300 60  0000 C CNN
F 3 "" H 1900 4300 60  0000 C CNN
	1    1900 4300
	1    0    0    -1  
$EndComp
$Comp
L R R4
U 1 1 5755BEEF
P 2050 3850
F 0 "R4" V 2130 3850 50  0000 C CNN
F 1 "10k" V 2050 3850 50  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 1980 3850 30  0001 C CNN
F 3 "" H 2050 3850 30  0000 C CNN
	1    2050 3850
	1    0    0    -1  
$EndComp
$Comp
L +9V #PWR018
U 1 1 5755C417
P 1800 5050
F 0 "#PWR018" H 1800 4900 50  0001 C CNN
F 1 "+9V" H 1800 5190 50  0000 C CNN
F 2 "" H 1800 5050 60  0000 C CNN
F 3 "" H 1800 5050 60  0000 C CNN
	1    1800 5050
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR019
U 1 1 5755C5F3
P 2800 5900
F 0 "#PWR019" H 2800 5650 50  0001 C CNN
F 1 "GND" H 2800 5750 50  0000 C CNN
F 2 "" H 2800 5900 60  0000 C CNN
F 3 "" H 2800 5900 60  0000 C CNN
	1    2800 5900
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR020
U 1 1 579E6AA0
P 6050 6650
F 0 "#PWR020" H 6050 6400 50  0001 C CNN
F 1 "GND" H 6050 6500 50  0000 C CNN
F 2 "" H 6050 6650 60  0000 C CNN
F 3 "" H 6050 6650 60  0000 C CNN
	1    6050 6650
	1    0    0    -1  
$EndComp
$Comp
L VCC #PWR021
U 1 1 579E6AE4
P 5750 5250
F 0 "#PWR021" H 5750 5100 50  0001 C CNN
F 1 "VCC" H 5750 5400 50  0000 C CNN
F 2 "" H 5750 5250 60  0000 C CNN
F 3 "" H 5750 5250 60  0000 C CNN
	1    5750 5250
	1    0    0    -1  
$EndComp
$Comp
L CONN_01X04 P5
U 1 1 57A3B3E4
P 7500 2450
F 0 "P5" H 7500 2700 50  0000 C CNN
F 1 "I2C" V 7600 2450 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x04" H 7500 2450 50  0001 C CNN
F 3 "" H 7500 2450 50  0000 C CNN
	1    7500 2450
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR022
U 1 1 57A3B5CD
P 7200 2700
F 0 "#PWR022" H 7200 2450 50  0001 C CNN
F 1 "GND" H 7200 2550 50  0000 C CNN
F 2 "" H 7200 2700 60  0000 C CNN
F 3 "" H 7200 2700 60  0000 C CNN
	1    7200 2700
	1    0    0    -1  
$EndComp
$Comp
L VCC #PWR023
U 1 1 57A3B614
P 7200 1900
F 0 "#PWR023" H 7200 1750 50  0001 C CNN
F 1 "VCC" H 7200 2050 50  0000 C CNN
F 2 "" H 7200 1900 60  0000 C CNN
F 3 "" H 7200 1900 60  0000 C CNN
	1    7200 1900
	1    0    0    -1  
$EndComp
$Comp
L R R6
U 1 1 57A3B77D
P 6700 2150
F 0 "R6" V 6780 2150 50  0000 C CNN
F 1 "10k" V 6700 2150 50  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 6630 2150 30  0001 C CNN
F 3 "" H 6700 2150 30  0000 C CNN
	1    6700 2150
	1    0    0    -1  
$EndComp
$Comp
L R R7
U 1 1 57A3B7DC
P 6950 2150
F 0 "R7" V 7030 2150 50  0000 C CNN
F 1 "10k" V 6950 2150 50  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 6880 2150 30  0001 C CNN
F 3 "" H 6950 2150 30  0000 C CNN
	1    6950 2150
	1    0    0    -1  
$EndComp
$Comp
L MicroSD J1
U 1 1 57AA5782
P 6350 5950
F 0 "J1" H 6150 6650 60  0000 C CNN
F 1 "MicroSD" H 6150 5250 60  0000 C CNN
F 2 "Footprints:MICRO_SD_HINGE_AMP" H 6450 6100 60  0001 C CNN
F 3 "" H 6450 6100 60  0000 C CNN
	1    6350 5950
	-1   0    0    -1  
$EndComp
$Comp
L Jumper_NO_Small JP1
U 1 1 57AA653D
P 2700 3350
F 0 "JP1" H 2700 3430 50  0000 C CNN
F 1 "Sleep" H 2710 3290 50  0001 C CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" H 2700 3350 50  0001 C CNN
F 3 "" H 2700 3350 50  0000 C CNN
	1    2700 3350
	0    -1   -1   0   
$EndComp
$Comp
L LM317EMP U2
U 1 1 57AA7255
P 2450 6600
F 0 "U2" H 2250 6800 50  0000 C CNN
F 1 "TS 1117 BCW33" H 2450 6800 50  0000 L CNN
F 2 "TO_SOT_Packages_SMD:SOT-223" H 2450 6700 50  0000 C CIN
F 3 "" H 2450 6600 50  0000 C CNN
	1    2450 6600
	1    0    0    -1  
$EndComp
$Comp
L BARREL_JACK CON1
U 1 1 57AA73D1
P 8600 4050
F 0 "CON1" H 8600 4300 50  0000 C CNN
F 1 "BARREL_JACK" H 8600 3850 50  0000 C CNN
F 2 "Connect:BARREL_JACK" H 8600 4050 50  0001 C CNN
F 3 "" H 8600 4050 50  0000 C CNN
	1    8600 4050
	1    0    0    -1  
$EndComp
$Comp
L +9V #PWR024
U 1 1 57AA7442
P 9250 3750
F 0 "#PWR024" H 9250 3600 50  0001 C CNN
F 1 "+9V" H 9250 3890 50  0000 C CNN
F 2 "" H 9250 3750 60  0000 C CNN
F 3 "" H 9250 3750 60  0000 C CNN
	1    9250 3750
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR025
U 1 1 57AA7495
P 9250 4250
F 0 "#PWR025" H 9250 4000 50  0001 C CNN
F 1 "GND" H 9250 4100 50  0000 C CNN
F 2 "" H 9250 4250 60  0000 C CNN
F 3 "" H 9250 4250 60  0000 C CNN
	1    9250 4250
	1    0    0    -1  
$EndComp
$Comp
L CONN_01X02 P6
U 1 1 57AA7630
P 9600 4000
F 0 "P6" H 9600 4150 50  0000 C CNN
F 1 "CONN_01X02" V 9700 4000 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x02" H 9600 4000 50  0001 C CNN
F 3 "" H 9600 4000 50  0000 C CNN
	1    9600 4000
	1    0    0    -1  
$EndComp
$Comp
L C C3
U 1 1 57AC2CCE
P 4200 6850
F 0 "C3" H 4225 6950 50  0000 L CNN
F 1 "100n" H 4225 6750 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 4238 6700 50  0001 C CNN
F 3 "" H 4200 6850 50  0000 C CNN
	1    4200 6850
	1    0    0    -1  
$EndComp
$Comp
L C C4
U 1 1 57AC2D5E
P 4600 6850
F 0 "C4" H 4625 6950 50  0000 L CNN
F 1 "100n" H 4625 6750 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 4638 6700 50  0001 C CNN
F 3 "" H 4600 6850 50  0000 C CNN
	1    4600 6850
	1    0    0    -1  
$EndComp
$Comp
L VCC #PWR026
U 1 1 57AC2DC5
P 4200 6600
F 0 "#PWR026" H 4200 6450 50  0001 C CNN
F 1 "VCC" H 4200 6750 50  0000 C CNN
F 2 "" H 4200 6600 60  0000 C CNN
F 3 "" H 4200 6600 60  0000 C CNN
	1    4200 6600
	1    0    0    -1  
$EndComp
$Comp
L VCC #PWR027
U 1 1 57AC2E21
P 4600 6600
F 0 "#PWR027" H 4600 6450 50  0001 C CNN
F 1 "VCC" H 4600 6750 50  0000 C CNN
F 2 "" H 4600 6600 60  0000 C CNN
F 3 "" H 4600 6600 60  0000 C CNN
	1    4600 6600
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR028
U 1 1 57AC2E7D
P 4200 7100
F 0 "#PWR028" H 4200 6850 50  0001 C CNN
F 1 "GND" H 4200 6950 50  0000 C CNN
F 2 "" H 4200 7100 60  0000 C CNN
F 3 "" H 4200 7100 60  0000 C CNN
	1    4200 7100
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR029
U 1 1 57AC2ED9
P 4600 7100
F 0 "#PWR029" H 4600 6850 50  0001 C CNN
F 1 "GND" H 4600 6950 50  0000 C CNN
F 2 "" H 4600 7100 60  0000 C CNN
F 3 "" H 4600 7100 60  0000 C CNN
	1    4600 7100
	1    0    0    -1  
$EndComp
Wire Wire Line
	5850 1500 5500 1500
Wire Wire Line
	5500 1500 5500 3500
Wire Wire Line
	5500 3500 5200 3500
Wire Wire Line
	5200 3400 5400 3400
Wire Wire Line
	5400 3400 5400 1400
Wire Wire Line
	5400 1400 5850 1400
Wire Wire Line
	5850 1800 5800 1800
Wire Wire Line
	5800 1800 5800 1850
Wire Wire Line
	5850 1600 5750 1600
Wire Wire Line
	5750 1600 5750 1200
Wire Wire Line
	3200 4250 3200 4300
Wire Wire Line
	3200 4300 3400 4300
Wire Wire Line
	3400 4300 3400 4100
Wire Wire Line
	5200 4100 5300 4100
Wire Wire Line
	5300 4100 5300 4200
Wire Wire Line
	1300 6450 1300 6550
Wire Wire Line
	1300 6550 1400 6550
Wire Wire Line
	1600 6550 2050 6550
Wire Wire Line
	1850 6700 1850 6550
Connection ~ 1850 6550
Wire Wire Line
	1850 7000 1850 7100
Wire Wire Line
	1850 7100 3100 7100
Wire Wire Line
	3100 7100 3100 7000
Wire Wire Line
	2450 6850 2450 7150
Connection ~ 2450 7100
Wire Wire Line
	2850 6550 3450 6550
Wire Wire Line
	3100 6550 3100 6700
Wire Wire Line
	3450 6550 3450 6350
Connection ~ 3100 6550
Wire Wire Line
	5200 4000 5650 4000
Wire Wire Line
	5500 4000 5500 4100
Wire Wire Line
	5500 4400 5500 4500
Wire Wire Line
	5850 3450 5850 3400
Wire Wire Line
	5850 3400 6200 3400
Wire Wire Line
	6200 3400 6200 3450
Wire Wire Line
	6000 3350 6000 3400
Connection ~ 6000 3400
Wire Wire Line
	5850 3750 5850 4050
Wire Wire Line
	5850 3800 5200 3800
Connection ~ 5850 3800
Wire Wire Line
	5850 4650 5850 4750
Wire Wire Line
	3400 3400 3200 3400
Wire Wire Line
	3200 3400 3200 1800
Wire Wire Line
	3200 1800 3400 1800
Wire Wire Line
	3400 1750 3400 1850
Connection ~ 3400 1800
Wire Wire Line
	3400 2500 3400 2450
Wire Wire Line
	3400 1400 3400 1450
Wire Wire Line
	2950 3200 2950 3250
Wire Wire Line
	3400 3600 2950 3600
Wire Wire Line
	2950 3600 2950 3550
Wire Wire Line
	3400 3900 2200 3900
Wire Wire Line
	2200 3900 2200 3100
Wire Wire Line
	2200 3100 1650 3100
Wire Wire Line
	1650 2900 2400 2900
Wire Wire Line
	2400 2900 2400 3800
Wire Wire Line
	2400 3800 3400 3800
Wire Wire Line
	1650 3000 1900 3000
Wire Wire Line
	1900 3000 1900 2700
Wire Wire Line
	1650 3200 1900 3200
Wire Wire Line
	1900 3200 1900 3350
Wire Wire Line
	1650 4200 1900 4200
Wire Wire Line
	1900 4200 1900 4300
Wire Wire Line
	1650 4000 1900 4000
Wire Wire Line
	1900 4000 1900 3900
Wire Wire Line
	5200 3700 5700 3700
Wire Wire Line
	1650 4100 2800 4100
Wire Wire Line
	2050 4000 2050 4100
Connection ~ 2050 4100
Wire Wire Line
	2050 3700 2050 3600
Wire Wire Line
	2050 3600 1750 3600
Wire Wire Line
	1750 3600 1750 4000
Connection ~ 1750 4000
Wire Wire Line
	1650 5400 2400 5400
Wire Wire Line
	2400 5400 2400 5000
Wire Wire Line
	2400 5000 3000 5000
Wire Wire Line
	3000 5000 3000 5100
Wire Wire Line
	2900 5100 2900 5000
Connection ~ 2900 5000
Wire Wire Line
	2800 5100 2800 5000
Connection ~ 2800 5000
Wire Wire Line
	2700 5150 2700 5000
Connection ~ 2700 5000
Wire Wire Line
	1650 5200 1950 5200
Wire Wire Line
	1800 5200 1800 5050
Connection ~ 1800 5200
Wire Wire Line
	2250 5200 2400 5200
Connection ~ 2400 5200
Wire Wire Line
	2700 5700 2700 5800
Wire Wire Line
	2700 5800 2900 5800
Wire Wire Line
	2900 5800 2900 5700
Wire Wire Line
	2800 5700 2800 5900
Connection ~ 2800 5800
Wire Wire Line
	4450 4600 4450 5550
Wire Wire Line
	3000 4800 3950 4800
Wire Wire Line
	3950 4800 3950 5450
Wire Wire Line
	5200 3900 5200 4900
Wire Wire Line
	5200 4900 2800 4900
Wire Wire Line
	2800 4900 2800 4100
Wire Wire Line
	3000 4000 3000 4800
Wire Wire Line
	3000 4000 3400 4000
Wire Wire Line
	5700 3700 5700 2500
Wire Wire Line
	5700 2500 7300 2500
Wire Wire Line
	7300 2400 5600 2400
Wire Wire Line
	5600 2400 5600 3600
Wire Wire Line
	5600 3600 5200 3600
Wire Wire Line
	7300 2300 7200 2300
Wire Wire Line
	7200 2300 7200 1900
Wire Wire Line
	7300 2600 7200 2600
Wire Wire Line
	7200 2600 7200 2700
Wire Wire Line
	6700 2000 6700 1950
Wire Wire Line
	6700 1950 7200 1950
Connection ~ 7200 1950
Wire Wire Line
	6950 2000 6950 1950
Connection ~ 6950 1950
Wire Wire Line
	6700 2300 6700 2400
Connection ~ 6700 2400
Wire Wire Line
	6950 2300 6950 2500
Connection ~ 6950 2500
Wire Wire Line
	5350 4850 5650 4850
Wire Wire Line
	5650 4850 5650 4000
Connection ~ 5500 4000
Wire Wire Line
	3950 5450 6150 5450
Wire Wire Line
	4450 5550 6150 5550
Wire Wire Line
	6150 5750 4550 5750
Wire Wire Line
	4550 5750 4550 4600
Wire Wire Line
	5350 5850 3050 5850
Wire Wire Line
	3050 5850 3050 5700
Wire Wire Line
	5350 5850 5350 4850
Wire Wire Line
	6150 5950 4150 5950
Wire Wire Line
	4150 5950 4150 4600
Wire Wire Line
	6150 5650 5750 5650
Wire Wire Line
	5750 5650 5750 5250
Wire Wire Line
	6150 5850 6050 5850
Wire Wire Line
	6050 5850 6050 6650
Wire Wire Line
	6150 6250 6050 6250
Connection ~ 6050 6250
Wire Wire Line
	6150 6350 6050 6350
Connection ~ 6050 6350
Wire Wire Line
	6150 6450 6050 6450
Connection ~ 6050 6450
Wire Wire Line
	6150 6550 6050 6550
Connection ~ 6050 6550
Wire Wire Line
	3400 3700 2700 3700
Wire Wire Line
	2700 3700 2700 3450
Wire Wire Line
	2700 3250 2700 2750
Wire Wire Line
	2700 2750 3200 2750
Connection ~ 3200 2750
Wire Wire Line
	8900 3950 9400 3950
Wire Wire Line
	9250 3950 9250 3750
Wire Wire Line
	8900 4050 9400 4050
Wire Wire Line
	9250 4050 9250 4250
Connection ~ 9250 3950
Connection ~ 9250 4050
Wire Wire Line
	4600 6600 4600 6700
Wire Wire Line
	4200 6600 4200 6700
Wire Wire Line
	4200 7000 4200 7100
Wire Wire Line
	4600 7100 4600 7000
$EndSCHEMATC
