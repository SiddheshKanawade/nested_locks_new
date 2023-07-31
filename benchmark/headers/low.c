//#include "kernel.h"

#include "periods.h"
#include "kernel_id.h"
#include "ecrobot_interface.h"
#include <string.h>  
//#include "motor_control.h"
#include "obst_detector.h"
//#include "motor_control.c"
//#include "display.c"
#include <time.h>
#include <stdio.h>

typedef int _boolean;
typedef int _integer;
typedef char* _string;
typedef double _real;
typedef double _double;
typedef float _float;
#define _false 0
#define _true 1


_boolean TerminateTask = 0;

int RIGHT_WHEEL_PORT; 
int LEFT_WHEEL_PORT; 
U32 RIGHT_LIGHT_SENSOR;
U32 LEFT_LIGHT_SENSOR;
int SONAR_SENSOR;

#define V_AVG 1.2
#define V_MAX 3.5

#define LIMIT_SONAR(X) ((X)/2.56)

static int sens_white_cal_right;
static int sens_white_cal_left;
static int sens_black_cal_right;
static int sens_black_cal_left;
static _boolean multi_task_obst = 0;

#define DISPLAY_WIDTH (NXT_LCD_WIDTH)
#define DISPLAY_DEPTH (NXT_LCD_DEPTH)

#define N_CHARS 128
#define FONT_WIDTH 5
#define CELL_WIDTH (FONT_WIDTH + 1)
#define DISPLAY_CHAR_WIDTH (DISPLAY_WIDTH/(CELL_WIDTH))
#define DISPLAY_CHAR_DEPTH (DISPLAY_DEPTH)

#define N_CHARS 128
#define FONT_WIDTH 5
#define CELL_WIDTH (FONT_WIDTH + 1)
#define DISPLAY_CHAR_WIDTH (DISPLAY_WIDTH/(CELL_WIDTH))
#define DISPLAY_CHAR_DEPTH (DISPLAY_DEPTH)

static struct
{
  Object hdr;
  U8 display[DISPLAY_DEPTH+1][DISPLAY_WIDTH];
} __attribute__((packed)) display_array;

static U8 (*display_buffer)[DISPLAY_WIDTH] = display_array.display;

static const U8 font[N_CHARS][FONT_WIDTH] = {
/* 0x00 */ {0x3E, 0x36, 0x2A, 0x36, 0x3E},
/* 0x01 */ {0x3E, 0x55, 0x61, 0x55, 0x3E},
/* 0x02 */ {0x3E, 0x6B, 0x5F, 0x6B, 0x3E},
/* 0x03 */ {0x0C, 0x1E, 0x3C, 0x1E, 0x0C},
/* 0x04 */ {0x08, 0x1C, 0x3E, 0x1C, 0x08},
/* 0x05 */ {0x18, 0x5E, 0x7E, 0x5E, 0x18},
/* 0x06 */ {0x18, 0x5C, 0x7E, 0x5C, 0x18},
/* 0x07 */ {0x3E, 0x36, 0x2A, 0x36, 0x3E},
/* 0x08 */ {0x3E, 0x36, 0x2A, 0x36, 0x3E},
/* 0x09 */ {0x3E, 0x36, 0x2A, 0x36, 0x3E},
/* 0x0A */ {0x3E, 0x36, 0x2A, 0x36, 0x3E},
/* 0x0B */ {0x3E, 0x36, 0x2A, 0x36, 0x3E},
/* 0x0C */ {0x3E, 0x36, 0x2A, 0x36, 0x3E},
/* 0x0D */ {0x3E, 0x36, 0x2A, 0x36, 0x3E},
/* 0x0E */ {0x3E, 0x36, 0x2A, 0x36, 0x3E},
/* 0x0F */ {0x3E, 0x36, 0x2A, 0x36, 0x3E},
/* 0x10 */ {0x3E, 0x36, 0x2A, 0x36, 0x3E},
/* 0x11 */ {0x3E, 0x36, 0x2A, 0x36, 0x3E},
/* 0x12 */ {0x3E, 0x36, 0x2A, 0x36, 0x3E},
/* 0x13 */ {0x3E, 0x36, 0x2A, 0x36, 0x3E},
/* 0x14 */ {0x3E, 0x36, 0x2A, 0x36, 0x3E},
/* 0x15 */ {0x3E, 0x36, 0x2A, 0x36, 0x3E},
/* 0x16 */ {0x3E, 0x36, 0x2A, 0x36, 0x3E},
/* 0x17 */ {0x3E, 0x36, 0x2A, 0x36, 0x3E},
/* 0x18 */ {0x3E, 0x36, 0x2A, 0x36, 0x3E},
/* 0x19 */ {0x3E, 0x36, 0x2A, 0x36, 0x3E},
/* 0x1A */ {0x3E, 0x36, 0x2A, 0x36, 0x3E},
/* 0x1B */ {0x3E, 0x36, 0x2A, 0x36, 0x3E},
/* 0x1C */ {0x3E, 0x36, 0x2A, 0x36, 0x3E},
/* 0x1D */ {0x3E, 0x36, 0x2A, 0x36, 0x3E},
/* 0x1E */ {0x3E, 0x36, 0x2A, 0x36, 0x3E},
/* 0x1F */ {0x3E, 0x36, 0x2A, 0x36, 0x3E},
/* 0x20 */ {0x00, 0x00, 0x00, 0x00, 0x00},
/* 0x21 */ {0x00, 0x00, 0x5F, 0x00, 0x00},
/* 0x22 */ {0x00, 0x07, 0x00, 0x07, 0x00},
/* 0x23 */ {0x14, 0x3E, 0x14, 0x3E, 0x14},
/* 0x24 */ {0x04, 0x2A, 0x7F, 0x2A, 0x10},
/* 0x25 */ {0x26, 0x16, 0x08, 0x34, 0x32},
/* 0x26 */ {0x36, 0x49, 0x59, 0x26, 0x50},
/* 0x27 */ {0x00, 0x00, 0x07, 0x00, 0x00},
/* 0x28 */ {0x00, 0x1C, 0x22, 0x41, 0x00},
/* 0x29 */ {0x00, 0x41, 0x22, 0x1C, 0x00},
/* 0x2A */ {0x2A, 0x1C, 0x7F, 0x1C, 0x2A},
/* 0x2B */ {0x08, 0x08, 0x3E, 0x08, 0x08},
/* 0x2C */ {0x00, 0x50, 0x30, 0x00, 0x00},
/* 0x2D */ {0x08, 0x08, 0x08, 0x08, 0x08},
/* 0x2E */ {0x00, 0x60, 0x60, 0x00, 0x00},
/* 0x2F */ {0x20, 0x10, 0x08, 0x04, 0x02},
/* 0x30 */ {0x3E, 0x51, 0x49, 0x45, 0x3E},
/* 0x31 */ {0x00, 0x42, 0x7F, 0x40, 0x00},
/* 0x32 */ {0x42, 0x61, 0x51, 0x49, 0x46},
/* 0x33 */ {0x21, 0x41, 0x45, 0x4B, 0x31},
/* 0x34 */ {0x18, 0x14, 0x12, 0x7F, 0x10},
/* 0x35 */ {0x27, 0x45, 0x45, 0x45, 0x39},
/* 0x36 */ {0x3C, 0x4A, 0x49, 0x49, 0x30},
/* 0x37 */ {0x01, 0x01, 0x79, 0x05, 0x03},
/* 0x38 */ {0x36, 0x49, 0x49, 0x49, 0x36},
/* 0x39 */ {0x06, 0x49, 0x49, 0x29, 0x1E},
/* 0x3A */ {0x00, 0x36, 0x36, 0x00, 0x00},
/* 0x3B */ {0x00, 0x56, 0x36, 0x00, 0x00},
/* 0x3C */ {0x08, 0x14, 0x22, 0x41, 0x00},
/* 0x3D */ {0x14, 0x14, 0x14, 0x14, 0x14},
/* 0x3E */ {0x41, 0x22, 0x14, 0x08, 0x00},
/* 0x3F */ {0x02, 0x01, 0x59, 0x05, 0x02},
/* 0x40 */ {0x1C, 0x2A, 0x36, 0x3E, 0x0C},
/* 0x41 */ {0x7E, 0x09, 0x09, 0x09, 0x7E},
/* 0x42 */ {0x7F, 0x49, 0x49, 0x49, 0x3E},
/* 0x43 */ {0x3E, 0x41, 0x41, 0x41, 0x22},
/* 0x44 */ {0x7F, 0x41, 0x41, 0x22, 0x1C},
/* 0x45 */ {0x7F, 0x49, 0x49, 0x49, 0x41},
/* 0x46 */ {0x7F, 0x09, 0x09, 0x09, 0x01},
/* 0x47 */ {0x3E, 0x41, 0x41, 0x49, 0x3A},
/* 0x48 */ {0x7F, 0x08, 0x08, 0x08, 0x7F},
/* 0x49 */ {0x00, 0x41, 0x7F, 0x41, 0x00},
/* 0x4A */ {0x20, 0x40, 0x41, 0x3F, 0x01},
/* 0x4B */ {0x7F, 0x08, 0x14, 0x22, 0x41},
/* 0x4C */ {0x7F, 0x40, 0x40, 0x40, 0x40},
/* 0x4D */ {0x7F, 0x02, 0x04, 0x02, 0x7F},
/* 0x4E */ {0x7F, 0x04, 0x08, 0x10, 0x7F},
/* 0x4F */ {0x3E, 0x41, 0x41, 0x41, 0x3E},
/* 0x50 */ {0x7F, 0x09, 0x09, 0x09, 0x06},
/* 0x51 */ {0x3E, 0x41, 0x51, 0x21, 0x5E},
/* 0x52 */ {0x7F, 0x09, 0x19, 0x29, 0x46},
/* 0x53 */ {0x26, 0x49, 0x49, 0x49, 0x32},
/* 0x54 */ {0x01, 0x01, 0x7F, 0x01, 0x01},
/* 0x55 */ {0x3F, 0x40, 0x40, 0x40, 0x3F},
/* 0x56 */ {0x1F, 0x20, 0x40, 0x20, 0x1F},
/* 0x57 */ {0x7F, 0x20, 0x18, 0x20, 0x7F},
/* 0x58 */ {0x63, 0x14, 0x08, 0x14, 0x63},
/* 0x59 */ {0x03, 0x04, 0x78, 0x04, 0x03},
/* 0x5A */ {0x61, 0x51, 0x49, 0x45, 0x43},
/* 0x5B */ {0x00, 0x7F, 0x41, 0x41, 0x00},
/* 0x5C */ {0x02, 0x04, 0x08, 0x10, 0x20},
/* 0x5D */ {0x00, 0x41, 0x41, 0x7F, 0x00},
/* 0x5E */ {0x04, 0x02, 0x01, 0x02, 0x04},
/* 0x5F */ {0x40, 0x40, 0x40, 0x40, 0x40},
/* 0x60 */ {0x00, 0x00, 0x07, 0x00, 0x00},
/* 0x61 */ {0x20, 0x54, 0x54, 0x54, 0x78},
/* 0x62 */ {0x7f, 0x48, 0x44, 0x44, 0x38},
/* 0x63 */ {0x30, 0x48, 0x48, 0x48, 0x20},
/* 0x64 */ {0x38, 0x44, 0x44, 0x48, 0x7f},
/* 0x65 */ {0x38, 0x54, 0x54, 0x54, 0x18},
/* 0x66 */ {0x08, 0x7e, 0x09, 0x09, 0x02},
/* 0x67 */ {0x0c, 0x52, 0x52, 0x52, 0x3e},
/* 0x68 */ {0x7f, 0x08, 0x04, 0x04, 0x78},
/* 0x69 */ {0x00, 0x44, 0x7d, 0x40, 0x00},
/* 0x6A */ {0x20, 0x40, 0x40, 0x3d, 0x00},
/* 0x6B */ {0x7f, 0x10, 0x28, 0x44, 0x00},
/* 0x6C */ {0x00, 0x41, 0x7f, 0x40, 0x00},
/* 0x6D */ {0x7c, 0x04, 0x18, 0x04, 0x78},
/* 0x6E */ {0x7c, 0x08, 0x04, 0x04, 0x78},
/* 0x6F */ {0x38, 0x44, 0x44, 0x44, 0x38},
/* 0x70 */ {0xfc, 0x14, 0x14, 0x14, 0x08},
/* 0x71 */ {0x08, 0x14, 0x14, 0x18, 0x7c},
/* 0x72 */ {0x7c, 0x08, 0x04, 0x04, 0x08},
/* 0x73 */ {0x48, 0x54, 0x54, 0x54, 0x20},
/* 0x74 */ {0x04, 0x3f, 0x44, 0x40, 0x20},
/* 0x75 */ {0x3c, 0x40, 0x40, 0x20, 0x7c},
/* 0x76 */ {0x1c, 0x20, 0x40, 0x20, 0x1c},
/* 0x77 */ {0x3c, 0x40, 0x38, 0x40, 0x3c},
/* 0x78 */ {0x44, 0x28, 0x10, 0x28, 0x44},
/* 0x79 */ {0x0c, 0x50, 0x50, 0x50, 0x3c},
/* 0x7A */ {0x44, 0x64, 0x54, 0x4c, 0x44},
/* 0x7B */ {0x00, 0x08, 0x36, 0x41, 0x00},
/* 0x7C */ {0x00, 0x00, 0x7F, 0x00, 0x00},
/* 0x7D */ {0x00, 0x41, 0x36, 0x08, 0x00},
/* 0x7E */ {0x00, 0x07, 0x00, 0x07, 0x00},
/* 0x7F */ {0x3E, 0x36, 0x2A, 0x36, 0x3E},
};


int display_x;
int display_y;

void
display_goto_xy(int x, int y)
{
  display_x = x;
  display_y = y;
}

void
display_char(int c)
{
  int i;
  U8 *b;
  const U8 *f;

  if (c >= 0 && c < N_CHARS &&
      display_x >= 0 && display_x < DISPLAY_CHAR_WIDTH &&
      display_y >= 0 && display_y < DISPLAY_CHAR_DEPTH) {
    b = &display_buffer[display_y][display_x * CELL_WIDTH];
    f = font[c];
    for (i = 0; i < FONT_WIDTH; i++) {
      *b = *f;
      b++;
      f++;
    }
  }
}

void
display_string(const char *str)
{
  while (*str) {
    if (*str != '\n') {
      display_char(*str);
      display_x++;
    } else {
      display_x = 0;
      display_y++;
    }
    str++;
  }
}

static void
display_unsigned_worker(U32 val, U32 places, U32 sign)
{
  char x[12];			// enough for 10 digits + sign + NULL 

  char *p = &x[11];
  int p_count = 0;


  *p = 0;

  if (places > 11)
    places = 11;

  while (val) {
    p--;
    p_count++;
    *p = (val % 10) + '0';
    val /= 10;
  }

  if (!p_count) {
    p--;
    p_count++;
    *p = '0';
  }

  if (sign) {
    p--;
    p_count++;
    *p = '-';
  }

  while (p_count < places) {
    p--;
    p_count++;
    *p = ' ';
  }

  display_string(p);
}

const U8 *display = (U8 *) 0;
volatile U8 dirty = 0;
#define CD_PIN  (1<<12)
U8 mode = 0xff;

static void spi_set_mode(U8 m)
{
  U32 status;

  /* nothing to do if we are already in the correct mode */
  if (m == mode) return;
  
  /* Wait until all bytes have been sent */
  do {
    status = *AT91C_SPI_SR;
  } while (!(status & 0x200));
  /* Set command or data mode */
  if (m)
    *AT91C_PIOA_SODR = CD_PIN;
  else
    *AT91C_PIOA_CODR = CD_PIN;
  /* remember the current mode */
  mode = m;
}

void
nxt_spi_write(U32 CD, const U8 *data, U32 nBytes)
{
  U32 status;
  U32 cd_mask = (CD ? 0x100 : 0);

  spi_set_mode(CD);
  while (nBytes) {
    *AT91C_SPI_TDR = (*data | cd_mask);
    data++;
    nBytes--;
    /* Wait until byte sent */
    do {
      status = *AT91C_SPI_SR;
    } while (!(status & 0x200));

  }
}

void
nxt_spi_refresh(void)
{
  /* Request the start of a dma refresh of the display 
   */
  // If the display is not set nothing to do.
  if (!display) return;
  // Say we have changes
  dirty = 1;
  // Start the DMA refresh
  *AT91C_SPI_IER = AT91C_SPI_ENDTX;
}



void
nxt_lcd_command(U8 cmd)
{
  U8 tmp = cmd;

  nxt_spi_write(0, &tmp, 1);
}

void
nxt_lcd_set_col(U32 coladdr)
{
  nxt_lcd_command(0x00 | (coladdr & 0xF));
  nxt_lcd_command(0x10 | ((coladdr >> 4) & 0xF));
}

void
nxt_lcd_set_page_address(U32 pa)
{
  nxt_lcd_command(0xB0 | (pa & 0xf));
}

void
nxt_lcd_force_update()
{
  // Update the screen the slow way. Works with interrupts disabled
  int i;
  U8 *disp = display;

  for (i = 0; i < NXT_LCD_DEPTH; i++) {
    nxt_lcd_set_col(0);
    nxt_lcd_set_page_address(i);

    nxt_spi_write(1, disp, NXT_LCD_WIDTH);
    disp += NXT_LCD_WIDTH;
  }
}


void
nxt_lcd_update()
{
#define DMA_REFRESH
#ifdef DMA_REFRESH
  nxt_spi_refresh();
#else
  nxt_lcd_force_update();
#endif
}



void
display_int(int val, U32 places)
{
  display_unsigned_worker((val < 0) ? -val : val, places, (val < 0));
}

int display_tick = 0;
int display_auto_update = 1;

void
display_update(void)
{
  display_tick = 0;
  nxt_lcd_update();
}




void show_var(char* varname, int line, int value) {
	//GetResource(lcd);
	int l;
	display_goto_xy(0, line);
	display_string(varname);
	l = strlen(varname);
	display_goto_xy(l, line);
	display_int(value, 4);
	display_goto_xy(0, line+1);
	display_update();
	//ReleaseResource(lcd);
}


void show_string(char* varname, int line) {
	//GetResource(lcd);
	display_goto_xy(0, line);
	display_string(varname);
	display_goto_xy(0, line+1);
	display_update();
	//ReleaseResource(lcd);
}


void reset_lcd() {
	//GetResource(lcd);
	for (int i = 0; i < 10; i++) {
		display_goto_xy(0, i);
		display_string("                ");
	}
	display_update();
	//ReleaseResource(lcd);
}
/***********************ecrobot()**********************************/
_boolean BTN1, BTN2;

#define ENTER_PRESSED BTN1
#define STOP_PRESSED  BTN2

typedef struct {
  U32 battery_state;
   U8 buttons_state;
} nxt_inputs;

static nxt_inputs ecrobot_inputs;

U8 ecrobot_get_button_state(void)
{
	return ecrobot_inputs.buttons_state;
}

U8 ecrobot_is_ENTER_button_pressed(void)
{
	return ((ecrobot_get_button_state() & ENTER_PRESSED) == ENTER_PRESSED);
}

U16 ecrobot_get_light_sensor(U32 port_id)
{
	return (U16)(port_id);
}

S32 ecrobot_get_sonar_sensor(U8 port_id)
{
	static U8 data[4] = {0};
	return (S32)(port_id);
}
/******************************************************************/
/**********************************systick.c****************************************/
static volatile U32 systick_ms;

void
systick_wait_ms(U32 ms)
{
  volatile U32 final = ms + systick_ms;

  while (systick_ms < final) {
  }
}

/**********************************************************/
void usr_init(void) {
	//GetResource(lcd);

	show_string("White calib", 0);
	while (!ecrobot_is_ENTER_button_pressed());
	sens_white_cal_right = ecrobot_get_light_sensor(RIGHT_LIGHT_SENSOR);
	sens_white_cal_left = ecrobot_get_light_sensor(LEFT_LIGHT_SENSOR);

	systick_wait_ms(1000);

	show_string("Black calib", 0);
	while (!ecrobot_is_ENTER_button_pressed());
	sens_black_cal_right = ecrobot_get_light_sensor(RIGHT_LIGHT_SENSOR);
	sens_black_cal_left = ecrobot_get_light_sensor(LEFT_LIGHT_SENSOR);

	reset_lcd();
	show_string("Calib completed", 0);
	show_var("white_right", 1, sens_white_cal_right);
	show_var("white_left", 2, sens_white_cal_left);
	show_var("black_right", 3, sens_black_cal_right);
	show_var("black_left", 4, sens_black_cal_left);

	systick_wait_ms(1000);
	while (!ecrobot_is_ENTER_button_pressed());
	reset_lcd();

	//ReleaseResource(lcd);
}

void ecrobot_set_motor_speed(U8 port, S8 speed_percent){
	if (speed_percent > 100)
      		speed_percent = 100;
    	if (speed_percent < -100)
      		speed_percent = -100;
}

void output_motor(U32 port, _real speed) {
	int speed_percent;

	if (speed > 100.0) {
		speed_percent = 100;
	} else if (speed < -100.0) {
		speed_percent = -100;
	} else {
		speed_percent = (int)speed;
	}

	ecrobot_set_motor_speed(port, speed_percent); // brake mode = 0 (float?)
}

void motor_control_O_u_d(_real ud) {
	show_var("ud", 5, ud * 100);

	ud += V_AVG;
	_real Pd = ((ud/V_MAX) * 100) + 10;

	show_var("Pd", 3, Pd);

	if (!multi_task_obst) output_motor(RIGHT_WHEEL_PORT, Pd);
}


void motor_control_O_u_g(_real ug) {
	show_var("ug", 6, ug * 100);

	ug += V_AVG;
	_real Pg = ((ug/V_MAX) * 100) + 10;

	show_var("Pg", 4, Pg);

	if (!multi_task_obst) output_motor(LEFT_WHEEL_PORT, Pg);
}

void obst_detector_O_obstacle(_boolean obst) {
	_real Pg = -32;
	_real Pd = 25;

	multi_task_obst = obst;

	if (multi_task_obst) {
		show_var("Pd", 3, Pg);
		show_var("Pg", 4, Pd);
		output_motor(LEFT_WHEEL_PORT, Pg);
		output_motor(RIGHT_WHEEL_PORT, Pd);
	} 
}

/******************************motorcontrol.c*****************************************/
_real pi;
_real kp_teta;
_real ki_teta;

typedef struct  {
   
   //INPUTS
   _real _Cg;
   _real _Cd;
   //OUTPUTS
   _real _u_d;
   _real _u_g;
   //REGISTERS
   _real M22;
   _boolean M22_nil;
   _boolean M19;
} motor_control_ctx;

// Single Static Context
static motor_control_ctx ctx;
/*--------
Output procedures must be defined,
Input procedures must be used:
--------*/
void motor_control_I_Cg(_real V){
   ctx._Cg = V;
}
void motor_control_I_Cd(_real V){
   ctx._Cd = V;
}
extern void motor_control_O_u_d(_real);
extern void motor_control_O_u_g(_real);
#ifdef CKCHECK
extern void motor_control_BOT_u_d();
extern void motor_control_BOT_u_g();
#endif
/*--------
Internal reset input procedure
--------*/
static void motor_control_reset_input(){
   //NOTHING FOR THIS VERSION...
}
/*--------
Reset procedure
--------*/
void motor_control_reset(){
   ctx.M22_nil = _true;
   ctx.M19 = _true;
   motor_control_reset_input();
}
/*--------
Step procedure
--------*/
void motor_control_step(){
//LOCAL VARIABLES
   _real L3;
   _real L14;
   _real L17;
   _real L13;
   _real L11;
   _real L18;
   _real L10;
   _real L8;
   _real L23;
   _real L7;
   _real L30;
   _boolean L29;
   _real L31;
   _real L28;
   _real L27;
   _real L34;
   _real L32;
   _real L26;
   _real L25;
   _real L6;
   _real L2;
   _real L38;
   _real L37;
   _real L36;
   _real T22;
//CODE
   L3 = (1.000000 / 2.000000);
   L14 = (pi / 200.000000);
   L17 = (ctx._Cd - ctx._Cg);
   L13 = (L14 * L17);
   L11 = (0.002000 * L13);
   if (ctx.M19) {
      L18 = 0.000000;
   } else {
      L18 = ctx.M22;
   }
   L10 = (L11 + L18);
   L8 = (ki_teta * L10);
   L23 = (kp_teta * L13);
   L7 = (L8 + L23);
   L30 = (2.000000 * L7);
   L29 = (L30 < 0.000000);
   L31 = (- L30);
   if (L29) {
      L28 = L31;
   } else {
      L28 = L30;
   }
   L27 = (- L28);
   L34 = (ctx._Cd + ctx._Cg);
   L32 = (0.005000 * L34);
   L26 = (L27 + L32);
   L25 = (2.000000 * L26);
   L6 = (L7 + L25);
   L2 = (L3 * L6);
   motor_control_O_u_d(L2);
   L38 = (- L7);
   L37 = (L38 + L25);
   L36 = (L3 * L37);
   motor_control_O_u_g(L36);
   T22 = L10;
   ctx.M22 = T22;
   ctx.M22_nil = _false;
   ctx.M19 = ctx.M19 && !(_true);
}
/***********************************************************************/

void highTask(){
		U16 raw_sensor_right;
	U16 raw_sensor_left;

	raw_sensor_right = ecrobot_get_light_sensor(RIGHT_LIGHT_SENSOR);
	raw_sensor_left = ecrobot_get_light_sensor(LEFT_LIGHT_SENSOR);

	if (raw_sensor_right < sens_white_cal_right) {
		raw_sensor_right = sens_white_cal_right;
	} else if (raw_sensor_right > sens_black_cal_right) {
		raw_sensor_right = sens_black_cal_right;
	}

	if (raw_sensor_left < sens_white_cal_left) {
		raw_sensor_left = sens_white_cal_left;
	} else if (raw_sensor_left > sens_black_cal_left) {
		raw_sensor_left = sens_black_cal_left;
	}

	raw_sensor_right = ((raw_sensor_right - sens_white_cal_right) * 100 /
				(sens_black_cal_right - sens_white_cal_right));

	raw_sensor_left = ((raw_sensor_left - sens_white_cal_left) * 100 /
				(sens_black_cal_left - sens_white_cal_left));

	raw_sensor_right = 100 - raw_sensor_right;
	raw_sensor_left = 100 - raw_sensor_left;

	show_var("raw_right", 0, raw_sensor_right);
	show_var("raw_left", 1, raw_sensor_left);

	motor_control_I_Cd(raw_sensor_right);
	motor_control_I_Cg(raw_sensor_left);
	motor_control_step();

	TerminateTask = 1;//TerminateTask();
}

/************************************obstacle_detector.c***********************************************/

_real white_threshold = 90;
_real black_threshold = 35;
_real obstacle_threshold = 8;

typedef struct  {
   
   //INPUTS
   _real _Co;
   _real _Cg;
   //OUTPUTS
   _boolean _obstacle;
   //REGISTERS
   _boolean M13;
   _boolean M13_nil;
   _boolean M32;
   _boolean M32_nil;
   _boolean M27;
   _boolean M27_nil;
   _boolean M20;
   _boolean M20_nil;
   _boolean M10;
   _boolean M10_nil;
   _boolean M7;
} obst_detector_ctx;

// Single Static Context
static obst_detector_ctx ctx1;
/*--------
Output procedures must be defined,
Input procedures must be used:
--------*/
void obst_detector_I_Co(_real V){
   ctx1._Co = V;
}
void obst_detector_I_Cg(_real V){
   ctx1._Cg = V;
}
extern void obst_detector_O_obstacle(_boolean);
#ifdef CKCHECK
extern void obst_detector_BOT_obstacle();
#endif
/*--------
Internal reset input procedure
--------*/
static void obst_detector_reset_input(){
   //NOTHING FOR THIS VERSION...
}
/*--------
Reset procedure
--------*/
void obst_detector_reset(){
   ctx1.M13_nil = _true;
   ctx1.M32_nil = _true;
   ctx1.M27_nil = _true;
   ctx1.M20_nil = _true;
   ctx1.M10_nil = _true;
   ctx1.M7 = _true;
   obst_detector_reset_input();
}
/*--------
Step procedure
--------*/
void obst_detector_step(){
//LOCAL VARIABLES
   _boolean L4;
   _boolean L6;
   _boolean L3;
   _boolean L12;
   _boolean L11;
   _boolean L2;
   _boolean L17;
   _boolean L19;
   _boolean L16;
   _boolean L15;
   _boolean L24;
   _boolean L26;
   _boolean L23;
   _boolean L22;
   _boolean L30;
   _boolean L31;
   _boolean L29;
   _boolean L28;
   _boolean L21;
   _boolean L14;
   _boolean T13;
   _boolean T32;
   _boolean T27;
   _boolean T20;
   _boolean T10;
//CODE
   L4 = (ctx1._Co < obstacle_threshold);
   if (ctx1.M7) {
      L6 = _false;
   } else {
      L6 = ctx1.M10;
   }
   L3 = (L4 || L6);
   if (ctx1.M7) {
      L12 = _false;
   } else {
      L12 = ctx1.M13;
   }
   L11 = (! L12);
   L2 = (L3 && L11);
   obst_detector_O_obstacle(L2);
   L17 = (ctx1._Cg >= white_threshold);
   if (ctx1.M7) {
      L19 = _false;
   } else {
      L19 = ctx1.M20;
   }
   L16 = (L17 || L19);
   L15 = (L16 && L11);
   L24 = (ctx1._Cg <= black_threshold);
   if (ctx1.M7) {
      L26 = _false;
   } else {
      L26 = ctx1.M27;
   }
   L23 = (L24 || L26);
   L22 = (L23 && L11);
   L30 = (ctx1._Cg <= white_threshold);
   if (ctx1.M7) {
      L31 = _false;
   } else {
      L31 = ctx1.M32;
   }
   L29 = (L30 || L31);
   L28 = (L29 && L11);
   L21 = (L22 && L28);
   L14 = (L15 && L21);
   T13 = L14;
   T32 = L28;
   T27 = L22;
   T20 = L15;
   T10 = L2;
   ctx1.M13 = T13;
   ctx1.M13_nil = _false;
   ctx1.M32 = T32;
   ctx1.M32_nil = _false;
   ctx1.M27 = T27;
   ctx1.M27_nil = _false;
   ctx1.M20 = T20;
   ctx1.M20_nil = _false;
   ctx1.M10 = T10;
   ctx1.M10_nil = _false;
   ctx1.M7 = ctx1.M7 && !(_true);
}
/***********************************************************************************/

void lowTask(){
	static U32 previous_raw_sonar_value = 255;
	float raw_sensor_left;

	raw_sensor_left = ecrobot_get_light_sensor(LEFT_LIGHT_SENSOR);

	if (raw_sensor_left < sens_white_cal_left) {
		raw_sensor_left = sens_white_cal_left;
	} else if (raw_sensor_left > sens_black_cal_left) {
		raw_sensor_left = sens_black_cal_left;
	}

	raw_sensor_left = ((raw_sensor_left - sens_white_cal_left) * 100 /
				(sens_black_cal_left - sens_white_cal_left));

	raw_sensor_left = 100 - raw_sensor_left;
	
	/*U32 raw_sonar_value = ecrobot_get_sonar_sensor(SONAR_SENSOR);

	if (raw_sonar_value < 0)
		raw_sonar_value = previous_raw_sonar_value;
	else
		previous_raw_sonar_value = raw_sonar_value;

	_float sonar_value = LIMIT_SONAR(raw_sonar_value);
	show_var("sonar", 2, sonar_value);

	obst_detector_I_Co(sonar_value);
	obst_detector_I_Cg(raw_sensor_left);
	obst_detector_step();*/

	TerminateTask = 1; //TerminateTask();
}

/*void ecrobot_set_light_sensor_active(U8 port_id)
{
	set_digi0(port_id);
}

void ecrobot_set_light_sensor_inactive(U8 port_id)
{
	unset_digi0(port_id);
}*///

_boolean ACTIVE = 0;

void ecrobot_device_initialize() {
	ACTIVE = 1;

	SONAR_SENSOR = 0;
	RIGHT_LIGHT_SENSOR = 0;
	LEFT_LIGHT_SENSOR = 0;

	motor_control_reset();
	obst_detector_reset();
}

void ecrobot_device_terminate() {
	ACTIVE = 0;

	SONAR_SENSOR = 0;
	RIGHT_LIGHT_SENSOR = 0;
	LEFT_LIGHT_SENSOR = 0;

	//ecrobot_set_light_sensor_inactive(RIGHT_LIGHT_SENSOR);
	//ecrobot_set_light_sensor_inactive(LEFT_LIGHT_SENSOR);
	//ecrobot_term_sonar_sensor(SONAR_SENSOR);

	ecrobot_set_motor_speed(RIGHT_WHEEL_PORT, 0);
	ecrobot_set_motor_speed(LEFT_WHEEL_PORT, 0);
}


void user_1ms_isr_type2(void)
{
	//StatusType ercd; 
	//ercd = SignalCounter( SysTimerCnt );
	//if( ercd != E_OK ){
	//	ShutdownOS( ercd );
	//}
}

void main(){
	//clock_t start, end, ex_time;
    	//start = clock();
	ecrobot_device_initialize();
	//highTask();
	lowTask();
	//ecrobot_device_terminate();
	//end = clock();
	//ex_time = end - start;
	//double time_taken = ((double)ex_time)/CLOCKS_PER_SEC; // in seconds 
  	//printf("\n\nProgram took %f seconds to execute \n", time_taken); 
}



/*
DeclareCounter(SysTimerCnt);
DeclareResource(lcd);
DeclareTask(LowTask);
DeclareTask(HighTask);

*/







