/*
 * A simple sketch that uses WiServer to get the hourly weather data from LAX and prints
 * it via the Serial API
 */

#include <WiServer.h>

#define WIRELESS_MODE_INFRA	1
#define WIRELESS_MODE_ADHOC	2

#define ENABLE 3
#define BUZZER 4

byte val; 
char code[10]; 
int bytesread = 0; 
int readerWait = 2000;
int buzzerLength = 250;

// Wireless configuration parameters ----------------------------------------
unsigned char local_ip[] = {10,0,0,15};	// IP address of WiShield
unsigned char gateway_ip[] = {10,0,0,1};	// router or gateway IP address
unsigned char subnet_mask[] = {255,255,255,0};	// subnet mask for the local network
const prog_char ssid[] PROGMEM = {"kratos"};		// max 32 bytes

unsigned char security_type = 0;	// 0 - open; 1 - WEP; 2 - WPA; 3 - WPA2

// WPA/WPA2 passphrase
const prog_char security_passphrase[] PROGMEM = {"12345678"};	// max 64 characters

// WEP 128-bit keys
// sample HEX keys
prog_uchar wep_keys[] PROGMEM = { 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08, 0x09, 0x0a, 0x0b, 0x0c, 0x0d,	// Key 0
				  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,	// Key 1
				  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,	// Key 2
				  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00	// Key 3
				};

// setup the wireless mode
// infrastructure - connect to AP
// adhoc - connect to another WiFi device
unsigned char wireless_mode = WIRELESS_MODE_INFRA;

unsigned char ssid_len;
unsigned char security_passphrase_len;
// End of wireless configuration parameters ----------------------------------------


// Function that prints data from the server
void printData(char* data, int len) {
  
  // Print the data returned by the server
  // Note that the data is not null-terminated, may be broken up into smaller packets, and 
  // includes the HTTP header. 
  while (len-- > 0) {
    Serial.print(*(data++));
  } 
}


// IP Address for www.weather.gov  
uint8 ip[] = {10,0,0,5};

// for some reason the body of the post is set as a function that prints just like the server would do
void statusBody() {
  WiServer.print(code);
}

// posts a status update to Sinatra
POSTrequest postStatus(ip, 4567, "10.0.0.5", "/", statusBody);

void setup() {
    // Initialize WiServer (we'll pass NULL for the page serving function since we don't need to serve web pages) 
  WiServer.init(NULL);
  
  // Enable Serial output and ask WiServer to generate log messages (optional)
  //Serial.begin(57600);
  //WiServer.enableVerboseMode(true);

  // Have the processData function called when data is returned by the server
  postStatus.setReturnFunc(printData);
  
  Serial.begin(2400);         // RFID reader SOUT pin connected to Serial RX pin at 2400bps 
  pinMode(ENABLE, OUTPUT);    // Set digital pin 3 as OUTPUT to connect it to the RFID /ENABLE pin 
  pinMode(BUZZER, OUTPUT);    // Set digital pin 4 as OUTPUT so we can sound a buzzer when a tag is read
  digitalWrite(BUZZER, LOW);  // turn the buzzer off
}


// Time (in millis) when the data should be retrieved 
long updateTime = 0;

void loop(){
  
  // Run WiServer
  WiServer.server_task();
 
  delay(10);
  
  checkForTag();
  
}


void checkForTag() {
  digitalWrite(ENABLE, LOW);            // Activate the RFID reader 
  if(Serial.available() > 0) {          // if data available from reader 
    if((val = Serial.read()) == 10) {   // check for header 
      bytesread = 0; 
      while(bytesread < 10) {              // read 10 digit code 
        if(Serial.available() > 0) { 
          val = Serial.read(); 
          if((val == 10)||(val == 13)) { // if header or stop bytes before the 10 digit reading 
            break;                       // stop reading 
          } 
          code[bytesread] = val;         // add the digit           
          bytesread++;                   // ready to read next digit  
        } 
      } 
      if(bytesread == 10) {              // if 10 digit read is complete 
        Serial.print("TAG code is: ");   // possibly a good TAG 
        Serial.println(code);            // print the TAG code 
        
        // post to the internets
        postStatus.submit();
        
        bytesread = 0; 
        
        // disable the reader so we don't get multiple reads
        digitalWrite(ENABLE, HIGH);
       
        // beep to say we read the card 
        digitalWrite(BUZZER, HIGH);
        delay(buzzerLength);
        digitalWrite(BUZZER, LOW);
  
        // wait for a little bit to let the user move the card away from the reader
        delay(readerWait);
        
        // empty out the serial buffer to prevent multiple reads
        Serial.flush();
      } 

    } 
  } 
}
