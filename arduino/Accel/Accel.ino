/*
  SDA - A4
  SCL - A5
  Vcc - 5V
  GND - GND
  AD0 - GND
*/



#include <Wire.h>
#include <math.h>

#define CONFIG 0x1A

#define device_address 0x68 
#define MOT_DETECT_CTRL 0x69

#define MOT_THR 0x1F

#define INT_ENABLE 0x38

#define INT_STATUS 0x3A

#define ACCEL_XOUT_H  0x3B
#define ACCEL_XOUT_L  0x3C
#define ACCEL_YOUT_H  0x3D
#define ACCEL_YOUT_L  0x3E
#define ACCEL_ZOUT_H  0x3F
#define ACCEL_ZOUT_L  0x40
#define TEMP_OUT_H  0x41
#define TEMP_OUT_L  0x42

#define GYRO_XOUT_H 0x43
#define GYRO_XOUT_L 0x44
#define GYRO_YOUT_H 0x45
#define GYRO_YOUT_L 0x46
#define GYRO_ZOUT_H 0x47
#define GYRO_ZOUT_L 0x48

#define SLEEP 0x6B   // R/W
#define ACCEL_CONFIG 0x1C


int accelRange = 2;
const int interruptPin = 8;

/*
  fetches one byte of data from the given register
*/
uint8_t getData(int reg){
  
  int error;
  uint8_t data;
   
  Wire.beginTransmission(device_address);
  Wire.write(reg);
  
  error =  Wire.endTransmission(false);

  if(error != 0){
    Serial.print("Error\n");
  }
  
  Wire.requestFrom(device_address, 1, true);
   
  data =  Wire.read();
   
  return data;
}


float getAccelX(void){
  
  uint8_t lowerByte;
  uint8_t upperByte; 
  int16_t accel;
  float accelReal;
  
  lowerByte = getData(ACCEL_XOUT_L);
  upperByte = getData(ACCEL_XOUT_H);

  accel = (int16_t)upperByte;
  accel <<= 8;
  
  accel |= lowerByte;
  
  accelReal = (float)accel / 2048;
  
  return accelReal;
}

float getAccelY(void){
  
  uint8_t lowerByte;
  uint8_t upperByte; 
  int16_t accel;
  float accelReal;
  
    
  lowerByte = getData(ACCEL_YOUT_L);
  upperByte = getData(ACCEL_YOUT_H);

  accel = (int16_t)upperByte;
  accel <<= 8;
  
  accel |= lowerByte;
  
  accelReal = (float)accel / 2048;
  
  return accelReal;
}


float getAccelZ(void){
  
  uint8_t lowerByte;
  uint8_t upperByte; 
  int16_t accel;
  float accelReal;
  
    
  lowerByte = getData(ACCEL_ZOUT_L);
  upperByte = getData(ACCEL_ZOUT_H);

  accel = (int16_t)upperByte;
  accel <<= 8;
  
  accel |= lowerByte;
  
  accelReal = (float)accel / 2048;
  
  return accelReal;
}



float getGyroX(void){
  
  uint8_t lowerByte;
  uint8_t upperByte; 
  int16_t accel;
  float accelReal;
  
  lowerByte = getData(GYRO_XOUT_L);
  upperByte = getData(GYRO_XOUT_H);

  accel = (int16_t)upperByte;
  accel <<= 8;
  
  accel |= lowerByte;
  
  accelReal = (float)accel / 131;
  
  return accelReal;
}

float getGyroY(void){
  
  uint8_t lowerByte;
  uint8_t upperByte; 
  int16_t accel;
  float accelReal;
  
  lowerByte = getData(GYRO_YOUT_L);
  upperByte = getData(GYRO_YOUT_H);

  accel = (int16_t)upperByte;
  accel <<= 8;
  
  accel |= lowerByte;
  
  accelReal = (float)accel / 131;
  
  return accelReal;
}


float getGyroZ(void){
  
  uint8_t lowerByte;
  uint8_t upperByte; 
  int16_t accel;
  float accelReal;
  
  lowerByte = getData(GYRO_ZOUT_L);
  upperByte = getData(GYRO_ZOUT_H);

  accel = (int16_t)upperByte;
  accel <<= 8;
  
  accel |= lowerByte;
  
  accelReal = (float)accel / 131;
  
  return accelReal;
}


float getTemp(void){
  
  uint8_t lowerByte;
  uint8_t upperByte;
  int16_t temp;
  float tempReal;
  
  lowerByte = getData(TEMP_OUT_L);
  upperByte = getData(TEMP_OUT_H);

  temp = (int16_t)upperByte;
  temp <<= 8;
  
  temp |= lowerByte;
  
  tempReal = (temp/340) + 36.53;
  
  
  return tempReal;
}


int wakeUp(void){
  
  uint8_t sleepBit;
  const uint8_t sleepBit_0 = 0;
  
  
  Serial.println("WAKE UP!\n");
 
  // set sleep bi to zero
  Wire.beginTransmission(device_address);
  Wire.write(SLEEP);
  Wire.write(&sleepBit_0, 1);
  Wire.endTransmission(true);
 
 
 Wire.requestFrom(device_address, 1, true);
 sleepBit = Wire.read();
 
  
 if(sleepBit == 0){
    Serial.println("Awake\n"); 
 }
 else{
    Serial.println("Still Sleeping\n"); 
 } 
 
 return 1-sleepBit;
 
}



void setAccelRange16(void){
  
  const uint8_t AFS_SEL = 0b00011000;
  
  Wire.beginTransmission(device_address);
  Wire.write(ACCEL_CONFIG);
  Wire.write(&AFS_SEL, 1);
  Wire.endTransmission(true);
  
  accelRange = 16;
}


/*
  NOT WORKING
*/
void setMotionInterupt(void){
  
  const uint8_t MOT_EN = 0b01000000;
  const uint8_t MOT_THR_ = 0b00000010;
  const uint8_t ACCEL_ON_DELAY = 0b00001000;
  
  Wire.beginTransmission(device_address);
  Wire.write(INT_ENABLE);
  Wire.write(&MOT_EN, 1);
  Wire.endTransmission(true);
  
  Wire.beginTransmission(device_address);
  Wire.write(MOT_DETECT_CTRL);
  Wire.write(&ACCEL_ON_DELAY, 1);
  Wire.endTransmission(true);
    
  Wire.beginTransmission(device_address);
  Wire.write(MOT_THR);
  Wire.write(&MOT_THR_, 1);
  Wire.endTransmission(true);
  
  //Serial.println(getData(INT_ENABLE), BIN);
  //Serial.println(getData(MOT_THR), BIN);
}

/*
  NOT WORKING
*/
int hasMoved(void){
  
  uint8_t data;
  uint8_t mask = 0b01000000;
  
  data = getData(INT_STATUS);
  
  Serial.println((data & mask), BIN);
  
  if( (data & mask) == 0 ){
   return 0;
  }
  else{
   return 1; 
  }
}

int crashed(){
  
  if(fabs(getAccelX()) > 10){
    Serial.println("CRASH!");
  }
  
  if(fabs(getAccelY()) > 10){
    Serial.println("CRASH!");
  }
  
  if(fabs(getAccelZ()) > 10){
    Serial.println("CRASH!");
  }
  
  return 0;
}


void setLPF(void){
  
  const uint8_t DLPF_CFG = 0b00000000;
    
  Wire.beginTransmission(device_address);
  Wire.write(CONFIG);
  Wire.write(&DLPF_CFG, 1);
  Wire.endTransmission(true);
}



void setup()
{   
     
  Serial.begin(9600);
  Serial.println("\nStarting...");
  
  
  Wire.begin();

  wakeUp();
  setAccelRange16();
  setMotionInterupt();
  setLPF();

  pinMode(interruptPin, INPUT);


}


void loop()
{
   
  Serial.print("accelX: ");
  Serial.println(getAccelX(), DEC);
  
   Serial.print("accelY: ");
  Serial.println(getAccelY(), DEC);
  
   Serial.print("accelZ: ");
  Serial.println(getAccelZ(), DEC);
  
  Serial.print("gyroX: ");
  Serial.println(getGyroX(), DEC);
  
  Serial.print("gyroY: ");
  Serial.println(getGyroY(), DEC);
  
  Serial.print("gyroZ: ");
  Serial.println(getGyroZ(), DEC);
  
  Serial.print("temp: ");
  Serial.println(getTemp(), DEC);
  
    
  Serial.println();
  
  
 
   
   //crashed();
 
    
  delay(2000);        
}
