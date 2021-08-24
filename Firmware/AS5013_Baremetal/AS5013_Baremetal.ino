#include <Wire.h>    

#define ADDR 0x41 // 0x40 alternative address.

#define nRESET 14   // Microcontroller pin number for reset connection
#define INT 15      // Microcontroller pin number for interrupt connection


#define CTRL_REG_1 0x0F  // 8-bit configuration register. (def: 11110000)
//  bit 7     1 = active mode, 0 = low power mode
//             AS5013 MUST be in low power mode for INT on threshold mode!
//  bits 6:4  low power readout time base register. Wake-up interval for low
//             power mode output:
//             000 -> 20ms, 001 -> 40ms, 010 -> 80ms, 011 -> 100ms
//             100 -> 140ms, 101 -> 200ms, 110 -> 260ms, 111 -> 320ms
//  bit 3     1 = interrupt disabled, 0 = interrupt enabled
//  bit 2     0 = INT pin low on every new coordinate calculation
//            1 = INT pin low when threshold values exceeded and while
//                threshold values are exceeded
//  bit 1     write to 1 to reset device
//  bit 0     1 = conversion complete, data valid. Read only!


#define T_CTRL_REG_2 0x2E   //Register to configure the magnet polarity
                            // 0x84 meaning not swaped polarity (default)
                            // 0x86 meaning swaped polarity

#define T_CTRL_REG 0x2D    // Scaling factor for X/Y coordinates.
//  Datasheet says to set this to 0x06 which is NOT the default power-up value.

#define ID_CODE_REG 0x0C   // 8-bit manufacturer ID code. Read only.
//  Reads as 0x0C- useful to test data communications with the device.

#define X_REG 0x10         // 8-bit register containing a signed 8-bit
                                   //  X coordinate
                                   
#define Y_REG 0x11         // Y position register. Reading this register
                                   //  resets the status of the INT output, so it
                                   //  should be read AFTER the X value.
                           
// INT threshold registers. If the X or Y value is greater than the value in the
//  corresponding "P" register or less than the value in the "N" register, and 
//  JS_Control_Register_1 bit 2 = 1 and bit 3 = 0, and the device is set to poll
//  its read values automatically, 
#define XP_REG 0x12
#define XN_REG 0x13
#define YP_REG 0x14
#define YN_REG 0x15

char XZero = 0;
char YZero = 0;
int16_t sensorData=0;

void setup() 
{ 
  Serial.begin(9600);  
  Wire.begin();        
  pinMode(INT, INPUT_PULLUP);  
  pinMode(nRESET, OUTPUT); // The reset line to the EasyPoint should be output.
  
  AS5013_Init();  
  AS5013_Int_Setup(XZero, YZero, 25, 25); 

  Serial.println("Setup completed successfully.");
} 


void loop() 
{ 
  if(digitalRead(INT)==LOW)
  {
    Serial.println("INT!!!!");
    for(int i=1;i<6;i++){
       Serial.println("Sensor "+String(i)+" = "+String(AS5013_Read_Raw(i)));
    }
    Serial.println(readXAxis(), DEC); // readXAxis() returns a signed 8-bit result.
    Serial.println(readYAxis(), DEC); // readYAxis() returns a signed 8-bit result.
    
  }
}

// A simple function for setting the internal interrupt function to flag the
//  processor if the joystick moves more that x_delta or y_delta units from
//  the points specified by x_null and y_null. A function to set up an
//  asymmetrical dead zone is left as an exercise for the reader; the principle
//  is the same- write the appropriate registers, etc etc.
void AS5013_Int_Setup(char x_null, char y_null, byte x_delta, byte y_delta)
{
  char xp, xn, yp, yn;  // 8-bit signed values for the trigger points.
  xp = x_null + x_delta;  // calculate the positive trigger point for x
  writeI2CReg(ADDR, XP_REG, xp);  // set the positive trigger point for x
  xn = x_null - x_delta;  // calculate the negative trigger point for x
  writeI2CReg(ADDR, XN_REG, xn);  // set the negative trigger point for x
  yp = y_null + y_delta;  // calculate the positive trigger point for y
  writeI2CReg(ADDR, YP_REG, yp);  // set the positive trigger point for y
  yn = y_null - y_delta;  // calculate the negative trigger point for y
  writeI2CReg(ADDR, YN_REG, yn);  // set the negative trigger point for y
  

  byte temp = readI2CReg(ADDR, CTRL_REG_1);
  // clear bit 3, INT pin is active.
  temp = temp & 0b11110111;
  // Then, clear bit 7, self-timed mode (otherwise,
  //  it will only do a conversion after a read, which means you need to poll
  //  it to initiate a read, which makes the INT pin useless).
  temp = temp & 0b01111111;
  // Now, clear bits 6:4, so we can set the polling rate. See register description
  //  above for details on various values of these bits.
  temp = temp & 0b10001111;
  // Set the bits according to the desired polling rate. Here, 200ms.
  temp = temp | 0b01010000;
  // Then, set bit 2, to tell the device to interrupt based on range and not
  //  every time a conversion is complete.
  temp = temp | 0b00000100;

  // Finally, write the adjusted value back into Control Register 1.
  writeI2CReg(ADDR, CTRL_REG_1, temp);
}


void AS5013_Init()
{    
  //Hardware Reset
  digitalWrite(nRESET, HIGH);
  delay(1);
  digitalWrite(nRESET, LOW);
  delay(1);
  digitalWrite(nRESET, HIGH);
  delay(100);  
  //Register intialization
  writeI2CReg(ADDR, T_CTRL_REG, 0x06);
 
  char X, Y;                // char is the signed 8-bit data type in Arduino.
  char X_temp=0, Y_temp=0;
  readXAxis();  // read and discard a couple of values- the first read after boot
  readYAxis();  // seems to be a little off on the low side.
  delay(5);
  
  //Collect four data points from each axis and calculate the average in zero.
  for (byte i = 0; i<4; i++)
  {
    X_temp += readXAxis();
    Y_temp += readYAxis();
    delay(5);
  }
  XZero = X_temp/4;
  YZero = Y_temp/4;
  if (readI2CReg(ADDR, ID_CODE_REG) != 0x0C) Serial.println("Sensor nor reponding");
}

//Function to read hall effect sensor in raw 
//argument works for selecting which sensor will be read, C1-5
int16_t AS5013_Read_Raw(int sensorToRead){
    int baseAddress=0x00;
    int16_t Cx_neg,Cx_pos;
    switch(sensorToRead){
      case 1:
        baseAddress=0x22;
      break;
      case 2:
        baseAddress=0x1E;
      break;
      case 3:
        baseAddress=0x1A;
      break;
      case 4:
        baseAddress=0x16;
      break;
      case 5:
        baseAddress=0x26;
      break;
      default:
        Serial.println("Not a sensor, please use 1 to 5");
        return -1;
      break;
      }
     
     Cx_neg = readI2CReg(ADDR, baseAddress)<<8; 
     Cx_neg = Cx_pos | readI2CReg(ADDR, baseAddress+0x01);
      
     Cx_pos = readI2CReg(ADDR, baseAddress+0x02)<<8;  
     Cx_pos = Cx_pos | readI2CReg(ADDR, baseAddress+0x03);
     return ((Cx_pos-Cx_neg)/2); 
  }


char readXAxis()
{
  return readI2CReg(ADDR, X_REG);
}

char readYAxis()
{
  return readI2CReg(ADDR, Y_REG);
}
 
byte readI2CReg(byte slave_addr, byte reg_addr)
{
  Wire.beginTransmission(slave_addr);
  Wire.write(reg_addr);
  Wire.endTransmission();
  Wire.requestFrom(slave_addr, (byte)1);
  return Wire.read();
}

void writeI2CReg(byte slave_addr, byte reg_addr, byte d_buff)
{
  Wire.beginTransmission(slave_addr);
  Wire.write(reg_addr);
  Wire.write(d_buff);
  Wire.endTransmission();
}
