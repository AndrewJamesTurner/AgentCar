/*
  Accel

  SDA - A4
  SCL - A5
  Vcc - 5V
  GND - GND
  AD0 - GND
*/

/*
UltraSound

  Vcc - 5v
  Gnd - GND
  Trig - 12
  Echo - 13
*/

#include <Wire.h>
#include <MPU6050.h>
#include <Ultrasonic.h>
#include <LiquidCrystal.h>


MPU6050 mpu6050;
Ultrasonic ultrasonic(12,13);
LiquidCrystal lcd(11, 10, 5, 4, 3, 2);

void setup()
{   
  Serial.begin(9600);

    mpu6050.begin();
    
   // set up the LCD's number of columns and rows: 
  lcd.begin(16, 2);
}


void loop()
{
  double temp;
  
  Serial.print("Acell X: ");
  Serial.println(mpu6050.getAccelX());

  Serial.print(ultrasonic.Ranging(CM));
  Serial.print("cm\n");

  lcd.setCursor(0, 0);
  lcd.print(ultrasonic.Ranging(CM));
  lcd.print(" cm      ");
  
  
  
  lcd.setCursor(8, 0);
  lcd.print("Z:");
  lcd.print(mpu6050.getAccelZ());
  lcd.print("g      ");
  
  lcd.setCursor(0, 1);
  lcd.print(mpu6050.getTemp());
  lcd.print("\xDF" "C      ");
  

  delay(500);
}
