/* Generated by CIL v. 1.7.3 */
/* print_CIL_Input is true */

#line 4 "biped_robot/biped_robot.c"
typedef unsigned char U8;
#line 5 "biped_robot/biped_robot.c"
typedef unsigned short U16;
#line 6 "biped_robot/biped_robot.c"
typedef short S16;
#line 7
enum __anonenum_motionCmd_t_622667461 {
    NEUTRAL = 0,
    STAND_UP = 1,
    FORWARD = 2,
    RIGHT_TURN = 3,
    LEFT_TURN = 4
} ;
#line 14 "biped_robot/biped_robot.c"
typedef enum __anonenum_motionCmd_t_622667461 motionCmd_t;
#line 15 "biped_robot/biped_robot.c"
struct __anonstruct_motion_t_763372307 {
   S16 angle[1][10] ;
   U16 wait ;
};
#line 19 "biped_robot/biped_robot.c"
typedef struct __anonstruct_motion_t_763372307 motion_t;
#line 20 "biped_robot/biped_robot.c"
struct __anonstruct_motionTable_t_630939579 {
   motion_t *pMotion ;
   int steps ;
};
#line 24 "biped_robot/biped_robot.c"
typedef struct __anonstruct_motionTable_t_630939579 motionTable_t;
#line 25 "biped_robot/biped_robot.c"
typedef unsigned char UINT8___0;
#line 27 "biped_robot/biped_robot.c"
typedef UINT8___0 TaskType___0;
#line 28 "biped_robot/biped_robot.c"
typedef UINT8___0 ResourceType___0;
#line 30 "biped_robot/biped_robot.c"
typedef unsigned char U8___0;
#line 31 "biped_robot/biped_robot.c"
typedef signed char S8___0;
#line 32 "biped_robot/biped_robot.c"
typedef unsigned long U32___0;
#line 33 "biped_robot/biped_robot.c"
typedef enum __anonenum_motionCmd_t_622667461 motionCmd_t___0;
#line 34
enum __anonenum_motionCmd_t_763372308 {
    NEUTRAL___1 = 0,
    STAND_UP___1 = 1,
    FORWARD___1 = 2,
    RIGHT_TURN___1 = 3,
    LEFT_TURN___1 = 4
} ;
#line 41 "biped_robot/biped_robot.c"
typedef enum __anonenum_motionCmd_t_763372308 motionCmd_t___1;
#line 44
extern unsigned long ecrobot_read_bt_packet(unsigned char *buf , unsigned long bufLen ) ;
#line 47
extern void ecrobot_status_monitor(char const   *target_name ) ;
#line 51
extern unsigned char TerminateTask(void) ;
#line 52
extern unsigned char ChainTask(unsigned char tskid ) ;
#line 53
extern unsigned char GetTaskID(unsigned char *p_tskid ) ;
#line 54
extern unsigned char GetResource(unsigned char resid ) ;
#line 55
extern unsigned char ReleaseResource(unsigned char resid ) ;
#line 68
extern int setServo(U8 port_id , motion_t *motion ) ;
#line 70 "biped_robot/biped_robot.c"
motion_t const   PRM_NEUTRAL[1]  = {      {{{(S16 )1000, (S16 )1000, (S16 )1000, (S16 )1000, (S16 )1000, (S16 )1000, (S16 )1000,
        (S16 )1000, (S16 )1000, (S16 )1000}}, (U16 )0}};
#line 72 "biped_robot/biped_robot.c"
motion_t const   PRM_STAND_UP[1]  = {      {{{(S16 )1000, (S16 )1000, (S16 )800, (S16 )1200, (S16 )800, (S16 )1200, (S16 )800,
        (S16 )1200, (S16 )1000, (S16 )1000}}, (U16 )500}};
#line 74 "biped_robot/biped_robot.c"
motion_t const   PRM_FORWARD[9]  = 
#line 74
  {      {{{(S16 )950, (S16 )950, (S16 )-1, (S16 )-1, (S16 )-1, (S16 )-1, (S16 )850, (S16 )-1,
        (S16 )-1, (S16 )1050}}, (U16 )200}, 
        {{{(S16 )-1, (S16 )-1, (S16 )300, (S16 )-1, (S16 )400, (S16 )-1, (S16 )900, (S16 )-1,
        (S16 )1050, (S16 )1100}}, (U16 )100}, 
        {{{(S16 )-1, (S16 )-1, (S16 )200, (S16 )1100, (S16 )-1, (S16 )-1, (S16 )-1, (S16 )1350,
        (S16 )850, (S16 )900}}, (U16 )200}, 
        {{{(S16 )-1, (S16 )-1, (S16 )800, (S16 )-1, (S16 )800, (S16 )-1, (S16 )850, (S16 )-1,
        (S16 )-1, (S16 )-1}}, (U16 )0}, 
        {{{(S16 )-1, (S16 )-1, (S16 )-1, (S16 )1600, (S16 )-1, (S16 )1500, (S16 )-1,
        (S16 )-1, (S16 )-1, (S16 )-1}}, (U16 )200}, 
        {{{(S16 )-1, (S16 )-1, (S16 )-1, (S16 )-1, (S16 )-1, (S16 )-1, (S16 )-1, (S16 )1200,
        (S16 )-1, (S16 )-1}}, (U16 )0}, 
        {{{(S16 )-1, (S16 )-1, (S16 )-1, (S16 )-1, (S16 )-1, (S16 )-1, (S16 )700, (S16 )-1,
        (S16 )1100, (S16 )1150}}, (U16 )100}, 
        {{{(S16 )-1, (S16 )-1, (S16 )-1, (S16 )1200, (S16 )-1, (S16 )1200, (S16 )-1,
        (S16 )-1, (S16 )1000, (S16 )1050}}, (U16 )200}, 
        {{{(S16 )-1, (S16 )-1, (S16 )-1, (S16 )-1, (S16 )-1, (S16 )-1, (S16 )850, (S16 )-1,
        (S16 )-1, (S16 )-1}}, (U16 )100}};
#line 93 "biped_robot/biped_robot.c"
motion_t const   PRM_RIGHT_TURN[9]  = 
#line 93
  {      {{{(S16 )1050, (S16 )1050, (S16 )-1, (S16 )-1, (S16 )-1, (S16 )-1, (S16 )850,
        (S16 )-1, (S16 )-1, (S16 )1050}}, (U16 )200}, 
        {{{(S16 )-1, (S16 )-1, (S16 )300, (S16 )-1, (S16 )400, (S16 )-1, (S16 )900, (S16 )-1,
        (S16 )1050, (S16 )1100}}, (U16 )100}, 
        {{{(S16 )-1, (S16 )-1, (S16 )200, (S16 )1100, (S16 )-1, (S16 )-1, (S16 )-1, (S16 )1350,
        (S16 )850, (S16 )900}}, (U16 )200}, 
        {{{(S16 )-1, (S16 )-1, (S16 )800, (S16 )-1, (S16 )800, (S16 )-1, (S16 )850, (S16 )-1,
        (S16 )-1, (S16 )-1}}, (U16 )0}, 
        {{{(S16 )-1, (S16 )-1, (S16 )-1, (S16 )1600, (S16 )-1, (S16 )1500, (S16 )-1,
        (S16 )-1, (S16 )-1, (S16 )-1}}, (U16 )200}, 
        {{{(S16 )-1, (S16 )-1, (S16 )-1, (S16 )-1, (S16 )-1, (S16 )-1, (S16 )-1, (S16 )1200,
        (S16 )-1, (S16 )-1}}, (U16 )0}, 
        {{{(S16 )-1, (S16 )-1, (S16 )-1, (S16 )-1, (S16 )-1, (S16 )-1, (S16 )700, (S16 )-1,
        (S16 )1100, (S16 )1150}}, (U16 )100}, 
        {{{(S16 )-1, (S16 )-1, (S16 )-1, (S16 )1200, (S16 )-1, (S16 )1200, (S16 )-1,
        (S16 )-1, (S16 )1000, (S16 )1050}}, (U16 )200}, 
        {{{(S16 )-1, (S16 )-1, (S16 )-1, (S16 )-1, (S16 )-1, (S16 )-1, (S16 )850, (S16 )-1,
        (S16 )-1, (S16 )-1}}, (U16 )100}};
#line 112 "biped_robot/biped_robot.c"
motion_t const   PRM_LEFT_TURN[9]  = 
#line 112
  {      {{{(S16 )950, (S16 )950, (S16 )-1, (S16 )-1, (S16 )-1, (S16 )-1, (S16 )-1, (S16 )1150,
        (S16 )950, (S16 )-1}}, (U16 )200}, 
        {{{(S16 )-1, (S16 )-1, (S16 )-1, (S16 )1700, (S16 )-1, (S16 )1600, (S16 )-1,
        (S16 )1100, (S16 )900, (S16 )950}}, (U16 )100}, 
        {{{(S16 )-1, (S16 )-1, (S16 )900, (S16 )1800, (S16 )-1, (S16 )-1, (S16 )650,
        (S16 )-1, (S16 )1100, (S16 )1150}}, (U16 )200}, 
        {{{(S16 )-1, (S16 )-1, (S16 )-1, (S16 )1200, (S16 )-1, (S16 )1200, (S16 )-1,
        (S16 )1150, (S16 )-1, (S16 )-1}}, (U16 )0}, 
        {{{(S16 )-1, (S16 )-1, (S16 )400, (S16 )-1, (S16 )500, (S16 )-1, (S16 )-1, (S16 )-1,
        (S16 )-1, (S16 )-1}}, (U16 )200}, 
        {{{(S16 )-1, (S16 )-1, (S16 )-1, (S16 )-1, (S16 )-1, (S16 )-1, (S16 )800, (S16 )-1,
        (S16 )-1, (S16 )-1}}, (U16 )0}, 
        {{{(S16 )-1, (S16 )-1, (S16 )-1, (S16 )-1, (S16 )-1, (S16 )-1, (S16 )-1, (S16 )1300,
        (S16 )850, (S16 )900}}, (U16 )100}, 
        {{{(S16 )-1, (S16 )-1, (S16 )800, (S16 )-1, (S16 )800, (S16 )-1, (S16 )-1, (S16 )-1,
        (S16 )950, (S16 )1000}}, (U16 )200}, 
        {{{(S16 )-1, (S16 )-1, (S16 )-1, (S16 )-1, (S16 )-1, (S16 )-1, (S16 )-1, (S16 )1150,
        (S16 )-1, (S16 )-1}}, (U16 )100}};
#line 131 "biped_robot/biped_robot.c"
motionTable_t const   motionTable[5]  = {      {(motion_t *)(PRM_NEUTRAL), (int )(sizeof(PRM_NEUTRAL) / sizeof(motion_t ))}, 
        {(motion_t *)(PRM_STAND_UP),
      (int )(sizeof(PRM_STAND_UP) / sizeof(motion_t ))}, 
        {(motion_t *)(PRM_FORWARD), (int )(sizeof(PRM_FORWARD) / sizeof(motion_t ))}, 
        {(motion_t *)(PRM_RIGHT_TURN),
      (int )(sizeof(PRM_RIGHT_TURN) / sizeof(motion_t ))}, 
        {(motion_t *)(PRM_LEFT_TURN), (int )(sizeof(PRM_LEFT_TURN) / sizeof(motion_t ))}};
#line 194
extern ResourceType___0 ResourceCommand ;
#line 196 "biped_robot/biped_robot.c"
static motionCmd_t___1 motionCmd  ;
#line 230 "biped_robot/biped_robot.c"
void TaskMainTask_Init(void) 
{ 


  {
#line 235
  return;
}
}
#line 238 "biped_robot/biped_robot.c"
void TaskMainTask_Commander(void) 
{ 
  U8___0 bt_receive_buf[32] ;
  U32___0 tmp ;
  S8___0 in13 ;
  S8___0 in24 ;
  motionCmd_t___1 cmd5 ;
  motionCmd_t___1 ret_getMotionCommand6 ;

  {
#line 248
  tmp = ecrobot_read_bt_packet(bt_receive_buf, (U32___0 )32);
#line 249
  if (tmp) {
#line 250
    GetResource(ResourceCommand);
#line 251
    in13 = (S8___0 )(- ((int )*((S8___0 *)(& bt_receive_buf[0]))));
#line 252
    in24 = *((S8___0 *)(& bt_receive_buf[1]));
#line 253
    cmd5 = (motionCmd_t___1 )1;
#line 254
    if ((int )in13 == 0) {
#line 255
      if ((int )in24 > 0) {
#line 256
        cmd5 = (motionCmd_t___1 )3;
      } else
#line 258
      if ((int )in24 < 0) {
#line 259
        cmd5 = (motionCmd_t___1 )4;
      }
    } else
#line 262
    if ((int )in13 > 0) {
#line 263
      if ((int )in24 == 0) {
#line 264
        cmd5 = (motionCmd_t___1 )2;
      }
    }
#line 267
    ret_getMotionCommand6 = cmd5;
#line 268
    goto Lret_getMotionCommand;
    Lret_getMotionCommand: 
#line 270
    motionCmd = ret_getMotionCommand6;
#line 271
    ReleaseResource(ResourceCommand);
  }
#line 273
  TerminateTask();
#line 274
  return;
}
}
#line 277 "biped_robot/biped_robot.c"
void TaskMainTask_Display(void) 
{ 


  {
#line 282
  ecrobot_status_monitor("BIPED ROBOT");
#line 283
  TerminateTask();
#line 284
  return;
}
}
#line 287 "biped_robot/biped_robot.c"
void TaskMainTask_MotionControl(void) 
{ 
  motionCmd_t___1 cmd ;
  TaskType___0 t ;
  U8 port_id3 ;
  motionCmd_t cmd4 ;
  int i5 ;
  int tmp6 ;

  {
#line 298
  GetResource(ResourceCommand);
#line 299
  cmd = motionCmd;
#line 300
  ReleaseResource(ResourceCommand);
#line 301
  port_id3 = (U8___0 )2;
#line 302
  cmd4 = (motionCmd_t___0 )cmd;
#line 304
  if ((unsigned long )cmd4 >= sizeof(motionTable)) {
#line 305
    goto Lret_setMotion;
  }
#line 307
  i5 = 0;
#line 308
  while (i5 < (int )motionTable[cmd4].steps) {
#line 309
    tmp6 = setServo(port_id3, (motion_t *)(motionTable[cmd4].pMotion + i5));
#line 310
    if (tmp6 == 0) {
#line 311
      i5 --;
#line 312
      if (i5 < 0) {
#line 313
        i5 = 0;
      }
    }
#line 316
    i5 ++;
  }
#line 318
  goto Lret_setMotion;
  Lret_setMotion: 
#line 321
  GetTaskID(& t);
#line 322
  ChainTask(t);
#line 324
  return;
}
}
#line 327
extern int create_task() ;
#line 328
extern int create_block() ;
#line 329 "biped_robot/biped_robot.c"
void main(void) 
{ 


  {
#line 332
  create_task("TaskMainTask_Commander", "TaskMainTask_Commander", 3, 5, 0.025);
#line 333
  create_task("TaskMainTask_Display", "TaskMainTask_Display", 2, 500, 0.01);
#line 334
  create_task("TaskMainTask_MotionControl", "TaskMainTask_MotionControl", 1, 999,
              0.052);
#line 335
  create_block(298, "TaskMainTask_Display", "motionCommand", 1, 2, 0.011);
#line 336
  create_block(250, "TaskMainTask_Commander", "motionCommand", 1, 3, 0.021);
#line 337
  return;
}
}
