# 1 "./sumoR.cil.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "/usr/include/stdc-predef.h" 1 3 4
# 1 "<command-line>" 2
# 1 "./sumoR.cil.c"
# 3 "sumo/sumoR.c"
typedef unsigned char U8;
# 4 "sumo/sumoR.c"
typedef unsigned long U32;
# 45 "sumo/sumoR.c"
typedef unsigned char U8___0;
# 46 "sumo/sumoR.c"
typedef unsigned short U16___0;
# 47 "sumo/sumoR.c"
typedef unsigned long U32___0;
# 53 "sumo/sumoR.c"
struct i2c_partial_transaction {
   U8___0 start : 1 ;
   U8___0 restart : 1 ;
   U8___0 stop : 1 ;
   U8___0 tx : 1 ;
   U8___0 last_pt : 1 ;
   U16___0 nbytes ;
   U8___0 *data ;
};
# 62 "sumo/sumoR.c"
enum __anonenum_i2c_port_state_506411302 {
    I2C_UNINITIALISED = 0,
    I2C_IDLE = 1,
    I2C_BEGIN = 2,
    I2C_RESTART1 = 3,
    I2C_START1 = 4,
    I2C_START2 = 5,
    I2C_START3 = 6,
    I2C_START_RECLOCK1 = 7,
    I2C_LOW0 = 8,
    I2C_LOW1 = 9,
    I2C_HIGH0 = 10,
    I2C_HIGH1 = 11,
    I2C_STOP0 = 12,
    I2C_STOP1 = 13,
    I2C_STOP2 = 14,
    I2C_STOP3 = 15
} ;
# 80 "sumo/sumoR.c"
typedef enum __anonenum_i2c_port_state_506411302 i2c_port_state;
# 81 "sumo/sumoR.c"
struct i2c_port_struct {
   U32___0 scl_pin ;
   U32___0 sda_pin ;
   U8___0 addr_int[2] ;
   U8___0 addr ;
   struct i2c_partial_transaction partial_transaction[3] ;
   struct i2c_partial_transaction *current_pt ;
   i2c_port_state state ;
   U32___0 nbits ;
   U32___0 ack_slot ;
   U32___0 ack_slot_pending ;
   U8___0 *dataN ;
   U32___0 transmitting ;
   U32___0 fault ;
   U32___0 n_fault ;
   U32___0 n_good ;
   U32___0 ack_fail ;
   U32___0 ack_good ;
   U32___0 pt_num ;
   U32___0 pt_begun ;
};
# 102 "sumo/sumoR.c"
typedef unsigned char U8___1;
# 104 "sumo/sumoR.c"
typedef unsigned short U16___1;
# 105 "sumo/sumoR.c"
typedef short S16___0;
# 106 "sumo/sumoR.c"
typedef unsigned long U32___1;
# 107 "sumo/sumoR.c"
typedef long S32___0;
# 258 "sumo/sumoR.c"
struct __anonstruct_NXTCOLORSENSOR_T_371327434 {
   U16___1 color ;
   S16___0 rgb[3] ;
   U16___1 light ;
   U8___1 volatile mode ;
   U8___1 volatile mode_state ;
   U8___1 volatile port_in_use ;
};
# 266 "sumo/sumoR.c"
typedef struct __anonstruct_NXTCOLORSENSOR_T_371327434 NXTCOLORSENSOR_T;
# 267 "sumo/sumoR.c"
typedef unsigned char U8___2;
# 268 "sumo/sumoR.c"
typedef signed char S8___1;
# 270 "sumo/sumoR.c"
typedef unsigned long U32___2;
# 272 "sumo/sumoR.c"
struct __anonstruct_to_avr_432250394 {
   U8___2 power ;
   U8___2 pwm_frequency ;
   S8___1 output_percent[4] ;
   U8___2 output_mode ;
   U8___2 input_power ;
} __attribute__((__packed__)) ;
# 279 "sumo/sumoR.c"
typedef struct __anonstruct_to_avr_432250394 to_avr;
# 294 "sumo/sumoR.c"
typedef unsigned long U32___3;
# 296 "sumo/sumoR.c"
struct motor_struct {
   int current_count ;
   int target_count ;
   int speed_percent ;
   U32___3 last ;
};
# 302 "sumo/sumoR.c"
typedef unsigned char UINT8;
# 303 "sumo/sumoR.c"
typedef UINT8 StatusType;
# 304 "sumo/sumoR.c"
typedef UINT8 ResourceType;
# 305 "sumo/sumoR.c"
typedef unsigned char U8___3;
# 306 "sumo/sumoR.c"
typedef unsigned short U16___3;
# 307 "sumo/sumoR.c"
typedef unsigned long U32___4;
# 308 "sumo/sumoR.c"
typedef long S32___1;
# 309 "sumo/sumoR.c"
struct dc_t {
   U32___4 duration ;
   S32___1 speed_left ;
   S32___1 speed_right ;
   int priority ;
};
# 316 "sumo/sumoR.c"
extern void display_update(void) ;
# 318 "sumo/sumoR.c"
extern void display_clear(U32 updateToo ) ;
# 320 "sumo/sumoR.c"
extern void display_char(int c ) ;
# 329 "sumo/sumoR.c"
int display_tick ;
# 330 "sumo/sumoR.c"
int display_auto_update ;
# 336 "sumo/sumoR.c"
extern unsigned long systick_get_ms(void) ;
# 347 "sumo/sumoR.c"
U8 const *displayM = (U8 const *)((U8 *)0);
# 348 "sumo/sumoR.c"
unsigned char volatile dirty = (U8 volatile )0;
# 349 "sumo/sumoR.c"
unsigned char volatile page = (U8 volatile )0;
# 350 "sumo/sumoR.c"
U8 const volatile *dataM = (U8 const volatile *)((U8 *)0);
# 351 "sumo/sumoR.c"
U8 mode = (U8 )255;
# 1075 "sumo/sumoR.c"
int display_x ;
# 1076 "sumo/sumoR.c"
int display_y ;
# 1447 "sumo/sumoR.c"
extern int i2c_busy(int port ) ;
# 1454 "sumo/sumoR.c"
static struct i2c_port_struct i2c_port[4] ;
# 2243 "sumo/sumoR.c"
static S32___0 distance_state[4] = { (S32___0 )-1, (S32___0 )-1, (S32___0 )-1, (S32___0 )-1};
# 2283 "sumo/sumoR.c"
U8___1 const NXT_COLORSENSOR_PROTOCOLS[7] = { (U8___1 const )176, (U8___1 const )112, (U8___1 const )240, (U8___1 const )8,
        (U8___1 const )176, (U8___1 const )136, (U8___1 const )136};
# 2286 "sumo/sumoR.c"
static NXTCOLORSENSOR_T sensor_data[4] ;
# 3843 "sumo/sumoR.c"
static to_avr io_to_avr ;
# 4107 "sumo/sumoR.c"
static struct motor_struct motor[3] ;
# 4249 "sumo/sumoR.c"
extern __attribute__((__nothrow__)) int ( __attribute__((__leaf__)) rand)(void) ;
# 4250 "sumo/sumoR.c"
extern StatusType TerminateTask(void) ;
# 4251 "sumo/sumoR.c"
extern StatusType GetResource(ResourceType resid ) ;
# 4252 "sumo/sumoR.c"
extern StatusType ReleaseResource(ResourceType resid ) ;
# 4253 "sumo/sumoR.c"
extern ResourceType DrivingControlResource ;
# 4254 "sumo/sumoR.c"
struct dc_t dc = {(U32___4 )0, (S32___1 )0, (S32___1 )0, 5};
# 4255 "sumo/sumoR.c"
U32___4 SeekStarted ;
# 4256 "sumo/sumoR.c"
S32___1 LastSonarValue ;
# 4257 "sumo/sumoR.c"
int InSetupPhase ;
# 4258 "sumo/sumoR.c"
U32___4 SetupStarted ;
# 4259 "sumo/sumoR.c"
void TaskMainMotorcontrolTask(void)
{
  U32___3 n1 ;
  int speed_percent2 ;
  int brake3 ;
  U32___3 n4 ;
  int speed_percent5 ;
  int brake6 ;
  U32___2 n7 ;
  int power_percent8 ;
  int brake9 ;
  U32___2 n10 ;
  int power_percent11 ;
  int brake12 ;

  {
# 4275 "sumo/sumoR.c"
  if (InSetupPhase) {
# 4276 "sumo/sumoR.c"
    TerminateTask();
  }
# 4278 "sumo/sumoR.c"
  GetResource(DrivingControlResource);
# 4279 "sumo/sumoR.c"
  if (dc.duration > 0UL) {
# 4280 "sumo/sumoR.c"
    dc.duration -= 50UL;
  } else {
# 4282 "sumo/sumoR.c"
    dc.priority = 5;
# 4283 "sumo/sumoR.c"
    dc.duration = (U32___4 )0;
# 4284 "sumo/sumoR.c"
    dc.speed_left = (S32___1 )0;
# 4285 "sumo/sumoR.c"
    dc.speed_right = (S32___1 )0;
  }
# 4287 "sumo/sumoR.c"
  n1 = (U32___4 )1;
# 4288 "sumo/sumoR.c"
  speed_percent2 = (int )(- dc.speed_left);
# 4289 "sumo/sumoR.c"
  brake3 = 1;
# 4290 "sumo/sumoR.c"
  if (n1 < 3UL) {
# 4291 "sumo/sumoR.c"
    if (speed_percent2 > 100) {
# 4292 "sumo/sumoR.c"
      speed_percent2 = 100;
    }
# 4294 "sumo/sumoR.c"
    if (speed_percent2 < -100) {
# 4295 "sumo/sumoR.c"
      speed_percent2 = -100;
    }
# 4297 "sumo/sumoR.c"
    motor[n1].speed_percent = speed_percent2;
# 4298 "sumo/sumoR.c"
    n7 = n1;
# 4299 "sumo/sumoR.c"
    power_percent8 = speed_percent2;
# 4300 "sumo/sumoR.c"
    brake9 = brake3;
# 4301 "sumo/sumoR.c"
    if (n7 < 3UL) {
# 4302 "sumo/sumoR.c"
      io_to_avr.output_percent[n7] = (S8___1 )power_percent8;
# 4303 "sumo/sumoR.c"
      if (brake9) {
# 4304 "sumo/sumoR.c"
        io_to_avr.output_mode = (U8___2 )((int )io_to_avr.output_mode | (1 << n7));
      } else {
# 4306 "sumo/sumoR.c"
        io_to_avr.output_mode = (U8___2 )((int )io_to_avr.output_mode & ~ (1 << n7));
      }
    }
# 4309 "sumo/sumoR.c"
    goto Lret_nxt_avr_set_motor;
    Lret_nxt_avr_set_motor: ;
  }
# 4312 "sumo/sumoR.c"
  goto Lret_nxt_motor_set_speed;
  Lret_nxt_motor_set_speed:
# 4314 "sumo/sumoR.c"
  n4 = (U32___4 )0;
# 4315 "sumo/sumoR.c"
  speed_percent5 = (int )(- dc.speed_right);
# 4316 "sumo/sumoR.c"
  brake6 = 1;
# 4317 "sumo/sumoR.c"
  if (n4 < 3UL) {
# 4318 "sumo/sumoR.c"
    if (speed_percent5 > 100) {
# 4319 "sumo/sumoR.c"
      speed_percent5 = 100;
    }
# 4321 "sumo/sumoR.c"
    if (speed_percent5 < -100) {
# 4322 "sumo/sumoR.c"
      speed_percent5 = -100;
    }
# 4324 "sumo/sumoR.c"
    motor[n4].speed_percent = speed_percent5;
# 4325 "sumo/sumoR.c"
    n10 = n4;
# 4326 "sumo/sumoR.c"
    power_percent11 = speed_percent5;
# 4327 "sumo/sumoR.c"
    brake12 = brake6;
# 4328 "sumo/sumoR.c"
    if (n10 < 3UL) {
# 4329 "sumo/sumoR.c"
      io_to_avr.output_percent[n10] = (S8___1 )power_percent11;
# 4330 "sumo/sumoR.c"
      if (brake12) {
# 4331 "sumo/sumoR.c"
        io_to_avr.output_mode = (U8___2 )((int )io_to_avr.output_mode | (1 << n10));
      } else {
# 4333 "sumo/sumoR.c"
        io_to_avr.output_mode = (U8___2 )((int )io_to_avr.output_mode & ~ (1 << n10));
      }
    }
# 4336 "sumo/sumoR.c"
    goto Lret_nxt_avr_set_motor___0;
    Lret_nxt_avr_set_motor___0: ;
  }
# 4339 "sumo/sumoR.c"
  goto Lret_nxt_motor_set_speed___0;
  Lret_nxt_motor_set_speed___0:
# 4341 "sumo/sumoR.c"
  ReleaseResource(DrivingControlResource);
# 4342 "sumo/sumoR.c"
  TerminateTask();
# 4343 "sumo/sumoR.c"
  return;
}
}
# 4373 "sumo/sumoR.c"
extern int ( colorsensor_init)() ;
# 4387 "sumo/sumoR.c"
extern int ( colorsensor_color_get)() ;
# 4389 "sumo/sumoR.c"
extern int ( colorsensor_rgb_get)() ;
# 4391 "sumo/sumoR.c"
extern int ( colorsensor_light_get)() ;
# 4394 "sumo/sumoR.c"
extern int ( colorsensor_light_full)() ;
# 4346 "sumo/sumoR.c"
void TaskMainColorSensorTask(void)
{
  U16___3 color ;
  U16___3 tmp ;
  int priority3 ;
  int speed_left4 ;
  int speed_right5 ;
  int duration6 ;
  U8___1 port_id7 ;
  unsigned short ret_ecrobot_get_nxtcolorsensor_light8 ;
  int port_id9 ;
  NXTCOLORSENSOR_T *sd10 ;
  U8___1 mode11 ;
  int tmp12 ;
  int tmp___013 ;

  {
# 4363 "sumo/sumoR.c"
  if (InSetupPhase) {
# 4364 "sumo/sumoR.c"
    TerminateTask();
  }
# 4366 "sumo/sumoR.c"
  port_id9 = 0;
# 4367 "sumo/sumoR.c"
  while (port_id9 < 4) {
# 4368 "sumo/sumoR.c"
    sd10 = & sensor_data[port_id9];
# 4369 "sumo/sumoR.c"
    if (sd10->port_in_use) {
# 4370 "sumo/sumoR.c"
      mode11 = (U8___1 )sd10->mode;
# 4371 "sumo/sumoR.c"
      if ((int )mode11 == 6) {
# 4372 "sumo/sumoR.c"
        sd10->port_in_use = (U8___1 volatile )0;
# 4373 "sumo/sumoR.c"
        colorsensor_init(port_id9, 136);
# 4374 "sumo/sumoR.c"
        goto Lret_ecrobot_process_bg_nxtcolorsensor;
      } else
# 4376 "sumo/sumoR.c"
      if ((int )mode11 != (int )sd10->mode_state) {
# 4377 "sumo/sumoR.c"
        sd10->color = (U16___1 )99;
# 4378 "sumo/sumoR.c"
        sd10->rgb[0] = (S16___0 )0;
# 4379 "sumo/sumoR.c"
        sd10->rgb[1] = (S16___0 )0;
# 4380 "sumo/sumoR.c"
        sd10->rgb[2] = (S16___0 )0;
# 4381 "sumo/sumoR.c"
        sd10->light = (U16___1 )0;
# 4382 "sumo/sumoR.c"
        sd10->mode_state = (U8___1 volatile )mode11;
# 4383 "sumo/sumoR.c"
        colorsensor_init(port_id9, 136);
# 4384 "sumo/sumoR.c"
        colorsensor_init(port_id9, (int )((unsigned char )NXT_COLORSENSOR_PROTOCOLS[mode11]));
      }
# 4386 "sumo/sumoR.c"
      if ((int )mode11 == 0) {
# 4387 "sumo/sumoR.c"
        tmp12 = colorsensor_color_get(port_id9);
# 4388 "sumo/sumoR.c"
        sd10->color = (U16___1 )tmp12;
# 4389 "sumo/sumoR.c"
        colorsensor_rgb_get(port_id9, sd10->rgb);
      } else {
# 4391 "sumo/sumoR.c"
        tmp___013 = colorsensor_light_get(port_id9);
# 4392 "sumo/sumoR.c"
        sd10->light = (U16___1 )tmp___013;
# 4393 "sumo/sumoR.c"
        if ((int )mode11 == 4) {
# 4394 "sumo/sumoR.c"
          colorsensor_light_full(port_id9);
        }
      }
    }
# 4398 "sumo/sumoR.c"
    port_id9 ++;
  }
# 4400 "sumo/sumoR.c"
  goto Lret_ecrobot_process_bg_nxtcolorsensor;
  Lret_ecrobot_process_bg_nxtcolorsensor:
# 4402 "sumo/sumoR.c"
  port_id7 = (U8___3 )0;
# 4403 "sumo/sumoR.c"
  ret_ecrobot_get_nxtcolorsensor_light8 = sensor_data[port_id7].light;
# 4404 "sumo/sumoR.c"
  goto Lret_ecrobot_get_nxtcolorsensor_light;
  Lret_ecrobot_get_nxtcolorsensor_light:
# 4406 "sumo/sumoR.c"
  tmp = ret_ecrobot_get_nxtcolorsensor_light8;
# 4407 "sumo/sumoR.c"
  color = tmp;
# 4408 "sumo/sumoR.c"
  if ((int )color < 300) {
# 4409 "sumo/sumoR.c"
    GetResource(DrivingControlResource);
# 4410 "sumo/sumoR.c"
    priority3 = 50;
# 4411 "sumo/sumoR.c"
    speed_left4 = -100;
# 4412 "sumo/sumoR.c"
    speed_right5 = -100;
# 4413 "sumo/sumoR.c"
    duration6 = 1250;
# 4414 "sumo/sumoR.c"
    GetResource(DrivingControlResource);
# 4415 "sumo/sumoR.c"
    if (dc.priority != 20) {
# 4416 "sumo/sumoR.c"
      SeekStarted = (U32___4 )0;
    }
# 4418 "sumo/sumoR.c"
    if (priority3 >= dc.priority) {
# 4419 "sumo/sumoR.c"
      dc.priority = priority3;
# 4420 "sumo/sumoR.c"
      dc.speed_left = (S32___1 )speed_left4;
# 4421 "sumo/sumoR.c"
      dc.speed_right = (S32___1 )speed_right5;
# 4422 "sumo/sumoR.c"
      dc.duration = (U32___4 )duration6;
    }
# 4424 "sumo/sumoR.c"
    ReleaseResource(DrivingControlResource);
# 4425 "sumo/sumoR.c"
    goto Lret_change_driving_command;
    Lret_change_driving_command:
# 4427 "sumo/sumoR.c"
    ReleaseResource(DrivingControlResource);
  }
# 4429 "sumo/sumoR.c"
  TerminateTask();
# 4430 "sumo/sumoR.c"
  return;
}
}
# 4433 "sumo/sumoR.c"
extern int copysign() ;
# 4521 "sumo/sumoR.c"
extern int ( memset)() ;
# 4434 "sumo/sumoR.c"
void TaskMainSonarSensorTask(void)
{
  int duration ;
  S32___1 distance ;
  S32___1 tmp ;
  int seek_delay_1 ;
  int seek_delay_2 ;
  int seek_delay_3 ;
  int seek_delay_4 ;
  int speed_left ;
  int speed_right ;
  int modifier ;
  int tmp___0 ;
  int tmp___1 ;
  U32___4 current_sys_tick ;
  U32___4 tmp___2 ;
  U32___4 delta ;
  int priority16 ;
  int speed_left17 ;
  int speed_right18 ;
  int duration19 ;
  int priority20 ;
  int speed_left21 ;
  int speed_right22 ;
  int duration23 ;
  int priority24 ;
  int speed_left25 ;
  int speed_right26 ;
  int duration27 ;
  int priority28 ;
  int speed_left29 ;
  int speed_right30 ;
  int duration31 ;
  int priority32 ;
  int speed_left33 ;
  int speed_right34 ;
  int duration35 ;
  int priority36 ;
  int speed_left37 ;
  int speed_right38 ;
  int duration39 ;
  U8___1 port_id40 ;
  int tmp41 ;
  long ret_ecrobot_get_sonar_sensor42 ;
  int port43 ;
  U32___0 address44 ;
  int internal_address45 ;
  int n_internal_address_bytes46 ;
  U8___0 *data47 ;
  U32___0 nbytes48 ;
  int write49 ;
  struct i2c_port_struct *p50 ;
  struct i2c_partial_transaction *pt51 ;
  int tmp52 ;
  int tmp___053 ;

  {
# 4491 "sumo/sumoR.c"
  if (InSetupPhase) {
# 4492 "sumo/sumoR.c"
    TerminateTask();
  }
# 4494 "sumo/sumoR.c"
  duration = 3000;
# 4495 "sumo/sumoR.c"
  port_id40 = (U8___3 )1;
# 4496 "sumo/sumoR.c"
  tmp41 = i2c_busy((int )port_id40);
# 4497 "sumo/sumoR.c"
  if (tmp41 == 0) {
# 4499 "sumo/sumoR.c"
    port43 = (int )port_id40;
# 4500 "sumo/sumoR.c"
    address44 = (U32___1 )1;
# 4501 "sumo/sumoR.c"
    internal_address45 = 66;
# 4502 "sumo/sumoR.c"
    n_internal_address_bytes46 = 1;
# 4504 "sumo/sumoR.c"
    nbytes48 = (U32___1 )1;
# 4505 "sumo/sumoR.c"
    write49 = 0;
# 4506 "sumo/sumoR.c"
    if (port43 < 0) {
# 4507 "sumo/sumoR.c"
      goto Lret_i2c_start_transaction;
    } else
# 4509 "sumo/sumoR.c"
    if (port43 >= 4) {
# 4510 "sumo/sumoR.c"
      goto Lret_i2c_start_transaction;
    }
# 4512 "sumo/sumoR.c"
    tmp52 = i2c_busy(port43);
# 4513 "sumo/sumoR.c"
    if (tmp52) {
# 4514 "sumo/sumoR.c"
      goto Lret_i2c_start_transaction;
    }
# 4516 "sumo/sumoR.c"
    p50 = & i2c_port[port43];
# 4517 "sumo/sumoR.c"
    p50->pt_num = (U32___0 )0;
# 4518 "sumo/sumoR.c"
    p50->pt_begun = (U32___0 )0;
# 4519 "sumo/sumoR.c"
    pt51 = p50->partial_transaction;
# 4520 "sumo/sumoR.c"
    p50->current_pt = pt51;
# 4521 "sumo/sumoR.c"
    memset((void *)pt51, 0, sizeof(p50->partial_transaction));
# 4522 "sumo/sumoR.c"
    if (n_internal_address_bytes46 > 0) {
# 4523 "sumo/sumoR.c"
      p50->addr_int[0] = (U8___0 )(address44 << 1);
# 4524 "sumo/sumoR.c"
      p50->addr_int[1] = (U8___0 )internal_address45;
# 4525 "sumo/sumoR.c"
      pt51->start = (U8___0 )1;
# 4526 "sumo/sumoR.c"
      if (write49) {
# 4527 "sumo/sumoR.c"
        pt51->stop = (U8___0 )0;
      } else {
# 4529 "sumo/sumoR.c"
        pt51->stop = (U8___0 )1;
      }
# 4531 "sumo/sumoR.c"
      pt51->tx = (U8___0 )1;
# 4532 "sumo/sumoR.c"
      pt51->data = p50->addr_int;
# 4533 "sumo/sumoR.c"
      pt51->nbytes = (U16___0 )2;
# 4534 "sumo/sumoR.c"
      pt51 ++;
    }
# 4536 "sumo/sumoR.c"
    if (n_internal_address_bytes46 == 0) {
# 4537 "sumo/sumoR.c"
      goto _L___2;
    } else
# 4539 "sumo/sumoR.c"
    if (! write49) {
      _L___2:
# 4541 "sumo/sumoR.c"
      if (n_internal_address_bytes46 > 0) {
# 4542 "sumo/sumoR.c"
        pt51->start = (U8___0 )0;
      } else {
# 4544 "sumo/sumoR.c"
        pt51->start = (U8___0 )1;
      }
# 4546 "sumo/sumoR.c"
      pt51->restart = (U8___0 )(! pt51->start);
# 4547 "sumo/sumoR.c"
      pt51->stop = (U8___0 )0;
# 4548 "sumo/sumoR.c"
      pt51->tx = (U8___0 )1;
# 4549 "sumo/sumoR.c"
      if (write49) {
# 4550 "sumo/sumoR.c"
        tmp___053 = 0;
      } else {
# 4552 "sumo/sumoR.c"
        tmp___053 = 1;
      }
# 4554 "sumo/sumoR.c"
      p50->addr = (U8___0 )((address44 << 1) | (unsigned long )tmp___053);
# 4555 "sumo/sumoR.c"
      pt51->data = & p50->addr;
# 4556 "sumo/sumoR.c"
      pt51->nbytes = (U16___0 )1;
# 4557 "sumo/sumoR.c"
      pt51 ++;
    }
# 4559 "sumo/sumoR.c"
    pt51->start = (U8___0 )0;
# 4560 "sumo/sumoR.c"
    pt51->stop = (U8___0 )1;
# 4561 "sumo/sumoR.c"
    if (write49) {
# 4562 "sumo/sumoR.c"
      pt51->tx = (U8___0 )1;
    } else {
# 4564 "sumo/sumoR.c"
      pt51->tx = (U8___0 )0;
    }
# 4566 "sumo/sumoR.c"
    pt51->data = data47;
# 4567 "sumo/sumoR.c"
    pt51->nbytes = (U16___0 )nbytes48;
# 4568 "sumo/sumoR.c"
    pt51->last_pt = (U8___0 )1;
# 4569 "sumo/sumoR.c"
    p50->state = (i2c_port_state )2;
# 4570 "sumo/sumoR.c"
    goto Lret_i2c_start_transaction;
    Lret_i2c_start_transaction: ;
  }
# 4573 "sumo/sumoR.c"
  ret_ecrobot_get_sonar_sensor42 = distance_state[port_id40];
# 4574 "sumo/sumoR.c"
  goto Lret_ecrobot_get_sonar_sensor;
  Lret_ecrobot_get_sonar_sensor:
# 4576 "sumo/sumoR.c"
  tmp = ret_ecrobot_get_sonar_sensor42;
# 4577 "sumo/sumoR.c"
  distance = tmp;
# 4578 "sumo/sumoR.c"
  if (LastSonarValue == 0L) {
# 4579 "sumo/sumoR.c"
    LastSonarValue = (S32___1 )255;
  }
# 4581 "sumo/sumoR.c"
  if (distance == 255L) {
# 4582 "sumo/sumoR.c"
    if (LastSonarValue < 20L) {
# 4583 "sumo/sumoR.c"
      priority16 = 30;
# 4584 "sumo/sumoR.c"
      speed_left17 = 100;
# 4585 "sumo/sumoR.c"
      speed_right18 = 100;
# 4586 "sumo/sumoR.c"
      duration19 = 150;
# 4587 "sumo/sumoR.c"
      GetResource(DrivingControlResource);
# 4588 "sumo/sumoR.c"
      if (dc.priority != 20) {
# 4589 "sumo/sumoR.c"
        SeekStarted = (U32___4 )0;
      }
# 4591 "sumo/sumoR.c"
      if (priority16 >= dc.priority) {
# 4592 "sumo/sumoR.c"
        dc.priority = priority16;
# 4593 "sumo/sumoR.c"
        dc.speed_left = (S32___1 )speed_left17;
# 4594 "sumo/sumoR.c"
        dc.speed_right = (S32___1 )speed_right18;
# 4595 "sumo/sumoR.c"
        dc.duration = (U32___4 )duration19;
      }
# 4597 "sumo/sumoR.c"
      ReleaseResource(DrivingControlResource);
# 4598 "sumo/sumoR.c"
      goto Lret_change_driving_command;
      Lret_change_driving_command: ;
    } else {
# 4601 "sumo/sumoR.c"
      LastSonarValue = distance;
    }
  } else {
# 4604 "sumo/sumoR.c"
    LastSonarValue = distance;
  }
# 4606 "sumo/sumoR.c"
  seek_delay_1 = 1000;
# 4607 "sumo/sumoR.c"
  seek_delay_2 = seek_delay_1 * 2;
# 4608 "sumo/sumoR.c"
  seek_delay_3 = seek_delay_2 * 2;
# 4609 "sumo/sumoR.c"
  seek_delay_4 = seek_delay_3 + 2000;
# 4610 "sumo/sumoR.c"
  if (distance > 70L) {
# 4611 "sumo/sumoR.c"
    if (SeekStarted == 0UL) {
# 4612 "sumo/sumoR.c"
      SeekStarted = systick_get_ms();
# 4613 "sumo/sumoR.c"
      tmp___0 = rand();
# 4614 "sumo/sumoR.c"
      tmp___1 = copysign(1, tmp___0 - 1073741823);
# 4615 "sumo/sumoR.c"
      modifier = tmp___1;
# 4616 "sumo/sumoR.c"
      speed_left = -70 * modifier;
# 4617 "sumo/sumoR.c"
      speed_right = 70 * modifier;
# 4618 "sumo/sumoR.c"
      priority20 = 20;
# 4619 "sumo/sumoR.c"
      speed_left21 = speed_left;
# 4620 "sumo/sumoR.c"
      speed_right22 = speed_right;
# 4621 "sumo/sumoR.c"
      duration23 = duration;
# 4622 "sumo/sumoR.c"
      GetResource(DrivingControlResource);
# 4623 "sumo/sumoR.c"
      if (dc.priority != 20) {
# 4624 "sumo/sumoR.c"
        SeekStarted = (U32___4 )0;
      }
# 4626 "sumo/sumoR.c"
      if (priority20 >= dc.priority) {
# 4627 "sumo/sumoR.c"
        dc.priority = priority20;
# 4628 "sumo/sumoR.c"
        dc.speed_left = (S32___1 )speed_left21;
# 4629 "sumo/sumoR.c"
        dc.speed_right = (S32___1 )speed_right22;
# 4630 "sumo/sumoR.c"
        dc.duration = (U32___4 )duration23;
      }
# 4632 "sumo/sumoR.c"
      ReleaseResource(DrivingControlResource);
# 4633 "sumo/sumoR.c"
      goto Lret_change_driving_command___0;
      Lret_change_driving_command___0: ;
    } else {
# 4636 "sumo/sumoR.c"
      tmp___2 = systick_get_ms();
# 4637 "sumo/sumoR.c"
      current_sys_tick = tmp___2;
# 4638 "sumo/sumoR.c"
      delta = current_sys_tick - SeekStarted;
# 4639 "sumo/sumoR.c"
      if (delta > (U32___4 )seek_delay_1) {
# 4640 "sumo/sumoR.c"
        if (delta <= (U32___4 )(seek_delay_1 + 100)) {
# 4641 "sumo/sumoR.c"
          GetResource(DrivingControlResource);
# 4642 "sumo/sumoR.c"
          speed_left = (int )(dc.speed_left * -1L);
# 4643 "sumo/sumoR.c"
          speed_right = (int )(dc.speed_right * -1L);
# 4644 "sumo/sumoR.c"
          ReleaseResource(DrivingControlResource);
# 4645 "sumo/sumoR.c"
          priority24 = 20;
# 4646 "sumo/sumoR.c"
          speed_left25 = speed_left;
# 4647 "sumo/sumoR.c"
          speed_right26 = speed_right;
# 4648 "sumo/sumoR.c"
          duration27 = duration;
# 4649 "sumo/sumoR.c"
          GetResource(DrivingControlResource);
# 4650 "sumo/sumoR.c"
          if (dc.priority != 20) {
# 4651 "sumo/sumoR.c"
            SeekStarted = (U32___4 )0;
          }
# 4653 "sumo/sumoR.c"
          if (priority24 >= dc.priority) {
# 4654 "sumo/sumoR.c"
            dc.priority = priority24;
# 4655 "sumo/sumoR.c"
            dc.speed_left = (S32___1 )speed_left25;
# 4656 "sumo/sumoR.c"
            dc.speed_right = (S32___1 )speed_right26;
# 4657 "sumo/sumoR.c"
            dc.duration = (U32___4 )duration27;
          }
# 4659 "sumo/sumoR.c"
          ReleaseResource(DrivingControlResource);
# 4660 "sumo/sumoR.c"
          goto Lret_change_driving_command___1;
          Lret_change_driving_command___1: ;
        } else {
# 4663 "sumo/sumoR.c"
          goto _L___1;
        }
      } else
      _L___1:
# 4667 "sumo/sumoR.c"
      if (delta > (U32___4 )seek_delay_2) {
# 4668 "sumo/sumoR.c"
        if (delta <= (U32___4 )(seek_delay_2 + 100)) {
# 4669 "sumo/sumoR.c"
          GetResource(DrivingControlResource);
# 4670 "sumo/sumoR.c"
          speed_left = (int )(dc.speed_left * -1L);
# 4671 "sumo/sumoR.c"
          speed_right = (int )(dc.speed_right * -1L);
# 4672 "sumo/sumoR.c"
          ReleaseResource(DrivingControlResource);
# 4673 "sumo/sumoR.c"
          priority28 = 20;
# 4674 "sumo/sumoR.c"
          speed_left29 = speed_left;
# 4675 "sumo/sumoR.c"
          speed_right30 = speed_right;
# 4676 "sumo/sumoR.c"
          duration31 = duration;
# 4677 "sumo/sumoR.c"
          GetResource(DrivingControlResource);
# 4678 "sumo/sumoR.c"
          if (dc.priority != 20) {
# 4679 "sumo/sumoR.c"
            SeekStarted = (U32___4 )0;
          }
# 4681 "sumo/sumoR.c"
          if (priority28 >= dc.priority) {
# 4682 "sumo/sumoR.c"
            dc.priority = priority28;
# 4683 "sumo/sumoR.c"
            dc.speed_left = (S32___1 )speed_left29;
# 4684 "sumo/sumoR.c"
            dc.speed_right = (S32___1 )speed_right30;
# 4685 "sumo/sumoR.c"
            dc.duration = (U32___4 )duration31;
          }
# 4687 "sumo/sumoR.c"
          ReleaseResource(DrivingControlResource);
# 4688 "sumo/sumoR.c"
          goto Lret_change_driving_command___2;
          Lret_change_driving_command___2: ;
        } else {
# 4691 "sumo/sumoR.c"
          goto _L___0;
        }
      } else
      _L___0:
# 4695 "sumo/sumoR.c"
      if (delta > (U32___4 )seek_delay_3) {
# 4696 "sumo/sumoR.c"
        if (delta <= (U32___4 )seek_delay_4) {
# 4697 "sumo/sumoR.c"
          speed_left = 100;
# 4698 "sumo/sumoR.c"
          speed_right = 100;
# 4699 "sumo/sumoR.c"
          priority32 = 20;
# 4700 "sumo/sumoR.c"
          speed_left33 = speed_left;
# 4701 "sumo/sumoR.c"
          speed_right34 = speed_right;
# 4702 "sumo/sumoR.c"
          duration35 = duration;
# 4703 "sumo/sumoR.c"
          GetResource(DrivingControlResource);
# 4704 "sumo/sumoR.c"
          if (dc.priority != 20) {
# 4705 "sumo/sumoR.c"
            SeekStarted = (U32___4 )0;
          }
# 4707 "sumo/sumoR.c"
          if (priority32 >= dc.priority) {
# 4708 "sumo/sumoR.c"
            dc.priority = priority32;
# 4709 "sumo/sumoR.c"
            dc.speed_left = (S32___1 )speed_left33;
# 4710 "sumo/sumoR.c"
            dc.speed_right = (S32___1 )speed_right34;
# 4711 "sumo/sumoR.c"
            dc.duration = (U32___4 )duration35;
          }
# 4713 "sumo/sumoR.c"
          ReleaseResource(DrivingControlResource);
# 4714 "sumo/sumoR.c"
          goto Lret_change_driving_command___3;
          Lret_change_driving_command___3: ;
        } else {
# 4717 "sumo/sumoR.c"
          goto _L;
        }
      } else
      _L:
# 4721 "sumo/sumoR.c"
      if (delta > (U32___4 )seek_delay_4) {
# 4722 "sumo/sumoR.c"
        SeekStarted = (U32___4 )0;
      }
    }
  } else {
# 4726 "sumo/sumoR.c"
    priority36 = 30;
# 4727 "sumo/sumoR.c"
    speed_left37 = 100;
# 4728 "sumo/sumoR.c"
    speed_right38 = 100;
# 4729 "sumo/sumoR.c"
    duration39 = 150;
# 4730 "sumo/sumoR.c"
    GetResource(DrivingControlResource);
# 4731 "sumo/sumoR.c"
    if (dc.priority != 20) {
# 4732 "sumo/sumoR.c"
      SeekStarted = (U32___4 )0;
    }
# 4734 "sumo/sumoR.c"
    if (priority36 >= dc.priority) {
# 4735 "sumo/sumoR.c"
      dc.priority = priority36;
# 4736 "sumo/sumoR.c"
      dc.speed_left = (S32___1 )speed_left37;
# 4737 "sumo/sumoR.c"
      dc.speed_right = (S32___1 )speed_right38;
# 4738 "sumo/sumoR.c"
      dc.duration = (U32___4 )duration39;
    }
# 4740 "sumo/sumoR.c"
    ReleaseResource(DrivingControlResource);
# 4741 "sumo/sumoR.c"
    goto Lret_change_driving_command___4;
    Lret_change_driving_command___4: ;
  }
# 4744 "sumo/sumoR.c"
  TerminateTask();
# 4745 "sumo/sumoR.c"
  return;
}
}
# 4932 "sumo/sumoR.c"
extern int ( display_unsigned_worker)() ;
# 4748 "sumo/sumoR.c"
void TaskMainDisplayTask(void)
{
  U32___4 tmp ;
  U16___3 color ;
  U16___3 tmp___0 ;
  S32___1 sonar ;
  S32___1 tmp___1 ;
  U8___1 port_id6 ;
  int tmp7 ;
  long ret_ecrobot_get_sonar_sensor8 ;
  U8___1 port_id9 ;
  unsigned short ret_ecrobot_get_nxtcolorsensor_light10 ;
  int port11 ;
  U32___0 address12 ;
  int internal_address13 ;
  int n_internal_address_bytes14 ;
  U8___0 *data15 ;
  U32___0 nbytes16 ;
  int write17 ;
  struct i2c_port_struct *p18 ;
  struct i2c_partial_transaction *pt19 ;
  int tmp20 ;
  int tmp___021 ;
  int x22 ;
  int y23 ;
  int x24 ;
  int y25 ;
  int x26 ;
  int y27 ;
  int x28 ;
  int y29 ;
  int x30 ;
  int y31 ;
  int x32 ;
  int y33 ;
  int x34 ;
  int y35 ;
  char const *str36 ;
  char const *str37 ;
  char const *str38 ;
  char const *str39 ;
  char const *str40 ;
  char const *str41 ;
  char const *str42 ;
  char const *str43 ;
  char const *str44 ;
  char const *str45 ;
  char const *str46 ;
  char const *str47 ;
  char const *str48 ;
  int val49 ;
  U32 places50 ;
  int tmp51 ;
  int val52 ;
  U32 places53 ;
  int tmp54 ;
  int val55 ;
  U32 places56 ;
  int tmp57 ;
  int val58 ;
  U32 places59 ;
  int tmp60 ;
  int val61 ;
  U32 places62 ;
  int tmp63 ;
  int val64 ;
  U32 places65 ;
  int tmp66 ;
  int val67 ;
  U32 places68 ;
  int tmp69 ;
  int val70 ;
  U32 places71 ;
  int tmp72 ;

  {
# 4824 "sumo/sumoR.c"
  if (InSetupPhase) {
# 4825 "sumo/sumoR.c"
    TerminateTask();
  }
# 4827 "sumo/sumoR.c"
  display_clear((U32___4 )0);
# 4828 "sumo/sumoR.c"
  GetResource(DrivingControlResource);
# 4829 "sumo/sumoR.c"
  x22 = 0;
# 4830 "sumo/sumoR.c"
  y23 = 0;
# 4831 "sumo/sumoR.c"
  display_x = x22;
# 4832 "sumo/sumoR.c"
  display_y = y23;
# 4833 "sumo/sumoR.c"
  goto Lret_display_goto_xy;
  Lret_display_goto_xy:
# 4835 "sumo/sumoR.c"
  str36 = "PRIO: ";
# 4836 "sumo/sumoR.c"
  while (*str36) {
# 4837 "sumo/sumoR.c"
    if ((int const )*str36 != 10) {
# 4838 "sumo/sumoR.c"
      display_char((int )*str36);
# 4839 "sumo/sumoR.c"
      display_x ++;
    } else {
# 4841 "sumo/sumoR.c"
      display_x = 0;
# 4842 "sumo/sumoR.c"
      display_y ++;
    }
# 4844 "sumo/sumoR.c"
    str36 ++;
  }
# 4846 "sumo/sumoR.c"
  goto Lret_display_string;
  Lret_display_string: ;
# 4848 "sumo/sumoR.c"
  switch (dc.priority) {
  case 5:
# 4850 "sumo/sumoR.c"
  str37 = "IDLE";
# 4851 "sumo/sumoR.c"
  while (*str37) {
# 4852 "sumo/sumoR.c"
    if ((int const )*str37 != 10) {
# 4853 "sumo/sumoR.c"
      display_char((int )*str37);
# 4854 "sumo/sumoR.c"
      display_x ++;
    } else {
# 4856 "sumo/sumoR.c"
      display_x = 0;
# 4857 "sumo/sumoR.c"
      display_y ++;
    }
# 4859 "sumo/sumoR.c"
    str37 ++;
  }
# 4861 "sumo/sumoR.c"
  goto Lret_display_string___0;
  Lret_display_string___0: ;
# 4863 "sumo/sumoR.c"
  break;
  case 20:
# 4865 "sumo/sumoR.c"
  str38 = "SEEK";
# 4866 "sumo/sumoR.c"
  while (*str38) {
# 4867 "sumo/sumoR.c"
    if ((int const )*str38 != 10) {
# 4868 "sumo/sumoR.c"
      display_char((int )*str38);
# 4869 "sumo/sumoR.c"
      display_x ++;
    } else {
# 4871 "sumo/sumoR.c"
      display_x = 0;
# 4872 "sumo/sumoR.c"
      display_y ++;
    }
# 4874 "sumo/sumoR.c"
    str38 ++;
  }
# 4876 "sumo/sumoR.c"
  goto Lret_display_string___1;
  Lret_display_string___1: ;
# 4878 "sumo/sumoR.c"
  break;
  case 30:
# 4880 "sumo/sumoR.c"
  str39 = "FOLLOW";
# 4881 "sumo/sumoR.c"
  while (*str39) {
# 4882 "sumo/sumoR.c"
    if ((int const )*str39 != 10) {
# 4883 "sumo/sumoR.c"
      display_char((int )*str39);
# 4884 "sumo/sumoR.c"
      display_x ++;
    } else {
# 4886 "sumo/sumoR.c"
      display_x = 0;
# 4887 "sumo/sumoR.c"
      display_y ++;
    }
# 4889 "sumo/sumoR.c"
    str39 ++;
  }
# 4891 "sumo/sumoR.c"
  goto Lret_display_string___2;
  Lret_display_string___2: ;
# 4893 "sumo/sumoR.c"
  break;
  case 50:
# 4895 "sumo/sumoR.c"
  str40 = "COLOR";
# 4896 "sumo/sumoR.c"
  while (*str40) {
# 4897 "sumo/sumoR.c"
    if ((int const )*str40 != 10) {
# 4898 "sumo/sumoR.c"
      display_char((int )*str40);
# 4899 "sumo/sumoR.c"
      display_x ++;
    } else {
# 4901 "sumo/sumoR.c"
      display_x = 0;
# 4902 "sumo/sumoR.c"
      display_y ++;
    }
# 4904 "sumo/sumoR.c"
    str40 ++;
  }
# 4906 "sumo/sumoR.c"
  goto Lret_display_string___3;
  Lret_display_string___3: ;
# 4908 "sumo/sumoR.c"
  break;
  default:
# 4910 "sumo/sumoR.c"
  str41 = "WTF: ";
# 4911 "sumo/sumoR.c"
  while (*str41) {
# 4912 "sumo/sumoR.c"
    if ((int const )*str41 != 10) {
# 4913 "sumo/sumoR.c"
      display_char((int )*str41);
# 4914 "sumo/sumoR.c"
      display_x ++;
    } else {
# 4916 "sumo/sumoR.c"
      display_x = 0;
# 4917 "sumo/sumoR.c"
      display_y ++;
    }
# 4919 "sumo/sumoR.c"
    str41 ++;
  }
# 4921 "sumo/sumoR.c"
  goto Lret_display_string___4;
  Lret_display_string___4:
# 4924 "sumo/sumoR.c"
  val49 = dc.priority;
# 4925 "sumo/sumoR.c"
  places50 = (U32___4 )3;
# 4927 "sumo/sumoR.c"
  if (val49 < 0) {
# 4928 "sumo/sumoR.c"
    tmp51 = - val49;
  } else {
# 4930 "sumo/sumoR.c"
    tmp51 = val49;
  }
# 4932 "sumo/sumoR.c"
  display_unsigned_worker((U32 )tmp51, places50, (U32 )(val49 < 0));
# 4933 "sumo/sumoR.c"
  goto Lret_display_int;
  Lret_display_int: ;
# 4937 "sumo/sumoR.c"
  break;
  }
# 4939 "sumo/sumoR.c"
  x24 = 0;
# 4940 "sumo/sumoR.c"
  y25 = 1;
# 4941 "sumo/sumoR.c"
  display_x = x24;
# 4942 "sumo/sumoR.c"
  display_y = y25;
# 4943 "sumo/sumoR.c"
  goto Lret_display_goto_xy___0;
  Lret_display_goto_xy___0:
# 4945 "sumo/sumoR.c"
  str42 = "SPEED L/R: ";
# 4946 "sumo/sumoR.c"
  while (*str42) {
# 4947 "sumo/sumoR.c"
    if ((int const )*str42 != 10) {
# 4948 "sumo/sumoR.c"
      display_char((int )*str42);
# 4949 "sumo/sumoR.c"
      display_x ++;
    } else {
# 4951 "sumo/sumoR.c"
      display_x = 0;
# 4952 "sumo/sumoR.c"
      display_y ++;
    }
# 4954 "sumo/sumoR.c"
    str42 ++;
  }
# 4956 "sumo/sumoR.c"
  goto Lret_display_string___5;
  Lret_display_string___5:
# 4958 "sumo/sumoR.c"
  x26 = 0;
# 4959 "sumo/sumoR.c"
  y27 = 2;
# 4960 "sumo/sumoR.c"
  display_x = x26;
# 4961 "sumo/sumoR.c"
  display_y = y27;
# 4962 "sumo/sumoR.c"
  goto Lret_display_goto_xy___1;
  Lret_display_goto_xy___1:
# 4965 "sumo/sumoR.c"
  val52 = (int )dc.speed_left;
# 4966 "sumo/sumoR.c"
  places53 = (U32___4 )4;
# 4968 "sumo/sumoR.c"
  if (val52 < 0) {
# 4969 "sumo/sumoR.c"
    tmp54 = - val52;
  } else {
# 4971 "sumo/sumoR.c"
    tmp54 = val52;
  }
# 4973 "sumo/sumoR.c"
  display_unsigned_worker((U32 )tmp54, places53, (U32 )(val52 < 0));
# 4974 "sumo/sumoR.c"
  goto Lret_display_int___0;
  Lret_display_int___0:
# 4977 "sumo/sumoR.c"
  str43 = "/";
# 4979 "sumo/sumoR.c"
  while (*str43) {
# 4980 "sumo/sumoR.c"
    if ((int const )*str43 != 10) {
# 4981 "sumo/sumoR.c"
      display_char((int )*str43);
# 4982 "sumo/sumoR.c"
      display_x ++;
    } else {
# 4984 "sumo/sumoR.c"
      display_x = 0;
# 4985 "sumo/sumoR.c"
      display_y ++;
    }
# 4987 "sumo/sumoR.c"
    str43 ++;
  }
# 4989 "sumo/sumoR.c"
  goto Lret_display_string___6;
  Lret_display_string___6:
# 4992 "sumo/sumoR.c"
  val55 = (int )dc.speed_right;
# 4993 "sumo/sumoR.c"
  places56 = (U32___4 )4;
# 4995 "sumo/sumoR.c"
  if (val55 < 0) {
# 4996 "sumo/sumoR.c"
    tmp57 = - val55;
  } else {
# 4998 "sumo/sumoR.c"
    tmp57 = val55;
  }
# 5000 "sumo/sumoR.c"
  display_unsigned_worker((U32 )tmp57, places56, (U32 )(val55 < 0));
# 5001 "sumo/sumoR.c"
  goto Lret_display_int___1;
  Lret_display_int___1:
# 5004 "sumo/sumoR.c"
  x28 = 0;
# 5005 "sumo/sumoR.c"
  y29 = 3;
# 5006 "sumo/sumoR.c"
  display_x = x28;
# 5007 "sumo/sumoR.c"
  display_y = y29;
# 5009 "sumo/sumoR.c"
  goto Lret_display_goto_xy___2;
  Lret_display_goto_xy___2:
# 5011 "sumo/sumoR.c"
  str44 = "DURATION: ";
# 5012 "sumo/sumoR.c"
  while (*str44) {
# 5013 "sumo/sumoR.c"
    if ((int const )*str44 != 10) {
# 5014 "sumo/sumoR.c"
      display_char((int )*str44);
# 5015 "sumo/sumoR.c"
      display_x ++;
    } else {
# 5017 "sumo/sumoR.c"
      display_x = 0;
# 5018 "sumo/sumoR.c"
      display_y ++;
    }
# 5020 "sumo/sumoR.c"
    str44 ++;
  }
# 5022 "sumo/sumoR.c"
  goto Lret_display_string___7;
  Lret_display_string___7:
# 5025 "sumo/sumoR.c"
  val58 = (int )dc.duration;
# 5026 "sumo/sumoR.c"
  places59 = (U32___4 )0;
# 5028 "sumo/sumoR.c"
  if (val58 < 0) {
# 5029 "sumo/sumoR.c"
    tmp60 = - val58;
  } else {
# 5031 "sumo/sumoR.c"
    tmp60 = val58;
  }
# 5033 "sumo/sumoR.c"
  display_unsigned_worker((U32 )tmp60, places59, (U32 )(val58 < 0));
# 5034 "sumo/sumoR.c"
  goto Lret_display_int___2;
  Lret_display_int___2:
# 5037 "sumo/sumoR.c"
  ReleaseResource(DrivingControlResource);
# 5038 "sumo/sumoR.c"
  x30 = 0;
# 5039 "sumo/sumoR.c"
  y31 = 4;
# 5040 "sumo/sumoR.c"
  display_x = x30;
# 5041 "sumo/sumoR.c"
  display_y = y31;
# 5043 "sumo/sumoR.c"
  goto Lret_display_goto_xy___3;
  Lret_display_goto_xy___3:
# 5045 "sumo/sumoR.c"
  str45 = "SYSTEM: ";
# 5046 "sumo/sumoR.c"
  while (*str45) {
# 5047 "sumo/sumoR.c"
    if ((int const )*str45 != 10) {
# 5048 "sumo/sumoR.c"
      display_char((int )*str45);
# 5049 "sumo/sumoR.c"
      display_x ++;
    } else {
# 5051 "sumo/sumoR.c"
      display_x = 0;
# 5052 "sumo/sumoR.c"
      display_y ++;
    }
# 5054 "sumo/sumoR.c"
    str45 ++;
  }
# 5056 "sumo/sumoR.c"
  goto Lret_display_string___8;
  Lret_display_string___8:
# 5059 "sumo/sumoR.c"
  tmp = systick_get_ms();
# 5060 "sumo/sumoR.c"
  val61 = (int )tmp;
# 5061 "sumo/sumoR.c"
  places62 = (U32___4 )0;
# 5063 "sumo/sumoR.c"
  if (val61 < 0) {
# 5064 "sumo/sumoR.c"
    tmp63 = - val61;
  } else {
# 5066 "sumo/sumoR.c"
    tmp63 = val61;
  }
# 5068 "sumo/sumoR.c"
  display_unsigned_worker((U32 )tmp63, places62, (U32 )(val61 < 0));
# 5069 "sumo/sumoR.c"
  goto Lret_display_int___3;
  Lret_display_int___3:
# 5072 "sumo/sumoR.c"
  port_id9 = (U8___3 )0;
# 5073 "sumo/sumoR.c"
  ret_ecrobot_get_nxtcolorsensor_light10 = sensor_data[port_id9].light;
# 5075 "sumo/sumoR.c"
  goto Lret_ecrobot_get_nxtcolorsensor_light;
  Lret_ecrobot_get_nxtcolorsensor_light:
# 5077 "sumo/sumoR.c"
  tmp___0 = ret_ecrobot_get_nxtcolorsensor_light10;
# 5078 "sumo/sumoR.c"
  color = tmp___0;
# 5079 "sumo/sumoR.c"
  x32 = 0;
# 5080 "sumo/sumoR.c"
  y33 = 5;
# 5081 "sumo/sumoR.c"
  display_x = x32;
# 5082 "sumo/sumoR.c"
  display_y = y33;
# 5083 "sumo/sumoR.c"
  goto Lret_display_goto_xy___4;
  Lret_display_goto_xy___4:
# 5085 "sumo/sumoR.c"
  str46 = "COLOR: ";
# 5086 "sumo/sumoR.c"
  while (*str46) {
# 5087 "sumo/sumoR.c"
    if ((int const )*str46 != 10) {
# 5088 "sumo/sumoR.c"
      display_char((int )*str46);
# 5089 "sumo/sumoR.c"
      display_x ++;
    } else {
# 5091 "sumo/sumoR.c"
      display_x = 0;
# 5092 "sumo/sumoR.c"
      display_y ++;
    }
# 5094 "sumo/sumoR.c"
    str46 ++;
  }
# 5096 "sumo/sumoR.c"
  goto Lret_display_string___9;
  Lret_display_string___9:
# 5099 "sumo/sumoR.c"
  val64 = (int )color;
# 5100 "sumo/sumoR.c"
  places65 = (U32___4 )0;
# 5102 "sumo/sumoR.c"
  if (val64 < 0) {
# 5103 "sumo/sumoR.c"
    tmp66 = - val64;
  } else {
# 5105 "sumo/sumoR.c"
    tmp66 = val64;
  }
# 5107 "sumo/sumoR.c"
  display_unsigned_worker((U32 )tmp66, places65, (U32 )(val64 < 0));
# 5108 "sumo/sumoR.c"
  goto Lret_display_int___4;
  Lret_display_int___4:
# 5111 "sumo/sumoR.c"
  port_id6 = (U8___3 )1;
# 5112 "sumo/sumoR.c"
  tmp7 = i2c_busy((int )port_id6);
# 5114 "sumo/sumoR.c"
  if (tmp7 == 0) {
# 5116 "sumo/sumoR.c"
    port11 = (int )port_id6;
# 5117 "sumo/sumoR.c"
    address12 = (U32___1 )1;
# 5118 "sumo/sumoR.c"
    internal_address13 = 66;
# 5119 "sumo/sumoR.c"
    n_internal_address_bytes14 = 1;
# 5121 "sumo/sumoR.c"
    nbytes16 = (U32___1 )1;
# 5122 "sumo/sumoR.c"
    write17 = 0;
# 5123 "sumo/sumoR.c"
    if (port11 < 0) {
# 5124 "sumo/sumoR.c"
      goto Lret_i2c_start_transaction;
    } else
# 5126 "sumo/sumoR.c"
    if (port11 >= 4) {
# 5127 "sumo/sumoR.c"
      goto Lret_i2c_start_transaction;
    }
# 5129 "sumo/sumoR.c"
    tmp20 = i2c_busy(port11);
# 5130 "sumo/sumoR.c"
    if (tmp20) {
# 5131 "sumo/sumoR.c"
      goto Lret_i2c_start_transaction;
    }
# 5133 "sumo/sumoR.c"
    p18 = & i2c_port[port11];
# 5134 "sumo/sumoR.c"
    p18->pt_num = (U32___0 )0;
# 5135 "sumo/sumoR.c"
    p18->pt_begun = (U32___0 )0;
# 5136 "sumo/sumoR.c"
    pt19 = p18->partial_transaction;
# 5137 "sumo/sumoR.c"
    p18->current_pt = pt19;
# 5138 "sumo/sumoR.c"
    memset((void *)pt19, 0, sizeof(p18->partial_transaction));
# 5139 "sumo/sumoR.c"
    if (n_internal_address_bytes14 > 0) {
# 5140 "sumo/sumoR.c"
      p18->addr_int[0] = (U8___0 )(address12 << 1);
# 5141 "sumo/sumoR.c"
      p18->addr_int[1] = (U8___0 )internal_address13;
# 5142 "sumo/sumoR.c"
      pt19->start = (U8___0 )1;
# 5143 "sumo/sumoR.c"
      if (write17) {
# 5144 "sumo/sumoR.c"
        pt19->stop = (U8___0 )0;
      } else {
# 5146 "sumo/sumoR.c"
        pt19->stop = (U8___0 )1;
      }
# 5148 "sumo/sumoR.c"
      pt19->tx = (U8___0 )1;
# 5149 "sumo/sumoR.c"
      pt19->data = p18->addr_int;
# 5150 "sumo/sumoR.c"
      pt19->nbytes = (U16___0 )2;
# 5151 "sumo/sumoR.c"
      pt19 ++;
    }
# 5153 "sumo/sumoR.c"
    if (n_internal_address_bytes14 == 0) {
# 5154 "sumo/sumoR.c"
      goto _L;
    } else
# 5156 "sumo/sumoR.c"
    if (! write17) {
      _L:
# 5158 "sumo/sumoR.c"
      if (n_internal_address_bytes14 > 0) {
# 5159 "sumo/sumoR.c"
        pt19->start = (U8___0 )0;
      } else {
# 5161 "sumo/sumoR.c"
        pt19->start = (U8___0 )1;
      }
# 5163 "sumo/sumoR.c"
      pt19->restart = (U8___0 )(! pt19->start);
# 5164 "sumo/sumoR.c"
      pt19->stop = (U8___0 )0;
# 5165 "sumo/sumoR.c"
      pt19->tx = (U8___0 )1;
# 5166 "sumo/sumoR.c"
      if (write17) {
# 5167 "sumo/sumoR.c"
        tmp___021 = 0;
      } else {
# 5169 "sumo/sumoR.c"
        tmp___021 = 1;
      }
# 5171 "sumo/sumoR.c"
      p18->addr = (U8___0 )((address12 << 1) | (unsigned long )tmp___021);
# 5172 "sumo/sumoR.c"
      pt19->data = & p18->addr;
# 5173 "sumo/sumoR.c"
      pt19->nbytes = (U16___0 )1;
# 5174 "sumo/sumoR.c"
      pt19 ++;
    }
# 5176 "sumo/sumoR.c"
    pt19->start = (U8___0 )0;
# 5177 "sumo/sumoR.c"
    pt19->stop = (U8___0 )1;
# 5178 "sumo/sumoR.c"
    if (write17) {
# 5179 "sumo/sumoR.c"
      pt19->tx = (U8___0 )1;
    } else {
# 5181 "sumo/sumoR.c"
      pt19->tx = (U8___0 )0;
    }
# 5183 "sumo/sumoR.c"
    pt19->data = data15;
# 5184 "sumo/sumoR.c"
    pt19->nbytes = (U16___0 )nbytes16;
# 5185 "sumo/sumoR.c"
    pt19->last_pt = (U8___0 )1;
# 5186 "sumo/sumoR.c"
    p18->state = (i2c_port_state )2;
# 5187 "sumo/sumoR.c"
    goto Lret_i2c_start_transaction;
    Lret_i2c_start_transaction: ;
  }
# 5190 "sumo/sumoR.c"
  ret_ecrobot_get_sonar_sensor8 = distance_state[port_id6];
# 5191 "sumo/sumoR.c"
  goto Lret_ecrobot_get_sonar_sensor;
  Lret_ecrobot_get_sonar_sensor:
# 5193 "sumo/sumoR.c"
  tmp___1 = ret_ecrobot_get_sonar_sensor8;
# 5194 "sumo/sumoR.c"
  sonar = tmp___1;
# 5195 "sumo/sumoR.c"
  x34 = 0;
# 5196 "sumo/sumoR.c"
  y35 = 6;
# 5197 "sumo/sumoR.c"
  display_x = x34;
# 5198 "sumo/sumoR.c"
  display_y = y35;
# 5199 "sumo/sumoR.c"
  goto Lret_display_goto_xy___5;
  Lret_display_goto_xy___5:
# 5201 "sumo/sumoR.c"
  str47 = "SONAR: ";
# 5202 "sumo/sumoR.c"
  while (*str47) {
# 5203 "sumo/sumoR.c"
    if ((int const )*str47 != 10) {
# 5204 "sumo/sumoR.c"
      display_char((int )*str47);
# 5205 "sumo/sumoR.c"
      display_x ++;
    } else {
# 5207 "sumo/sumoR.c"
      display_x = 0;
# 5208 "sumo/sumoR.c"
      display_y ++;
    }
# 5210 "sumo/sumoR.c"
    str47 ++;
  }
# 5212 "sumo/sumoR.c"
  goto Lret_display_string___10;
  Lret_display_string___10:
# 5215 "sumo/sumoR.c"
  val67 = (int )sonar;
# 5216 "sumo/sumoR.c"
  places68 = (U32___4 )0;
# 5218 "sumo/sumoR.c"
  if (val67 < 0) {
# 5219 "sumo/sumoR.c"
    tmp69 = - val67;
  } else {
# 5221 "sumo/sumoR.c"
    tmp69 = val67;
  }
# 5223 "sumo/sumoR.c"
  display_unsigned_worker((U32 )tmp69, places68, (U32 )(val67 < 0));
# 5224 "sumo/sumoR.c"
  goto Lret_display_int___5;
  Lret_display_int___5:
# 5227 "sumo/sumoR.c"
  str48 = " / ";
# 5229 "sumo/sumoR.c"
  while (*str48) {
# 5230 "sumo/sumoR.c"
    if ((int const )*str48 != 10) {
# 5231 "sumo/sumoR.c"
      display_char((int )*str48);
# 5232 "sumo/sumoR.c"
      display_x ++;
    } else {
# 5234 "sumo/sumoR.c"
      display_x = 0;
# 5235 "sumo/sumoR.c"
      display_y ++;
    }
# 5237 "sumo/sumoR.c"
    str48 ++;
  }
# 5239 "sumo/sumoR.c"
  goto Lret_display_string___11;
  Lret_display_string___11:
# 5242 "sumo/sumoR.c"
  val70 = (int )LastSonarValue;
# 5243 "sumo/sumoR.c"
  places71 = (U32___4 )0;
# 5245 "sumo/sumoR.c"
  if (val70 < 0) {
# 5246 "sumo/sumoR.c"
    tmp72 = - val70;
  } else {
# 5248 "sumo/sumoR.c"
    tmp72 = val70;
  }
# 5250 "sumo/sumoR.c"
  display_unsigned_worker((U32 )tmp72, places71, (U32 )(val70 < 0));
# 5251 "sumo/sumoR.c"
  goto Lret_display_int___6;
  Lret_display_int___6:
# 5254 "sumo/sumoR.c"
  display_update();
# 5255 "sumo/sumoR.c"
  TerminateTask();
# 5257 "sumo/sumoR.c"
  return;
}
}
# 5260 "sumo/sumoR.c"
extern int create_block() ;
# 5261 "sumo/sumoR.c"
extern int create_task() ;
# 5262 "sumo/sumoR.c"
void main(void)
{


  {
# 5268 "sumo/sumoR.c"
  create_task("TaskMainDisplayTask", "TaskMainDisplayTask", 1, 250, 9.411);
# 5269 "sumo/sumoR.c"
  create_task("TaskMainColorSensorTask", "TaskMainColorSensorTask", 5, 100, 0.068);
# 5270 "sumo/sumoR.c"
  create_task("TaskMainSonarSensorTask", "TaskMainSonarSensorTask", 2, 100, 11.994);
# 5271 "sumo/sumoR.c"
  create_task("TaskMainMotorControlTask", "TaskMainMotorControlTask", 1, 50, 9.074);
# 5272 "sumo/sumoR.c"
  create_block(4278, "TaskMainMotorControlTask", "DrivingControlResource", 1, 1, 0.071);
# 5273 "sumo/sumoR.c"
  create_block(4409, "TaskMainColorSensorTask", "DrivingControlResource", 2, 2, 0.028);
# 5274 "sumo/sumoR.c"
  create_block(4414, "TaskMainColorSensorTask", "DrivingControlResource", 2, 2, 0.02);
# 5275 "sumo/sumoR.c"
  create_block(4828, "TaskMainDisplayTask", "DrivingControlResource", 1, 10, 0.22);
# 5276 "sumo/sumoR.c"
  create_block(4587, "TaskMainSonarSensorTask", "DrivingControlResource", 8, 5, 0.019);
# 5277 "sumo/sumoR.c"
  create_block(4622, "TaskMainSonarSensorTask", "DrivingControlResource", 8, 5, 0.018);
# 5278 "sumo/sumoR.c"
  create_block(4641, "TaskMainSonarSensorTask", "DrivingControlResource", 8, 5, 0.01);
# 5279 "sumo/sumoR.c"
  create_block(4649, "TaskMainSonarSensorTask", "DrivingControlResource", 8, 5, 0.018);
# 5280 "sumo/sumoR.c"
  create_block(4669, "TaskMainSonarSensorTask", "DrivingControlResource", 8, 5, 0.012);
# 5281 "sumo/sumoR.c"
  create_block(4677, "TaskMainSonarSensorTask", "DrivingControlResource", 8, 5, 0.019);
# 5282 "sumo/sumoR.c"
  create_block(4703, "TaskMainSonarSensorTask", "DrivingControlResource", 8, 5, 0.022);
# 5283 "sumo/sumoR.c"
  create_block(4730, "TaskMainSonarSensorTask", "DrivingControlResource", 8, 5, 0.019);
# 5284 "sumo/sumoR.c"
  return;
}
}
