/* Generated by CIL v. 1.7.3 */
/* print_CIL_Input is true */

int Obstacle  =    0;
int Forward  =    50;
void setForward(int fwd ) 
{ 


  {
  Forward = fwd;
  return;
}
}
void ProgA(int Sensor_input ) 
{ 
  int fwd2 ;

  {
  Obstacle = 0;
  if (Sensor_input <= 10) {
    {
    Obstacle = 1;
    fwd2 = -100;
    {
    Forward = fwd2;
    goto Lret_setForward;
    }
    Lret_setForward: /* CIL Label */ ;
    }
  }
  return;
}
}
void ProgB(void) 
{ 
  int fwd1 ;

  {
  if (! Obstacle) {
    {
    fwd1 = 100;
    {
    Forward = fwd1;
    goto Lret_setForward;
    }
    Lret_setForward: /* CIL Label */ ;
    }
  }
  return;
}
}
extern int ( /* missing proto */  create_task)() ;
void main(void) 
{ 


  {
  create_task("ProgA", "ProgA", 2, 100, 0.016);
  create_task("ProgB", "ProgB", 1, 200, 0.009);
  return;
}
}