#include <annot.h>

void ProgB ();

int Obstacle = 0; int Forward = 50;

 void ProgA (int Sensor_input){
 Obstacle = 0;
 if (Sensor_input <= 10){
 Obstacle = 1;
 Forward = -100;
 }
 }

 void ProgB (){
 if (!Obstacle){
 Forward = 100;
 }
 }
 void main(){
 	ProgA(1);
	//ProgB();
 }
