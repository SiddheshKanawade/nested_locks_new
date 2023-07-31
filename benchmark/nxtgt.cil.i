# 1 "./nxtgt.cil.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "/usr/include/stdc-predef.h" 1 3 4
# 1 "<command-line>" 2
# 1 "./nxtgt.cil.c"
# 3 "nxtgt/nxtgt.c"
typedef unsigned char U8;
# 4 "nxtgt/nxtgt.c"
typedef signed char S8;
# 7 "nxtgt/nxtgt.c"
typedef unsigned long U32;
# 8 "nxtgt/nxtgt.c"
typedef long S32;
# 9 "nxtgt/nxtgt.c"
typedef char CHAR;
# 11 "nxtgt/nxtgt.c"
typedef int SINT;
# 12 "nxtgt/nxtgt.c"
struct __anonstruct_nxt_inputs_83380041 {
   U32 battery_state ;
   U8 buttons_state ;
};
# 16 "nxtgt/nxtgt.c"
typedef struct __anonstruct_nxt_inputs_83380041 nxt_inputs;
# 168 "nxtgt/nxtgt.c"
typedef unsigned char UINT8;
# 169 "nxtgt/nxtgt.c"
typedef UINT8 StatusType;
# 170 "nxtgt/nxtgt.c"
typedef unsigned char U8___0;
# 171 "nxtgt/nxtgt.c"
typedef signed char S8___0;
# 173 "nxtgt/nxtgt.c"
typedef unsigned long U32___0;
# 174 "nxtgt/nxtgt.c"
typedef long S32___0;
# 176 "nxtgt/nxtgt.c"
typedef int SINT___0;
# 192 "nxtgt/nxtgt.c"
extern unsigned long systick_get_ms(void) ;
# 196 "nxtgt/nxtgt.c"
extern U32 sensor_adc(U32 n ) ;
# 198 "nxtgt/nxtgt.c"
extern int nxt_motor_get_count(unsigned long n ) ;
# 199 "nxtgt/nxtgt.c"
extern void nxt_motor_set_count(unsigned long n , int count ) ;
# 200 "nxtgt/nxtgt.c"
extern void nxt_motor_set_speed(unsigned long n , int speed_percent , int brake ) ;
# 203 "nxtgt/nxtgt.c"
extern void display_update(void) ;
# 204 "nxtgt/nxtgt.c"
extern void display_clear(U32 updateToo ) ;
# 205 "nxtgt/nxtgt.c"
extern void display_goto_xy(int x , int y ) ;
# 206 "nxtgt/nxtgt.c"
extern void display_string(char const *str ) ;
# 207 "nxtgt/nxtgt.c"
extern void display_int(int val , U32 places ) ;
# 208 "nxtgt/nxtgt.c"
extern void display_unsigned(U32 val , U32 places ) ;
# 217 "nxtgt/nxtgt.c"
extern void bt_receive(unsigned char *buf ) ;
# 229 "nxtgt/nxtgt.c"
extern int ecrobot_get_bt_status(void) ;
# 253 "nxtgt/nxtgt.c"
extern long ecrobot_get_sonar_sensor(U8 port_id ) ;
# 277 "nxtgt/nxtgt.c"
extern void ecrobot_bt_data_logger(S8 data1 , S8 data2 ) ;
# 292 "nxtgt/nxtgt.c"
U8 const NXT_COLORSENSOR_PROTOCOLS[7] = { (U8 const )176, (U8 const )112, (U8 const )240, (U8 const )8,
        (U8 const )176, (U8 const )136, (U8 const )136};
# 296 "nxtgt/nxtgt.c"
static nxt_inputs ecrobot_inputs ;
# 302 "nxtgt/nxtgt.c"
extern StatusType TerminateTask(void) ;
# 309 "nxtgt/nxtgt.c"
static unsigned char volatile bt_status = (U8___0 volatile )4;
# 312 "nxtgt/nxtgt.c"
static U8___0 receiveBuf[128] ;
# 313 "nxtgt/nxtgt.c"
static S8___0 EDC_flag ;
# 314 "nxtgt/nxtgt.c"
S32___0 FrictionComp(S32___0 ratio , S32___0 offset ) ;
# 315 "nxtgt/nxtgt.c"
void TaskMainTaskInitialize(void)
{


  {
# 317 "nxtgt/nxtgt.c"
  nxt_motor_set_speed((U32___0 )0, 0, 1);
# 318 "nxtgt/nxtgt.c"
  nxt_motor_set_speed((U32___0 )2, 0, 1);
# 319 "nxtgt/nxtgt.c"
  nxt_motor_set_speed((U32___0 )1, 0, 1);
# 320 "nxtgt/nxtgt.c"
  nxt_motor_set_count((U32___0 )0, 0);
# 321 "nxtgt/nxtgt.c"
  nxt_motor_set_count((U32___0 )2, 0);
# 322 "nxtgt/nxtgt.c"
  nxt_motor_set_count((U32___0 )1, 0);
# 323 "nxtgt/nxtgt.c"
  EDC_flag = (S8___0 )1;
# 324 "nxtgt/nxtgt.c"
  TerminateTask();
# 325 "nxtgt/nxtgt.c"
  return;
}
}
# 327 "nxtgt/nxtgt.c"
void TaskMainTaskControl(void) ;
# 328 "nxtgt/nxtgt.c"
static U8___0 touch_sensor_state = (U8___0 )0;
# 329 "nxtgt/nxtgt.c"
static U8___0 bt_receive_buf[32] ;
# 330 "nxtgt/nxtgt.c"
void TaskMainTaskControl(void)
{
  S32___0 analog_stick_left ;
  S32___0 analog_stick_right ;
  S32___0 steering_angle ;
  S32___0 steering_err ;
  S32___0 steering_speed ;
  S32___0 diff_gain ;
  U8___0 touch_sensor ;
  int tmp ;
  S32___0 tmp___0 ;
  S32___0 tmp___1 ;
  S32___0 tmp___2 ;
  S32___0 tmp___3 ;
  S32___0 tmp___4 ;
  S32___0 tmp___5 ;
  S32___0 tmp___6 ;
  U8___0 *buf16 ;
  U32___0 bufLen17 ;
  SINT___0 i18 ;
  U32___0 len19 ;
  U8 port_id20 ;
  U32 tmp21 ;
  unsigned char ret_ecrobot_get_touch_sensor22 ;

  {
# 355 "nxtgt/nxtgt.c"
  buf16 = bt_receive_buf;
# 356 "nxtgt/nxtgt.c"
  bufLen17 = (U32___0 )32;
# 357 "nxtgt/nxtgt.c"
  if ((int volatile )bt_status == (int volatile )7) {
# 358 "nxtgt/nxtgt.c"
    if (bufLen17 <= 126UL) {
# 359 "nxtgt/nxtgt.c"
      bt_receive(& receiveBuf[0]);
# 360 "nxtgt/nxtgt.c"
      len19 = (U32___0 )receiveBuf[0];
# 361 "nxtgt/nxtgt.c"
      if (len19 > 0UL) {
# 362 "nxtgt/nxtgt.c"
        if (len19 <= bufLen17) {
# 363 "nxtgt/nxtgt.c"
          i18 = 0;
# 364 "nxtgt/nxtgt.c"
          while ((U32___0 )i18 < len19) {
# 365 "nxtgt/nxtgt.c"
            *(buf16 + i18) = receiveBuf[i18 + 2];
# 366 "nxtgt/nxtgt.c"
            i18 ++;
          }
# 368 "nxtgt/nxtgt.c"
          goto Lret_ecrobot_read_bt_packet;
        }
      }
    }
  }
# 373 "nxtgt/nxtgt.c"
  goto Lret_ecrobot_read_bt_packet;
  Lret_ecrobot_read_bt_packet:
# 375 "nxtgt/nxtgt.c"
  analog_stick_left = - ((S32___0 )*((S8___0 *)(& bt_receive_buf[0])));
# 376 "nxtgt/nxtgt.c"
  analog_stick_right = (S32___0 )*((S8___0 *)(& bt_receive_buf[1]));
# 377 "nxtgt/nxtgt.c"
  port_id20 = (U8___0 )3;
# 378 "nxtgt/nxtgt.c"
  tmp21 = sensor_adc((U32 )port_id20);
# 379 "nxtgt/nxtgt.c"
  ret_ecrobot_get_touch_sensor22 = (U8 )(tmp21 < 512UL);
# 380 "nxtgt/nxtgt.c"
  goto Lret_ecrobot_get_touch_sensor;
  Lret_ecrobot_get_touch_sensor:
# 382 "nxtgt/nxtgt.c"
  touch_sensor = ret_ecrobot_get_touch_sensor22;
# 383 "nxtgt/nxtgt.c"
  if ((int )touch_sensor == 1) {
# 384 "nxtgt/nxtgt.c"
    if ((int )touch_sensor_state == 0) {
# 385 "nxtgt/nxtgt.c"
      EDC_flag = (S8___0 )(~ ((int )EDC_flag) + 1);
    }
  }
# 388 "nxtgt/nxtgt.c"
  touch_sensor_state = touch_sensor;
# 389 "nxtgt/nxtgt.c"
  tmp = nxt_motor_get_count((U32___0 )0);
# 390 "nxtgt/nxtgt.c"
  steering_angle = (S32___0 )tmp;
# 391 "nxtgt/nxtgt.c"
  steering_err = (40L * analog_stick_right) / 100L - steering_angle;
# 392 "nxtgt/nxtgt.c"
  steering_speed = 2L * steering_err;
# 393 "nxtgt/nxtgt.c"
  tmp___0 = FrictionComp(steering_speed, (S32___0 )10);
# 394 "nxtgt/nxtgt.c"
  nxt_motor_set_speed((U32___0 )0, (int )tmp___0, 1);
# 395 "nxtgt/nxtgt.c"
  diff_gain = (S32___0 )10;
# 396 "nxtgt/nxtgt.c"
  if (steering_angle > 2L) {
# 397 "nxtgt/nxtgt.c"
    if ((int )EDC_flag == -1) {
# 398 "nxtgt/nxtgt.c"
      diff_gain = (S32___0 )((1.0F - ((float )steering_angle * 0.7F) / (float )40) * (float )10);
    }
# 400 "nxtgt/nxtgt.c"
    tmp___1 = FrictionComp((analog_stick_left * diff_gain) / 10L, (S32___0 )10);
# 401 "nxtgt/nxtgt.c"
    nxt_motor_set_speed((U32___0 )2, (int )tmp___1, 1);
# 402 "nxtgt/nxtgt.c"
    tmp___2 = FrictionComp(analog_stick_left, (S32___0 )10);
# 403 "nxtgt/nxtgt.c"
    nxt_motor_set_speed((U32___0 )1, (int )tmp___2, 1);
  } else
# 405 "nxtgt/nxtgt.c"
  if (steering_angle < -2L) {
# 406 "nxtgt/nxtgt.c"
    if ((int )EDC_flag == -1) {
# 407 "nxtgt/nxtgt.c"
      diff_gain = (S32___0 )((1.0F + ((float )steering_angle * 0.7F) / (float )40) * (float )10);
    }
# 409 "nxtgt/nxtgt.c"
    tmp___3 = FrictionComp(analog_stick_left, (S32___0 )10);
# 410 "nxtgt/nxtgt.c"
    nxt_motor_set_speed((U32___0 )2, (int )tmp___3, 1);
# 411 "nxtgt/nxtgt.c"
    tmp___4 = FrictionComp((analog_stick_left * diff_gain) / 10L, (S32___0 )10);
# 412 "nxtgt/nxtgt.c"
    nxt_motor_set_speed((U32___0 )1, (int )tmp___4, 1);
  } else {
# 414 "nxtgt/nxtgt.c"
    tmp___5 = FrictionComp(analog_stick_left, (S32___0 )10);
# 415 "nxtgt/nxtgt.c"
    nxt_motor_set_speed((U32___0 )2, (int )tmp___5, 1);
# 416 "nxtgt/nxtgt.c"
    tmp___6 = FrictionComp(analog_stick_left, (S32___0 )10);
# 417 "nxtgt/nxtgt.c"
    nxt_motor_set_speed((U32___0 )1, (int )tmp___6, 1);
  }
# 419 "nxtgt/nxtgt.c"
  ecrobot_bt_data_logger((S8___0 )analog_stick_left, (S8___0 )analog_stick_right);
# 420 "nxtgt/nxtgt.c"
  TerminateTask();
# 421 "nxtgt/nxtgt.c"
  return;
}
}
# 424 "nxtgt/nxtgt.c"
void TaskMainTaskSonar(void)
{
  S32___0 sonar ;

  {
# 429 "nxtgt/nxtgt.c"
  sonar = ecrobot_get_sonar_sensor((U8___0 )1);
# 430 "nxtgt/nxtgt.c"
  TerminateTask();
# 431 "nxtgt/nxtgt.c"
  return;
}
}
# 491 "nxtgt/nxtgt.c"
extern int ( getDistance)() ;
# 434 "nxtgt/nxtgt.c"
void TaskMainTaskLCD(void)
{
  CHAR const *target_name1 ;
  U32 tmp2 ;
  int tmp___03 ;
  int tmp___14 ;
  int tmp___25 ;
  U32 tmp___36 ;
  U32 tmp___47 ;
  U32 tmp___58 ;
  U32 tmp___69 ;
  SINT tmp___710 ;
  S32 tmp___811 ;
  int tmp ;

  {
# 449 "nxtgt/nxtgt.c"
  target_name1 = "NXT GT";
# 451 "nxtgt/nxtgt.c"
  display_clear((U32 )0);
# 452 "nxtgt/nxtgt.c"
  display_goto_xy(0, 0);
# 453 "nxtgt/nxtgt.c"
  display_string(target_name1);
# 454 "nxtgt/nxtgt.c"
  display_goto_xy(0, 1);
# 455 "nxtgt/nxtgt.c"
  display_string("TIME:");
# 456 "nxtgt/nxtgt.c"
  tmp2 = systick_get_ms();
# 457 "nxtgt/nxtgt.c"
  display_unsigned(tmp2 / 1000UL, (U32 )0);
# 458 "nxtgt/nxtgt.c"
  display_goto_xy(0, 2);
# 459 "nxtgt/nxtgt.c"
  display_string("BATT:");
# 460 "nxtgt/nxtgt.c"
  display_unsigned(ecrobot_inputs.battery_state / 100UL, (U32 )0);
# 461 "nxtgt/nxtgt.c"
  display_goto_xy(0, 3);
# 462 "nxtgt/nxtgt.c"
  display_string("REV: ");
# 463 "nxtgt/nxtgt.c"
  tmp___03 = nxt_motor_get_count((U32 )0);
# 464 "nxtgt/nxtgt.c"
  display_int(tmp___03, (U32 )0);
# 465 "nxtgt/nxtgt.c"
  tmp___14 = nxt_motor_get_count((U32 )1);
# 466 "nxtgt/nxtgt.c"
  display_int(tmp___14, (U32 )6);
# 467 "nxtgt/nxtgt.c"
  display_goto_xy(0, 4);
# 468 "nxtgt/nxtgt.c"
  display_string("     ");
# 469 "nxtgt/nxtgt.c"
  tmp___25 = nxt_motor_get_count((U32 )2);
# 470 "nxtgt/nxtgt.c"
  display_int(tmp___25, (U32 )0);
# 471 "nxtgt/nxtgt.c"
  display_goto_xy(0, 5);
# 472 "nxtgt/nxtgt.c"
  display_string("ADC: ");
# 473 "nxtgt/nxtgt.c"
  tmp___36 = sensor_adc((U32 )0);
# 474 "nxtgt/nxtgt.c"
  display_unsigned(tmp___36, (U32 )0);
# 475 "nxtgt/nxtgt.c"
  tmp___47 = sensor_adc((U32 )1);
# 476 "nxtgt/nxtgt.c"
  display_unsigned(tmp___47, (U32 )5);
# 477 "nxtgt/nxtgt.c"
  display_goto_xy(0, 6);
# 478 "nxtgt/nxtgt.c"
  display_string("     ");
# 479 "nxtgt/nxtgt.c"
  tmp___58 = sensor_adc((U32 )2);
# 480 "nxtgt/nxtgt.c"
  display_unsigned(tmp___58, (U32 )0);
# 481 "nxtgt/nxtgt.c"
  tmp___69 = sensor_adc((U32 )3);
# 482 "nxtgt/nxtgt.c"
  display_unsigned(tmp___69, (U32 )5);
# 483 "nxtgt/nxtgt.c"
  display_goto_xy(0, 7);
# 484 "nxtgt/nxtgt.c"
  display_string("BT/DST: ");
# 485 "nxtgt/nxtgt.c"
  tmp___710 = ecrobot_get_bt_status();
# 486 "nxtgt/nxtgt.c"
  if (tmp___710 == 7) {
# 487 "nxtgt/nxtgt.c"
    display_unsigned((U32 )1, (U32 )0);
  } else {
# 489 "nxtgt/nxtgt.c"
    display_unsigned((U32 )0, (U32 )0);
  }
# 491 "nxtgt/nxtgt.c"
  tmp = getDistance();
# 491 "nxtgt/nxtgt.c"
  tmp___811 = (S32 )tmp;
# 492 "nxtgt/nxtgt.c"
  display_int((int )tmp___811, (U32 )5);
# 493 "nxtgt/nxtgt.c"
  display_update();
# 494 "nxtgt/nxtgt.c"
  goto Lret_ecrobot_status_monitor;
  Lret_ecrobot_status_monitor:
# 497 "nxtgt/nxtgt.c"
  TerminateTask();
# 499 "nxtgt/nxtgt.c"
  return;
}
}
# 502 "nxtgt/nxtgt.c"
S32___0 FrictionComp(S32___0 ratio , S32___0 offset )
{


  {
# 505 "nxtgt/nxtgt.c"
  if (ratio > 0L) {
# 506 "nxtgt/nxtgt.c"
    return (((100L - offset) * ratio) / 100L + offset);
  } else
# 508 "nxtgt/nxtgt.c"
  if (ratio < 0L) {
# 509 "nxtgt/nxtgt.c"
    return (((100L - offset) * ratio) / 100L - offset);
  } else {
# 511 "nxtgt/nxtgt.c"
    return (ratio);
  }
}
}
# 515 "nxtgt/nxtgt.c"
extern int create_task() ;
# 516 "nxtgt/nxtgt.c"
void main(void)
{


  {
# 519 "nxtgt/nxtgt.c"
  create_task("TaskMainTaskInitialize", "TaskMainTaskInitialize", 4, 800, 0.009);
# 520 "nxtgt/nxtgt.c"
  create_task("TaskMainTaskControl", "TaskMainTaskControl", 3, 10, 0.082);
# 521 "nxtgt/nxtgt.c"
  create_task("TaskMainTaskSonar", "TaskMainTaskSonar", 2, 50, 0.009);
# 522 "nxtgt/nxtgt.c"
  create_task("TaskMainTaskLCD", "TaskMainTaskLCD", 1, 500, 0.020);
# 523 "nxtgt/nxtgt.c"
  return;
}
}
