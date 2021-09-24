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
Wire Wire Line
	9475 1420 9985 1420
Wire Wire Line
	9985 2145 9475 2145
Wire Wire Line
	9985 2085 9985 2145
$Comp
L Motor:Motor_DC M1
U 1 1 61383ACB
P 9985 1785
F 0 "M1" H 10143 1781 50  0000 L CNN
F 1 "Motor_DC" H 10143 1690 50  0000 L CNN
F 2 "BYTE_Sensors:VLV041235L" H 9985 1695 50  0001 C CNN
F 3 "~" H 9985 1695 50  0001 C CNN
	1    9985 1785
	1    0    0    -1  
$EndComp
Text Label 7855 1835 0    50   ~ 0
SDA
Wire Wire Line
	7855 2235 8120 2235
Text Label 7855 2235 0    50   ~ 0
EN
Wire Wire Line
	9265 2695 9265 2600
$Comp
L power:GND #PWR0106
U 1 1 61379802
P 9265 2695
F 0 "#PWR0106" H 9265 2445 50  0001 C CNN
F 1 "GND" H 9270 2522 50  0000 C CNN
F 2 "" H 9265 2695 50  0001 C CNN
F 3 "" H 9265 2695 50  0001 C CNN
	1    9265 2695
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C4
U 1 1 6137828E
P 9265 2500
F 0 "C4" H 9357 2546 50  0000 L CNN
F 1 "1uF" H 9357 2455 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 9265 2500 50  0001 C CNN
F 3 "~" H 9265 2500 50  0001 C CNN
	1    9265 2500
	1    0    0    -1  
$EndComp
Wire Wire Line
	9135 980  9135 1020
Wire Wire Line
	9135 1220 9135 1285
$Comp
L power:GND #PWR0105
U 1 1 61374EE8
P 9135 1285
F 0 "#PWR0105" H 9135 1035 50  0001 C CNN
F 1 "GND" H 9140 1112 50  0000 C CNN
F 2 "" H 9135 1285 50  0001 C CNN
F 3 "" H 9135 1285 50  0001 C CNN
	1    9135 1285
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
L power:+3.3V #PWR0103
U 1 1 613742A0
P 9135 980
F 0 "#PWR0103" H 9135 830 50  0001 C CNN
F 1 "+3.3V" H 9150 1153 50  0000 C CNN
F 2 "" H 9135 980 50  0001 C CNN
F 3 "" H 9135 980 50  0001 C CNN
	1    9135 980 
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C5
U 1 1 61373136
P 9135 1120
F 0 "C5" H 9227 1166 50  0000 L CNN
F 1 "1uF" H 9227 1075 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 9135 1120 50  0001 C CNN
F 3 "~" H 9135 1120 50  0001 C CNN
	1    9135 1120
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR0102
U 1 1 61371DD9
P 8520 1490
F 0 "#PWR0102" H 8520 1340 50  0001 C CNN
F 1 "+3.3V" H 8535 1663 50  0000 C CNN
F 2 "" H 8520 1490 50  0001 C CNN
F 3 "" H 8520 1490 50  0001 C CNN
	1    8520 1490
	1    0    0    -1  
$EndComp
Wire Wire Line
	8620 2435 8620 2490
Text Notes 4820 4945 0    50   ~ 0
ADDR = 0x31
$Comp
L BYTE_Magnetic-rescue:SI7210-B-10-IM2-magnetic_sensor U5
U 1 1 61388DA0
P 6130 4395
F 0 "U5" H 6385 4540 50  0000 C CNN
F 1 "SI7210-B-13-IM2" H 7115 3960 50  0000 C CNN
F 2 "BYTE_Sensors:SON40P140X160X40-8N-D" H 7180 4495 50  0001 L CNN
F 3 "https://www.silabs.com/documents/public/data-sheets/si7210-datasheet.pdf" H 7180 4395 50  0001 L CNN
F 4 "SI7210-B-13-IM2" H 7180 4095 50  0001 L CNN "manf#"
	1    6130 4395
	1    0    0    -1  
$EndComp
Text Notes 6765 4945 0    50   ~ 0
ADDR = 0x32
$Comp
L BYTE_Magnetic-rescue:SI7210-B-10-IM2-magnetic_sensor U6
U 1 1 6138AFC6
P 8000 4395
F 0 "U6" H 8255 4540 50  0000 C CNN
F 1 "SI7210-B-14-IM2" H 8985 3960 50  0000 C CNN
F 2 "BYTE_Sensors:SON40P140X160X40-8N-D" H 9050 4495 50  0001 L CNN
F 3 "https://www.silabs.com/documents/public/data-sheets/si7210-datasheet.pdf" H 9050 4395 50  0001 L CNN
F 4 "SI7210-B-14-IM2" H 9050 4095 50  0001 L CNN "manf#"
	1    8000 4395
	1    0    0    -1  
$EndComp
Text Notes 8635 4945 0    50   ~ 0
ADDR = 0x33
Text Notes 8640 5020 0    50   ~ 0
Low(Push-pull)
Text Notes 6760 5020 0    50   ~ 0
Low(Push-pull)
Text Notes 4810 5020 0    50   ~ 0
Low(Push-pull)
Text Label 3970 4445 0    50   ~ 0
SCL
Wire Wire Line
	3970 4445 4185 4445
Text Label 3970 4595 0    50   ~ 0
SDA
Wire Wire Line
	3970 4595 4185 4595
Text Label 5915 4445 0    50   ~ 0
SCL
Wire Wire Line
	5915 4445 6130 4445
Text Label 5915 4595 0    50   ~ 0
SDA
Wire Wire Line
	5915 4595 6130 4595
Text Label 7785 4445 0    50   ~ 0
SCL
Wire Wire Line
	7785 4445 8000 4445
Text Label 7785 4595 0    50   ~ 0
SDA
Wire Wire Line
	7785 4595 8000 4595
$Comp
L power:GND #PWR0113
U 1 1 613BBBF7
P 4785 5050
F 0 "#PWR0113" H 4785 4800 50  0001 C CNN
F 1 "GND" H 4790 4877 50  0000 C CNN
F 2 "" H 4785 5050 50  0001 C CNN
F 3 "" H 4785 5050 50  0001 C CNN
	1    4785 5050
	1    0    0    -1  
$EndComp
Wire Wire Line
	4785 5050 4785 4995
$Comp
L power:GND #PWR0116
U 1 1 613BEF21
P 6730 5050
F 0 "#PWR0116" H 6730 4800 50  0001 C CNN
F 1 "GND" H 6735 4877 50  0000 C CNN
F 2 "" H 6730 5050 50  0001 C CNN
F 3 "" H 6730 5050 50  0001 C CNN
	1    6730 5050
	1    0    0    -1  
$EndComp
Wire Wire Line
	6730 5050 6730 4995
$Comp
L power:GND #PWR0117
U 1 1 613C028C
P 8600 5050
F 0 "#PWR0117" H 8600 4800 50  0001 C CNN
F 1 "GND" H 8605 4877 50  0000 C CNN
F 2 "" H 8600 5050 50  0001 C CNN
F 3 "" H 8600 5050 50  0001 C CNN
	1    8600 5050
	1    0    0    -1  
$EndComp
Wire Wire Line
	8600 5050 8600 4995
$Comp
L power:+3.3V #PWR0119
U 1 1 613C89AA
P 4785 4020
F 0 "#PWR0119" H 4785 3870 50  0001 C CNN
F 1 "+3.3V" H 4800 4193 50  0000 C CNN
F 2 "" H 4785 4020 50  0001 C CNN
F 3 "" H 4785 4020 50  0001 C CNN
	1    4785 4020
	1    0    0    -1  
$EndComp
Wire Wire Line
	4785 4020 4785 4095
$Comp
L power:+3.3V #PWR0120
U 1 1 613CA4B2
P 6730 4020
F 0 "#PWR0120" H 6730 3870 50  0001 C CNN
F 1 "+3.3V" H 6745 4193 50  0000 C CNN
F 2 "" H 6730 4020 50  0001 C CNN
F 3 "" H 6730 4020 50  0001 C CNN
	1    6730 4020
	1    0    0    -1  
$EndComp
Wire Wire Line
	6730 4020 6730 4095
$Comp
L power:+3.3V #PWR0121
U 1 1 613CC42C
P 8600 4020
F 0 "#PWR0121" H 8600 3870 50  0001 C CNN
F 1 "+3.3V" H 8615 4193 50  0000 C CNN
F 2 "" H 8600 4020 50  0001 C CNN
F 3 "" H 8600 4020 50  0001 C CNN
	1    8600 4020
	1    0    0    -1  
$EndComp
Wire Wire Line
	8600 4020 8600 4095
Wire Wire Line
	5150 3685 5150 3725
Wire Wire Line
	5150 3925 5150 3990
$Comp
L power:+3.3V #PWR0124
U 1 1 6140C4E9
P 5150 3685
F 0 "#PWR0124" H 5150 3535 50  0001 C CNN
F 1 "+3.3V" H 5165 3858 50  0000 C CNN
F 2 "" H 5150 3685 50  0001 C CNN
F 3 "" H 5150 3685 50  0001 C CNN
	1    5150 3685
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C3
U 1 1 6140C4F3
P 5150 3825
F 0 "C3" H 5242 3871 50  0000 L CNN
F 1 "0.1uF" H 5242 3780 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 5150 3825 50  0001 C CNN
F 3 "~" H 5150 3825 50  0001 C CNN
	1    5150 3825
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0125
U 1 1 6140C4FD
P 5150 3990
F 0 "#PWR0125" H 5150 3740 50  0001 C CNN
F 1 "GND" H 5155 3817 50  0000 C CNN
F 2 "" H 5150 3990 50  0001 C CNN
F 3 "" H 5150 3990 50  0001 C CNN
	1    5150 3990
	1    0    0    -1  
$EndComp
Wire Wire Line
	7130 3630 7130 3670
Wire Wire Line
	7130 3870 7130 3935
$Comp
L power:+3.3V #PWR0126
U 1 1 614205AE
P 7130 3630
F 0 "#PWR0126" H 7130 3480 50  0001 C CNN
F 1 "+3.3V" H 7145 3803 50  0000 C CNN
F 2 "" H 7130 3630 50  0001 C CNN
F 3 "" H 7130 3630 50  0001 C CNN
	1    7130 3630
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C6
U 1 1 614205B8
P 7130 3770
F 0 "C6" H 7222 3816 50  0000 L CNN
F 1 "0.1uF" H 7222 3725 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 7130 3770 50  0001 C CNN
F 3 "~" H 7130 3770 50  0001 C CNN
	1    7130 3770
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0127
U 1 1 614205C2
P 7130 3935
F 0 "#PWR0127" H 7130 3685 50  0001 C CNN
F 1 "GND" H 7135 3762 50  0000 C CNN
F 2 "" H 7130 3935 50  0001 C CNN
F 3 "" H 7130 3935 50  0001 C CNN
	1    7130 3935
	1    0    0    -1  
$EndComp
Wire Wire Line
	8955 3685 8955 3725
Wire Wire Line
	8955 3925 8955 3990
$Comp
L power:+3.3V #PWR0128
U 1 1 61428F42
P 8955 3685
F 0 "#PWR0128" H 8955 3535 50  0001 C CNN
F 1 "+3.3V" H 8970 3858 50  0000 C CNN
F 2 "" H 8955 3685 50  0001 C CNN
F 3 "" H 8955 3685 50  0001 C CNN
	1    8955 3685
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C7
U 1 1 61428F4C
P 8955 3825
F 0 "C7" H 9047 3871 50  0000 L CNN
F 1 "0.1uF" H 9047 3780 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 8955 3825 50  0001 C CNN
F 3 "~" H 8955 3825 50  0001 C CNN
	1    8955 3825
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0129
U 1 1 61428F56
P 8955 3990
F 0 "#PWR0129" H 8955 3740 50  0001 C CNN
F 1 "GND" H 8960 3817 50  0000 C CNN
F 2 "" H 8955 3990 50  0001 C CNN
F 3 "" H 8955 3990 50  0001 C CNN
	1    8955 3990
	1    0    0    -1  
$EndComp
$Comp
L Driver_Haptic:DRV2605LDGS U1
U 1 1 6138E2E3
P 8620 2035
F 0 "U1" H 8225 2395 50  0000 C CNN
F 1 "DRV2605LDGS" H 8915 1665 50  0000 C CNN
F 2 "Package_SO:VSSOP-10_3x3mm_P0.5mm" H 8620 2035 50  0001 C CIN
F 3 "http://www.ti.com/lit/ds/symlink/drv2605l.pdf" H 8620 2035 50  0001 C CNN
F 4 "DRV2605LDGST" H 8620 2035 50  0001 C CNN "manf#"
	1    8620 2035
	1    0    0    -1  
$EndComp
Wire Wire Line
	9120 2235 9265 2235
Wire Wire Line
	9265 2235 9265 2400
Wire Wire Line
	7855 1835 8120 1835
Wire Wire Line
	7855 1935 8120 1935
Text Label 7855 1935 0    50   ~ 0
SCL
Wire Wire Line
	8620 1635 8620 1585
Wire Wire Line
	8620 1585 8520 1585
Wire Wire Line
	8520 1585 8520 1635
Wire Wire Line
	8520 1490 8520 1585
Connection ~ 8520 1585
Wire Wire Line
	9120 1835 9475 1835
Wire Wire Line
	9475 1420 9475 1835
Wire Wire Line
	9475 1935 9120 1935
Wire Wire Line
	9475 1935 9475 2145
$Comp
L Connector_Generic:Conn_01x05 J1
U 1 1 613CC247
P 1445 2255
F 0 "J1" H 1363 1830 50  0000 C CNN
F 1 "Input" H 1363 1921 50  0000 C CNN
F 2 "BYTE_Sensors:Flex_Connector" H 1445 2255 50  0001 C CNN
F 3 "~" H 1445 2255 50  0001 C CNN
	1    1445 2255
	-1   0    0    1   
$EndComp
$Comp
L power:+3.3V #PWR0101
U 1 1 613F1152
P 1965 1920
F 0 "#PWR0101" H 1965 1770 50  0001 C CNN
F 1 "+3.3V" H 1980 2093 50  0000 C CNN
F 2 "" H 1965 1920 50  0001 C CNN
F 3 "" H 1965 1920 50  0001 C CNN
	1    1965 1920
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0109
U 1 1 613F34F1
P 2150 2195
F 0 "#PWR0109" H 2150 1945 50  0001 C CNN
F 1 "GND" H 2155 2022 50  0000 C CNN
F 2 "" H 2150 2195 50  0001 C CNN
F 3 "" H 2150 2195 50  0001 C CNN
	1    2150 2195
	1    0    0    -1  
$EndComp
Wire Wire Line
	1910 2155 1645 2155
Text Label 1910 2355 2    50   ~ 0
SCL
Wire Wire Line
	1910 2355 1645 2355
Text Label 1910 2455 2    50   ~ 0
SDA
Wire Wire Line
	1910 2455 1645 2455
Wire Wire Line
	9985 1420 9985 1585
$Comp
L Analog_ADC:ADS1115IDGS U2
U 1 1 6142B156
P 5385 2015
F 0 "U2" H 5130 2470 50  0000 C CNN
F 1 "ADS1115IDGS" H 5690 1665 50  0000 C CNN
F 2 "Package_SO:TSSOP-10_3x3mm_P0.5mm" H 5385 1515 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/ads1113.pdf" H 5335 1115 50  0001 C CNN
	1    5385 2015
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR0110
U 1 1 61424F74
P 5385 1470
F 0 "#PWR0110" H 5385 1320 50  0001 C CNN
F 1 "+3.3V" H 5400 1643 50  0000 C CNN
F 2 "" H 5385 1470 50  0001 C CNN
F 3 "" H 5385 1470 50  0001 C CNN
	1    5385 1470
	1    0    0    -1  
$EndComp
Wire Wire Line
	5385 1470 5385 1515
$Comp
L power:GND #PWR0111
U 1 1 61427F9A
P 5385 2460
F 0 "#PWR0111" H 5385 2210 50  0001 C CNN
F 1 "GND" H 5390 2287 50  0000 C CNN
F 2 "" H 5385 2460 50  0001 C CNN
F 3 "" H 5385 2460 50  0001 C CNN
	1    5385 2460
	1    0    0    -1  
$EndComp
Wire Wire Line
	5385 2415 5385 2460
Wire Wire Line
	5770 1090 5770 1130
Wire Wire Line
	5770 1330 5770 1395
$Comp
L power:GND #PWR0112
U 1 1 6142AA46
P 5770 1395
F 0 "#PWR0112" H 5770 1145 50  0001 C CNN
F 1 "GND" H 5775 1222 50  0000 C CNN
F 2 "" H 5770 1395 50  0001 C CNN
F 3 "" H 5770 1395 50  0001 C CNN
	1    5770 1395
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR0114
U 1 1 6142AA50
P 5770 1090
F 0 "#PWR0114" H 5770 940 50  0001 C CNN
F 1 "+3.3V" H 5785 1263 50  0000 C CNN
F 2 "" H 5770 1090 50  0001 C CNN
F 3 "" H 5770 1090 50  0001 C CNN
	1    5770 1090
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C1
U 1 1 6142AA5A
P 5770 1230
F 0 "C1" H 5862 1276 50  0000 L CNN
F 1 "1uF" H 5862 1185 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 5770 1230 50  0001 C CNN
F 3 "~" H 5770 1230 50  0001 C CNN
	1    5770 1230
	1    0    0    -1  
$EndComp
Text Label 6050 2115 2    50   ~ 0
SDA
Wire Wire Line
	6050 2115 5785 2115
Wire Wire Line
	6050 2015 5785 2015
Text Label 6050 2015 2    50   ~ 0
SCL
$Comp
L power:GND #PWR0115
U 1 1 61434826
P 5995 2475
F 0 "#PWR0115" H 5995 2225 50  0001 C CNN
F 1 "GND" H 6000 2302 50  0000 C CNN
F 2 "" H 5995 2475 50  0001 C CNN
F 3 "" H 5995 2475 50  0001 C CNN
	1    5995 2475
	1    0    0    -1  
$EndComp
Wire Wire Line
	5995 2475 5995 2215
Wire Wire Line
	5995 2215 5785 2215
Text Label 4805 1915 0    50   ~ 0
A0
Wire Wire Line
	4805 1915 4985 1915
Text Label 4805 2015 0    50   ~ 0
A1
Wire Wire Line
	4805 2015 4985 2015
Text Label 4805 2115 0    50   ~ 0
A2
Wire Wire Line
	4805 2115 4985 2115
Text Label 4805 2215 0    50   ~ 0
A3
Wire Wire Line
	4805 2215 4985 2215
Text Label 3615 2180 2    50   ~ 0
A0
Wire Wire Line
	3615 2180 3435 2180
Text Label 3615 2080 2    50   ~ 0
A1
Wire Wire Line
	3615 2080 3435 2080
Text Label 3615 1880 2    50   ~ 0
A2
Wire Wire Line
	3615 1880 3435 1880
Text Label 3615 1980 2    50   ~ 0
A3
Wire Wire Line
	3615 1980 3435 1980
$Comp
L Connector_Generic:Conn_01x04 J2
U 1 1 61436C08
P 3235 2080
F 0 "J2" H 3153 1655 50  0000 C CNN
F 1 "FSR" H 3153 1746 50  0000 C CNN
F 2 "" H 3235 2080 50  0001 C CNN
F 3 "~" H 3235 2080 50  0001 C CNN
	1    3235 2080
	-1   0    0    1   
$EndComp
$Comp
L BYTE_Magnetic-rescue:SI7210-B-10-IM2-magnetic_sensor U4
U 1 1 6137AFA1
P 4185 4395
F 0 "U4" H 4440 4540 50  0000 C CNN
F 1 "SI7210-B-12-IM2" H 5170 3960 50  0000 C CNN
F 2 "BYTE_Sensors:SON40P140X160X40-8N-D" H 5235 4495 50  0001 L CNN
F 3 "https://www.silabs.com/documents/public/data-sheets/si7210-datasheet.pdf" H 5235 4395 50  0001 L CNN
F 4 "SI7210-B-12-IM2" H 5235 4095 50  0001 L CNN "manf#"
	1    4185 4395
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Pack04 RN1
U 1 1 61491CB7
P 4150 2600
F 0 "RN1" H 4338 2646 50  0000 L CNN
F 1 "R_Pack04" H 4338 2555 50  0000 L CNN
F 2 "Resistor_SMD:R_Array_Convex_4x0603" V 4425 2600 50  0001 C CNN
F 3 "~" H 4150 2600 50  0001 C CNN
	1    4150 2600
	-1   0    0    1   
$EndComp
Wire Wire Line
	4050 2800 4150 2800
Wire Wire Line
	4150 2800 4250 2800
Connection ~ 4150 2800
Wire Wire Line
	4250 2800 4350 2800
Connection ~ 4250 2800
Connection ~ 4350 2800
Wire Wire Line
	4050 2250 4050 2400
Wire Wire Line
	4150 2400 4150 2250
Wire Wire Line
	4250 2400 4250 2250
Wire Wire Line
	4350 2400 4350 2250
Text Label 4050 2250 3    50   ~ 0
A1
Text Label 4150 2250 3    50   ~ 0
A0
Text Label 4350 2250 3    50   ~ 0
A2
Text Label 4250 2250 3    50   ~ 0
A3
$Comp
L Device:D_Small D1
U 1 1 614CCBCC
P 5470 4255
F 0 "D1" V 5424 4325 50  0000 L CNN
F 1 "D_Small" V 5515 4325 50  0000 L CNN
F 2 "Diode_SMD:D_0603_1608Metric" V 5470 4255 50  0001 C CNN
F 3 "~" V 5470 4255 50  0001 C CNN
	1    5470 4255
	0    1    1    0   
$EndComp
Wire Wire Line
	5470 4355 5470 4445
Wire Wire Line
	5470 4445 5385 4445
$Comp
L Device:D_Small D2
U 1 1 614D0F0E
P 7415 4255
F 0 "D2" V 7369 4325 50  0000 L CNN
F 1 "D_Small" V 7460 4325 50  0000 L CNN
F 2 "Diode_SMD:D_0603_1608Metric" V 7415 4255 50  0001 C CNN
F 3 "~" V 7415 4255 50  0001 C CNN
	1    7415 4255
	0    1    1    0   
$EndComp
Wire Wire Line
	7415 4355 7415 4445
Wire Wire Line
	7415 4445 7330 4445
$Comp
L Device:D_Small D3
U 1 1 614D3973
P 9305 4245
F 0 "D3" V 9259 4315 50  0000 L CNN
F 1 "D_Small" V 9350 4315 50  0000 L CNN
F 2 "Diode_SMD:D_0603_1608Metric" V 9305 4245 50  0001 C CNN
F 3 "~" V 9305 4245 50  0001 C CNN
	1    9305 4245
	0    1    1    0   
$EndComp
Wire Wire Line
	9305 4345 9305 4445
Wire Wire Line
	9305 4445 9200 4445
Text Label 9305 4070 0    50   ~ 0
magneticSignal
Wire Wire Line
	9305 4070 9305 4145
Text Label 7415 4080 0    50   ~ 0
magneticSignal
Wire Wire Line
	7415 4080 7415 4155
Text Label 5470 4080 0    50   ~ 0
magneticSignal
Wire Wire Line
	5470 4080 5470 4155
Wire Wire Line
	1645 2255 1965 2255
Wire Wire Line
	1965 1920 1965 2255
Wire Wire Line
	2150 2055 1645 2055
Wire Wire Line
	2150 2055 2150 2195
$Comp
L magnetic_sensor:PTCA9536BDTMR U3
U 1 1 61509300
P 1500 4415
F 0 "U3" H 2225 5068 60  0000 C CNN
F 1 "PTCA9536BDTMR" H 2765 3995 60  0000 C CNN
F 2 "BYTE_Sensors:PTCA9416DTMR" H 2300 4755 60  0001 C CNN
F 3 "https://www.ti.com/lit/ds/symlink/tca9536.pdf?ts=1632417802890&ref_url=https%253A%252F%252Fwww.ti.com%252Fproduct%252FTCA9536" H 2300 5112 60  0001 C CNN
	1    1500 4415
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR0108
U 1 1 61514F71
P 2350 3830
F 0 "#PWR0108" H 2350 3680 50  0001 C CNN
F 1 "+3.3V" H 2365 4003 50  0000 C CNN
F 2 "" H 2350 3830 50  0001 C CNN
F 3 "" H 2350 3830 50  0001 C CNN
	1    2350 3830
	1    0    0    -1  
$EndComp
Wire Wire Line
	2350 3830 2350 3965
$Comp
L power:GND #PWR0118
U 1 1 615183EC
P 2350 5015
F 0 "#PWR0118" H 2350 4765 50  0001 C CNN
F 1 "GND" H 2355 4842 50  0000 C CNN
F 2 "" H 2350 5015 50  0001 C CNN
F 3 "" H 2350 5015 50  0001 C CNN
	1    2350 5015
	1    0    0    -1  
$EndComp
Wire Wire Line
	2350 4965 2350 5015
Wire Wire Line
	6050 1815 5785 1815
Text Label 6050 1815 2    50   ~ 0
ALERT
Text Label 1455 4665 0    50   ~ 0
INT_OUT
Wire Wire Line
	1455 4665 1700 4665
Text Label 1910 2155 2    50   ~ 0
INT_OUT
Text Label 1485 4465 0    50   ~ 0
SCL
Wire Wire Line
	1485 4465 1700 4465
Text Label 1485 4365 0    50   ~ 0
SDA
Wire Wire Line
	1485 4365 1700 4365
Text Label 4350 2940 2    50   ~ 0
FSR_CTRL
Wire Wire Line
	4350 2800 4350 2940
$Comp
L power:GND #PWR0107
U 1 1 615E5E49
P 7725 2225
F 0 "#PWR0107" H 7725 1975 50  0001 C CNN
F 1 "GND" H 7730 2052 50  0000 C CNN
F 2 "" H 7725 2225 50  0001 C CNN
F 3 "" H 7725 2225 50  0001 C CNN
	1    7725 2225
	1    0    0    -1  
$EndComp
Wire Wire Line
	7725 2225 7725 2135
Wire Wire Line
	7725 2135 8120 2135
Text Label 3055 4365 2    50   ~ 0
FSR_CTRL
Wire Wire Line
	3055 4365 2750 4365
Wire Wire Line
	2750 4465 3295 4465
Text Label 3295 4465 2    50   ~ 0
magneticSignal
Wire Wire Line
	3015 4565 2750 4565
Text Label 3015 4565 2    50   ~ 0
ALERT
$EndSCHEMATC
