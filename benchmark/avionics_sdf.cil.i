# 1 "./avionics.cil.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "/usr/include/stdc-predef.h" 1 3 4
# 1 "<command-line>" 2
# 1 "./avionics.cil.c"
# 17 "avionics/avionics.c"
int AG_Time_to_Go_to_Release ;
# 18 "avionics/avionics.c"
int AG_Weapon_Release_Interval ;
# 19 "avionics/avionics.c"
int AG_Delivery_Mode_Selected ;
# 20 "avionics/avionics.c"
int SMS_Bomb_Button_Depressed ;
# 22 "avionics/avionics.c"
int SMS_Release_Signal ;
# 25 "avionics/avionics.c"
void weapon_release(void)
{
  int temp ;

  {
# 27 "avionics/avionics.c"
  temp = AG_Time_to_Go_to_Release;
# 28 "avionics/avionics.c"
  temp = AG_Weapon_Release_Interval;
# 29 "avionics/avionics.c"
  temp = AG_Delivery_Mode_Selected;
# 30 "avionics/avionics.c"
  temp = SMS_Bomb_Button_Depressed;
# 32 "avionics/avionics.c"
  SMS_Release_Signal = temp;
# 33 "avionics/avionics.c"
  return;
}
}
# 42 "avionics/avionics.c"
int Radar_Mode ;
# 43 "avionics/avionics.c"
int Radar_Contact_Table ;
# 44 "avionics/avionics.c"
int Radar_Target_Position ;
# 45 "avionics/avionics.c"
int MPD_Contact_Number_to_Track ;
# 48 "avionics/avionics.c"
int Radar_Contact_Number_to_Track ;
# 49 "avionics/avionics.c"
int Radar_Status ;
# 52 "avionics/avionics.c"
void radar_control(void)
{
  int temp1 ;
  int temp2 ;
  int temp3 ;
  int temp4 ;

  {
# 55 "avionics/avionics.c"
  temp1 = Radar_Mode;
# 56 "avionics/avionics.c"
  temp2 = Radar_Contact_Table;
# 57 "avionics/avionics.c"
  temp3 = Radar_Target_Position;
# 58 "avionics/avionics.c"
  temp4 = MPD_Contact_Number_to_Track;
# 60 "avionics/avionics.c"
  Radar_Mode = temp1;
# 61 "avionics/avionics.c"
  Radar_Contact_Number_to_Track = temp4;
# 62 "avionics/avionics.c"
  Radar_Status = temp2;
# 63 "avionics/avionics.c"
  return;
}
}
# 72 "avionics/avionics.c"
int NAV_Aircraft_Position ;
# 73 "avionics/avionics.c"
int AG_Target_Location ;
# 74 "avionics/avionics.c"
int AG_HUD_Target_Designation_Selected ;
# 75 "avionics/avionics.c"
int HOTAS_TDC_HUD_Reticle_Delta ;
# 76 "avionics/avionics.c"
int AG_Radar_Target_Designation_Selected ;
# 80 "avionics/avionics.c"
int HUD_Target_Reticle ;
# 81 "avionics/avionics.c"
int HUD_Reticle_Position ;
# 84 "avionics/avionics.c"
void target_tracking(void)
{
  int temp1 ;
  int temp2 ;

  {
# 87 "avionics/avionics.c"
  temp1 = NAV_Aircraft_Position;
# 88 "avionics/avionics.c"
  temp1 = AG_Target_Location;
# 89 "avionics/avionics.c"
  temp1 = AG_HUD_Target_Designation_Selected;
# 90 "avionics/avionics.c"
  temp2 = HOTAS_TDC_HUD_Reticle_Delta;
# 91 "avionics/avionics.c"
  temp2 = AG_Radar_Target_Designation_Selected;
# 92 "avionics/avionics.c"
  temp2 = Radar_Target_Position;
# 94 "avionics/avionics.c"
  AG_Target_Location = temp1;
# 95 "avionics/avionics.c"
  HUD_Target_Reticle = temp2;
# 96 "avionics/avionics.c"
  HUD_Reticle_Position = temp2;
# 97 "avionics/avionics.c"
  return;
}
}
# 107 "avionics/avionics.c"
int HOTAS_HUD_Designation_Selected ;
# 109 "avionics/avionics.c"
int HOTAS_Radar_Target_Designation_Selected ;
# 111 "avionics/avionics.c"
int HOTAS_Undesignate_Selected ;
# 120 "avionics/avionics.c"
void target_sweetening(void)
{
  int temp1 ;
  int temp2 ;

  {
# 123 "avionics/avionics.c"
  temp1 = NAV_Aircraft_Position;
# 124 "avionics/avionics.c"
  temp2 = HOTAS_HUD_Designation_Selected;
# 125 "avionics/avionics.c"
  temp1 = HUD_Reticle_Position;
# 126 "avionics/avionics.c"
  temp2 = HOTAS_Radar_Target_Designation_Selected;
# 127 "avionics/avionics.c"
  temp1 = Radar_Target_Position;
# 128 "avionics/avionics.c"
  temp2 = HOTAS_Undesignate_Selected;
# 130 "avionics/avionics.c"
  AG_Target_Location = temp1;
# 131 "avionics/avionics.c"
  HUD_Target_Reticle = temp1;
# 132 "avionics/avionics.c"
  HUD_Reticle_Position = temp1;
# 133 "avionics/avionics.c"
  AG_Radar_Target_Designation_Selected = temp2;
# 134 "avionics/avionics.c"
  AG_HUD_Target_Designation_Selected = temp2;
# 135 "avionics/avionics.c"
  return;
}
}
# 144 "avionics/avionics.c"
int DP_Keyset_RWR_Program_Message ;
# 145 "avionics/avionics.c"
int DP_Keyset_Weapon_Program_Message ;
# 146 "avionics/avionics.c"
int DP_Keyset_Target_Designation_Message ;
# 147 "avionics/avionics.c"
int DP_Keyset_Delivery_Mode_Toggle_Message ;
# 149 "avionics/avionics.c"
int Keyset_Waypoint_Table ;
# 150 "avionics/avionics.c"
int Keyset_Waypoint_Offset ;
# 151 "avionics/avionics.c"
int Keyset_Waypoint_Steering_Selected ;
# 152 "avionics/avionics.c"
int Keyset_Quantity_Select_Request ;
# 153 "avionics/avionics.c"
int Keyset_Interval_Select_Request ;
# 154 "avionics/avionics.c"
int Keyset_AUTO_CCIP_Toggle ;
# 155 "avionics/avionics.c"
int Keyset_RWR_Frequency_Table ;
# 156 "avionics/avionics.c"
int Keyset_RWR_Search_Sector_Table ;
# 159 "avionics/avionics.c"
void target_sweetening1(void)
{
  int temp1 ;
  int temp2 ;
  int temp3 ;
  int temp4 ;

  {
# 162 "avionics/avionics.c"
  temp1 = DP_Keyset_RWR_Program_Message;
# 163 "avionics/avionics.c"
  temp2 = DP_Keyset_Weapon_Program_Message;
# 164 "avionics/avionics.c"
  temp3 = DP_Keyset_Target_Designation_Message;
# 165 "avionics/avionics.c"
  temp4 = DP_Keyset_Delivery_Mode_Toggle_Message;
# 167 "avionics/avionics.c"
  Keyset_Waypoint_Table = temp4;
# 168 "avionics/avionics.c"
  Keyset_Waypoint_Offset = temp4;
# 169 "avionics/avionics.c"
  Keyset_Waypoint_Steering_Selected = temp3;
# 170 "avionics/avionics.c"
  Keyset_Quantity_Select_Request = temp2;
# 171 "avionics/avionics.c"
  Keyset_Interval_Select_Request = temp2;
# 172 "avionics/avionics.c"
  Keyset_AUTO_CCIP_Toggle = temp3;
# 173 "avionics/avionics.c"
  Keyset_RWR_Frequency_Table = temp1;
# 174 "avionics/avionics.c"
  Keyset_RWR_Search_Sector_Table = temp1;
# 175 "avionics/avionics.c"
  return;
}
}
# 184 "avionics/avionics.c"
int ADC_Angle_of_Attack ;
# 184 "avionics/avionics.c"
int ADC_Mach_Number ;
# 184 "avionics/avionics.c"
int ADC_Barometric_Altitude ;
# 185 "avionics/avionics.c"
int ADC_Magnetic_Heading ;
# 185 "avionics/avionics.c"
int ADC_True_Airspeed ;
# 186 "avionics/avionics.c"
int INS_Body_Rates ;
# 187 "avionics/avionics.c"
int INS_Acceleration ;
# 188 "avionics/avionics.c"
int INS_Present_Position ;
# 189 "avionics/avionics.c"
int INS_True_Heading ;
# 190 "avionics/avionics.c"
int INS_Velocity ;
# 191 "avionics/avionics.c"
int RALT_Radar_Altitude ;
# 193 "avionics/avionics.c"
int INS_Reference_Velocity ;
# 194 "avionics/avionics.c"
int NAV_Airspeed ;
# 195 "avionics/avionics.c"
int NAV_Rate_of_Change_Airspeed ;
# 196 "avionics/avionics.c"
int NAV_Position ;
# 197 "avionics/avionics.c"
int NAV_Angle_of_Attack ;
# 198 "avionics/avionics.c"
int NAV_Attitude ;
# 199 "avionics/avionics.c"
int NAV_Body_Rates ;
# 200 "avionics/avionics.c"
int NAV_Flight_Path_Angle ;
# 201 "avionics/avionics.c"
int NAV_Ground_Speed ;
# 202 "avionics/avionics.c"
int NAV_Ground_Track_Angle ;
# 203 "avionics/avionics.c"
int NAV_Magnetic_Variation ;
# 204 "avionics/avionics.c"
int NAV_Altitude ;
# 205 "avionics/avionics.c"
int NAV_Velocity ;
# 206 "avionics/avionics.c"
int NAV_Acceleration ;
# 207 "avionics/avionics.c"
int NAV_Wind ;
# 208 "avionics/avionics.c"
int NAV_Body_to_Earth_Transform ;
# 209 "avionics/avionics.c"
int NAV_Body_to_Horizon_Transform ;
# 210 "avionics/avionics.c"
int NAV_Radar_to_Body_Transform ;
# 211 "avionics/avionics.c"
int NAV_Radar_to_Earth_Transform ;
# 214 "avionics/avionics.c"
void aircraft_flight_data(void)
{
  int temp1 ;
  int temp2 ;
  int temp3 ;

  {
# 217 "avionics/avionics.c"
  temp1 = ADC_Angle_of_Attack;
# 218 "avionics/avionics.c"
  temp1 = RALT_Radar_Altitude;
# 219 "avionics/avionics.c"
  temp1 = ADC_Mach_Number;
# 220 "avionics/avionics.c"
  temp2 = ADC_Barometric_Altitude;
# 221 "avionics/avionics.c"
  temp2 = ADC_Magnetic_Heading;
# 222 "avionics/avionics.c"
  temp2 = ADC_True_Airspeed;
# 223 "avionics/avionics.c"
  temp3 = INS_Body_Rates;
# 224 "avionics/avionics.c"
  temp3 = INS_Acceleration;
# 225 "avionics/avionics.c"
  temp3 = INS_Present_Position;
# 226 "avionics/avionics.c"
  temp3 = INS_True_Heading;
# 227 "avionics/avionics.c"
  temp3 = INS_Velocity;
# 228 "avionics/avionics.c"
  temp3 = RALT_Radar_Altitude;
# 231 "avionics/avionics.c"
  INS_Reference_Velocity = temp1;
# 232 "avionics/avionics.c"
  NAV_Airspeed = temp1;
# 233 "avionics/avionics.c"
  NAV_Rate_of_Change_Airspeed = temp1;
# 234 "avionics/avionics.c"
  NAV_Position = temp1;
# 235 "avionics/avionics.c"
  NAV_Angle_of_Attack = temp1;
# 236 "avionics/avionics.c"
  NAV_Attitude = temp2;
# 237 "avionics/avionics.c"
  NAV_Body_Rates = temp2;
# 238 "avionics/avionics.c"
  NAV_Flight_Path_Angle = temp2;
# 239 "avionics/avionics.c"
  NAV_Ground_Speed = temp2;
# 240 "avionics/avionics.c"
  NAV_Ground_Track_Angle = temp2;
# 241 "avionics/avionics.c"
  NAV_Magnetic_Variation = temp2;
# 242 "avionics/avionics.c"
  NAV_Altitude = temp3;
# 243 "avionics/avionics.c"
  NAV_Velocity = temp3;
# 244 "avionics/avionics.c"
  NAV_Acceleration = temp3;
# 245 "avionics/avionics.c"
  NAV_Wind = temp3;
# 246 "avionics/avionics.c"
  NAV_Body_to_Earth_Transform = temp3;
# 247 "avionics/avionics.c"
  NAV_Body_to_Horizon_Transform = temp3;
# 248 "avionics/avionics.c"
  NAV_Radar_to_Body_Transform = temp3;
# 249 "avionics/avionics.c"
  NAV_Radar_to_Earth_Transform = temp3;
# 250 "avionics/avionics.c"
  return;
}
}
# 264 "avionics/avionics.c"
int NAV_Barometric_Altitude ;
# 266 "avionics/avionics.c"
int NAV_Steer_to_Point ;
# 271 "avionics/avionics.c"
int AG_Weapon_Down_Range_Travel ;
# 272 "avionics/avionics.c"
int AG_Weapon_Cross_Range_Travel ;
# 276 "avionics/avionics.c"
int DP_HUD_NAV_Data_Message ;
# 277 "avionics/avionics.c"
int DP_HUD_Pitch_Ladder_Message ;
# 278 "avionics/avionics.c"
int DP_HUD_Velocity_Vector_Message ;
# 279 "avionics/avionics.c"
int DP_HUD_Steering_Cue_Message ;
# 280 "avionics/avionics.c"
int DP_HUD_Reticle_Message ;
# 281 "avionics/avionics.c"
int DP_HUD_Weapon_Release_Message ;
# 282 "avionics/avionics.c"
int DP_HUD_CCIP_Display_Message ;
# 285 "avionics/avionics.c"
void HUD_display(void)
{
  int temp1 ;
  int temp2 ;
  int temp3 ;
  int temp4 ;

  {
# 288 "avionics/avionics.c"
  temp1 = NAV_Airspeed;
# 289 "avionics/avionics.c"
  temp2 = NAV_Position;
# 290 "avionics/avionics.c"
  temp3 = NAV_Angle_of_Attack;
# 291 "avionics/avionics.c"
  temp1 = NAV_Attitude;
# 292 "avionics/avionics.c"
  temp2 = NAV_Body_Rates;
# 293 "avionics/avionics.c"
  temp3 = NAV_Barometric_Altitude;
# 294 "avionics/avionics.c"
  temp1 = NAV_Velocity;
# 295 "avionics/avionics.c"
  temp2 = NAV_Steer_to_Point;
# 296 "avionics/avionics.c"
  temp3 = HUD_Target_Reticle;
# 297 "avionics/avionics.c"
  temp1 = HUD_Reticle_Position;
# 298 "avionics/avionics.c"
  temp2 = AG_Time_to_Go_to_Release;
# 299 "avionics/avionics.c"
  temp3 = AG_Delivery_Mode_Selected;
# 300 "avionics/avionics.c"
  temp4 = AG_Weapon_Down_Range_Travel;
# 301 "avionics/avionics.c"
  temp3 = AG_Weapon_Cross_Range_Travel;
# 303 "avionics/avionics.c"
  DP_HUD_NAV_Data_Message = temp1;
# 304 "avionics/avionics.c"
  DP_HUD_Pitch_Ladder_Message = temp2;
# 305 "avionics/avionics.c"
  DP_HUD_Velocity_Vector_Message = temp1;
# 306 "avionics/avionics.c"
  if (NAV_Steer_to_Point) {
# 307 "avionics/avionics.c"
    DP_HUD_Steering_Cue_Message = temp3;
  } else
# 306 "avionics/avionics.c"
  if (HUD_Target_Reticle) {
# 307 "avionics/avionics.c"
    DP_HUD_Steering_Cue_Message = temp3;
  }
# 308 "avionics/avionics.c"
  DP_HUD_Reticle_Message = temp1;
# 309 "avionics/avionics.c"
  if (AG_Delivery_Mode_Selected) {
# 309 "avionics/avionics.c"
    if (HUD_Reticle_Position) {
# 310 "avionics/avionics.c"
      DP_HUD_Weapon_Release_Message = temp4;
    }
  }
# 311 "avionics/avionics.c"
  DP_HUD_CCIP_Display_Message = temp2;
# 312 "avionics/avionics.c"
  return;
}
}
# 321 "avionics/avionics.c"
int MPD_Tactical_Display_Scale_Selected ;
# 323 "avionics/avionics.c"
int RWR_Threat_Table ;
# 330 "avionics/avionics.c"
int DP_MPD_Tactical_Radar_Contacts_Message ;
# 331 "avionics/avionics.c"
int DP_MPD_Tactical_Radar_Target_Message ;
# 332 "avionics/avionics.c"
int DP_MPD_Tactical_Threats_Display_Message ;
# 333 "avionics/avionics.c"
int DP_MPD_Tactical_Compass_Rose_Message ;
# 334 "avionics/avionics.c"
int DP_MPD_AG_Target_Message ;
# 337 "avionics/avionics.c"
void MPD_tactical_display(void)
{
  int temp1 ;
  int temp2 ;

  {
# 340 "avionics/avionics.c"
  temp1 = MPD_Tactical_Display_Scale_Selected;
# 341 "avionics/avionics.c"
  temp2 = Radar_Contact_Table;
# 342 "avionics/avionics.c"
  temp2 = RWR_Threat_Table;
# 343 "avionics/avionics.c"
  temp1 = NAV_Position;
# 344 "avionics/avionics.c"
  temp1 = NAV_Magnetic_Variation;
# 345 "avionics/avionics.c"
  temp2 = NAV_Steer_to_Point;
# 346 "avionics/avionics.c"
  temp1 = Radar_Target_Position;
# 347 "avionics/avionics.c"
  temp2 = AG_Target_Location;
# 349 "avionics/avionics.c"
  DP_MPD_Tactical_Radar_Contacts_Message = temp1;
# 350 "avionics/avionics.c"
  DP_MPD_Tactical_Radar_Target_Message = temp2;
# 351 "avionics/avionics.c"
  DP_MPD_Tactical_Threats_Display_Message = temp1;
# 352 "avionics/avionics.c"
  DP_MPD_Tactical_Compass_Rose_Message = temp2;
# 353 "avionics/avionics.c"
  DP_MPD_AG_Target_Message = temp1;
# 354 "avionics/avionics.c"
  return;
}
}
# 365 "avionics/avionics.c"
int MPD_Waypoint_Counter ;
# 367 "avionics/avionics.c"
int Keyset_Offset ;
# 374 "avionics/avionics.c"
void steering(void)
{
  int temp1 ;
  int temp2 ;

  {
# 377 "avionics/avionics.c"
  temp1 = NAV_Position;
# 378 "avionics/avionics.c"
  temp1 = NAV_Velocity;
# 379 "avionics/avionics.c"
  temp1 = MPD_Waypoint_Counter;
# 380 "avionics/avionics.c"
  temp1 = Keyset_Waypoint_Table;
# 381 "avionics/avionics.c"
  temp2 = Keyset_Offset;
# 382 "avionics/avionics.c"
  temp2 = Keyset_Waypoint_Steering_Selected;
# 383 "avionics/avionics.c"
  temp2 = AG_Target_Location;
# 385 "avionics/avionics.c"
  NAV_Steer_to_Point = temp1;
# 386 "avionics/avionics.c"
  return;
}
}
# 397 "avionics/avionics.c"
int NAV_Aircraft_Velocity ;
# 398 "avionics/avionics.c"
int NAV_Mach_Number ;
# 404 "avionics/avionics.c"
int MPD_Weapon_Selected ;
# 406 "avionics/avionics.c"
int SMS_Ballistic_Coefficients ;
# 409 "avionics/avionics.c"
int AG_Weapon_Time_of_Fall ;
# 412 "avionics/avionics.c"
int AG_Weapon_Down_Range_Error ;
# 413 "avionics/avionics.c"
int AG_Weapon_Cross_Range_Error ;
# 416 "avionics/avionics.c"
void weapon_trajectory(void)
{
  int temp1 ;
  int temp2 ;
  int temp3 ;

  {
# 419 "avionics/avionics.c"
  temp1 = NAV_Aircraft_Position;
# 420 "avionics/avionics.c"
  temp2 = NAV_Barometric_Altitude;
# 421 "avionics/avionics.c"
  temp3 = NAV_Aircraft_Velocity;
# 422 "avionics/avionics.c"
  temp1 = NAV_Mach_Number;
# 423 "avionics/avionics.c"
  temp2 = NAV_Wind;
# 424 "avionics/avionics.c"
  temp3 = NAV_Angle_of_Attack;
# 425 "avionics/avionics.c"
  temp1 = NAV_Attitude;
# 426 "avionics/avionics.c"
  temp2 = NAV_Body_Rates;
# 427 "avionics/avionics.c"
  temp3 = AG_Target_Location;
# 428 "avionics/avionics.c"
  temp1 = MPD_Weapon_Selected;
# 429 "avionics/avionics.c"
  temp2 = AG_Delivery_Mode_Selected;
# 430 "avionics/avionics.c"
  temp3 = SMS_Ballistic_Coefficients;
# 432 "avionics/avionics.c"
  AG_Time_to_Go_to_Release = temp1;
# 433 "avionics/avionics.c"
  AG_Weapon_Time_of_Fall = temp3;
# 434 "avionics/avionics.c"
  AG_Weapon_Down_Range_Travel = temp2;
# 435 "avionics/avionics.c"
  AG_Weapon_Cross_Range_Travel = temp3;
# 436 "avionics/avionics.c"
  AG_Weapon_Down_Range_Error = temp3;
# 437 "avionics/avionics.c"
  AG_Weapon_Cross_Range_Error = temp3;
# 438 "avionics/avionics.c"
  return;
}
}
# 447 "avionics/avionics.c"
int RWR_Threat_Table_Bearing ;
# 448 "avionics/avionics.c"
int RWR_Threat_Table_Frequency ;
# 450 "avionics/avionics.c"
int MPD_Threat_Warning ;
# 451 "avionics/avionics.c"
int HUD_Threat_Warning ;
# 454 "avionics/avionics.c"
void threat_response_display(void)
{
  int temp1 ;
  int temp2 ;

  {
# 457 "avionics/avionics.c"
  temp1 = RWR_Threat_Table_Bearing;
# 458 "avionics/avionics.c"
  temp2 = RWR_Threat_Table_Frequency;
# 460 "avionics/avionics.c"
  MPD_Threat_Warning = temp2;
# 461 "avionics/avionics.c"
  HUD_Threat_Warning = temp1;
# 462 "avionics/avionics.c"
  return;
}
}
# 477 "avionics/avionics.c"
void AUTO_CCIP_Toggle(void)
{
  int temp ;

  {
# 480 "avionics/avionics.c"
  temp = Keyset_AUTO_CCIP_Toggle;
# 481 "avionics/avionics.c"
  DP_HUD_CCIP_Display_Message = temp;
# 482 "avionics/avionics.c"
  return;
}
}
# 493 "avionics/avionics.c"
int SMS_Stores_Select ;
# 494 "avionics/avionics.c"
int SMS_Stores_Release ;
# 499 "avionics/avionics.c"
void poll_RWR(void)
{
  int temp1 ;
  int temp2 ;

  {
# 502 "avionics/avionics.c"
  temp1 = RWR_Threat_Table;
# 503 "avionics/avionics.c"
  SMS_Stores_Select = temp1;
# 504 "avionics/avionics.c"
  SMS_Stores_Release = temp1;
# 505 "avionics/avionics.c"
  MPD_Threat_Warning = temp2;
# 506 "avionics/avionics.c"
  HUD_Threat_Warning = temp2;
# 507 "avionics/avionics.c"
  return;
}
}
# 523 "avionics/avionics.c"
void reinitiate_trajectory(void)
{
  int temp1 ;
  int temp2 ;

  {
# 526 "avionics/avionics.c"
  temp1 = MPD_Weapon_Selected;
# 527 "avionics/avionics.c"
  temp2 = AG_Delivery_Mode_Selected;
# 529 "avionics/avionics.c"
  AG_Weapon_Down_Range_Error = temp1;
# 530 "avionics/avionics.c"
  AG_Weapon_Cross_Range_Error = temp2;
# 531 "avionics/avionics.c"
  return;
}
}
# 540 "avionics/avionics.c"
int Equipment_status_message ;
# 542 "avionics/avionics.c"
int MCC_Status ;
# 543 "avionics/avionics.c"
int ADC_Status ;
# 544 "avionics/avionics.c"
int INS_Status ;
# 545 "avionics/avionics.c"
int SMS_Status ;
# 547 "avionics/avionics.c"
int RWR_Status ;
# 548 "avionics/avionics.c"
int RALT_Status ;
# 549 "avionics/avionics.c"
int DP_MPD_Error_Advisory_Message ;
# 550 "avionics/avionics.c"
int DP_HUD_Error_Advisory_Message ;
# 553 "avionics/avionics.c"
void Periodic_BIT(void)
{
  int temp1 ;
  int temp2 ;
  int temp3 ;
  int temp4 ;
  int temp5 ;

  {
# 556 "avionics/avionics.c"
  temp4 = Equipment_status_message;
# 558 "avionics/avionics.c"
  MCC_Status = temp1;
# 559 "avionics/avionics.c"
  ADC_Status = temp2;
# 560 "avionics/avionics.c"
  INS_Status = temp3;
# 561 "avionics/avionics.c"
  SMS_Status = temp2;
# 562 "avionics/avionics.c"
  Radar_Status = temp4;
# 563 "avionics/avionics.c"
  RWR_Status = temp4;
# 564 "avionics/avionics.c"
  RALT_Status = temp1;
# 565 "avionics/avionics.c"
  DP_MPD_Error_Advisory_Message = temp5;
# 566 "avionics/avionics.c"
  DP_HUD_Error_Advisory_Message = temp5;
# 567 "avionics/avionics.c"
  return;
}
}
# 572 "avionics/avionics.c"
extern int ( create_task)() ;
# 570 "avionics/avionics.c"
void main(void)
{


  {
# 572 "avionics/avionics.c"
  create_task("Weapon_release", "weapon_release", 1, 10, 5.0);
# 573 "avionics/avionics.c"
  create_task("Radar_tracking", "radar_control", 2, 40, 2.0);
# 574 "avionics/avionics.c"
  create_task("Target_tracking", "target_tracking", 3, 40, 4.0);
# 575 "avionics/avionics.c"
  create_task("Target_sweetening", "target_sweetening", 4, 40, 2.0);
# 576 "avionics/avionics.c"
  create_task("HOTAS_bomb_button", "target_sweetening1", 5, 40, 1.0);
# 577 "avionics/avionics.c"
  create_task("Aircraft_flight_data", "aircraft_flight_data", 6, 55, 8.0);
# 578 "avionics/avionics.c"
  create_task("HUD_display", "HUD_display", 7, 52, 6.0);
# 579 "avionics/avionics.c"
  create_task("MPD_tactical_display", "MPD_tactical_display", 8, 50, 8.0);
# 580 "avionics/avionics.c"
  create_task("Steering", "steering", 9, 80, 6.0);
# 581 "avionics/avionics.c"
  create_task("Weapon_trajectory", "weapon_trajectory", 10, 100, 7.0);
# 582 "avionics/avionics.c"
  create_task("Threat_response_display", "threat_response_display", 11, 100, 3.0);
# 583 "avionics/avionics.c"
  create_task("Auto_CCIP_toggle", "AUTO_CCIP_Toggle", 12, 200, 1.0);
# 584 "avionics/avionics.c"
  create_task("Poll_RWR", "poll_RWR", 13, 100, 3.0);
# 585 "avionics/avionics.c"
  create_task("Reinitiate_trajectory", "reinitiate_trajectory", 14, 400, 6.0);
# 586 "avionics/avionics.c"
  create_task("Periodic_BIT", "Periodic_BIT", 15, 1000, 5.0);
# 587 "avionics/avionics.c"
  return;
}
}
