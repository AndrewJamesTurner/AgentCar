int pushButton = 2;
int led1 = 13;
int led2 = 12;

int ledState = 0;;


// the setup routine runs once when you press reset:
void setup() {
   
  // make the pushbutton's pin an input:
  pinMode(pushButton, INPUT);

  // initialize the digital pin as an output.
  pinMode(led1, OUTPUT);   
  
  // initialize the digital pin as an output.
  pinMode(led2, OUTPUT);   
}

// the loop routine runs over and over again forever:
void loop() {
      
  // read the input pin:
  int reading = digitalRead(pushButton);
    
  if(reading == 1){
   delay(100);
  
    reading = digitalRead(pushButton);
  
    if(reading == 1){
      ledState = !ledState;
    }
  }
    
  if(ledState == 1){
    digitalWrite(led1, HIGH); 
    digitalWrite(led2, LOW);
  }
  else{
    digitalWrite(led1, LOW); 
    digitalWrite(led2, HIGH); 
  }
}
