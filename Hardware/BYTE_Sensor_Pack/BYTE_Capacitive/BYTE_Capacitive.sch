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
L capacitive_sensor:AD7147PACPZ-1500R7 U1
U 1 1 6135B046
P 4525 1655
F 0 "U1" H 4725 2105 50  0000 L CNN
F 1 "AD7147PACPZ-1500R7" H 5140 500 50  0000 L CNN
F 2 "BYTE_Sensors:QFN50P400X400X80-25N-D" H 5575 2055 50  0001 L CNN
F 3 "http://www.analog.com/media/en/technical-documentation/data-sheets/AD7147.pdf" H 5575 1955 50  0001 L CNN
F 4 "AD7147PACPZ-1500R7, Capacitance to Digital Converter, 16 bit- 24-Pin LFCSP EP" H 5575 1855 50  0001 L CNN "Description"
F 5 "AD7147PACPZ-1500R7" H 5575 1555 50  0001 L CNN "manf#"
	1    4525 1655
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR0101
U 1 1 61367C1E
P 5125 905
F 0 "#PWR0101" H 5125 755 50  0001 C CNN
F 1 "+3.3V" H 5140 1078 50  0000 C CNN
F 2 "" H 5125 905 50  0001 C CNN
F 3 "" H 5125 905 50  0001 C CNN
	1    5125 905 
	1    0    0    -1  
$EndComp
Wire Wire Line
	8620 2435 8620 2490
$Comp
L power:+3.3V #PWR0102
U 1 1 61371DD9
P 8520 1245
F 0 "#PWR0102" H 8520 1095 50  0001 C CNN
F 1 "+3.3V" H 8535 1418 50  0000 C CNN
F 2 "" H 8520 1245 50  0001 C CNN
F 3 "" H 8520 1245 50  0001 C CNN
	1    8520 1245
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C5
U 1 1 61373136
P 9125 1090
F 0 "C5" H 9217 1136 50  0000 L CNN
F 1 "1uF" H 9217 1045 50  0000 L CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 9125 1090 50  0001 C CNN
F 3 "~" H 9125 1090 50  0001 C CNN
	1    9125 1090
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR0103
U 1 1 613742A0
P 9125 950
F 0 "#PWR0103" H 9125 800 50  0001 C CNN
F 1 "+3.3V" H 9140 1123 50  0000 C CNN
F 2 "" H 9125 950 50  0001 C CNN
F 3 "" H 9125 950 50  0001 C CNN
	1    9125 950 
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0104
U 1 1 61369733
P 8620 2490
F 0 "#PWR0104" H 8620 2240 50  0001 C CNN
F 1 "GND" H 8625 2317 50  0000 C CNN
F 2 "" H 8620 2490 50  0001 C CNN
F 3 "" H 8620 2490 50  0001 C CNN
	1    8620 2490
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0105
U 1 1 61374EE8
P 9125 1255
F 0 "#PWR0105" H 9125 1005 50  0001 C CNN
F 1 "GND" H 9130 1082 50  0000 C CNN
F 2 "" H 9125 1255 50  0001 C CNN
F 3 "" H 9125 1255 50  0001 C CNN
	1    9125 1255
	1    0    0    -1  
$EndComp
Wire Wire Line
	9125 1190 9125 1255
Wire Wire Line
	9125 950  9125 990 
$Comp
L Device:C_Small C4
U 1 1 6137828E
P 7820 1170
F 0 "C4" H 7912 1216 50  0000 L CNN
F 1 "1uF" H 7912 1125 50  0000 L CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 7820 1170 50  0001 C CNN
F 3 "~" H 7820 1170 50  0001 C CNN
	1    7820 1170
	1    0    0    -1  
$EndComp
Text Label 7605 1735 0    50   ~ 0
REG
Wire Wire Line
	7605 1735 7870 1735
Text Label 7820 915  0    50   ~ 0
REG
Wire Wire Line
	7820 915  7820 1070
$Comp
L power:GND #PWR0106
U 1 1 61379802
P 7820 1365
F 0 "#PWR0106" H 7820 1115 50  0001 C CNN
F 1 "GND" H 7825 1192 50  0000 C CNN
F 2 "" H 7820 1365 50  0001 C CNN
F 3 "" H 7820 1365 50  0001 C CNN
	1    7820 1365
	1    0    0    -1  
$EndComp
Wire Wire Line
	7820 1365 7820 1270
Text Label 7605 2135 0    50   ~ 0
EN
Wire Wire Line
	7605 2135 7870 2135
Wire Wire Line
	7605 2035 7870 2035
Text Label 7605 2035 0    50   ~ 0
IN_TRIG
Wire Wire Line
	7605 1835 7870 1835
Text Label 7605 1835 0    50   ~ 0
SCL
Wire Wire Line
	7605 1935 7870 1935
Text Label 7605 1935 0    50   ~ 0
SDA
$Comp
L Motor:Motor_DC M1
U 1 1 61383ACB
P 9875 1850
F 0 "M1" H 10033 1846 50  0000 L CNN
F 1 "Motor_DC" H 10033 1755 50  0000 L CNN
F 2 "BYTE_Sensors:VLV041235L" H 9875 1760 50  0001 C CNN
F 3 "~" H 9875 1760 50  0001 C CNN
	1    9875 1850
	1    0    0    -1  
$EndComp
Wire Wire Line
	9875 2150 9875 2210
Wire Wire Line
	9875 2210 9365 2210
Wire Wire Line
	9365 2210 9365 2035
Wire Wire Line
	9365 2035 9270 2035
Wire Wire Line
	9270 1835 9365 1835
Wire Wire Line
	9365 1835 9365 1485
Wire Wire Line
	9365 1485 9875 1485
Wire Wire Line
	9875 1485 9875 1650
Wire Wire Line
	4260 1905 4525 1905
Text Label 4260 1905 0    50   ~ 0
SCL
Wire Wire Line
	4260 2005 4525 2005
Text Label 4260 2005 0    50   ~ 0
SDA
Text Label 2880 1585 0    50   ~ 0
SCL
Text Label 2880 1685 0    50   ~ 0
SDA
$Comp
L power:+3.3V #PWR0107
U 1 1 6139A81A
P 3310 1305
F 0 "#PWR0107" H 3310 1155 50  0001 C CNN
F 1 "+3.3V" H 3325 1478 50  0000 C CNN
F 2 "" H 3310 1305 50  0001 C CNN
F 3 "" H 3310 1305 50  0001 C CNN
	1    3310 1305
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR0108
U 1 1 6139B3E0
P 3585 1300
F 0 "#PWR0108" H 3585 1150 50  0001 C CNN
F 1 "+3.3V" H 3600 1473 50  0000 C CNN
F 2 "" H 3585 1300 50  0001 C CNN
F 3 "" H 3585 1300 50  0001 C CNN
	1    3585 1300
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R1
U 1 1 6139B985
P 3310 1440
F 0 "R1" H 3175 1480 50  0000 L CNN
F 1 "2.2K" H 3105 1395 50  0000 L CNN
F 2 "Resistor_SMD:R_0402_1005Metric" H 3310 1440 50  0001 C CNN
F 3 "~" H 3310 1440 50  0001 C CNN
	1    3310 1440
	1    0    0    -1  
$EndComp
Wire Wire Line
	3585 1300 3585 1340
Wire Wire Line
	3310 1305 3310 1340
Wire Wire Line
	3310 1585 3310 1540
Wire Wire Line
	2880 1585 3310 1585
Wire Wire Line
	2880 1685 3585 1685
Wire Wire Line
	4260 1705 4525 1705
Text Label 4260 1705 0    50   ~ 0
ADD1
Wire Wire Line
	4260 1805 4525 1805
Text Label 4260 1805 0    50   ~ 0
ADD0
Wire Wire Line
	4260 1505 4525 1505
Text Label 4260 1505 0    50   ~ 0
GPIO
Wire Wire Line
	4260 1605 4525 1605
Text Label 4260 1605 0    50   ~ 0
INT
Wire Wire Line
	5125 905  5125 965 
Wire Wire Line
	5225 1055 5225 965 
Wire Wire Line
	5225 965  5125 965 
Connection ~ 5125 965 
Wire Wire Line
	5125 965  5125 1055
$Comp
L Device:C_Small C2
U 1 1 613AA98F
P 5705 895
F 0 "C2" H 5585 955 50  0000 L CNN
F 1 "0.1uF" H 5475 825 50  0000 L CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 5705 895 50  0001 C CNN
F 3 "~" H 5705 895 50  0001 C CNN
	1    5705 895 
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR0109
U 1 1 613AAB03
P 5705 755
F 0 "#PWR0109" H 5705 605 50  0001 C CNN
F 1 "+3.3V" H 5720 928 50  0000 C CNN
F 2 "" H 5705 755 50  0001 C CNN
F 3 "" H 5705 755 50  0001 C CNN
	1    5705 755 
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0110
U 1 1 613AAB0D
P 5705 1060
F 0 "#PWR0110" H 5705 810 50  0001 C CNN
F 1 "GND" H 5710 887 50  0000 C CNN
F 2 "" H 5705 1060 50  0001 C CNN
F 3 "" H 5705 1060 50  0001 C CNN
	1    5705 1060
	1    0    0    -1  
$EndComp
Wire Wire Line
	5705 995  5705 1060
Wire Wire Line
	5705 755  5705 795 
$Comp
L Device:C_Small C3
U 1 1 613B889F
P 5965 890
F 0 "C3" H 6057 936 50  0000 L CNN
F 1 "1uF" H 6057 845 50  0000 L CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 5965 890 50  0001 C CNN
F 3 "~" H 5965 890 50  0001 C CNN
	1    5965 890 
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR0111
U 1 1 613B89E7
P 5965 750
F 0 "#PWR0111" H 5965 600 50  0001 C CNN
F 1 "+3.3V" H 5980 923 50  0000 C CNN
F 2 "" H 5965 750 50  0001 C CNN
F 3 "" H 5965 750 50  0001 C CNN
	1    5965 750 
	1    0    0    -1  
$EndComp
Wire Wire Line
	5965 990  5965 1055
Wire Wire Line
	5965 750  5965 790 
Text Label 2885 2070 0    50   ~ 0
ADD1
Text Label 2885 2170 0    50   ~ 0
ADD0
$Comp
L power:GND #PWR0112
U 1 1 613B89F1
P 5965 1055
F 0 "#PWR0112" H 5965 805 50  0001 C CNN
F 1 "GND" H 5970 882 50  0000 C CNN
F 2 "" H 5965 1055 50  0001 C CNN
F 3 "" H 5965 1055 50  0001 C CNN
	1    5965 1055
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0113
U 1 1 613C9C55
P 5025 3340
F 0 "#PWR0113" H 5025 3090 50  0001 C CNN
F 1 "GND" H 5030 3167 50  0000 C CNN
F 2 "" H 5025 3340 50  0001 C CNN
F 3 "" H 5025 3340 50  0001 C CNN
	1    5025 3340
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C1
U 1 1 613CB215
P 4925 3140
F 0 "C1" H 4805 3200 50  0000 L CNN
F 1 "100nF" H 4685 3070 50  0000 L CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 4925 3140 50  0001 C CNN
F 3 "~" H 4925 3140 50  0001 C CNN
	1    4925 3140
	1    0    0    -1  
$EndComp
Wire Wire Line
	5025 3340 5025 3285
Wire Wire Line
	4925 2955 4925 3040
Wire Wire Line
	4925 3240 4925 3285
Wire Wire Line
	4925 3285 5025 3285
Connection ~ 5025 3285
Wire Wire Line
	5025 3285 5025 2955
Wire Wire Line
	4825 2955 4825 3040
Text Label 4620 3040 0    50   ~ 0
ACSH
Wire Wire Line
	4620 3040 4825 3040
$Comp
L power:GND #PWR0114
U 1 1 613D3874
P 3595 2295
F 0 "#PWR0114" H 3595 2045 50  0001 C CNN
F 1 "GND" H 3600 2122 50  0000 C CNN
F 2 "" H 3595 2295 50  0001 C CNN
F 3 "" H 3595 2295 50  0001 C CNN
	1    3595 2295
	1    0    0    -1  
$EndComp
Wire Wire Line
	3595 2295 3595 2170
Wire Wire Line
	2885 2070 3595 2070
Wire Wire Line
	2885 2170 3595 2170
Connection ~ 3595 2170
Wire Wire Line
	3595 2170 3595 2070
Wire Wire Line
	5125 2955 5125 3285
Wire Wire Line
	5125 3285 5025 3285
NoConn ~ 5725 2655
NoConn ~ 5725 2555
NoConn ~ 5725 2455
NoConn ~ 5725 2355
NoConn ~ 5725 2255
NoConn ~ 5725 2155
NoConn ~ 5725 2055
NoConn ~ 5725 1955
NoConn ~ 5725 1855
Wire Wire Line
	5990 1655 5725 1655
Text Label 5990 1655 2    50   ~ 0
CIN2
Wire Wire Line
	5990 1755 5725 1755
Text Label 5990 1755 2    50   ~ 0
CIN3
Wire Wire Line
	5990 1455 5725 1455
Text Label 5990 1455 2    50   ~ 0
CIN0
Wire Wire Line
	5990 1555 5725 1555
Text Label 5990 1555 2    50   ~ 0
CIN1
Text Label 2880 1785 0    50   ~ 0
INT
Wire Wire Line
	3585 1540 3585 1685
$Comp
L Device:R_Small R2
U 1 1 6139C2A7
P 3585 1440
F 0 "R2" H 3450 1475 50  0000 L CNN
F 1 "2.2K" H 3375 1405 50  0000 L CNN
F 2 "Resistor_SMD:R_0402_1005Metric" H 3585 1440 50  0001 C CNN
F 3 "~" H 3585 1440 50  0001 C CNN
	1    3585 1440
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R3
U 1 1 613F62D2
P 3840 1440
F 0 "R3" H 3705 1475 50  0000 L CNN
F 1 "2.2K" H 3630 1405 50  0000 L CNN
F 2 "Resistor_SMD:R_0402_1005Metric" H 3840 1440 50  0001 C CNN
F 3 "~" H 3840 1440 50  0001 C CNN
	1    3840 1440
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR0115
U 1 1 613F6CA2
P 3840 1300
F 0 "#PWR0115" H 3840 1150 50  0001 C CNN
F 1 "+3.3V" H 3855 1473 50  0000 C CNN
F 2 "" H 3840 1300 50  0001 C CNN
F 3 "" H 3840 1300 50  0001 C CNN
	1    3840 1300
	1    0    0    -1  
$EndComp
Wire Wire Line
	3840 1300 3840 1340
Wire Wire Line
	3840 1540 3840 1785
Wire Wire Line
	2880 1785 3840 1785
$Comp
L capacitive_sensor:DRV2605LDGST U2
U 1 1 61387521
P 7870 1735
F 0 "U2" H 8130 1875 50  0000 C CNN
F 1 "DRV2605LDGST" H 8935 1160 50  0000 C CNN
F 2 "BYTE_Sensors:SOP50P490X110-10N" H 9120 1835 50  0001 L CNN
F 3 "http://www.ti.com/lit/ds/symlink/drv2605l.pdf" H 9120 1735 50  0001 L CNN
F 4 "ERM & LRA Device Haptic Driver 2-5V BGA9 Texas Instruments DRV2605LDGST Piezo Haptic Motor Driver IC, 5 V, 10-Pin VSSOP" H 9120 1635 50  0001 L CNN "Description"
F 5 "DRV2605LDGST" H 9120 1335 50  0001 L CNN "manf#"
	1    7870 1735
	1    0    0    -1  
$EndComp
Wire Wire Line
	8520 1245 8520 1330
Wire Wire Line
	8720 1435 8720 1330
Wire Wire Line
	8720 1330 8520 1330
Connection ~ 8520 1330
Wire Wire Line
	8520 1330 8520 1435
$Comp
L Connector_Generic:Conn_01x05 J1
U 1 1 613D0451
P 1465 1735
F 0 "J1" H 1383 1310 50  0000 C CNN
F 1 "input" H 1383 1401 50  0000 C CNN
F 2 "BYTE_Sensors:Flex_Connector" H 1465 1735 50  0001 C CNN
F 3 "~" H 1465 1735 50  0001 C CNN
	1    1465 1735
	-1   0    0    1   
$EndComp
$Comp
L Connector_Generic:Conn_01x04 T1
U 1 1 613D170B
P 7120 1485
F 0 "T1" H 7200 1477 50  0000 L CNN
F 1 "PCB" H 7200 1386 50  0000 L CNN
F 2 "BYTE_Sensors:Capacitive_PCB_NoConnector" H 7120 1485 50  0001 C CNN
F 3 "~" H 7120 1485 50  0001 C CNN
	1    7120 1485
	1    0    0    -1  
$EndComp
Wire Wire Line
	6655 1485 6920 1485
Text Label 6655 1485 0    50   ~ 0
CIN2
Wire Wire Line
	6655 1385 6920 1385
Text Label 6655 1385 0    50   ~ 0
CIN3
Wire Wire Line
	6655 1685 6920 1685
Text Label 6655 1685 0    50   ~ 0
CIN0
Wire Wire Line
	6655 1585 6920 1585
Text Label 6655 1585 0    50   ~ 0
CIN1
$Comp
L power:GND #PWR?
U 1 1 613F2C03
P 1770 2020
F 0 "#PWR?" H 1770 1770 50  0001 C CNN
F 1 "GND" H 1775 1847 50  0000 C CNN
F 2 "" H 1770 2020 50  0001 C CNN
F 3 "" H 1770 2020 50  0001 C CNN
	1    1770 2020
	1    0    0    -1  
$EndComp
Wire Wire Line
	1770 2020 1770 1935
Wire Wire Line
	1770 1935 1665 1935
$Comp
L power:+3.3V #PWR?
U 1 1 613FDE77
P 1830 1405
F 0 "#PWR?" H 1830 1255 50  0001 C CNN
F 1 "+3.3V" H 1845 1578 50  0000 C CNN
F 2 "" H 1830 1405 50  0001 C CNN
F 3 "" H 1830 1405 50  0001 C CNN
	1    1830 1405
	1    0    0    -1  
$EndComp
Wire Wire Line
	1830 1405 1830 1535
Wire Wire Line
	1830 1535 1665 1535
Text Label 1830 1835 2    50   ~ 0
SDA
Wire Wire Line
	1665 1835 1830 1835
Text Label 1830 1735 2    50   ~ 0
SCL
Wire Wire Line
	1830 1735 1665 1735
Text Label 1830 1635 2    50   ~ 0
INT
Wire Wire Line
	1830 1635 1665 1635
$EndSCHEMATC
