EESchema Schematic File Version 4
EELAYER 30 0
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
L Connector:8P8C_Shielded J1
U 1 1 5F426E8E
P 1085 4665
F 0 "J1" H 730 5130 50  0000 C CNN
F 1 "8P8C_Shielded" H 1405 4225 50  0000 C CNN
F 2 "Connector_RJ:RJ45_Amphenol_54602-x08_Horizontal" V 1085 4690 50  0001 C CNN
F 3 "~" V 1085 4690 50  0001 C CNN
	1    1085 4665
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0107
U 1 1 5F44BFBD
P 9760 4510
F 0 "#PWR0107" H 9760 4260 50  0001 C CNN
F 1 "GND" H 9765 4337 50  0000 C CNN
F 2 "" H 9760 4510 50  0001 C CNN
F 3 "" H 9760 4510 50  0001 C CNN
	1    9760 4510
	1    0    0    -1  
$EndComp
$Comp
L byteController:BL653 U2
U 1 1 614AEB76
P 9610 2655
F 0 "U2" H 9095 4210 50  0000 C CNN
F 1 "BL653" H 10365 910 50  0000 C CNN
F 2 "Controller:BL653_v5" H 9610 1455 50  0001 C CNN
F 3 "https://www.lairdconnect.com/documentation/datasheet-bl653-series" H 9560 1355 50  0001 C CNN
	1    9610 2655
	1    0    0    -1  
$EndComp
Wire Wire Line
	9760 4455 9760 4510
Text Label 10925 4205 2    50   ~ 0
SWCLK
Wire Wire Line
	10925 4205 10610 4205
Text Label 10925 4305 2    50   ~ 0
SWDIO
Wire Wire Line
	10925 4305 10610 4305
Text Label 10790 3205 2    50   ~ 0
D+
Wire Wire Line
	10790 3205 10610 3205
Text Label 10790 3305 2    50   ~ 0
D-
Wire Wire Line
	10790 3305 10610 3305
$Comp
L Connector:USB_C_Plug_USB2.0 P1
U 1 1 614CD575
P 1065 1610
F 0 "P1" H 600 2270 50  0000 C CNN
F 1 "USB_C_Plug_USB2.0" H 1445 860 50  0000 C CNN
F 2 "Connectors:C393939" H 1215 1610 50  0001 C CNN
F 3 "https://www.usb.org/sites/default/files/documents/usb_type-c.zip" H 1215 1610 50  0001 C CNN
	1    1065 1610
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0101
U 1 1 614D6657
P 915 2665
F 0 "#PWR0101" H 915 2415 50  0001 C CNN
F 1 "GND" H 920 2492 50  0000 C CNN
F 2 "" H 915 2665 50  0001 C CNN
F 3 "" H 915 2665 50  0001 C CNN
	1    915  2665
	1    0    0    -1  
$EndComp
Wire Wire Line
	915  2665 915  2570
Wire Wire Line
	915  2570 765  2570
Wire Wire Line
	765  2570 765  2510
Wire Wire Line
	915  2570 1065 2570
Wire Wire Line
	1065 2570 1065 2510
Connection ~ 915  2570
Text Label 1845 1710 2    50   ~ 0
D+
Wire Wire Line
	1845 1710 1665 1710
Text Label 1845 1510 2    50   ~ 0
D-
Wire Wire Line
	1845 1510 1665 1510
Text Label 1845 1310 2    50   ~ 0
CC2
Wire Wire Line
	1845 1310 1665 1310
Text Label 1845 1210 2    50   ~ 0
CC1
Wire Wire Line
	1845 1210 1665 1210
$Comp
L power:VBUS #PWR0102
U 1 1 614E606D
P 1845 835
F 0 "#PWR0102" H 1845 685 50  0001 C CNN
F 1 "VBUS" H 1860 1008 50  0000 C CNN
F 2 "" H 1845 835 50  0001 C CNN
F 3 "" H 1845 835 50  0001 C CNN
	1    1845 835 
	1    0    0    -1  
$EndComp
Wire Wire Line
	1845 835  1845 1010
Wire Wire Line
	1845 1010 1665 1010
$Comp
L byteController:MCP73830T-2AAI_MYY U1
U 1 1 614ED8F7
P 3660 1170
F 0 "U1" H 3900 1300 50  0000 C CNN
F 1 "MCP73830T-2AAI_MYY" H 4690 620 50  0000 C CNN
F 2 "Controller:2x2TDFN" H 4710 1270 50  0001 L CNN
F 3 "http://www.microchip.com/mymicrochip/filehandler.aspx?ddocname=en555820" H 4710 1170 50  0001 L CNN
F 4 "Battery Management 1A LI-ION BATTERY CHARGE MGNT CNTRLR" H 3860 70  50  0001 L CNN "Description"
F 5 "MCP73830T-2AAI/MYY" H 3910 20  50  0001 L CNN "manf#"
	1    3660 1170
	1    0    0    -1  
$EndComp
$Comp
L power:+BATT #PWR0103
U 1 1 614EFAB8
P 5380 840
F 0 "#PWR0103" H 5380 690 50  0001 C CNN
F 1 "+BATT" H 5395 1013 50  0000 C CNN
F 2 "" H 5380 840 50  0001 C CNN
F 3 "" H 5380 840 50  0001 C CNN
	1    5380 840 
	1    0    0    -1  
$EndComp
Wire Wire Line
	5380 840  5380 1170
Wire Wire Line
	5380 1170 4860 1170
$Comp
L power:GND #PWR0104
U 1 1 614F1EEA
P 4135 2000
F 0 "#PWR0104" H 4135 1750 50  0001 C CNN
F 1 "GND" H 4140 1827 50  0000 C CNN
F 2 "" H 4135 2000 50  0001 C CNN
F 3 "" H 4135 2000 50  0001 C CNN
	1    4135 2000
	1    0    0    -1  
$EndComp
Wire Wire Line
	4135 2000 4135 1935
Wire Wire Line
	4135 1935 4060 1935
Wire Wire Line
	4060 1935 4060 1870
Wire Wire Line
	4135 1935 4210 1935
Wire Wire Line
	4210 1935 4210 1870
Connection ~ 4135 1935
$Comp
L power:VBUS #PWR0105
U 1 1 614F43CC
P 3360 845
F 0 "#PWR0105" H 3360 695 50  0001 C CNN
F 1 "VBUS" H 3375 1018 50  0000 C CNN
F 2 "" H 3360 845 50  0001 C CNN
F 3 "" H 3360 845 50  0001 C CNN
	1    3360 845 
	1    0    0    -1  
$EndComp
Wire Wire Line
	3360 845  3360 1170
$Comp
L Device:R_Small R2
U 1 1 614F5BFE
P 5380 1580
F 0 "R2" H 5321 1534 50  0000 R CNN
F 1 "2K" H 5321 1625 50  0000 R CNN
F 2 "Resistor_SMD:R_0603_1608Metric" H 5380 1580 50  0001 C CNN
F 3 "~" H 5380 1580 50  0001 C CNN
	1    5380 1580
	-1   0    0    1   
$EndComp
Wire Wire Line
	5380 1480 5380 1370
Wire Wire Line
	5380 1370 4860 1370
$Comp
L power:GND #PWR0106
U 1 1 614F85EA
P 5380 1785
F 0 "#PWR0106" H 5380 1535 50  0001 C CNN
F 1 "GND" H 5385 1612 50  0000 C CNN
F 2 "" H 5380 1785 50  0001 C CNN
F 3 "" H 5380 1785 50  0001 C CNN
	1    5380 1785
	1    0    0    -1  
$EndComp
Wire Wire Line
	5380 1680 5380 1785
Text Label 5040 1520 2    50   ~ 0
STAT
Wire Wire Line
	5040 1520 4860 1520
Wire Wire Line
	3360 1170 3660 1170
NoConn ~ 3660 1370
Text Notes 3565 790  0    39   ~ 0
The MCP73830/L devices are always enabled with an\ninternal pull-down resistor. Pulling the CE pin high will\nenter Standby mode
$Comp
L Device:C_Small C2
U 1 1 614FE9C8
P 5785 1230
F 0 "C2" H 5877 1276 50  0000 L CNN
F 1 "4.7uF" H 5877 1185 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 5785 1230 50  0001 C CNN
F 3 "~" H 5785 1230 50  0001 C CNN
	1    5785 1230
	1    0    0    -1  
$EndComp
$Comp
L power:+BATT #PWR0108
U 1 1 614FF262
P 5785 1065
F 0 "#PWR0108" H 5785 915 50  0001 C CNN
F 1 "+BATT" H 5800 1238 50  0000 C CNN
F 2 "" H 5785 1065 50  0001 C CNN
F 3 "" H 5785 1065 50  0001 C CNN
	1    5785 1065
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0109
U 1 1 614FFC71
P 5785 1430
F 0 "#PWR0109" H 5785 1180 50  0001 C CNN
F 1 "GND" H 5790 1257 50  0000 C CNN
F 2 "" H 5785 1430 50  0001 C CNN
F 3 "" H 5785 1430 50  0001 C CNN
	1    5785 1430
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C1
U 1 1 61500A42
P 2955 1030
F 0 "C1" H 3047 1076 50  0000 L CNN
F 1 "4.7uF" H 3047 985 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 2955 1030 50  0001 C CNN
F 3 "~" H 2955 1030 50  0001 C CNN
	1    2955 1030
	1    0    0    -1  
$EndComp
$Comp
L power:VBUS #PWR0110
U 1 1 61501632
P 2955 845
F 0 "#PWR0110" H 2955 695 50  0001 C CNN
F 1 "VBUS" H 2970 1018 50  0000 C CNN
F 2 "" H 2955 845 50  0001 C CNN
F 3 "" H 2955 845 50  0001 C CNN
	1    2955 845 
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0111
U 1 1 615041FB
P 2955 1190
F 0 "#PWR0111" H 2955 940 50  0001 C CNN
F 1 "GND" H 2960 1017 50  0000 C CNN
F 2 "" H 2955 1190 50  0001 C CNN
F 3 "" H 2955 1190 50  0001 C CNN
	1    2955 1190
	1    0    0    -1  
$EndComp
Wire Wire Line
	2955 1130 2955 1190
Wire Wire Line
	2955 845  2955 930 
Wire Wire Line
	5785 1065 5785 1130
Wire Wire Line
	5785 1430 5785 1330
Text Label 2820 1405 2    50   ~ 0
STAT
$Comp
L Device:LED_Small D1
U 1 1 61515176
P 2450 1000
F 0 "D1" V 2496 930 50  0000 R CNN
F 1 "RED" V 2405 930 50  0000 R CNN
F 2 "LED_SMD:LED_0805_2012Metric" V 2450 1000 50  0001 C CNN
F 3 "~" V 2450 1000 50  0001 C CNN
	1    2450 1000
	0    -1   -1   0   
$EndComp
$Comp
L Device:R_Small R1
U 1 1 61516B35
P 2450 1250
F 0 "R1" H 2391 1204 50  0000 R CNN
F 1 "2K" H 2391 1295 50  0000 R CNN
F 2 "Resistor_SMD:R_0603_1608Metric" H 2450 1250 50  0001 C CNN
F 3 "~" H 2450 1250 50  0001 C CNN
	1    2450 1250
	-1   0    0    1   
$EndComp
Wire Wire Line
	2450 1405 2450 1350
Wire Wire Line
	2450 1405 2820 1405
Wire Wire Line
	2450 1100 2450 1150
$Comp
L power:VBUS #PWR0112
U 1 1 61518804
P 2450 845
F 0 "#PWR0112" H 2450 695 50  0001 C CNN
F 1 "VBUS" H 2465 1018 50  0000 C CNN
F 2 "" H 2450 845 50  0001 C CNN
F 3 "" H 2450 845 50  0001 C CNN
	1    2450 845 
	1    0    0    -1  
$EndComp
Wire Wire Line
	2450 845  2450 900 
$Comp
L Device:R_Small R3
U 1 1 61534F4E
P 6445 1135
F 0 "R3" H 6580 1100 50  0000 R CNN
F 1 "2K" H 6595 1165 50  0000 R CNN
F 2 "Resistor_SMD:R_0603_1608Metric" H 6445 1135 50  0001 C CNN
F 3 "~" H 6445 1135 50  0001 C CNN
	1    6445 1135
	-1   0    0    1   
$EndComp
$Comp
L Device:R_Small R5
U 1 1 615366F2
P 6610 1140
F 0 "R5" H 6551 1094 50  0000 R CNN
F 1 "2K" H 6551 1185 50  0000 R CNN
F 2 "Resistor_SMD:R_0603_1608Metric" H 6610 1140 50  0001 C CNN
F 3 "~" H 6610 1140 50  0001 C CNN
	1    6610 1140
	-1   0    0    1   
$EndComp
$Comp
L power:+BATT #PWR0113
U 1 1 6153865B
P 6445 880
F 0 "#PWR0113" H 6445 730 50  0001 C CNN
F 1 "+BATT" H 6460 1053 50  0000 C CNN
F 2 "" H 6445 880 50  0001 C CNN
F 3 "" H 6445 880 50  0001 C CNN
	1    6445 880 
	1    0    0    -1  
$EndComp
Wire Wire Line
	6445 880  6445 930 
Wire Wire Line
	6610 930  6445 930 
Wire Wire Line
	6610 930  6610 1040
Connection ~ 6445 930 
Wire Wire Line
	6445 930  6445 1035
Wire Wire Line
	6610 1240 6610 1300
Wire Wire Line
	6610 1300 7025 1300
Text Label 7025 1300 2    39   ~ 0
SDA
Text Label 7025 1365 2    39   ~ 0
SCL
Wire Wire Line
	7025 1365 6445 1365
Wire Wire Line
	6445 1235 6445 1365
Text Label 6840 2320 2    50   ~ 0
STAT
$Comp
L Device:LED_Small D2
U 1 1 6155CE20
P 6470 1915
F 0 "D2" V 6516 1845 50  0000 R CNN
F 1 "RED" V 6425 1845 50  0000 R CNN
F 2 "LED_SMD:LED_0805_2012Metric" V 6470 1915 50  0001 C CNN
F 3 "~" V 6470 1915 50  0001 C CNN
	1    6470 1915
	0    -1   -1   0   
$EndComp
$Comp
L Device:R_Small R4
U 1 1 6155CE2A
P 6470 2165
F 0 "R4" H 6411 2119 50  0000 R CNN
F 1 "2K" H 6411 2210 50  0000 R CNN
F 2 "Resistor_SMD:R_0603_1608Metric" H 6470 2165 50  0001 C CNN
F 3 "~" H 6470 2165 50  0001 C CNN
	1    6470 2165
	-1   0    0    1   
$EndComp
Wire Wire Line
	6470 2320 6470 2265
Wire Wire Line
	6470 2320 6840 2320
Wire Wire Line
	6470 2015 6470 2065
Wire Wire Line
	6470 1760 6470 1815
$Comp
L power:+BATT #PWR0114
U 1 1 615671DE
P 6470 1760
F 0 "#PWR0114" H 6470 1610 50  0001 C CNN
F 1 "+BATT" H 6485 1933 50  0000 C CNN
F 2 "" H 6470 1760 50  0001 C CNN
F 3 "" H 6470 1760 50  0001 C CNN
	1    6470 1760
	1    0    0    -1  
$EndComp
$EndSCHEMATC
