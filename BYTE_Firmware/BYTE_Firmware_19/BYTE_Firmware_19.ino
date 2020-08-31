/*  The BYTE interface firmware
    Created August 20 2020
    By: oneohm
    http://github.com/oneohm/BYTE
*/

#include <Mouse.h>
#include <Keyboard.h>
#include <FlashStorage.h>

// Create a structure to contain all of the calibration data
// The "valid" variable is set to "true" after
// the structure is filled with actual data for the first time.
typedef struct {
  bool valid;
  int biteBaselineOffset;
  int liteBiteThreshold;
  int firmBiteThreshold;
  int baselineOffset[4];
  int fsrMax[4]; 
} CalibrationData;

// Reserve a portion of flash memory for the calibration data
FlashStorage(calibration_storage, CalibrationData);

// Create a variable for handling the calibration
CalibrationData cal;

// Pin Mapping
const unsigned int bitePin = 6;
const unsigned int hapticPin = 7;
//const unsigned int fsrPins[4] = {2,3,4,5}; 
const unsigned int fsrPins[4] = {3,2,4,5}; //Upper right and left pins swapped in actual prototype...

// Predefined calibration values
//const int moveTreshold = 1;
const int maxMovement = 10;
const int scrollThreshold = 6;
const int pushClickForce = 30;
const float forceScalerX = 0.1; // 0.3 works OK
const float forceScalerY = 0.1; // 0.12 works OK
const float inertiaFactor = 0.15; // 0.5 might be a bit too much

bool isBit = false;
bool longClicked = false;
bool pressClicked = false;
int fsrReadings[4] = {0,0,0,0};
int biteReading = 0;
int previousMoveX = 0;
int previousMoveY = 0;
float xAccumulator = 0;
float yAccumulator = 0;
int lastMoveMagnitude = 0;
int lastForceMagnitude = 0;

// Timing configuration
unsigned long restTimer = 0;
unsigned long previousMillis = 0; // Stores the last time the loop was run
unsigned long clickStartTime = 0; // Keeps track of click length
const unsigned int captureWindow = 3000; //Number of milliseconds to monitor the pin during calibration
const unsigned long updateInterval = 8; // Standard mice have a 125Hz polling rate (~8ms between samples)
const unsigned long longClickTime = 2000; // milliseconds required to trigger a long click
const unsigned long driftRestPeriod = 550; // milliseconds of rest to trigger drift compensation

// Drift compensation
int driftDetectionForce = 0;
const int driftDetectionChange = 2;

void getOffsets(void){
  //TODO Better to collect several samples, rather than just one...
  for(int index = 0; index <= 3; index++){
    cal.baselineOffset[index]=analogRead(fsrPins[index]);
  }
  cal.biteBaselineOffset = analogRead(bitePin);
}

// Useful to periodically reset the "at rest" offests to deal with sensor drift
void resetOffsets(void){
  for(int index = 0; index <= 3; index++){
    cal.baselineOffset[index]=analogRead(fsrPins[index]);
  }
}

// Open a new text document and guide the user through calibration
// This is for OSX, needs to be changed for other platforms...
void calibrate(void){
  Keyboard.press(KEY_LEFT_GUI);
  delay(100);
  Keyboard.press(' ');
  delay(500);
  Keyboard.releaseAll();
  delay(500);
  Keyboard.print("textEdit");
  delay(1000);
  Keyboard.press(KEY_RETURN);
  delay(100);
  Keyboard.releaseAll();
  delay(500);
  Keyboard.press(KEY_LEFT_GUI);
  delay(100);
  Keyboard.press('n');
  delay(500);
  Keyboard.releaseAll();
  delay(500);
  Keyboard.println("BYTE Calibration");
  Keyboard.press(KEY_RETURN);
  delay(100);
  Keyboard.releaseAll();
  delay(100);
  Keyboard.press(KEY_RETURN);
  delay(100);
  Keyboard.releaseAll();
  Keyboard.println("Setting the baseline.");
  Keyboard.press(KEY_RETURN);
  delay(100);
  Keyboard.releaseAll(); 
  Keyboard.println("Hold the BYTE comfortably at rest...");
  Keyboard.press(KEY_RETURN);
  delay(100);
  Keyboard.releaseAll(); 
  getOffsets();
  Keyboard.print("  Baseline established");
  Keyboard.press(KEY_RETURN);
  delay(100);
  Keyboard.releaseAll();
  Keyboard.press(KEY_RETURN);
  delay(100);
  Keyboard.releaseAll();  
  Keyboard.println("First set the motion activation force (lite bite).");
  Keyboard.press(KEY_RETURN);
  delay(100);
  Keyboard.releaseAll(); 
  Keyboard.println("Apply the desired pressure...");
  Keyboard.press(KEY_RETURN);
  delay(100);
  Keyboard.releaseAll(); 
  cal.liteBiteThreshold = capturePressure(bitePin);
  Keyboard.print("  Set to: ");
  Keyboard.println(cal.liteBiteThreshold);
  Keyboard.press(KEY_RETURN);
  delay(100);
  Keyboard.releaseAll();
  Keyboard.press(KEY_RETURN);
  delay(100);
  Keyboard.releaseAll();  
  Keyboard.println("Now set the click force (firm bite).");
  Keyboard.press(KEY_RETURN);
  delay(100);
  Keyboard.releaseAll(); 
  Keyboard.println("Apply the desired pressure...");
  Keyboard.press(KEY_RETURN);
  delay(100);
  Keyboard.releaseAll(); 
  cal.firmBiteThreshold = capturePressure(bitePin);
  Keyboard.print("  Set to: ");
  Keyboard.println(cal.firmBiteThreshold);
  Keyboard.press(KEY_RETURN);
  delay(100);
  Keyboard.releaseAll();
  Keyboard.press(KEY_RETURN);
  delay(100);
  Keyboard.releaseAll(); 
  Keyboard.println("Now set the mouse upper left movement pressure.");
  Keyboard.press(KEY_RETURN);
  delay(100);
  Keyboard.releaseAll(); 
  Keyboard.println("Apply the maximum desired pressure...");
  Keyboard.press(KEY_RETURN);
  delay(100);
  Keyboard.releaseAll();
  cal.fsrMax[0] = capturePressure(fsrPins[0]);
  Keyboard.print("  Set to: ");
  Keyboard.println(cal.fsrMax[0]);
  Keyboard.press(KEY_RETURN);
  delay(100);
  Keyboard.releaseAll(); 
  Keyboard.press(KEY_RETURN);
  delay(100);
  Keyboard.releaseAll(); 
  Keyboard.println("Now set the mouse upper right movement pressure");
  Keyboard.press(KEY_RETURN);
  delay(100);
  Keyboard.releaseAll(); 
  Keyboard.println("Apply the maximum desired pressure...");
  Keyboard.press(KEY_RETURN);
  delay(100);
  Keyboard.releaseAll();
  cal.fsrMax[1] = capturePressure(fsrPins[1]);
  Keyboard.print("  Set to: ");
  Keyboard.println(cal.fsrMax[1]);
  Keyboard.press(KEY_RETURN);
  delay(100);
  Keyboard.releaseAll();
  Keyboard.press(KEY_RETURN);
  delay(100);
  Keyboard.releaseAll(); 
  Keyboard.println("Now set the mouse lower left movement pressure.");
  Keyboard.press(KEY_RETURN);
  delay(100);
  Keyboard.releaseAll(); 
  Keyboard.println("Apply the maximum desired pressure...");
  Keyboard.press(KEY_RETURN);
  delay(100);
  Keyboard.releaseAll(); 
  cal.fsrMax[2] = capturePressure(fsrPins[2]);
  Keyboard.print("  Set to: ");
  Keyboard.println(cal.fsrMax[2]);
  Keyboard.press(KEY_RETURN);
  delay(100);
  Keyboard.releaseAll();
  Keyboard.press(KEY_RETURN);
  delay(100);
  Keyboard.releaseAll(); 
  Keyboard.println("Now set the mouse lower right movement pressure.");
  Keyboard.press(KEY_RETURN);
  delay(100);
  Keyboard.releaseAll(); 
  Keyboard.println("Apply the maximum desired pressure...");
  Keyboard.press(KEY_RETURN);
  delay(100);
  Keyboard.releaseAll(); 
  cal.fsrMax[3] = capturePressure(fsrPins[3]);
  Keyboard.print("  Set to: ");
  Keyboard.println(cal.fsrMax[3]);
  Keyboard.press(KEY_RETURN);
  delay(100);
  Keyboard.releaseAll();
  Keyboard.press(KEY_RETURN);
  delay(100);
  Keyboard.releaseAll();    
}

// Calibration sanity check
bool check_calibration(void){
  bool isCalibrationGood = true;
  
  // Make sure the navigation baseline values are larger than the max values  
  for(int index = 0; index <= 3; index++){
    if(cal.baselineOffset[index] >= cal.fsrMax[index]){
      // the baseline and max sensor values are too close - bad calibration
      isCalibrationGood = false;
    } 
  }
  // Make sure the bite baseline values are larger than the max values  
  if(cal.biteBaselineOffset >= cal.liteBiteThreshold){
      // the baseline and max sensor values are too close - bad calibration
      isCalibrationGood = false;    
  }
  // Make sure firm bite threshold is higher than lite bite pressure threshold
  if(cal.liteBiteThreshold >= cal.firmBiteThreshold){
      // the baseline and max sensor values are too close - bad calibration
      isCalibrationGood = false;       
  }  
  return isCalibrationGood;
}

// Measure the adc pin and find the max value asserted in the next two seconds
int capturePressure(unsigned int adcPin){
  unsigned long time_now = 0; 
  int currentValue = 0;
  int maxValue = 0;
  
  time_now = millis();
  while (millis() < (time_now + captureWindow))
  {
    currentValue = analogRead(adcPin);
    if(currentValue > maxValue){
      maxValue = currentValue;
    }
  }
  return maxValue;
}

// Short, low intensity haptic pulse
void movePulse(void){
  analogWrite(hapticPin,125);
  delay(90);
  analogWrite(hapticPin,0);  
}

// Long, high intensity haptic pulse
void clickPulse(void){
  analogWrite(hapticPin,250);
  delay(300);
  analogWrite(hapticPin,0);
}

void setup(void){
  // Pin mode configuration
  pinMode(bitePin, INPUT);
  pinMode(fsrPins[0], INPUT);
  pinMode(fsrPins[1], INPUT);
  pinMode(fsrPins[2], INPUT);
  pinMode(fsrPins[3], INPUT);
  pinMode(hapticPin, OUTPUT);
  digitalWrite(hapticPin, LOW);

  Serial.begin(9600); 
  Keyboard.begin(); 
  delay(200); 
  
  // Read out the calibration data stored in flash memory
  cal = calibration_storage.read();

  // If this is the first run the "valid" value will be "false"...
  if(cal.valid == false){
    delay(1000); // Allow extra time for the host system to recognize the keyboard interface
    calibrate();
    // Sanity check the new calibration data
    cal.valid = check_calibration();
    calibration_storage.write(cal);

    // Only initiate mouse control if the calibration was successful
    if(cal.valid == true){
      Serial.print("Calibraton checks out");
      Keyboard.println("Calibration complete! Activating the BYTE now."); 
      Mouse.begin();
    }
    else{
      Serial.print("There was a problem with calibration!");
      Keyboard.println("Problem with Calibration! Check connections and retry.");
    }
  } 
}

void loop(void){
  int tempVal = 0; 
  
  // Update the sensor data at a defined rate, rather than just free-run the loop
  unsigned long currentMillis = millis(); 
  if(currentMillis - previousMillis > updateInterval){
//    Serial.println(previousMillis);
//    Serial.println(currentMillis);
    previousMillis = currentMillis;  
     
    Serial.println("Analog readings: ");

    // Get the navigation forces
    for(int index = 0; index <= 3; index++){
      tempVal = analogRead(fsrPins[index]);
      fsrReadings[index] = map(tempVal,cal.baselineOffset[index],cal.fsrMax[index],0,100);  
      Serial.print("Baseline: ");
      Serial.println(cal.baselineOffset[index]);
      Serial.print("Raw Value: ");
      Serial.println(tempVal);    
      Serial.print("Mapped Value: ");
      Serial.println(fsrReadings[index]);    
    }
    Serial.println();

    // Get the bite force
    tempVal = analogRead(bitePin); 
    biteReading = map(tempVal,cal.biteBaselineOffset,cal.firmBiteThreshold,0,cal.firmBiteThreshold); 
    Serial.print("Bite Baseline: ");
    Serial.println(cal.biteBaselineOffset); 
    Serial.print("Raw Value: ");
    Serial.println(tempVal);
    Serial.print("Mapped Value: "); 
    Serial.println(biteReading); 
    Serial.println();
    
  /*
    // Compute basic overall force components
    // This seems to result in the least drift
    int yForce = (fsrReadings[2]+fsrReadings[3])/2-(fsrReadings[0]+fsrReadings[1])/2; 
    int xForce = (fsrReadings[1]+fsrReadings[3])/2-(fsrReadings[0]+fsrReadings[2])/2;
  */ 
  
    // Seesaw coordinate system force measurements
    // This is more sensitive, but seems to drift more - requires good sensor preload force
    float y45Force = (fsrReadings[3] - fsrReadings[0])/2;
    float x45Force = (fsrReadings[1] - fsrReadings[2])/2;
    // Compute the cartesian coordinated force (45 degree rotation)
    float yForce = (y45Force - x45Force)/(0.70710678118);
    float xForce = (x45Force + y45Force)/(0.70710678118); 
    
  /*
    // Experimental hybrid force calculation
    // Might be a nice balance of sensitivity and drift?
    int yForceA = (fsrReadings[2]+fsrReadings[3])/2-(fsrReadings[0]+fsrReadings[1])/2; 
    int xForceA = (fsrReadings[1]+fsrReadings[3])/2-(fsrReadings[0]+fsrReadings[2])/2;
    // Compute the cartesian coordinated force
    int y45Force = (fsrReadings[3]-fsrReadings[0])/2;
    int x45Force = (fsrReadings[1]-fsrReadings[2])/2;
    // Compute the cartesian coordinated force
    int yForceB = (y45Force-x45Force)/(0.70710678118);
    int xForceB = (x45Force+y45Force)/(0.70710678118);  
    // Average the two computed forces
    int yForce = (yForceA+yForceB)/2;
    int xForce = (xForceA+xForceB)/2;
  */

    // Inertial Modification
    float forceMagnitude = sqrt(sq(yForce)+sq(xForce));
    float intertialModifier = inertiaFactor*(forceMagnitude-lastForceMagnitude);
    xForce = xForce + (intertialModifier * xForce);    
    yForce = yForce + (intertialModifier * yForce);
      
    // Scale and make sure the movement is in range
    // Might make more sense to apply the forceScaler up above in the map functions...
    float moveX = constrain((forceScalerX * xForce),-maxMovement,maxMovement);
    float moveY = constrain((forceScalerY * yForce),-maxMovement,maxMovement); 
   
    // More inertial modificaton to improve slow movement
    // Check to make sure the forceMagnitude is not 0 to avoid the dreaded division by 0
    if(forceMagnitude > 0){
      moveX = moveX * (1/abs(1+inertiaFactor*(1-lastForceMagnitude/forceMagnitude)));
      moveY = moveY * (1/abs(1+inertiaFactor*(1-lastForceMagnitude/forceMagnitude)));
    }

    
    // Average this calculated move with the previous one, allow for fractional moves...
    // TODO This section is confusing, consider re-working it...
//    xAccumulator = (moveX+previousMoveX)/2;
//    yAccumulator = (moveY+previousMoveY)/2;
    xAccumulator = xAccumulator + moveX;
    yAccumulator = yAccumulator + moveY;
    moveX = (int)xAccumulator; 
    moveY = (int)yAccumulator; 
    xAccumulator = xAccumulator - moveX;
    yAccumulator = yAccumulator - moveY;
    
    // Drift Compensation
    // Watch for a period of rest with minimal change in force 
    if(abs(driftDetectionForce-forceMagnitude) <= driftDetectionChange){
      restTimer += updateInterval;
      if(restTimer >= driftRestPeriod){
        // No change in force for a while, reset the baseline
        Serial.println("compensating drift");     
        resetOffsets(); // Re-establish mouse force offsets
        restTimer = 0; // Reset the rest counter
      }
    }
    else{
      // Too much change this update, so reset drift detection variables
      driftDetectionForce = forceMagnitude;
      restTimer = 0;
    }

    // Send some more debug info
    Serial.println("XY Forces: ");
    Serial.println(xForce);
    Serial.println(yForce);
    Serial.println("XY Accumulators: ");
    Serial.println(xAccumulator);
    Serial.println(yAccumulator);
    Serial.println("XY Move: ");
    Serial.println(moveX);
    Serial.println(moveY);
    Serial.println();

    // Only process mouse actions if the calibration is valid
    if(cal.valid == true){
      
      // Handle enabling/disabling movement
      if(!isBit && (biteReading >= cal.liteBiteThreshold)){
        Serial.println("movement enabled");
        isBit = true;
  
        // Check to see if this is actually a full click to avaid a double haptic indication
        // Wait another update interval period before checking bite pressure again
        delay(updateInterval); 
        tempVal = analogRead(bitePin); 
        biteReading = map(tempVal,cal.biteBaselineOffset,cal.firmBiteThreshold,0,cal.firmBiteThreshold); 
        // Now check for sufficient click pressure
        if(biteReading >= cal.firmBiteThreshold){
          Serial.println("clicked");
          // First reverse the last mouse move to improve click position accuracy
          Mouse.move(-previousMoveX, -previousMoveY, 0);
          Mouse.press();
          clickStartTime = millis();
          clickPulse();
        }
        else{
          // Not enough pressure for a click, movement enabled 
          movePulse();
        }     
      }
      else if(isBit && (biteReading < cal.liteBiteThreshold)){
        Serial.println("movement disabled");
        isBit = false;
        movePulse();
      }
      
      // Handle clicks
      if((biteReading >= cal.firmBiteThreshold)&&(!Mouse.isPressed())){
        Serial.println("clicked");
        // First reverse the last mouse move to improve click position accuracy
        Mouse.move(-previousMoveX, -previousMoveY, 0);
        Mouse.press();
        clickStartTime = millis();
        clickPulse();
      }
      else if((biteReading < cal.firmBiteThreshold)&&(Mouse.isPressed())){
        // The click has been released
        Serial.println("unclicked");
        // Clear the click states
        Mouse.release();
        longClicked = false;
        pressClicked = false;
      }
  
      // Handle long clicks
      currentMillis = millis();
      if(!longClicked && (Mouse.isPressed() && ((currentMillis - clickStartTime) > longClickTime))){
        Serial.println("long clicked");
        longClicked = true;
        clickPulse();
        delay(100);
        clickPulse();
      }
  
      // Handle press to click - Pressure applied to all quadrants at the same time
      if(!Mouse.isPressed() && !isBit &&
         (fsrReadings[0] >= (cal.baselineOffset[0] + pushClickForce))&&
         (fsrReadings[1] >= (cal.baselineOffset[1] + pushClickForce))&&
         (fsrReadings[2] >= (cal.baselineOffset[2] + pushClickForce))&&
         (fsrReadings[3] >= (cal.baselineOffset[3] + pushClickForce))){
        Serial.println("pressed");
        pressClicked = true;
        clickPulse();
        delay(50);
        clickPulse();
        delay(50);
        clickPulse();
      }  
      
      // Handle movement
      if(isBit && ((abs(moveX) >= 0)||(abs(moveY) >= 0))){
        Serial.println("moving");
        Mouse.move(moveX, moveY, 0);
      }
    
      // Handle scrolling
      // TODO make scrolling proportional to force (or computed move distance...)
      if(!isBit && (abs(moveY) >= scrollThreshold)){
        Serial.println("scrolling");
        if(moveY > 0){
          Mouse.move(0,0,1);
        }
        else{
          Mouse.move(0,0,-1);
        }    
        // TODO perhaps an approach to smooth out the scolling, with several spread out updates?
        delay(60); // Even at 1 scrolling is very fast, add a delay to slow it down
      }
    }
     
    // Save some stuff for use in the next update pass
    lastForceMagnitude = forceMagnitude;
    previousMoveX = moveX;
    previousMoveY = moveY;
  }
} 

