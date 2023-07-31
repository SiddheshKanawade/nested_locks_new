# 1 "./biped_robot.cil.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "/usr/include/stdc-predef.h" 1 3 4
# 1 "<command-line>" 2
# 1 "./biped_robot.cil.c"
# 4 "biped_robot/biped_robot.c"
typedef unsigned char U8;
# 5 "biped_robot/biped_robot.c"
typedef unsigned short U16;
# 6 "biped_robot/biped_robot.c"
typedef short S16;
# 7 "biped_robot/biped_robot.c"
enum __anonenum_motionCmd_t_622667461 {
    NEUTRAL = 0,
    STAND_UP = 1,
    FORWARD = 2,
    RIGHT_TURN = 3,
    LEFT_TURN = 4
} ;
# 14 "biped_robot/biped_robot.c"
typedef enum __anonenum_motionCmd_t_622667461 motionCmd_t;
# 15 "biped_robot/biped_robot.c"
struct __anonstruct_motion_t_763372307 {
   S16 angle[1][10] ;
   U16 wait ;
};
# 19 "biped_robot/biped_robot.c"
typedef struct __anonstruct_motion_t_763372307 motion_t;
# 20 "biped_robot/biped_robot.c"
struct __anonstruct_motionTable_t_630939579 {
   motion_t *pMotion ;
   int steps ;
};
# 24 "biped_robot/biped_robot.c"
typedef struct __anonstruct_motionTable_t_630939579 motionTable_t;
# 25 "biped_robot/biped_robot.c"
typedef unsigned char UINT8___0;
# 27 "biped_robot/biped_robot.c"
typedef UINT8___0 TaskType___0;
# 28 "biped_robot/biped_robot.c"
typedef UINT8___0 ResourceType___0;
# 30 "biped_robot/biped_robot.c"
typedef unsigned char U8___0;
# 31 "biped_robot/biped_robot.c"
typedef signed char S8___0;
# 32 "biped_robot/biped_robot.c"
typedef unsigned long U32___0;
# 33 "biped_robot/biped_robot.c"
typedef enum __anonenum_motionCmd_t_622667461 motionCmd_t___0;
# 34 "biped_robot/biped_robot.c"
enum __anonenum_motionCmd_t_763372308 {
    NEUTRAL___1 = 0,
    STAND_UP___1 = 1,
    FORWARD___1 = 2,
    RIGHT_TURN___1 = 3,
    LEFT_TURN___1 = 4
} ;
# 41 "biped_robot/biped_robot.c"
typedef enum __anonenum_motionCmd_t_763372308 motionCmd_t___1;
# 44 "biped_robot/biped_robot.c"
extern unsigned long ecrobot_read_bt_packet(unsigned char *buf , unsigned long bufLen ) ;
# 47 "biped_robot/biped_robot.c"
extern void ecrobot_status_monitor(char const *target_name ) ;
# 51 "biped_robot/biped_robot.c"
extern unsigned char TerminateTask(void) ;
# 52 "biped_robot/biped_robot.c"
extern unsigned char ChainTask(unsigned char tskid ) ;
# 53 "biped_robot/biped_robot.c"
extern unsigned char GetTaskID(unsigned char *p_tskid ) ;
# 54 "biped_robot/biped_robot.c"
extern unsigned char GetResource(unsigned char resid ) ;
# 55 "biped_robot/biped_robot.c"
extern unsigned char ReleaseResource(unsigned char resid ) ;
# 68 "biped_robot/biped_robot.c"
extern int setServo(U8 port_id , motion_t *motion ) ;
# 70 "biped_robot/biped_robot.c"
motion_t const PRM_NEUTRAL[1] = { {{{(S16 )1000, (S16 )1000, (S16 )1000, (S16 )1000, (S16 )1000, (S16 )1000, (S16 )1000,
        (S16 )1000, (S16 )1000, (S16 )1000}}, (U16 )0}};
# 72 "biped_robot/biped_robot.c"
motion_t const PRM_STAND_UP[1] = { {{{(S16 )1000, (S16 )1000, (S16 )800, (S16 )1200, (S16 )800, (S16 )1200, (S16 )800,
        (S16 )1200, (S16 )1000, (S16 )1000}}, (U16 )500}};
# 74 "biped_robot/biped_robot.c"
motion_t const PRM_FORWARD[9] =
# 74 "biped_robot/biped_robot.c"
  { {{{(S16 )950, (S16 )950, (S16 )-1, (S16 )-1, (S16 )-1, (S16 )-1, (S16 )850, (S16 )-1,
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
# 93 "biped_robot/biped_robot.c"
motion_t const PRM_RIGHT_TURN[9] =
# 93 "biped_robot/biped_robot.c"
  { {{{(S16 )1050, (S16 )1050, (S16 )-1, (S16 )-1, (S16 )-1, (S16 )-1, (S16 )850,
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
# 112 "biped_robot/biped_robot.c"
motion_t const PRM_LEFT_TURN[9] =
# 112 "biped_robot/biped_robot.c"
  { {{{(S16 )950, (S16 )950, (S16 )-1, (S16 )-1, (S16 )-1, (S16 )-1, (S16 )-1, (S16 )1150,
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
# 131 "biped_robot/biped_robot.c"
motionTable_t const motionTable[5] = { {(motion_t *)(PRM_NEUTRAL), (int )(sizeof(PRM_NEUTRAL) / sizeof(motion_t ))},
        {(motion_t *)(PRM_STAND_UP),
      (int )(sizeof(PRM_STAND_UP) / sizeof(motion_t ))},
        {(motion_t *)(PRM_FORWARD), (int )(sizeof(PRM_FORWARD) / sizeof(motion_t ))},
        {(motion_t *)(PRM_RIGHT_TURN),
      (int )(sizeof(PRM_RIGHT_TURN) / sizeof(motion_t ))},
        {(motion_t *)(PRM_LEFT_TURN), (int )(sizeof(PRM_LEFT_TURN) / sizeof(motion_t ))}};
# 194 "biped_robot/biped_robot.c"
extern ResourceType___0 ResourceCommand ;
# 196 "biped_robot/biped_robot.c"
static motionCmd_t___1 motionCmd ;
# 230 "biped_robot/biped_robot.c"
void TaskMainTask_Init(void)
{


  {
# 235 "biped_robot/biped_robot.c"
  return;
}
}
# 238 "biped_robot/biped_robot.c"
void TaskMainTask_Commander(void)
{
  U8___0 bt_receive_buf[32] ;
  U32___0 tmp ;
  S8___0 in13 ;
  S8___0 in24 ;
  motionCmd_t___1 cmd5 ;
  motionCmd_t___1 ret_getMotionCommand6 ;

  {
# 248 "biped_robot/biped_robot.c"
  tmp = ecrobot_read_bt_packet(bt_receive_buf, (U32___0 )32);
# 249 "biped_robot/biped_robot.c"
  if (tmp) {
# 250 "biped_robot/biped_robot.c"
    GetResource(ResourceCommand);
# 251 "biped_robot/biped_robot.c"
    in13 = (S8___0 )(- ((int )*((S8___0 *)(& bt_receive_buf[0]))));
# 252 "biped_robot/biped_robot.c"
    in24 = *((S8___0 *)(& bt_receive_buf[1]));
# 253 "biped_robot/biped_robot.c"
    cmd5 = (motionCmd_t___1 )1;
# 254 "biped_robot/biped_robot.c"
    if ((int )in13 == 0) {
# 255 "biped_robot/biped_robot.c"
      if ((int )in24 > 0) {
# 256 "biped_robot/biped_robot.c"
        cmd5 = (motionCmd_t___1 )3;
      } else
# 258 "biped_robot/biped_robot.c"
      if ((int )in24 < 0) {
# 259 "biped_robot/biped_robot.c"
        cmd5 = (motionCmd_t___1 )4;
      }
    } else
# 262 "biped_robot/biped_robot.c"
    if ((int )in13 > 0) {
# 263 "biped_robot/biped_robot.c"
      if ((int )in24 == 0) {
# 264 "biped_robot/biped_robot.c"
        cmd5 = (motionCmd_t___1 )2;
      }
    }
# 267 "biped_robot/biped_robot.c"
    ret_getMotionCommand6 = cmd5;
# 268 "biped_robot/biped_robot.c"
    goto Lret_getMotionCommand;
    Lret_getMotionCommand:
# 270 "biped_robot/biped_robot.c"
    motionCmd = ret_getMotionCommand6;
# 271 "biped_robot/biped_robot.c"
    ReleaseResource(ResourceCommand);
  }
# 273 "biped_robot/biped_robot.c"
  TerminateTask();
# 274 "biped_robot/biped_robot.c"
  return;
}
}
# 277 "biped_robot/biped_robot.c"
void TaskMainTask_Display(void)
{


  {
# 282 "biped_robot/biped_robot.c"
  ecrobot_status_monitor("BIPED ROBOT");
# 283 "biped_robot/biped_robot.c"
  TerminateTask();
# 284 "biped_robot/biped_robot.c"
  return;
}
}
# 287 "biped_robot/biped_robot.c"
void TaskMainTask_MotionControl(void)
{
  motionCmd_t___1 cmd ;
  TaskType___0 t ;
  U8 port_id3 ;
  motionCmd_t cmd4 ;
  int i5 ;
  int tmp6 ;

  {
# 298 "biped_robot/biped_robot.c"
  GetResource(ResourceCommand);
# 299 "biped_robot/biped_robot.c"
  cmd = motionCmd;
# 300 "biped_robot/biped_robot.c"
  ReleaseResource(ResourceCommand);
# 301 "biped_robot/biped_robot.c"
  port_id3 = (U8___0 )2;
# 302 "biped_robot/biped_robot.c"
  cmd4 = (motionCmd_t___0 )cmd;
# 304 "biped_robot/biped_robot.c"
  if ((unsigned long )cmd4 >= sizeof(motionTable)) {
# 305 "biped_robot/biped_robot.c"
    goto Lret_setMotion;
  }
# 307 "biped_robot/biped_robot.c"
  i5 = 0;
# 308 "biped_robot/biped_robot.c"
  while (i5 < (int )motionTable[cmd4].steps) {
# 309 "biped_robot/biped_robot.c"
    tmp6 = setServo(port_id3, (motion_t *)(motionTable[cmd4].pMotion + i5));
# 310 "biped_robot/biped_robot.c"
    if (tmp6 == 0) {
# 311 "biped_robot/biped_robot.c"
      i5 --;
# 312 "biped_robot/biped_robot.c"
      if (i5 < 0) {
# 313 "biped_robot/biped_robot.c"
        i5 = 0;
      }
    }
# 316 "biped_robot/biped_robot.c"
    i5 ++;
  }
# 318 "biped_robot/biped_robot.c"
  goto Lret_setMotion;
  Lret_setMotion:
# 321 "biped_robot/biped_robot.c"
  GetTaskID(& t);
# 322 "biped_robot/biped_robot.c"
  ChainTask(t);
# 324 "biped_robot/biped_robot.c"
  return;
}
}
# 327 "biped_robot/biped_robot.c"
extern int create_task() ;
# 328 "biped_robot/biped_robot.c"
extern int create_block() ;
# 329 "biped_robot/biped_robot.c"
void main(void)
{


  {
# 332 "biped_robot/biped_robot.c"
  create_task("TaskMainTask_Commander", "TaskMainTask_Commander", 3, 5, 0.025);
# 333 "biped_robot/biped_robot.c"
  create_task("TaskMainTask_Display", "TaskMainTask_Display", 2, 500, 0.01);
# 334 "biped_robot/biped_robot.c"
  create_task("TaskMainTask_MotionControl", "TaskMainTask_MotionControl", 1, 999,
              0.052);
# 335 "biped_robot/biped_robot.c"
  create_block(298, "TaskMainTask_Display", "motionCommand", 1, 2, 0.011);
# 336 "biped_robot/biped_robot.c"
  create_block(250, "TaskMainTask_Commander", "motionCommand", 1, 3, 0.021);
# 337 "biped_robot/biped_robot.c"
  return;
}
}
