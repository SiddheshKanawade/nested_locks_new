#ifndef __OCARINA_GENERATED_SUBPROGRAMS_H_
#define __OCARINA_GENERATED_SUBPROGRAMS_H_ 
#include <types.h>
/**************************************************** */

/*  This file was automatically generated by Ocarina  */

/*  Working Copy from rd2e9f13e */

/*  Do NOT hand-modify this file, as your             */

/*  changes will be lost when you re-run Ocarina      */

/**************************************************** */

void ardupilot_software__spg_gps_simulation 
    (ardupilot_software__gps_position_i* gps_pos);

void ardupilot_software__spg_flt_mgmt_simulation 
    (ardupilot_software__gps_position_i gps_pos,
    base_types__integer* speed,
    base_types__integer* angle);

void ardupilot_software__spg_throttle_simulation 
    (base_types__integer speed);

void ardupilot_software__spg_yaw_simulation 
    (base_types__integer angle);

#endif
