# 1 "./avionics.cil.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "/usr/include/stdc-predef.h" 1 3 4
# 1 "<command-line>" 2
# 1 "./avionics.cil.c"
# 17 "../benchmark/avionics/avionics.c"
int AG_Time_to_Go_to_Release ;
# 18 "../benchmark/avionics/avionics.c"
int AG_Weapon_Release_Interval ;
# 19 "../benchmark/avionics/avionics.c"
int AG_Delivery_Mode_Selected ;
# 20 "../benchmark/avionics/avionics.c"
int SMS_Bomb_Button_Depressed ;
# 22 "../benchmark/avionics/avionics.c"
int SMS_Release_Signal ;
# 25 "../benchmark/avionics/avionics.c"
void weapon_release(void)
{
  int temp ;

  {
# 27 "../benchmark/avionics/avionics.c"
  temp = AG_Time_to_Go_to_Release;
# 28 "../benchmark/avionics/avionics.c"
  temp = AG_Weapon_Release_Interval;
# 29 "../benchmark/avionics/avionics.c"
  temp = AG_Delivery_Mode_Selected;
# 30 "../benchmark/avionics/avionics.c"
  temp = SMS_Bomb_Button_Depressed;
# 32 "../benchmark/avionics/avionics.c"
  SMS_Release_Signal = temp;
# 33 "../benchmark/avionics/avionics.c"
  return;
}
}
# 42 "../benchmark/avionics/avionics.c"
int Radar_Mode ;
# 43 "../benchmark/avionics/avionics.c"
int Radar_Contact_Table ;
# 44 "../benchmark/avionics/avionics.c"
int Radar_Target_Position ;
# 45 "../benchmark/avionics/avionics.c"
int MPD_Contact_Number_to_Track ;
# 48 "../benchmark/avionics/avionics.c"
int Radar_Contact_Number_to_Track ;
# 49 "../benchmark/avionics/avionics.c"
int Radar_Status ;
# 52 "../benchmark/avionics/avionics.c"
void radar_control(void)
{
  int temp1 ;
  int temp2 ;
  int temp3 ;
  int temp4 ;

  {
# 55 "../benchmark/avionics/avionics.c"
  temp1 = Radar_Mode;
# 56 "../benchmark/avionics/avionics.c"
  temp2 = Radar_Contact_Table;
# 57 "../benchmark/avionics/avionics.c"
  temp3 = Radar_Target_Position;
# 58 "../benchmark/avionics/avionics.c"
  temp4 = MPD_Contact_Number_to_Track;
# 60 "../benchmark/avionics/avionics.c"
  Radar_Mode = temp1;
# 61 "../benchmark/avionics/avionics.c"
  Radar_Contact_Number_to_Track = temp4;
# 62 "../benchmark/avionics/avionics.c"
  Radar_Status = temp2;
# 63 "../benchmark/avionics/avionics.c"
  return;
}
}
# 72 "../benchmark/avionics/avionics.c"
int NAV_Aircraft_Position ;
# 73 "../benchmark/avionics/avionics.c"
int AG_Target_Location ;
# 74 "../benchmark/avionics/avionics.c"
int AG_HUD_Target_Designation_Selected ;
# 75 "../benchmark/avionics/avionics.c"
int HOTAS_TDC_HUD_Reticle_Delta ;
# 76 "../benchmark/avionics/avionics.c"
int AG_Radar_Target_Designation_Selected ;
# 80 "../benchmark/avionics/avionics.c"
int HUD_Target_Reticle ;
# 81 "../benchmark/avionics/avionics.c"
int HUD_Reticle_Position ;
# 84 "../benchmark/avionics/avionics.c"
void target_tracking(void)
{
  int temp1 ;
  int temp2 ;

  {
# 87 "../benchmark/avionics/avionics.c"
  temp1 = NAV_Aircraft_Position;
# 88 "../benchmark/avionics/avionics.c"
  temp1 = AG_Target_Location;
# 89 "../benchmark/avionics/avionics.c"
  temp1 = AG_HUD_Target_Designation_Selected;
# 90 "../benchmark/avionics/avionics.c"
  temp2 = HOTAS_TDC_HUD_Reticle_Delta;
# 91 "../benchmark/avionics/avionics.c"
  temp2 = AG_Radar_Target_Designation_Selected;
# 92 "../benchmark/avionics/avionics.c"
  temp2 = Radar_Target_Position;
# 94 "../benchmark/avionics/avionics.c"
  AG_Target_Location = temp1;
# 95 "../benchmark/avionics/avionics.c"
  HUD_Target_Reticle = temp2;
# 96 "../benchmark/avionics/avionics.c"
  HUD_Reticle_Position = temp2;
# 97 "../benchmark/avionics/avionics.c"
  return;
}
}
# 107 "../benchmark/avionics/avionics.c"
int HOTAS_HUD_Designation_Selected ;
# 109 "../benchmark/avionics/avionics.c"
int HOTAS_Radar_Target_Designation_Selected ;
# 111 "../benchmark/avionics/avionics.c"
int HOTAS_Undesignate_Selected ;
# 120 "../benchmark/avionics/avionics.c"
void target_sweetening(void)
{
  int temp1 ;
  int temp2 ;

  {
# 123 "../benchmark/avionics/avionics.c"
  temp1 = NAV_Aircraft_Position;
# 124 "../benchmark/avionics/avionics.c"
  temp2 = HOTAS_HUD_Designation_Selected;
# 125 "../benchmark/avionics/avionics.c"
  temp1 = HUD_Reticle_Position;
# 126 "../benchmark/avionics/avionics.c"
  temp2 = HOTAS_Radar_Target_Designation_Selected;
# 127 "../benchmark/avionics/avionics.c"
  temp1 = Radar_Target_Position;
# 128 "../benchmark/avionics/avionics.c"
  temp2 = HOTAS_Undesignate_Selected;
# 130 "../benchmark/avionics/avionics.c"
  AG_Target_Location = temp1;
# 131 "../benchmark/avionics/avionics.c"
  HUD_Target_Reticle = temp1;
# 132 "../benchmark/avionics/avionics.c"
  HUD_Reticle_Position = temp1;
# 133 "../benchmark/avionics/avionics.c"
  AG_Radar_Target_Designation_Selected = temp2;
# 134 "../benchmark/avionics/avionics.c"
  AG_HUD_Target_Designation_Selected = temp2;
# 135 "../benchmark/avionics/avionics.c"
  return;
}
}
# 144 "../benchmark/avionics/avionics.c"
int DP_Keyset_RWR_Program_Message ;
# 145 "../benchmark/avionics/avionics.c"
int DP_Keyset_Weapon_Program_Message ;
# 146 "../benchmark/avionics/avionics.c"
int DP_Keyset_Target_Designation_Message ;
# 147 "../benchmark/avionics/avionics.c"
int DP_Keyset_Delivery_Mode_Toggle_Message ;
# 149 "../benchmark/avionics/avionics.c"
int Keyset_Waypoint_Table ;
# 150 "../benchmark/avionics/avionics.c"
int Keyset_Waypoint_Offset ;
# 151 "../benchmark/avionics/avionics.c"
int Keyset_Waypoint_Steering_Selected ;
# 152 "../benchmark/avionics/avionics.c"
int Keyset_Quantity_Select_Request ;
# 153 "../benchmark/avionics/avionics.c"
int Keyset_Interval_Select_Request ;
# 154 "../benchmark/avionics/avionics.c"
int Keyset_AUTO_CCIP_Toggle ;
# 155 "../benchmark/avionics/avionics.c"
int Keyset_RWR_Frequency_Table ;
# 156 "../benchmark/avionics/avionics.c"
int Keyset_RWR_Search_Sector_Table ;
# 159 "../benchmark/avionics/avionics.c"
void target_sweetening1(void)
{
  int temp1 ;
  int temp2 ;
  int temp3 ;
  int temp4 ;

  {
# 162 "../benchmark/avionics/avionics.c"
  temp1 = DP_Keyset_RWR_Program_Message;
# 163 "../benchmark/avionics/avionics.c"
  temp2 = DP_Keyset_Weapon_Program_Message;
# 164 "../benchmark/avionics/avionics.c"
  temp3 = DP_Keyset_Target_Designation_Message;
# 165 "../benchmark/avionics/avionics.c"
  temp4 = DP_Keyset_Delivery_Mode_Toggle_Message;
# 167 "../benchmark/avionics/avionics.c"
  Keyset_Waypoint_Table = temp4;
# 168 "../benchmark/avionics/avionics.c"
  Keyset_Waypoint_Offset = temp4;
# 169 "../benchmark/avionics/avionics.c"
  Keyset_Waypoint_Steering_Selected = temp3;
# 170 "../benchmark/avionics/avionics.c"
  Keyset_Quantity_Select_Request = temp2;
# 171 "../benchmark/avionics/avionics.c"
  Keyset_Interval_Select_Request = temp2;
# 172 "../benchmark/avionics/avionics.c"
  Keyset_AUTO_CCIP_Toggle = temp3;
# 173 "../benchmark/avionics/avionics.c"
  Keyset_RWR_Frequency_Table = temp1;
# 174 "../benchmark/avionics/avionics.c"
  Keyset_RWR_Search_Sector_Table = temp1;
# 175 "../benchmark/avionics/avionics.c"
  return;
}
}
# 184 "../benchmark/avionics/avionics.c"
int ADC_Angle_of_Attack ;
# 184 "../benchmark/avionics/avionics.c"
int ADC_Mach_Number ;
# 184 "../benchmark/avionics/avionics.c"
int ADC_Barometric_Altitude ;
# 185 "../benchmark/avionics/avionics.c"
int ADC_Magnetic_Heading ;
# 185 "../benchmark/avionics/avionics.c"
int ADC_True_Airspeed ;
# 186 "../benchmark/avionics/avionics.c"
int INS_Body_Rates ;
# 187 "../benchmark/avionics/avionics.c"
int INS_Acceleration ;
# 188 "../benchmark/avionics/avionics.c"
int INS_Present_Position ;
# 189 "../benchmark/avionics/avionics.c"
int INS_True_Heading ;
# 190 "../benchmark/avionics/avionics.c"
int INS_Velocity ;
# 191 "../benchmark/avionics/avionics.c"
int RALT_Radar_Altitude ;
# 193 "../benchmark/avionics/avionics.c"
int INS_Reference_Velocity ;
# 194 "../benchmark/avionics/avionics.c"
int NAV_Airspeed ;
# 195 "../benchmark/avionics/avionics.c"
int NAV_Rate_of_Change_Airspeed ;
# 196 "../benchmark/avionics/avionics.c"
int NAV_Position ;
# 197 "../benchmark/avionics/avionics.c"
int NAV_Angle_of_Attack ;
# 198 "../benchmark/avionics/avionics.c"
int NAV_Attitude ;
# 199 "../benchmark/avionics/avionics.c"
int NAV_Body_Rates ;
# 200 "../benchmark/avionics/avionics.c"
int NAV_Flight_Path_Angle ;
# 201 "../benchmark/avionics/avionics.c"
int NAV_Ground_Speed ;
# 202 "../benchmark/avionics/avionics.c"
int NAV_Ground_Track_Angle ;
# 203 "../benchmark/avionics/avionics.c"
int NAV_Magnetic_Variation ;
# 204 "../benchmark/avionics/avionics.c"
int NAV_Altitude ;
# 205 "../benchmark/avionics/avionics.c"
int NAV_Velocity ;
# 206 "../benchmark/avionics/avionics.c"
int NAV_Acceleration ;
# 207 "../benchmark/avionics/avionics.c"
int NAV_Wind ;
# 208 "../benchmark/avionics/avionics.c"
int NAV_Body_to_Earth_Transform ;
# 209 "../benchmark/avionics/avionics.c"
int NAV_Body_to_Horizon_Transform ;
# 210 "../benchmark/avionics/avionics.c"
int NAV_Radar_to_Body_Transform ;
# 211 "../benchmark/avionics/avionics.c"
int NAV_Radar_to_Earth_Transform ;
# 214 "../benchmark/avionics/avionics.c"
void aircraft_flight_data(void)
{
  int temp1 ;
  int temp2 ;
  int temp3 ;

  {
# 217 "../benchmark/avionics/avionics.c"
  temp1 = ADC_Angle_of_Attack;
# 218 "../benchmark/avionics/avionics.c"
  temp1 = RALT_Radar_Altitude;
# 219 "../benchmark/avionics/avionics.c"
  temp1 = ADC_Mach_Number;
# 220 "../benchmark/avionics/avionics.c"
  temp2 = ADC_Barometric_Altitude;
# 221 "../benchmark/avionics/avionics.c"
  temp2 = ADC_Magnetic_Heading;
# 222 "../benchmark/avionics/avionics.c"
  temp2 = ADC_True_Airspeed;
# 223 "../benchmark/avionics/avionics.c"
  temp3 = INS_Body_Rates;
# 224 "../benchmark/avionics/avionics.c"
  temp3 = INS_Acceleration;
# 225 "../benchmark/avionics/avionics.c"
  temp3 = INS_Present_Position;
# 226 "../benchmark/avionics/avionics.c"
  temp3 = INS_True_Heading;
# 227 "../benchmark/avionics/avionics.c"
  temp3 = INS_Velocity;
# 228 "../benchmark/avionics/avionics.c"
  temp3 = RALT_Radar_Altitude;
# 231 "../benchmark/avionics/avionics.c"
  INS_Reference_Velocity = temp1;
# 232 "../benchmark/avionics/avionics.c"
  NAV_Airspeed = temp1;
# 233 "../benchmark/avionics/avionics.c"
  NAV_Rate_of_Change_Airspeed = temp1;
# 234 "../benchmark/avionics/avionics.c"
  NAV_Position = temp1;
# 235 "../benchmark/avionics/avionics.c"
  NAV_Angle_of_Attack = temp1;
# 236 "../benchmark/avionics/avionics.c"
  NAV_Attitude = temp2;
# 237 "../benchmark/avionics/avionics.c"
  NAV_Body_Rates = temp2;
# 238 "../benchmark/avionics/avionics.c"
  NAV_Flight_Path_Angle = temp2;
# 239 "../benchmark/avionics/avionics.c"
  NAV_Ground_Speed = temp2;
# 240 "../benchmark/avionics/avionics.c"
  NAV_Ground_Track_Angle = temp2;
# 241 "../benchmark/avionics/avionics.c"
  NAV_Magnetic_Variation = temp2;
# 242 "../benchmark/avionics/avionics.c"
  NAV_Altitude = temp3;
# 243 "../benchmark/avionics/avionics.c"
  NAV_Velocity = temp3;
# 244 "../benchmark/avionics/avionics.c"
  NAV_Acceleration = temp3;
# 245 "../benchmark/avionics/avionics.c"
  NAV_Wind = temp3;
# 246 "../benchmark/avionics/avionics.c"
  NAV_Body_to_Earth_Transform = temp3;
# 247 "../benchmark/avionics/avionics.c"
  NAV_Body_to_Horizon_Transform = temp3;
# 248 "../benchmark/avionics/avionics.c"
  NAV_Radar_to_Body_Transform = temp3;
# 249 "../benchmark/avionics/avionics.c"
  NAV_Radar_to_Earth_Transform = temp3;
# 250 "../benchmark/avionics/avionics.c"
  return;
}
}
# 264 "../benchmark/avionics/avionics.c"
int NAV_Barometric_Altitude ;
# 266 "../benchmark/avionics/avionics.c"
int NAV_Steer_to_Point ;
# 271 "../benchmark/avionics/avionics.c"
int AG_Weapon_Down_Range_Travel ;
# 272 "../benchmark/avionics/avionics.c"
int AG_Weapon_Cross_Range_Travel ;
# 276 "../benchmark/avionics/avionics.c"
int DP_HUD_NAV_Data_Message ;
# 277 "../benchmark/avionics/avionics.c"
int DP_HUD_Pitch_Ladder_Message ;
# 278 "../benchmark/avionics/avionics.c"
int DP_HUD_Velocity_Vector_Message ;
# 279 "../benchmark/avionics/avionics.c"
int DP_HUD_Steering_Cue_Message ;
# 280 "../benchmark/avionics/avionics.c"
int DP_HUD_Reticle_Message ;
# 281 "../benchmark/avionics/avionics.c"
int DP_HUD_Weapon_Release_Message ;
# 282 "../benchmark/avionics/avionics.c"
int DP_HUD_CCIP_Display_Message ;
# 285 "../benchmark/avionics/avionics.c"
void HUD_display(void)
{
  int temp1 ;
  int temp2 ;
  int temp3 ;
  int temp4 ;

  {
# 288 "../benchmark/avionics/avionics.c"
  temp1 = NAV_Airspeed;
# 289 "../benchmark/avionics/avionics.c"
  temp2 = NAV_Position;
# 290 "../benchmark/avionics/avionics.c"
  temp3 = NAV_Angle_of_Attack;
# 291 "../benchmark/avionics/avionics.c"
  temp1 = NAV_Attitude;
# 292 "../benchmark/avionics/avionics.c"
  temp2 = NAV_Body_Rates;
# 293 "../benchmark/avionics/avionics.c"
  temp3 = NAV_Barometric_Altitude;
# 294 "../benchmark/avionics/avionics.c"
  temp1 = NAV_Velocity;
# 295 "../benchmark/avionics/avionics.c"
  temp2 = NAV_Steer_to_Point;
# 296 "../benchmark/avionics/avionics.c"
  temp3 = HUD_Target_Reticle;
# 297 "../benchmark/avionics/avionics.c"
  temp1 = HUD_Reticle_Position;
# 298 "../benchmark/avionics/avionics.c"
  temp2 = AG_Time_to_Go_to_Release;
# 299 "../benchmark/avionics/avionics.c"
  temp3 = AG_Delivery_Mode_Selected;
# 300 "../benchmark/avionics/avionics.c"
  temp4 = AG_Weapon_Down_Range_Travel;
# 301 "../benchmark/avionics/avionics.c"
  temp3 = AG_Weapon_Cross_Range_Travel;
# 303 "../benchmark/avionics/avionics.c"
  DP_HUD_NAV_Data_Message = temp1;
# 304 "../benchmark/avionics/avionics.c"
  DP_HUD_Pitch_Ladder_Message = temp2;
# 305 "../benchmark/avionics/avionics.c"
  DP_HUD_Velocity_Vector_Message = temp1;
# 306 "../benchmark/avionics/avionics.c"
  if (NAV_Steer_to_Point) {
# 307 "../benchmark/avionics/avionics.c"
    DP_HUD_Steering_Cue_Message = temp3;
  } else
# 306 "../benchmark/avionics/avionics.c"
  if (HUD_Target_Reticle) {
# 307 "../benchmark/avionics/avionics.c"
    DP_HUD_Steering_Cue_Message = temp3;
  }
# 308 "../benchmark/avionics/avionics.c"
  DP_HUD_Reticle_Message = temp1;
# 309 "../benchmark/avionics/avionics.c"
  if (AG_Delivery_Mode_Selected) {
# 309 "../benchmark/avionics/avionics.c"
    if (HUD_Reticle_Position) {
# 310 "../benchmark/avionics/avionics.c"
      DP_HUD_Weapon_Release_Message = temp4;
    }
  }
# 311 "../benchmark/avionics/avionics.c"
  DP_HUD_CCIP_Display_Message = temp2;
# 312 "../benchmark/avionics/avionics.c"
  return;
}
}
# 321 "../benchmark/avionics/avionics.c"
int MPD_Tactical_Display_Scale_Selected ;
# 323 "../benchmark/avionics/avionics.c"
int RWR_Threat_Table ;
# 330 "../benchmark/avionics/avionics.c"
int DP_MPD_Tactical_Radar_Contacts_Message ;
# 331 "../benchmark/avionics/avionics.c"
int DP_MPD_Tactical_Radar_Target_Message ;
# 332 "../benchmark/avionics/avionics.c"
int DP_MPD_Tactical_Threats_Display_Message ;
# 333 "../benchmark/avionics/avionics.c"
int DP_MPD_Tactical_Compass_Rose_Message ;
# 334 "../benchmark/avionics/avionics.c"
int DP_MPD_AG_Target_Message ;
# 337 "../benchmark/avionics/avionics.c"
void MPD_tactical_display(void)
{
  int temp1 ;
  int temp2 ;

  {
# 340 "../benchmark/avionics/avionics.c"
  temp1 = MPD_Tactical_Display_Scale_Selected;
# 341 "../benchmark/avionics/avionics.c"
  temp2 = Radar_Contact_Table;
# 342 "../benchmark/avionics/avionics.c"
  temp2 = RWR_Threat_Table;
# 343 "../benchmark/avionics/avionics.c"
  temp1 = NAV_Position;
# 344 "../benchmark/avionics/avionics.c"
  temp1 = NAV_Magnetic_Variation;
# 345 "../benchmark/avionics/avionics.c"
  temp2 = NAV_Steer_to_Point;
# 346 "../benchmark/avionics/avionics.c"
  temp1 = Radar_Target_Position;
# 347 "../benchmark/avionics/avionics.c"
  temp2 = AG_Target_Location;
# 349 "../benchmark/avionics/avionics.c"
  DP_MPD_Tactical_Radar_Contacts_Message = temp1;
# 350 "../benchmark/avionics/avionics.c"
  DP_MPD_Tactical_Radar_Target_Message = temp2;
# 351 "../benchmark/avionics/avionics.c"
  DP_MPD_Tactical_Threats_Display_Message = temp1;
# 352 "../benchmark/avionics/avionics.c"
  DP_MPD_Tactical_Compass_Rose_Message = temp2;
# 353 "../benchmark/avionics/avionics.c"
  DP_MPD_AG_Target_Message = temp1;
# 354 "../benchmark/avionics/avionics.c"
  return;
}
}
# 365 "../benchmark/avionics/avionics.c"
int MPD_Waypoint_Counter ;
# 367 "../benchmark/avionics/avionics.c"
int Keyset_Offset ;
# 374 "../benchmark/avionics/avionics.c"
void steering(void)
{
  int temp1 ;
  int temp2 ;

  {
# 377 "../benchmark/avionics/avionics.c"
  temp1 = NAV_Position;
# 378 "../benchmark/avionics/avionics.c"
  temp1 = NAV_Velocity;
# 379 "../benchmark/avionics/avionics.c"
  temp1 = MPD_Waypoint_Counter;
# 380 "../benchmark/avionics/avionics.c"
  temp1 = Keyset_Waypoint_Table;
# 381 "../benchmark/avionics/avionics.c"
  temp2 = Keyset_Offset;
# 382 "../benchmark/avionics/avionics.c"
  temp2 = Keyset_Waypoint_Steering_Selected;
# 383 "../benchmark/avionics/avionics.c"
  temp2 = AG_Target_Location;
# 385 "../benchmark/avionics/avionics.c"
  NAV_Steer_to_Point = temp1;
# 386 "../benchmark/avionics/avionics.c"
  return;
}
}
# 397 "../benchmark/avionics/avionics.c"
int NAV_Aircraft_Velocity ;
# 398 "../benchmark/avionics/avionics.c"
int NAV_Mach_Number ;
# 404 "../benchmark/avionics/avionics.c"
int MPD_Weapon_Selected ;
# 406 "../benchmark/avionics/avionics.c"
int SMS_Ballistic_Coefficients ;
# 409 "../benchmark/avionics/avionics.c"
int AG_Weapon_Time_of_Fall ;
# 412 "../benchmark/avionics/avionics.c"
int AG_Weapon_Down_Range_Error ;
# 413 "../benchmark/avionics/avionics.c"
int AG_Weapon_Cross_Range_Error ;
# 416 "../benchmark/avionics/avionics.c"
void weapon_trajectory(void)
{
  int temp1 ;
  int temp2 ;
  int temp3 ;

  {
# 419 "../benchmark/avionics/avionics.c"
  temp1 = NAV_Aircraft_Position;
# 420 "../benchmark/avionics/avionics.c"
  temp2 = NAV_Barometric_Altitude;
# 421 "../benchmark/avionics/avionics.c"
  temp3 = NAV_Aircraft_Velocity;
# 422 "../benchmark/avionics/avionics.c"
  temp1 = NAV_Mach_Number;
# 423 "../benchmark/avionics/avionics.c"
  temp2 = NAV_Wind;
# 424 "../benchmark/avionics/avionics.c"
  temp3 = NAV_Angle_of_Attack;
# 425 "../benchmark/avionics/avionics.c"
  temp1 = NAV_Attitude;
# 426 "../benchmark/avionics/avionics.c"
  temp2 = NAV_Body_Rates;
# 427 "../benchmark/avionics/avionics.c"
  temp3 = AG_Target_Location;
# 428 "../benchmark/avionics/avionics.c"
  temp1 = MPD_Weapon_Selected;
# 429 "../benchmark/avionics/avionics.c"
  temp2 = AG_Delivery_Mode_Selected;
# 430 "../benchmark/avionics/avionics.c"
  temp3 = SMS_Ballistic_Coefficients;
# 432 "../benchmark/avionics/avionics.c"
  AG_Time_to_Go_to_Release = temp1;
# 433 "../benchmark/avionics/avionics.c"
  AG_Weapon_Time_of_Fall = temp3;
# 434 "../benchmark/avionics/avionics.c"
  AG_Weapon_Down_Range_Travel = temp2;
# 435 "../benchmark/avionics/avionics.c"
  AG_Weapon_Cross_Range_Travel = temp3;
# 436 "../benchmark/avionics/avionics.c"
  AG_Weapon_Down_Range_Error = temp3;
# 437 "../benchmark/avionics/avionics.c"
  AG_Weapon_Cross_Range_Error = temp3;
# 438 "../benchmark/avionics/avionics.c"
  return;
}
}
# 447 "../benchmark/avionics/avionics.c"
int RWR_Threat_Table_Bearing ;
# 448 "../benchmark/avionics/avionics.c"
int RWR_Threat_Table_Frequency ;
# 450 "../benchmark/avionics/avionics.c"
int MPD_Threat_Warning ;
# 451 "../benchmark/avionics/avionics.c"
int HUD_Threat_Warning ;
# 454 "../benchmark/avionics/avionics.c"
void threat_response_display(void)
{
  int temp1 ;
  int temp2 ;

  {
# 457 "../benchmark/avionics/avionics.c"
  temp1 = RWR_Threat_Table_Bearing;
# 458 "../benchmark/avionics/avionics.c"
  temp2 = RWR_Threat_Table_Frequency;
# 460 "../benchmark/avionics/avionics.c"
  MPD_Threat_Warning = temp2;
# 461 "../benchmark/avionics/avionics.c"
  HUD_Threat_Warning = temp1;
# 462 "../benchmark/avionics/avionics.c"
  return;
}
}
# 477 "../benchmark/avionics/avionics.c"
void AUTO_CCIP_Toggle(void)
{
  int temp ;

  {
# 480 "../benchmark/avionics/avionics.c"
  temp = Keyset_AUTO_CCIP_Toggle;
# 481 "../benchmark/avionics/avionics.c"
  DP_HUD_CCIP_Display_Message = temp;
# 482 "../benchmark/avionics/avionics.c"
  return;
}
}
# 493 "../benchmark/avionics/avionics.c"
int SMS_Stores_Select ;
# 494 "../benchmark/avionics/avionics.c"
int SMS_Stores_Release ;
# 499 "../benchmark/avionics/avionics.c"
void poll_RWR(void)
{
  int temp1 ;
  int temp2 ;

  {
# 502 "../benchmark/avionics/avionics.c"
  temp1 = RWR_Threat_Table;
# 503 "../benchmark/avionics/avionics.c"
  SMS_Stores_Select = temp1;
# 504 "../benchmark/avionics/avionics.c"
  SMS_Stores_Release = temp1;
# 505 "../benchmark/avionics/avionics.c"
  MPD_Threat_Warning = temp2;
# 506 "../benchmark/avionics/avionics.c"
  HUD_Threat_Warning = temp2;
# 507 "../benchmark/avionics/avionics.c"
  return;
}
}
# 523 "../benchmark/avionics/avionics.c"
void reinitiate_trajectory(void)
{
  int temp1 ;
  int temp2 ;

  {
# 526 "../benchmark/avionics/avionics.c"
  temp1 = MPD_Weapon_Selected;
# 527 "../benchmark/avionics/avionics.c"
  temp2 = AG_Delivery_Mode_Selected;
# 529 "../benchmark/avionics/avionics.c"
  AG_Weapon_Down_Range_Error = temp1;
# 530 "../benchmark/avionics/avionics.c"
  AG_Weapon_Cross_Range_Error = temp2;
# 531 "../benchmark/avionics/avionics.c"
  return;
}
}
# 540 "../benchmark/avionics/avionics.c"
int Equipment_status_message ;
# 542 "../benchmark/avionics/avionics.c"
int MCC_Status ;
# 543 "../benchmark/avionics/avionics.c"
int ADC_Status ;
# 544 "../benchmark/avionics/avionics.c"
int INS_Status ;
# 545 "../benchmark/avionics/avionics.c"
int SMS_Status ;
# 547 "../benchmark/avionics/avionics.c"
int RWR_Status ;
# 548 "../benchmark/avionics/avionics.c"
int RALT_Status ;
# 549 "../benchmark/avionics/avionics.c"
int DP_MPD_Error_Advisory_Message ;
# 550 "../benchmark/avionics/avionics.c"
int DP_HUD_Error_Advisory_Message ;
# 553 "../benchmark/avionics/avionics.c"
void Periodic_BIT(void)
{
  int temp1 ;
  int temp2 ;
  int temp3 ;
  int temp4 ;
  int temp5 ;

  {
# 556 "../benchmark/avionics/avionics.c"
  temp4 = Equipment_status_message;
# 558 "../benchmark/avionics/avionics.c"
  MCC_Status = temp1;
# 559 "../benchmark/avionics/avionics.c"
  ADC_Status = temp2;
# 560 "../benchmark/avionics/avionics.c"
  INS_Status = temp3;
# 561 "../benchmark/avionics/avionics.c"
  SMS_Status = temp2;
# 562 "../benchmark/avionics/avionics.c"
  Radar_Status = temp4;
# 563 "../benchmark/avionics/avionics.c"
  RWR_Status = temp4;
# 564 "../benchmark/avionics/avionics.c"
  RALT_Status = temp1;
# 565 "../benchmark/avionics/avionics.c"
  DP_MPD_Error_Advisory_Message = temp5;
# 566 "../benchmark/avionics/avionics.c"
  DP_HUD_Error_Advisory_Message = temp5;
# 567 "../benchmark/avionics/avionics.c"
  return;
}
}
# 572 "../benchmark/avionics/avionics.c"
extern int ( create_task)() ;
# 570 "../benchmark/avionics/avionics.c"
void main(void)
{


  {
# 572 "../benchmark/avionics/avionics.c"
  create_task("Weapon_release", "weapon_release", 1, 10, 5.0);
# 573 "../benchmark/avionics/avionics.c"
  create_task("Radar_tracking", "radar_control", 2, 40, 2.0);
# 574 "../benchmark/avionics/avionics.c"
  create_task("Target_tracking", "target_tracking", 3, 40, 4.0);
# 575 "../benchmark/avionics/avionics.c"
  create_task("Target_sweetening", "target_sweetening", 4, 40, 2.0);
# 576 "../benchmark/avionics/avionics.c"
  create_task("HOTAS_bomb_button", "target_sweetening1", 5, 40, 1.0);
# 577 "../benchmark/avionics/avionics.c"
  create_task("Aircraft_flight_data", "aircraft_flight_data", 6, 55, 8.0);
# 578 "../benchmark/avionics/avionics.c"
  create_task("HUD_display", "HUD_display", 7, 52, 6.0);
# 579 "../benchmark/avionics/avionics.c"
  create_task("MPD_tactical_display", "MPD_tactical_display", 8, 50, 8.0);
# 580 "../benchmark/avionics/avionics.c"
  create_task("Steering", "steering", 9, 80, 6.0);
# 581 "../benchmark/avionics/avionics.c"
  create_task("Weapon_trajectory", "weapon_trajectory", 10, 100, 7.0);
# 582 "../benchmark/avionics/avionics.c"
  create_task("Threat_response_display", "threat_response_display", 11, 100, 3.0);
# 583 "../benchmark/avionics/avionics.c"
  create_task("Auto_CCIP_toggle", "AUTO_CCIP_Toggle", 12, 200, 1.0);
# 584 "../benchmark/avionics/avionics.c"
  create_task("Poll_RWR", "poll_RWR", 13, 100, 3.0);
# 585 "../benchmark/avionics/avionics.c"
  create_task("Reinitiate_trajectory", "reinitiate_trajectory", 14, 400, 6.0);
# 586 "../benchmark/avionics/avionics.c"
  create_task("Periodic_BIT", "Periodic_BIT", 15, 1000, 5.0);
# 587 "../benchmark/avionics/avionics.c"
  return;
}
}
