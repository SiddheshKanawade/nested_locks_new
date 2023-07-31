# 1 "./fse_obstacle.cil.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "/usr/include/stdc-predef.h" 1 3 4
# 1 "<command-line>" 2
# 1 "./fse_obstacle.cil.c"
# 1 "fse_obstacle/fse_obstacle.c"
int Obstacle = 0;
# 1 "fse_obstacle/fse_obstacle.c"
int Forward = 50;
# 3 "fse_obstacle/fse_obstacle.c"
void ProgA(int Sensor_input )
{


  {
# 5 "fse_obstacle/fse_obstacle.c"
  Obstacle = 0;
# 6 "fse_obstacle/fse_obstacle.c"
  if (Sensor_input <= 10) {
# 8 "fse_obstacle/fse_obstacle.c"
    Obstacle = 1;
# 9 "fse_obstacle/fse_obstacle.c"
    Forward = -100;
  }
# 11 "fse_obstacle/fse_obstacle.c"
  return;
}
}
# 12 "fse_obstacle/fse_obstacle.c"
void ProgB(void)
{


  {
# 14 "fse_obstacle/fse_obstacle.c"
  if (! Obstacle) {
# 16 "fse_obstacle/fse_obstacle.c"
    Forward = 100;
  }
# 18 "fse_obstacle/fse_obstacle.c"
  return;
}
}
# 22 "fse_obstacle/fse_obstacle.c"
extern int ( create_task)() ;
# 20 "fse_obstacle/fse_obstacle.c"
void main(void)
{


  {
# 22 "fse_obstacle/fse_obstacle.c"
  create_task("ProgA", "ProgA", 2, 100, 0.016);
# 23 "fse_obstacle/fse_obstacle.c"
  create_task("ProgB", "ProgB", 1, 200, 0.009);
# 24 "fse_obstacle/fse_obstacle.c"
  return;
}
}
