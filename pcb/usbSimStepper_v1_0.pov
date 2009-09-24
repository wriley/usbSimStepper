//POVRay-File created by 3d41.ulp v1.05
//C:/Documents and Settings/wriley/My Documents/Projects/usbSimStepper/pcb/usbSimStepper_v1_0.brd
//24/09/2009 15:11:32

#version 3.5;

//Set to on if the file should be used as .inc
#local use_file_as_inc = off;
#if(use_file_as_inc=off)


//changes the apperance of resistors (1 Blob / 0 real)
#declare global_res_shape = 1;
//randomize color of resistors 1=random 0=same color
#declare global_res_colselect = 0;
//Number of the color for the resistors
//0=Green, 1="normal color" 2=Blue 3=Brown
#declare global_res_col = 1;
//Set to on if you want to render the PCB upside-down
#declare pcb_upsidedown = off;
//Set to x or z to rotate around the corresponding axis (referring to pcb_upsidedown)
#declare pcb_rotdir = x;
//Set the length off short pins over the PCB
#declare pin_length = 2.5;
#declare global_diode_bend_radius = 1;
#declare global_res_bend_radius = 1;
#declare global_solder = on;

#declare global_show_screws = on;
#declare global_show_washers = on;
#declare global_show_nuts = on;

//Animation
#declare global_anim = on;
#local global_anim_showcampath = no;

#declare global_fast_mode = off;

#declare col_preset = 2;
#declare pin_short = on;

#declare environment = off;

#local cam_x = 0;
#local cam_y = 354;
#local cam_z = -189;
#local cam_a = 20;
#local cam_look_x = 0;
#local cam_look_y = -8;
#local cam_look_z = 0;

#local pcb_rotate_x = 0;
#local pcb_rotate_y = 0;
#local pcb_rotate_z = 0;

#local pcb_board = on;
#local pcb_parts = on;
#if(global_fast_mode=off)
	#local pcb_polygons = on;
	#local pcb_silkscreen = on;
	#local pcb_wires = on;
	#local pcb_pads_smds = on;
#else
	#local pcb_polygons = off;
	#local pcb_silkscreen = off;
	#local pcb_wires = off;
	#local pcb_pads_smds = off;
#end

#local lgt1_pos_x = 31;
#local lgt1_pos_y = 47;
#local lgt1_pos_z = 43;
#local lgt1_intense = 0.796949;
#local lgt2_pos_x = -31;
#local lgt2_pos_y = 47;
#local lgt2_pos_z = 43;
#local lgt2_intense = 0.796949;
#local lgt3_pos_x = 31;
#local lgt3_pos_y = 47;
#local lgt3_pos_z = -29;
#local lgt3_intense = 0.796949;
#local lgt4_pos_x = -31;
#local lgt4_pos_y = 47;
#local lgt4_pos_z = -29;
#local lgt4_intense = 0.796949;

//Do not change these values
#declare pcb_height = 1.500000;
#declare pcb_cuheight = 0.035000;
#declare pcb_x_size = 82.220000;
#declare pcb_y_size = 82.540000;
#declare pcb_layer1_used = 1;
#declare pcb_layer16_used = 1;
#declare inc_testmode = off;
#declare global_seed=seed(645);
#declare global_pcb_layer_dis = array[16]
{
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	1.535000,
}
#declare global_pcb_real_hole = 2.000000;

#include "tools.inc"
#include "user.inc"

global_settings{charset utf8}

#if(environment=on)
sky_sphere {pigment {Navy}
pigment {bozo turbulence 0.65 octaves 7 omega 0.7 lambda 2
color_map {
[0.0 0.1 color rgb <0.85, 0.85, 0.85> color rgb <0.75, 0.75, 0.75>]
[0.1 0.5 color rgb <0.75, 0.75, 0.75> color rgbt <1, 1, 1, 1>]
[0.5 1.0 color rgbt <1, 1, 1, 1> color rgbt <1, 1, 1, 1>]}
scale <0.1, 0.5, 0.1>} rotate -90*x}
plane{y, -10.0-max(pcb_x_size,pcb_y_size)*abs(max(sin((pcb_rotate_x/180)*pi),sin((pcb_rotate_z/180)*pi)))
texture{T_Chrome_2D
normal{waves 0.1 frequency 3000.0 scale 3000.0}} translate<0,0,0>}
#end

//Animation data
#if(global_anim=on)
#declare global_anim_showcampath = no;
#end

#declare global_anim_npoints_cam_flight=10;
#local global_anim_points_cam_flight=array[global_anim_npoints_cam_flight]
{	<-40.640000,200.000000,-49.530000>
	<-2.540000,50.000000,-15.240000>
	<41.910000,40.000000,-5.080000>
	<86.360000,40.000000,11.430000>
	<96.520000,40.000000,39.370000>
	<86.360000,40.000000,64.770000>
	<36.830000,40.000000,97.790000>
	<-35.560000,60.000000,87.630000>
	<-44.450000,80.000000,60.960000>
	<-43.180000,100.000000,45.720000>
};

#declare global_anim_npoints_cam_view=4;
#local global_anim_points_cam_view=array[global_anim_npoints_cam_view]
{	<27.940000,20.000000,24.130000>
	<35.560000,20.000000,29.210000>
	<39.370000,20.000000,35.560000>
	<41.910000,20.000000,40.640000>
};

#if((global_anim=on)|(global_anim_showcampath=yes))
#local global_anim_spline_cam_flight = 
spline{
	natural_spline	#local i=0;
	#local cnt=0;
	#local inc=1/(global_anim_npoints_cam_flight-1);

	#while(i<1.0000001)
		i,	global_anim_points_cam_flight[cnt]+<-41.110000,0,-41.270000>

		#local i = i+inc;
		#local cnt = cnt+1;
	#end
}
#local global_anim_spline_cam_view = 
spline{
	natural_spline	#local i=0;
	#local cnt=0;
	#local inc=1/(global_anim_npoints_cam_view-1);

	#while(i<1.0000001)
		i,	global_anim_points_cam_view[cnt]+<-41.110000,0,-41.270000>

		#local i = i+inc;
		#local cnt = cnt+1;
	#end
}
#end

#if((global_anim_showcampath=yes)&(global_anim=off))
#local ctr = 0;
#while (ctr < 1)
	sphere {
		global_anim_spline_cam_flight(ctr),0.4
		pigment { rgb <1-ctr,0,0> }
	}
#local ctr = ctr + 0.001;
#end
#local ctr = 0;
#while (ctr < global_anim_npoints_cam_flight)
	sphere {
	global_anim_points_cam_flight[ctr]+<-41.110000,0,-41.270000>,0.5
	pigment { Blue }
	}
#local ctr = ctr + 1;
#end
#local ctr = 0;
#while (ctr < 1)
	sphere {
		global_anim_spline_cam_view(ctr),0.4
		pigment { rgb <1-ctr,1,1-ctr> }
	}
#local ctr = ctr + 0.001;
#end
#local ctr = 0;
#while (ctr < global_anim_npoints_cam_view)
	sphere {
	global_anim_points_cam_view[ctr]+<-41.110000,0,-41.270000>,0.5
	pigment { Red }
	}
#local ctr = ctr + 1;
#end
#end
#if(global_anim=on)
camera
{
	location global_anim_spline_cam_flight(clock)
	#if(global_anim_npoints_cam_view>2)
		look_at global_anim_spline_cam_view(clock)
	#else
		look_at global_anim_spline_cam_flight(clock+0.01)-<0,-0.01,0>
	#end
	angle 45
}
light_source
{
	global_anim_spline_cam_flight(clock)
	color rgb <1,1,1>
	spotlight point_at 
	#if(global_anim_npoints_cam_view>2)
		global_anim_spline_cam_view(clock)
	#else
		global_anim_spline_cam_flight(clock+0.01)-<0,-0.01,0>
	#end
	radius 35 falloff  40
}
#else
camera
{
	location <cam_x,cam_y,cam_z>
	look_at <cam_look_x,cam_look_y,cam_look_z>
	angle cam_a
	//translates the camera that <0,0,0> is over the Eagle <0,0>
	//translate<-41.110000,0,-41.270000>
}
#end

background{col_bgr}


//Axis uncomment to activate
//object{TOOLS_AXIS_XYZ(100,100,100 //texture{ pigment{rgb<1,0,0>} finish{diffuse 0.8 phong 1}}, //texture{ pigment{rgb<1,1,1>} finish{diffuse 0.8 phong 1}})}

light_source{<lgt1_pos_x,lgt1_pos_y,lgt1_pos_z> White*lgt1_intense}
light_source{<lgt2_pos_x,lgt2_pos_y,lgt2_pos_z> White*lgt2_intense}
light_source{<lgt3_pos_x,lgt3_pos_y,lgt3_pos_z> White*lgt3_intense}
light_source{<lgt4_pos_x,lgt4_pos_y,lgt4_pos_z> White*lgt4_intense}
#end


#macro USBSIMSTEPPER_V1_0(mac_x_ver,mac_y_ver,mac_z_ver,mac_x_rot,mac_y_rot,mac_z_rot)
union{
#if(pcb_board = on)
difference{
union{
//Board
prism{-1.500000,0.000000,8
<0.000000,0.000000><82.220000,0.000000>
<82.220000,0.000000><82.220000,82.540000>
<82.220000,82.540000><0.000000,82.540000>
<0.000000,82.540000><0.000000,0.000000>
texture{col_brd}}
}//End union(Platine)
//Holes(real)/Parts
cylinder{<16.510000,1,3.810000><16.510000,-5,3.810000>1.651000 texture{col_hls}}
cylinder{<64.770000,1,3.810000><64.770000,-5,3.810000>1.651000 texture{col_hls}}
cylinder{<17.780000,1,78.740000><17.780000,-5,78.740000>1.651000 texture{col_hls}}
cylinder{<64.770000,1,78.740000><64.770000,-5,78.740000>1.651000 texture{col_hls}}
//Holes(real)/Board
cylinder{<40.640000,1,77.470000><40.640000,-5,77.470000>1.600000 texture{col_hls}}
cylinder{<40.640000,1,69.850000><40.640000,-5,69.850000>1.600000 texture{col_hls}}
cylinder{<39.370000,1,49.530000><39.370000,-5,49.530000>1.600000 texture{col_hls}}
cylinder{<45.720000,1,49.530000><45.720000,-5,49.530000>1.600000 texture{col_hls}}
cylinder{<17.780000,1,40.640000><17.780000,-5,40.640000>1.600000 texture{col_hls}}
cylinder{<17.780000,1,20.320000><17.780000,-5,20.320000>1.600000 texture{col_hls}}
//Holes(real)/Vias
cylinder{<35.560000,0.095000,6.172200><35.560000,-1.595000,6.172200>1.143000 texture{col_hls}}
cylinder{<47.599600,0.095000,6.172200><47.599600,-1.595000,6.172200>1.143000 texture{col_hls}}
}//End difference(reale Bohrungen/Durchbrüche)
#end
#if(pcb_parts=on)//Parts
union{
#ifndef(pack_IC1) #declare global_pack_IC1=yes; object {IC_DIS_DIP28("ATMEGA8","ATMEL",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<41.910000,0.000000,30.480000>translate<0,3.000000,0> }#end		//DIP28 300mil IC1 ATMEGA8 DIL28-3
#ifndef(pack_IC1) object{SOCKET_DIP28()rotate<0,0.000000,0> rotate<0,0,0> translate<41.910000,0.000000,30.480000>}#end					//IC-Sockel 28Pin IC1 ATMEGA8
#ifndef(pack_IC2) #declare global_pack_IC2=yes; object {IC_DIS_DIP16("L293D","ST",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<21.590000,0.000000,57.150000>translate<0,3.000000,0> }#end		//DIP16 IC2 L293D DIL16
#ifndef(pack_IC2) object{SOCKET_DIP16()rotate<0,0.000000,0> rotate<0,0,0> translate<21.590000,0.000000,57.150000>}#end					//IC-Sockel 16Pin IC2 L293D
#ifndef(pack_IC3) #declare global_pack_IC3=yes; object {IC_DIS_DIP16("L293D","ST",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<62.230000,0.000000,57.150000>translate<0,3.000000,0> }#end		//DIP16 IC3 L293D DIL16
#ifndef(pack_IC3) object{SOCKET_DIP16()rotate<0,0.000000,0> rotate<0,0,0> translate<62.230000,0.000000,57.150000>}#end					//IC-Sockel 16Pin IC3 L293D
#ifndef(pack_LED1) #declare global_pack_LED1=yes; object {DIODE_DIS_LED_5MM(Green,0.500000,0.000000,)translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<11.430000,0.000000,43.180000>}#end		//Diskrete 5MM LED LED1 PWR LED5MM
#ifndef(pack_LED2) #declare global_pack_LED2=yes; object {DIODE_DIS_LED_5MM(Red,0.500000,0.000000,)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<11.430000,0.000000,68.580000>}#end		//Diskrete 5MM LED LED2 MPWR LED5MM
#ifndef(pack_R1) #declare global_pack_R1=yes; object {RES_DIS_0204_075MM(texture{pigment{Blue}finish{phong 0.2}},texture{pigment{Gray45}finish{phong 0.2}},texture{pigment{Black}finish{phong 0.2}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<31.750000,0.000000,19.050000>}#end		//Discrete Resistor 0,15W 7,5MM Grid R1 68 0204/7
#ifndef(pack_R2) #declare global_pack_R2=yes; object {RES_DIS_0204_075MM(texture{pigment{Blue}finish{phong 0.2}},texture{pigment{Gray45}finish{phong 0.2}},texture{pigment{Black}finish{phong 0.2}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<63.500000,0.000000,30.480000>}#end		//Discrete Resistor 0,15W 7,5MM Grid R2 68 0204/7
#ifndef(pack_R3) #declare global_pack_R3=yes; object {RES_DIS_0204_075MM(texture{pigment{DarkBrown}finish{phong 0.2}},texture{pigment{Green*0.7}finish{phong 0.2}},texture{pigment{Red*0.7}finish{phong 0.2}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<59.690000,0.000000,38.100000>}#end		//Discrete Resistor 0,15W 7,5MM Grid R3 1K5 0204/7
#ifndef(pack_R4) #declare global_pack_R4=yes; object {RES_DIS_0204_075MM(texture{pigment{DarkBrown}finish{phong 0.2}},texture{pigment{Black}finish{phong 0.2}},texture{pigment{Green*0.7}finish{phong 0.2}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<27.940000,0.000000,12.700000>}#end		//Discrete Resistor 0,15W 7,5MM Grid R4 1M 0204/7
#ifndef(pack_R5) #declare global_pack_R5=yes; object {RES_DIS_0204_075MM(texture{pigment{DarkBrown}finish{phong 0.2}},texture{pigment{Green*0.7}finish{phong 0.2}},texture{pigment{DarkBrown}finish{phong 0.2}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<8.890000,0.000000,48.260000>}#end		//Discrete Resistor 0,15W 7,5MM Grid R5 150 0204/7
#ifndef(pack_R6) #declare global_pack_R6=yes; object {RES_DIS_0204_075MM(texture{pigment{DarkBrown}finish{phong 0.2}},texture{pigment{Green*0.7}finish{phong 0.2}},texture{pigment{DarkBrown}finish{phong 0.2}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<13.970000,0.000000,73.660000>}#end		//Discrete Resistor 0,15W 7,5MM Grid R6 150 0204/7
#ifndef(pack_R7) #declare global_pack_R7=yes; object {RES_DIS_0204_075MM(texture{pigment{DarkBrown}finish{phong 0.2}},texture{pigment{Black}finish{phong 0.2}},texture{pigment{Orange}finish{phong 0.2}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<43.180000,0.000000,40.640000>}#end		//Discrete Resistor 0,15W 7,5MM Grid R7 10K 0204/7
#ifndef(pack_R8) #declare global_pack_R8=yes; object {RES_DIS_0204_075MM(texture{pigment{DarkBrown}finish{phong 0.2}},texture{pigment{Black}finish{phong 0.2}},texture{pigment{Orange}finish{phong 0.2}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<21.590000,0.000000,30.480000>}#end		//Discrete Resistor 0,15W 7,5MM Grid R8 10K 0204/7
#ifndef(pack_R9) #declare global_pack_R9=yes; object {RES_DIS_0204_075MM(texture{pigment{DarkBrown}finish{phong 0.2}},texture{pigment{Black}finish{phong 0.2}},texture{pigment{Orange}finish{phong 0.2}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<39.370000,0.000000,23.495000>}#end		//Discrete Resistor 0,15W 7,5MM Grid R9 10K 0204/7
#ifndef(pack_R10) #declare global_pack_R10=yes; object {RES_DIS_0204_075MM(texture{pigment{DarkBrown}finish{phong 0.2}},texture{pigment{Black}finish{phong 0.2}},texture{pigment{Orange}finish{phong 0.2}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<8.890000,0.000000,57.150000>}#end		//Discrete Resistor 0,15W 7,5MM Grid R10 10K 0204/7
#ifndef(pack_R11) #declare global_pack_R11=yes; object {RES_DIS_0204_075MM(texture{pigment{DarkBrown}finish{phong 0.2}},texture{pigment{Black}finish{phong 0.2}},texture{pigment{Orange}finish{phong 0.2}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<34.290000,0.000000,57.150000>}#end		//Discrete Resistor 0,15W 7,5MM Grid R11 10K 0204/7
#ifndef(pack_R12) #declare global_pack_R12=yes; object {RES_DIS_0204_075MM(texture{pigment{DarkBrown}finish{phong 0.2}},texture{pigment{Green*0.7}finish{phong 0.2}},texture{pigment{DarkBrown}finish{phong 0.2}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<60.960000,0.000000,40.640000>}#end		//Discrete Resistor 0,15W 7,5MM Grid R12 150 0204/7
#ifndef(pack_R13) #declare global_pack_R13=yes; object {RES_DIS_0204_075MM(texture{pigment{DarkBrown}finish{phong 0.2}},texture{pigment{Black}finish{phong 0.2}},texture{pigment{Orange}finish{phong 0.2}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<49.530000,0.000000,57.150000>}#end		//Discrete Resistor 0,15W 7,5MM Grid R13 10K 0204/7
#ifndef(pack_R14) #declare global_pack_R14=yes; object {RES_DIS_0204_075MM(texture{pigment{DarkBrown}finish{phong 0.2}},texture{pigment{Black}finish{phong 0.2}},texture{pigment{Orange}finish{phong 0.2}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<74.930000,0.000000,57.150000>}#end		//Discrete Resistor 0,15W 7,5MM Grid R14 10K 0204/7
#ifndef(pack_R15) #declare global_pack_R15=yes; object {RES_DIS_0204_075MM(texture{pigment{DarkBrown}finish{phong 0.2}},texture{pigment{Black}finish{phong 0.2}},texture{pigment{Red*0.7}finish{phong 0.2}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<53.340000,0.000000,40.640000>}#end		//Discrete Resistor 0,15W 7,5MM Grid R15 1K 0204/7
#ifndef(pack_R16) #declare global_pack_R16=yes; object {RES_DIS_0204_075MM(texture{pigment{DarkBrown}finish{phong 0.2}},texture{pigment{Green*0.7}finish{phong 0.2}},texture{pigment{DarkBrown}finish{phong 0.2}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<72.390000,0.000000,40.640000>}#end		//Discrete Resistor 0,15W 7,5MM Grid R16 150 0204/7
#ifndef(pack_R17) #declare global_pack_R17=yes; object {RES_DIS_0204_075MM(texture{pigment{DarkBrown}finish{phong 0.2}},texture{pigment{Black}finish{phong 0.2}},texture{pigment{Red*0.7}finish{phong 0.2}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<50.800000,0.000000,40.640000>}#end		//Discrete Resistor 0,15W 7,5MM Grid R17 1K 0204/7
}//End union
#end
#if(pcb_pads_smds=on)
//Pads&SMD/Parts
#ifndef(global_pack_C1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.651000,0.700000,1,16,1+global_tmp,0) rotate<0,-180.000000,0>translate<48.260000,0,17.145000> texture{col_thl}}
#ifndef(global_pack_C1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.651000,0.700000,1,16,1+global_tmp,0) rotate<0,-180.000000,0>translate<45.720000,0,17.145000> texture{col_thl}}
#ifndef(global_pack_C2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.651000,0.700000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<53.340000,0,17.145000> texture{col_thl}}
#ifndef(global_pack_C2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.651000,0.700000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<55.880000,0,17.145000> texture{col_thl}}
#ifndef(global_pack_C3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.651000,0.700000,1,16,1+global_tmp,0) rotate<0,-90.000000,0>translate<45.720000,0,38.100000> texture{col_thl}}
#ifndef(global_pack_C3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.651000,0.700000,1,16,1+global_tmp,0) rotate<0,-90.000000,0>translate<45.720000,0,40.640000> texture{col_thl}}
#ifndef(global_pack_C4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.651000,0.700000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<71.120000,0,50.800000> texture{col_thl}}
#ifndef(global_pack_C4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.651000,0.700000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<73.660000,0,50.800000> texture{col_thl}}
#ifndef(global_pack_C5) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.651000,0.700000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<30.480000,0,50.800000> texture{col_thl}}
#ifndef(global_pack_C5) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.651000,0.700000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<33.020000,0,50.800000> texture{col_thl}}
#ifndef(global_pack_D2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.408000,0.900000,1,16,1+global_tmp,0) rotate<0,-180.000000,0>translate<31.496000,0,10.160000> texture{col_thl}}
#ifndef(global_pack_D2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.408000,0.900000,1,16,1+global_tmp,0) rotate<0,-180.000000,0>translate<24.384000,0,10.160000> texture{col_thl}}
#ifndef(global_pack_D3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.408000,0.900000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<49.784000,0,11.430000> texture{col_thl}}
#ifndef(global_pack_D3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.408000,0.900000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<56.896000,0,11.430000> texture{col_thl}}
#ifndef(global_pack_IC1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<25.400000,0,26.670000> texture{col_thl}}
#ifndef(global_pack_IC1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<27.940000,0,26.670000> texture{col_thl}}
#ifndef(global_pack_IC1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<30.480000,0,26.670000> texture{col_thl}}
#ifndef(global_pack_IC1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<33.020000,0,26.670000> texture{col_thl}}
#ifndef(global_pack_IC1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<35.560000,0,26.670000> texture{col_thl}}
#ifndef(global_pack_IC1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<38.100000,0,26.670000> texture{col_thl}}
#ifndef(global_pack_IC1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<40.640000,0,26.670000> texture{col_thl}}
#ifndef(global_pack_IC1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<43.180000,0,26.670000> texture{col_thl}}
#ifndef(global_pack_IC1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<45.720000,0,26.670000> texture{col_thl}}
#ifndef(global_pack_IC1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<48.260000,0,26.670000> texture{col_thl}}
#ifndef(global_pack_IC1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<50.800000,0,26.670000> texture{col_thl}}
#ifndef(global_pack_IC1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<53.340000,0,26.670000> texture{col_thl}}
#ifndef(global_pack_IC1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<55.880000,0,26.670000> texture{col_thl}}
#ifndef(global_pack_IC1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<58.420000,0,26.670000> texture{col_thl}}
#ifndef(global_pack_IC1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<58.420000,0,34.290000> texture{col_thl}}
#ifndef(global_pack_IC1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<55.880000,0,34.290000> texture{col_thl}}
#ifndef(global_pack_IC1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<53.340000,0,34.290000> texture{col_thl}}
#ifndef(global_pack_IC1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<50.800000,0,34.290000> texture{col_thl}}
#ifndef(global_pack_IC1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<48.260000,0,34.290000> texture{col_thl}}
#ifndef(global_pack_IC1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<45.720000,0,34.290000> texture{col_thl}}
#ifndef(global_pack_IC1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<43.180000,0,34.290000> texture{col_thl}}
#ifndef(global_pack_IC1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<40.640000,0,34.290000> texture{col_thl}}
#ifndef(global_pack_IC1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<38.100000,0,34.290000> texture{col_thl}}
#ifndef(global_pack_IC1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<35.560000,0,34.290000> texture{col_thl}}
#ifndef(global_pack_IC1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<33.020000,0,34.290000> texture{col_thl}}
#ifndef(global_pack_IC1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<30.480000,0,34.290000> texture{col_thl}}
#ifndef(global_pack_IC1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<27.940000,0,34.290000> texture{col_thl}}
#ifndef(global_pack_IC1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<25.400000,0,34.290000> texture{col_thl}}
#ifndef(global_pack_IC2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.600200,0.812800,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<12.700000,0,53.340000> texture{col_thl}}
#ifndef(global_pack_IC2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.600200,0.812800,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<15.240000,0,53.340000> texture{col_thl}}
#ifndef(global_pack_IC2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.600200,0.812800,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<17.780000,0,53.340000> texture{col_thl}}
#ifndef(global_pack_IC2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.600200,0.812800,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<20.320000,0,53.340000> texture{col_thl}}
#ifndef(global_pack_IC2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.600200,0.812800,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<22.860000,0,53.340000> texture{col_thl}}
#ifndef(global_pack_IC2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.600200,0.812800,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<25.400000,0,53.340000> texture{col_thl}}
#ifndef(global_pack_IC2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.600200,0.812800,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<27.940000,0,53.340000> texture{col_thl}}
#ifndef(global_pack_IC2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.600200,0.812800,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<30.480000,0,53.340000> texture{col_thl}}
#ifndef(global_pack_IC2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.600200,0.812800,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<30.480000,0,60.960000> texture{col_thl}}
#ifndef(global_pack_IC2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.600200,0.812800,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<27.940000,0,60.960000> texture{col_thl}}
#ifndef(global_pack_IC2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.600200,0.812800,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<25.400000,0,60.960000> texture{col_thl}}
#ifndef(global_pack_IC2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.600200,0.812800,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<22.860000,0,60.960000> texture{col_thl}}
#ifndef(global_pack_IC2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.600200,0.812800,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<20.320000,0,60.960000> texture{col_thl}}
#ifndef(global_pack_IC2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.600200,0.812800,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<17.780000,0,60.960000> texture{col_thl}}
#ifndef(global_pack_IC2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.600200,0.812800,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<15.240000,0,60.960000> texture{col_thl}}
#ifndef(global_pack_IC2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.600200,0.812800,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<12.700000,0,60.960000> texture{col_thl}}
#ifndef(global_pack_IC3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.600200,0.812800,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<53.340000,0,53.340000> texture{col_thl}}
#ifndef(global_pack_IC3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.600200,0.812800,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<55.880000,0,53.340000> texture{col_thl}}
#ifndef(global_pack_IC3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.600200,0.812800,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<58.420000,0,53.340000> texture{col_thl}}
#ifndef(global_pack_IC3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.600200,0.812800,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<60.960000,0,53.340000> texture{col_thl}}
#ifndef(global_pack_IC3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.600200,0.812800,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<63.500000,0,53.340000> texture{col_thl}}
#ifndef(global_pack_IC3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.600200,0.812800,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<66.040000,0,53.340000> texture{col_thl}}
#ifndef(global_pack_IC3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.600200,0.812800,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<68.580000,0,53.340000> texture{col_thl}}
#ifndef(global_pack_IC3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.600200,0.812800,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<71.120000,0,53.340000> texture{col_thl}}
#ifndef(global_pack_IC3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.600200,0.812800,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<71.120000,0,60.960000> texture{col_thl}}
#ifndef(global_pack_IC3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.600200,0.812800,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<68.580000,0,60.960000> texture{col_thl}}
#ifndef(global_pack_IC3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.600200,0.812800,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<66.040000,0,60.960000> texture{col_thl}}
#ifndef(global_pack_IC3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.600200,0.812800,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<63.500000,0,60.960000> texture{col_thl}}
#ifndef(global_pack_IC3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.600200,0.812800,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<60.960000,0,60.960000> texture{col_thl}}
#ifndef(global_pack_IC3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.600200,0.812800,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<58.420000,0,60.960000> texture{col_thl}}
#ifndef(global_pack_IC3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.600200,0.812800,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<55.880000,0,60.960000> texture{col_thl}}
#ifndef(global_pack_IC3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.600200,0.812800,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<53.340000,0,60.960000> texture{col_thl}}
#ifndef(global_pack_JP1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.879600,1.016000,1,16,0+global_tmp,0) rotate<0,-270.000000,0>translate<71.120000,0,33.020000> texture{col_thl}}
#ifndef(global_pack_JP1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.879600,1.016000,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<73.660000,0,33.020000> texture{col_thl}}
#ifndef(global_pack_JP1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.879600,1.016000,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<71.120000,0,30.480000> texture{col_thl}}
#ifndef(global_pack_JP1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.879600,1.016000,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<73.660000,0,30.480000> texture{col_thl}}
#ifndef(global_pack_JP1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.879600,1.016000,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<71.120000,0,27.940000> texture{col_thl}}
#ifndef(global_pack_JP1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.879600,1.016000,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<73.660000,0,27.940000> texture{col_thl}}
#ifndef(global_pack_JP2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.879600,1.016000,1,16,0+global_tmp,0) rotate<0,-0.000000,0>translate<40.640000,0,59.690000> texture{col_thl}}
#ifndef(global_pack_JP2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.879600,1.016000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<43.180000,0,59.690000> texture{col_thl}}
#ifndef(global_pack_JP3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.879600,1.016000,1,16,0+global_tmp,0) rotate<0,-180.000000,0>translate<27.940000,0,40.640000> texture{col_thl}}
#ifndef(global_pack_JP3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.879600,1.016000,1,16,1+global_tmp,0) rotate<0,-180.000000,0>translate<25.400000,0,40.640000> texture{col_thl}}
#ifndef(global_pack_JP3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.879600,1.016000,1,16,1+global_tmp,0) rotate<0,-180.000000,0>translate<22.860000,0,40.640000> texture{col_thl}}
#ifndef(global_pack_JP4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.879600,1.016000,1,16,0+global_tmp,0) rotate<0,-0.000000,0>translate<22.860000,0,20.320000> texture{col_thl}}
#ifndef(global_pack_JP4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.879600,1.016000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<25.400000,0,20.320000> texture{col_thl}}
#ifndef(global_pack_JP4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.879600,1.016000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<27.940000,0,20.320000> texture{col_thl}}
#ifndef(global_pack_JP5) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.879600,1.016000,1,16,0+global_tmp,0) rotate<0,-0.000000,0>translate<36.830000,0,19.050000> texture{col_thl}}
#ifndef(global_pack_JP5) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.879600,1.016000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<39.370000,0,19.050000> texture{col_thl}}
#ifndef(global_pack_JP6) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.879600,1.016000,1,16,0+global_tmp,0) rotate<0,-90.000000,0>translate<30.480000,0,69.850000> texture{col_thl}}
#ifndef(global_pack_JP6) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.879600,1.016000,1,16,1+global_tmp,0) rotate<0,-90.000000,0>translate<30.480000,0,72.390000> texture{col_thl}}
#ifndef(global_pack_JP6) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.879600,1.016000,1,16,1+global_tmp,0) rotate<0,-90.000000,0>translate<30.480000,0,74.930000> texture{col_thl}}
#ifndef(global_pack_JP6) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.879600,1.016000,1,16,1+global_tmp,0) rotate<0,-90.000000,0>translate<30.480000,0,77.470000> texture{col_thl}}
#ifndef(global_pack_JP7) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.879600,1.016000,1,16,0+global_tmp,0) rotate<0,-90.000000,0>translate<50.800000,0,69.850000> texture{col_thl}}
#ifndef(global_pack_JP7) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.879600,1.016000,1,16,1+global_tmp,0) rotate<0,-90.000000,0>translate<50.800000,0,72.390000> texture{col_thl}}
#ifndef(global_pack_JP7) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.879600,1.016000,1,16,1+global_tmp,0) rotate<0,-90.000000,0>translate<50.800000,0,74.930000> texture{col_thl}}
#ifndef(global_pack_JP7) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.879600,1.016000,1,16,1+global_tmp,0) rotate<0,-90.000000,0>translate<50.800000,0,77.470000> texture{col_thl}}
#ifndef(global_pack_JP8) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.879600,1.016000,1,16,0+global_tmp,0) rotate<0,-0.000000,0>translate<57.150000,0,45.720000> texture{col_thl}}
#ifndef(global_pack_JP8) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.879600,1.016000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<59.690000,0,45.720000> texture{col_thl}}
#ifndef(global_pack_JP8) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.879600,1.016000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<62.230000,0,45.720000> texture{col_thl}}
#ifndef(global_pack_JP9) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.879600,1.016000,1,16,0+global_tmp,0) rotate<0,-0.000000,0>translate<68.580000,0,45.720000> texture{col_thl}}
#ifndef(global_pack_JP9) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.879600,1.016000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<71.120000,0,45.720000> texture{col_thl}}
#ifndef(global_pack_JP9) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.879600,1.016000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<73.660000,0,45.720000> texture{col_thl}}
#ifndef(global_pack_LED1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.879600,0.812800,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<10.160000,0,43.180000> texture{col_thl}}
#ifndef(global_pack_LED1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.879600,0.812800,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<12.700000,0,43.180000> texture{col_thl}}
#ifndef(global_pack_LED2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.879600,0.812800,1,16,1+global_tmp,0) rotate<0,-180.000000,0>translate<12.700000,0,68.580000> texture{col_thl}}
#ifndef(global_pack_LED2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.879600,0.812800,1,16,1+global_tmp,0) rotate<0,-180.000000,0>translate<10.160000,0,68.580000> texture{col_thl}}
#ifndef(global_pack_Q1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,1+global_tmp,0) rotate<0,-90.000000,0>translate<48.260000,0,21.590000> texture{col_thl}}
#ifndef(global_pack_Q1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,1+global_tmp,0) rotate<0,-90.000000,0>translate<53.340000,0,21.590000> texture{col_thl}}
#ifndef(global_pack_R1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<31.750000,0,22.860000> texture{col_thl}}
#ifndef(global_pack_R1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<31.750000,0,15.240000> texture{col_thl}}
#ifndef(global_pack_R2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<63.500000,0,26.670000> texture{col_thl}}
#ifndef(global_pack_R2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<63.500000,0,34.290000> texture{col_thl}}
#ifndef(global_pack_R3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<55.880000,0,38.100000> texture{col_thl}}
#ifndef(global_pack_R3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<63.500000,0,38.100000> texture{col_thl}}
#ifndef(global_pack_R4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<31.750000,0,12.700000> texture{col_thl}}
#ifndef(global_pack_R4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<24.130000,0,12.700000> texture{col_thl}}
#ifndef(global_pack_R5) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<5.080000,0,48.260000> texture{col_thl}}
#ifndef(global_pack_R5) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<12.700000,0,48.260000> texture{col_thl}}
#ifndef(global_pack_R6) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<17.780000,0,73.660000> texture{col_thl}}
#ifndef(global_pack_R6) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<10.160000,0,73.660000> texture{col_thl}}
#ifndef(global_pack_R7) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<43.180000,0,44.450000> texture{col_thl}}
#ifndef(global_pack_R7) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<43.180000,0,36.830000> texture{col_thl}}
#ifndef(global_pack_R8) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<21.590000,0,26.670000> texture{col_thl}}
#ifndef(global_pack_R8) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<21.590000,0,34.290000> texture{col_thl}}
#ifndef(global_pack_R9) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<35.560000,0,23.495000> texture{col_thl}}
#ifndef(global_pack_R9) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<43.180000,0,23.495000> texture{col_thl}}
#ifndef(global_pack_R10) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<8.890000,0,53.340000> texture{col_thl}}
#ifndef(global_pack_R10) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<8.890000,0,60.960000> texture{col_thl}}
#ifndef(global_pack_R11) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<34.290000,0,53.340000> texture{col_thl}}
#ifndef(global_pack_R11) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<34.290000,0,60.960000> texture{col_thl}}
#ifndef(global_pack_R12) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<57.150000,0,40.640000> texture{col_thl}}
#ifndef(global_pack_R12) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<64.770000,0,40.640000> texture{col_thl}}
#ifndef(global_pack_R13) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<49.530000,0,53.340000> texture{col_thl}}
#ifndef(global_pack_R13) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<49.530000,0,60.960000> texture{col_thl}}
#ifndef(global_pack_R14) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<74.930000,0,53.340000> texture{col_thl}}
#ifndef(global_pack_R14) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<74.930000,0,60.960000> texture{col_thl}}
#ifndef(global_pack_R15) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<53.340000,0,36.830000> texture{col_thl}}
#ifndef(global_pack_R15) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<53.340000,0,44.450000> texture{col_thl}}
#ifndef(global_pack_R16) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<68.580000,0,40.640000> texture{col_thl}}
#ifndef(global_pack_R16) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<76.200000,0,40.640000> texture{col_thl}}
#ifndef(global_pack_R17) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<50.800000,0,36.830000> texture{col_thl}}
#ifndef(global_pack_R17) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<50.800000,0,44.450000> texture{col_thl}}
#ifndef(global_pack_S1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,1+global_tmp,0) rotate<0,-90.000000,0>translate<9.169400,0,27.228800> texture{col_thl}}
#ifndef(global_pack_S1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,1+global_tmp,0) rotate<0,-90.000000,0>translate<9.169400,0,33.731200> texture{col_thl}}
#ifndef(global_pack_S1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,1+global_tmp,0) rotate<0,-90.000000,0>translate<13.690600,0,27.228800> texture{col_thl}}
#ifndef(global_pack_S1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,1+global_tmp,0) rotate<0,-90.000000,0>translate<13.690600,0,33.731200> texture{col_thl}}
#ifndef(global_pack_X1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.676400,0.914400,1,16,1+global_tmp,0) rotate<0,-270.000000,0>translate<40.386000,0,5.664200> texture{col_thl}}
#ifndef(global_pack_X1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.676400,0.914400,1,16,1+global_tmp,0) rotate<0,-270.000000,0>translate<40.386000,0,8.864600> texture{col_thl}}
#ifndef(global_pack_X1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.676400,0.914400,1,16,1+global_tmp,0) rotate<0,-90.000000,0>translate<42.875200,0,5.664200> texture{col_thl}}
#ifndef(global_pack_X1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(3.302000,2.286000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<35.560000,0,6.172200> texture{col_thl}}
#ifndef(global_pack_X1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(3.302000,2.286000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<47.599600,0,6.172200> texture{col_thl}}
#ifndef(global_pack_X1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.676400,0.914400,1,16,1+global_tmp,0) rotate<0,-90.000000,0>translate<42.875200,0,8.864600> texture{col_thl}}
//Pads/Vias
#end
#if(pcb_wires=on)
union{
//Signals
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.160000,0.000000,68.580000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.160000,0.000000,73.660000>}
box{<0,0,-0.127000><5.080000,0.035000,0.127000> rotate<0,90.000000,0> translate<10.160000,0.000000,73.660000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.700000,0.000000,43.180000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.700000,0.000000,48.260000>}
box{<0,0,-0.127000><5.080000,0.035000,0.127000> rotate<0,90.000000,0> translate<12.700000,0.000000,48.260000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.890000,-1.535000,53.340000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.700000,-1.535000,53.340000>}
box{<0,0,-0.127000><3.810000,0.035000,0.127000> rotate<0,0.000000,0> translate<8.890000,-1.535000,53.340000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.700000,-1.535000,59.829600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.700000,-1.535000,60.960000>}
box{<0,0,-0.127000><1.130400,0.035000,0.127000> rotate<0,90.000000,0> translate<12.700000,-1.535000,60.960000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.700000,0.000000,60.960000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.700000,0.000000,68.580000>}
box{<0,0,-0.127000><7.620000,0.035000,0.127000> rotate<0,90.000000,0> translate<12.700000,0.000000,68.580000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.690600,0.000000,27.228800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.690600,0.000000,33.731200>}
box{<0,0,-0.127000><6.502400,0.035000,0.127000> rotate<0,90.000000,0> translate<13.690600,0.000000,33.731200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.240000,0.000000,59.829600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.240000,0.000000,60.960000>}
box{<0,0,-0.127000><1.130400,0.035000,0.127000> rotate<0,90.000000,0> translate<15.240000,0.000000,60.960000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.700000,-1.535000,59.829600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.582400,-1.535000,55.947200>}
box{<0,0,-0.127000><5.490543,0.035000,0.127000> rotate<0,44.997030,0> translate<12.700000,-1.535000,59.829600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.582400,-1.535000,52.929400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.582400,-1.535000,55.947200>}
box{<0,0,-0.127000><3.017800,0.035000,0.127000> rotate<0,90.000000,0> translate<16.582400,-1.535000,55.947200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.582400,-1.535000,52.929400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.309000,-1.535000,52.202800>}
box{<0,0,-0.127000><1.027568,0.035000,0.127000> rotate<0,44.997030,0> translate<16.582400,-1.535000,52.929400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.780000,-1.535000,53.340000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.780000,-1.535000,54.470400>}
box{<0,0,-0.127000><1.130400,0.035000,0.127000> rotate<0,90.000000,0> translate<17.780000,-1.535000,54.470400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.780000,0.000000,60.960000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.780000,0.000000,64.770000>}
box{<0,0,-0.127000><3.810000,0.035000,0.127000> rotate<0,90.000000,0> translate<17.780000,0.000000,64.770000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.780000,-1.535000,54.470400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.014200,-1.535000,54.470400>}
box{<0,0,-0.127000><0.234200,0.035000,0.127000> rotate<0,0.000000,0> translate<17.780000,-1.535000,54.470400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.240000,0.000000,59.829600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.050000,0.000000,56.019600>}
box{<0,0,-0.127000><5.388154,0.035000,0.127000> rotate<0,44.997030,0> translate<15.240000,0.000000,59.829600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.050000,0.000000,52.970600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.050000,0.000000,56.019600>}
box{<0,0,-0.127000><3.049000,0.035000,0.127000> rotate<0,90.000000,0> translate<19.050000,0.000000,56.019600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.690600,-1.535000,27.228800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.040500,-1.535000,27.228800>}
box{<0,0,-0.127000><6.349900,0.035000,0.127000> rotate<0,0.000000,0> translate<13.690600,-1.535000,27.228800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.040500,-1.535000,27.228800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.599300,-1.535000,26.670000>}
box{<0,0,-0.127000><0.790263,0.035000,0.127000> rotate<0,44.997030,0> translate<20.040500,-1.535000,27.228800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.599300,-1.535000,26.670000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.590000,-1.535000,26.670000>}
box{<0,0,-0.127000><0.990700,0.035000,0.127000> rotate<0,0.000000,0> translate<20.599300,-1.535000,26.670000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.590000,-1.535000,26.670000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.580700,-1.535000,26.670000>}
box{<0,0,-0.127000><0.990700,0.035000,0.127000> rotate<0,0.000000,0> translate<21.590000,-1.535000,26.670000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.860000,0.000000,20.320000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.860000,0.000000,21.590100>}
box{<0,0,-0.127000><1.270100,0.035000,0.127000> rotate<0,90.000000,0> translate<22.860000,0.000000,21.590100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.014200,-1.535000,54.470400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.130000,-1.535000,60.586200>}
box{<0,0,-0.127000><8.649047,0.035000,0.127000> rotate<0,-44.997030,0> translate<18.014200,-1.535000,54.470400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.130000,-1.535000,60.586200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.130000,-1.535000,62.229900>}
box{<0,0,-0.127000><1.643700,0.035000,0.127000> rotate<0,90.000000,0> translate<24.130000,-1.535000,62.229900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.580700,-1.535000,26.670000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.231800,-1.535000,28.321100>}
box{<0,0,-0.127000><2.335008,0.035000,0.127000> rotate<0,-44.997030,0> translate<22.580700,-1.535000,26.670000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.860000,0.000000,21.590100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.511200,0.000000,21.590100>}
box{<0,0,-0.127000><1.651200,0.035000,0.127000> rotate<0,0.000000,0> translate<22.860000,0.000000,21.590100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.240000,-1.535000,53.340000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.773800,-1.535000,43.806200>}
box{<0,0,-0.127000><13.482829,0.035000,0.127000> rotate<0,44.997030,0> translate<15.240000,-1.535000,53.340000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.400000,-1.535000,28.321100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.400000,-1.535000,26.670000>}
box{<0,0,-0.127000><1.651100,0.035000,0.127000> rotate<0,-90.000000,0> translate<25.400000,-1.535000,26.670000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.231800,-1.535000,28.321100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.400000,-1.535000,28.321100>}
box{<0,0,-0.127000><1.168200,0.035000,0.127000> rotate<0,0.000000,0> translate<24.231800,-1.535000,28.321100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.400000,0.000000,34.290000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.400000,0.000000,40.640000>}
box{<0,0,-0.127000><6.350000,0.035000,0.127000> rotate<0,90.000000,0> translate<25.400000,0.000000,40.640000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.400000,0.000000,53.340000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.400000,0.000000,54.470400>}
box{<0,0,-0.127000><1.130400,0.035000,0.127000> rotate<0,90.000000,0> translate<25.400000,0.000000,54.470400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.400000,0.000000,60.960000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.400000,0.000000,69.850000>}
box{<0,0,-0.127000><8.890000,0.035000,0.127000> rotate<0,90.000000,0> translate<25.400000,0.000000,69.850000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.400000,-1.535000,28.321100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.857300,-1.535000,28.778400>}
box{<0,0,-0.127000><0.646720,0.035000,0.127000> rotate<0,-44.997030,0> translate<25.400000,-1.535000,28.321100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.400000,0.000000,54.470400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.670000,0.000000,55.740400>}
box{<0,0,-0.127000><1.796051,0.035000,0.127000> rotate<0,-44.997030,0> translate<25.400000,0.000000,54.470400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.670000,0.000000,55.740400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.670000,0.000000,68.580000>}
box{<0,0,-0.127000><12.839600,0.035000,0.127000> rotate<0,90.000000,0> translate<26.670000,0.000000,68.580000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.511200,0.000000,21.590100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.940000,0.000000,25.018900>}
box{<0,0,-0.127000><4.849055,0.035000,0.127000> rotate<0,-44.997030,0> translate<24.511200,0.000000,21.590100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.940000,0.000000,25.018900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.940000,0.000000,26.670000>}
box{<0,0,-0.127000><1.651100,0.035000,0.127000> rotate<0,90.000000,0> translate<27.940000,0.000000,26.670000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.940000,0.000000,34.290000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.940000,0.000000,40.640000>}
box{<0,0,-0.127000><6.350000,0.035000,0.127000> rotate<0,90.000000,0> translate<27.940000,0.000000,40.640000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.940000,0.000000,48.751500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.940000,0.000000,53.340000>}
box{<0,0,-0.127000><4.588500,0.035000,0.127000> rotate<0,90.000000,0> translate<27.940000,0.000000,53.340000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.940000,0.000000,59.829600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.940000,0.000000,60.960000>}
box{<0,0,-0.127000><1.130400,0.035000,0.127000> rotate<0,90.000000,0> translate<27.940000,0.000000,60.960000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.309000,-1.535000,52.202800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.443900,-1.535000,52.202800>}
box{<0,0,-0.127000><11.134900,0.035000,0.127000> rotate<0,0.000000,0> translate<17.309000,-1.535000,52.202800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.443900,-1.535000,52.202800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.210000,-1.535000,52.968900>}
box{<0,0,-0.127000><1.083429,0.035000,0.127000> rotate<0,-44.997030,0> translate<28.443900,-1.535000,52.202800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.210000,-1.535000,52.968900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.210000,-1.535000,53.728200>}
box{<0,0,-0.127000><0.759300,0.035000,0.127000> rotate<0,90.000000,0> translate<29.210000,-1.535000,53.728200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.400000,0.000000,20.320000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.098900,0.000000,25.018900>}
box{<0,0,-0.127000><6.645248,0.035000,0.127000> rotate<0,-44.997030,0> translate<25.400000,0.000000,20.320000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.773800,-1.535000,43.806200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.234900,-1.535000,43.806200>}
box{<0,0,-0.127000><5.461100,0.035000,0.127000> rotate<0,0.000000,0> translate<24.773800,-1.535000,43.806200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.098900,0.000000,25.018900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.480000,0.000000,25.018900>}
box{<0,0,-0.127000><0.381100,0.035000,0.127000> rotate<0,0.000000,0> translate<30.098900,0.000000,25.018900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.480000,0.000000,25.018900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.480000,0.000000,26.670000>}
box{<0,0,-0.127000><1.651100,0.035000,0.127000> rotate<0,90.000000,0> translate<30.480000,0.000000,26.670000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.050000,0.000000,52.970600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.480000,0.000000,41.540600>}
box{<0,0,-0.127000><16.164461,0.035000,0.127000> rotate<0,44.997030,0> translate<19.050000,0.000000,52.970600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.480000,0.000000,34.290000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.480000,0.000000,41.540600>}
box{<0,0,-0.127000><7.250600,0.035000,0.127000> rotate<0,90.000000,0> translate<30.480000,0.000000,41.540600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.130000,-1.535000,62.229900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.480000,-1.535000,68.579900>}
box{<0,0,-0.127000><8.980256,0.035000,0.127000> rotate<0,-44.997030,0> translate<24.130000,-1.535000,62.229900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.480000,-1.535000,68.579900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.480000,-1.535000,69.850000>}
box{<0,0,-0.127000><1.270100,0.035000,0.127000> rotate<0,90.000000,0> translate<30.480000,-1.535000,69.850000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.670000,0.000000,68.580000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.480000,0.000000,72.390000>}
box{<0,0,-0.127000><5.388154,0.035000,0.127000> rotate<0,-44.997030,0> translate<26.670000,0.000000,68.580000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.400000,0.000000,69.850000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.480000,0.000000,74.930000>}
box{<0,0,-0.127000><7.184205,0.035000,0.127000> rotate<0,-44.997030,0> translate<25.400000,0.000000,69.850000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.780000,0.000000,64.770000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.480000,0.000000,77.470000>}
box{<0,0,-0.127000><17.960512,0.035000,0.127000> rotate<0,-44.997030,0> translate<17.780000,0.000000,64.770000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.940000,0.000000,48.751500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.242000,0.000000,45.449500>}
box{<0,0,-0.127000><4.669733,0.035000,0.127000> rotate<0,44.997030,0> translate<27.940000,0.000000,48.751500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.242000,0.000000,35.991800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.242000,0.000000,45.449500>}
box{<0,0,-0.127000><9.457700,0.035000,0.127000> rotate<0,90.000000,0> translate<31.242000,0.000000,45.449500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.496000,0.000000,10.160000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.496000,0.000000,11.455300>}
box{<0,0,-0.127000><1.295300,0.035000,0.127000> rotate<0,90.000000,0> translate<31.496000,0.000000,11.455300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.496000,0.000000,11.455300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.750000,0.000000,11.709300>}
box{<0,0,-0.127000><0.359210,0.035000,0.127000> rotate<0,-44.997030,0> translate<31.496000,0.000000,11.455300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.750000,0.000000,11.709300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.750000,0.000000,12.700000>}
box{<0,0,-0.127000><0.990700,0.035000,0.127000> rotate<0,90.000000,0> translate<31.750000,0.000000,12.700000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.750000,0.000000,12.700000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.750000,0.000000,15.240000>}
box{<0,0,-0.127000><2.540000,0.035000,0.127000> rotate<0,90.000000,0> translate<31.750000,0.000000,15.240000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.750000,0.000000,22.860000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.750000,0.000000,23.850700>}
box{<0,0,-0.127000><0.990700,0.035000,0.127000> rotate<0,90.000000,0> translate<31.750000,0.000000,23.850700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.940000,0.000000,59.829600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.750000,0.000000,56.019600>}
box{<0,0,-0.127000><5.388154,0.035000,0.127000> rotate<0,44.997030,0> translate<27.940000,0.000000,59.829600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.750000,0.000000,37.211100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.750000,0.000000,56.019600>}
box{<0,0,-0.127000><18.808500,0.035000,0.127000> rotate<0,90.000000,0> translate<31.750000,0.000000,56.019600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.242000,0.000000,35.991800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.750200,0.000000,35.483600>}
box{<0,0,-0.127000><0.718703,0.035000,0.127000> rotate<0,44.997030,0> translate<31.242000,0.000000,35.991800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.750200,0.000000,33.498200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.750200,0.000000,35.483600>}
box{<0,0,-0.127000><1.985400,0.035000,0.127000> rotate<0,90.000000,0> translate<31.750200,0.000000,35.483600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.750200,0.000000,33.498200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.609500,0.000000,32.638900>}
box{<0,0,-0.127000><1.215234,0.035000,0.127000> rotate<0,44.997030,0> translate<31.750200,0.000000,33.498200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.750000,0.000000,23.850700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.918200,0.000000,25.018900>}
box{<0,0,-0.127000><1.652084,0.035000,0.127000> rotate<0,-44.997030,0> translate<31.750000,0.000000,23.850700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.918200,0.000000,25.018900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.020000,0.000000,25.018900>}
box{<0,0,-0.127000><0.101800,0.035000,0.127000> rotate<0,0.000000,0> translate<32.918200,0.000000,25.018900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.020000,0.000000,25.018900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.020000,0.000000,26.670000>}
box{<0,0,-0.127000><1.651100,0.035000,0.127000> rotate<0,90.000000,0> translate<33.020000,0.000000,26.670000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.020000,0.000000,26.670000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.020000,0.000000,28.321100>}
box{<0,0,-0.127000><1.651100,0.035000,0.127000> rotate<0,90.000000,0> translate<33.020000,0.000000,28.321100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.750000,0.000000,37.211100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.020000,0.000000,35.941100>}
box{<0,0,-0.127000><1.796051,0.035000,0.127000> rotate<0,44.997030,0> translate<31.750000,0.000000,37.211100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.020000,0.000000,34.290000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.020000,0.000000,35.941100>}
box{<0,0,-0.127000><1.651100,0.035000,0.127000> rotate<0,90.000000,0> translate<33.020000,0.000000,35.941100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.480000,-1.535000,60.960000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.290000,-1.535000,60.960000>}
box{<0,0,-0.127000><3.810000,0.035000,0.127000> rotate<0,0.000000,0> translate<30.480000,-1.535000,60.960000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.210000,-1.535000,53.728200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.171800,-1.535000,59.690000>}
box{<0,0,-0.127000><8.431258,0.035000,0.127000> rotate<0,-44.997030,0> translate<29.210000,-1.535000,53.728200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.560000,0.000000,21.590100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.560000,0.000000,23.495000>}
box{<0,0,-0.127000><1.904900,0.035000,0.127000> rotate<0,90.000000,0> translate<35.560000,0.000000,23.495000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.560000,0.000000,23.495000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.560000,0.000000,26.670000>}
box{<0,0,-0.127000><3.175000,0.035000,0.127000> rotate<0,90.000000,0> translate<35.560000,0.000000,26.670000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.609500,0.000000,32.638900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.560000,0.000000,32.638900>}
box{<0,0,-0.127000><2.950500,0.035000,0.127000> rotate<0,0.000000,0> translate<32.609500,0.000000,32.638900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.560000,0.000000,32.638900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.560000,0.000000,34.290000>}
box{<0,0,-0.127000><1.651100,0.035000,0.127000> rotate<0,90.000000,0> translate<35.560000,0.000000,34.290000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.496000,-1.535000,10.160000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.890200,-1.535000,10.160000>}
box{<0,0,-0.127000><4.394200,0.035000,0.127000> rotate<0,0.000000,0> translate<31.496000,-1.535000,10.160000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.020000,0.000000,28.321100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.039400,0.000000,28.321100>}
box{<0,0,-0.127000><3.019400,0.035000,0.127000> rotate<0,0.000000,0> translate<33.020000,0.000000,28.321100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.560000,0.000000,21.590100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.830000,0.000000,20.320100>}
box{<0,0,-0.127000><1.796051,0.035000,0.127000> rotate<0,44.997030,0> translate<35.560000,0.000000,21.590100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.830000,0.000000,19.050000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.830000,0.000000,20.320100>}
box{<0,0,-0.127000><1.270100,0.035000,0.127000> rotate<0,90.000000,0> translate<36.830000,0.000000,20.320100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.873500,0.000000,27.487000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.873500,0.000000,25.782400>}
box{<0,0,-0.127000><1.704600,0.035000,0.127000> rotate<0,-90.000000,0> translate<36.873500,0.000000,25.782400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.039400,0.000000,28.321100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.873500,0.000000,27.487000>}
box{<0,0,-0.127000><1.179596,0.035000,0.127000> rotate<0,44.997030,0> translate<36.039400,0.000000,28.321100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.100000,0.000000,26.670000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.100000,0.000000,28.321100>}
box{<0,0,-0.127000><1.651100,0.035000,0.127000> rotate<0,90.000000,0> translate<38.100000,0.000000,28.321100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.100000,-1.535000,35.941100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.100000,-1.535000,34.290000>}
box{<0,0,-0.127000><1.651100,0.035000,0.127000> rotate<0,-90.000000,0> translate<38.100000,-1.535000,34.290000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.234900,-1.535000,43.806200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.100000,-1.535000,35.941100>}
box{<0,0,-0.127000><11.122931,0.035000,0.127000> rotate<0,44.997030,0> translate<30.234900,-1.535000,43.806200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.873500,0.000000,25.782400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.103400,0.000000,24.552500>}
box{<0,0,-0.127000><1.739341,0.035000,0.127000> rotate<0,44.997030,0> translate<36.873500,0.000000,25.782400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.100000,0.000000,28.321100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.090700,0.000000,29.311800>}
box{<0,0,-0.127000><1.401061,0.035000,0.127000> rotate<0,-44.997030,0> translate<38.100000,0.000000,28.321100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.090700,0.000000,29.311800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.090700,0.000000,35.702900>}
box{<0,0,-0.127000><6.391100,0.035000,0.127000> rotate<0,90.000000,0> translate<39.090700,0.000000,35.702900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.890200,-1.535000,10.160000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.386000,-1.535000,5.664200>}
box{<0,0,-0.127000><6.358021,0.035000,0.127000> rotate<0,44.997030,0> translate<35.890200,-1.535000,10.160000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.171800,-1.535000,59.690000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.640000,-1.535000,59.690000>}
box{<0,0,-0.127000><5.468200,0.035000,0.127000> rotate<0,0.000000,0> translate<35.171800,-1.535000,59.690000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.640000,-1.535000,59.690000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.922000,-1.535000,61.972000>}
box{<0,0,-0.127000><3.227235,0.035000,0.127000> rotate<0,-44.997030,0> translate<40.640000,-1.535000,59.690000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.386000,-1.535000,8.864600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.951400,-1.535000,11.430000>}
box{<0,0,-0.127000><3.628023,0.035000,0.127000> rotate<0,-44.997030,0> translate<40.386000,-1.535000,8.864600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.180000,0.000000,34.290000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.180000,0.000000,36.830000>}
box{<0,0,-0.127000><2.540000,0.035000,0.127000> rotate<0,90.000000,0> translate<43.180000,0.000000,36.830000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.720000,-1.535000,25.018900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.720000,-1.535000,26.670000>}
box{<0,0,-0.127000><1.651100,0.035000,0.127000> rotate<0,90.000000,0> translate<45.720000,-1.535000,26.670000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.260000,0.000000,17.145000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.260000,0.000000,21.590000>}
box{<0,0,-0.127000><4.445000,0.035000,0.127000> rotate<0,90.000000,0> translate<48.260000,0.000000,21.590000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.720000,-1.535000,25.018900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.260000,-1.535000,22.478900>}
box{<0,0,-0.127000><3.592102,0.035000,0.127000> rotate<0,44.997030,0> translate<45.720000,-1.535000,25.018900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.260000,-1.535000,21.590000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.260000,-1.535000,22.478900>}
box{<0,0,-0.127000><0.888900,0.035000,0.127000> rotate<0,90.000000,0> translate<48.260000,-1.535000,22.478900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.260000,-1.535000,25.018900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.260000,-1.535000,26.670000>}
box{<0,0,-0.127000><1.651100,0.035000,0.127000> rotate<0,90.000000,0> translate<48.260000,-1.535000,26.670000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.260000,-1.535000,32.638900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.260000,-1.535000,34.290000>}
box{<0,0,-0.127000><1.651100,0.035000,0.127000> rotate<0,90.000000,0> translate<48.260000,-1.535000,34.290000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.951400,-1.535000,11.430000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.784000,-1.535000,11.430000>}
box{<0,0,-0.127000><6.832600,0.035000,0.127000> rotate<0,0.000000,0> translate<42.951400,-1.535000,11.430000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.260000,-1.535000,25.018900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.911100,-1.535000,25.018900>}
box{<0,0,-0.127000><1.651100,0.035000,0.127000> rotate<0,0.000000,0> translate<48.260000,-1.535000,25.018900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.260000,-1.535000,32.638900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.418900,-1.535000,30.480000>}
box{<0,0,-0.127000><3.053146,0.035000,0.127000> rotate<0,44.997030,0> translate<48.260000,-1.535000,32.638900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.800000,-1.535000,25.018900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.800000,-1.535000,26.670000>}
box{<0,0,-0.127000><1.651100,0.035000,0.127000> rotate<0,90.000000,0> translate<50.800000,-1.535000,26.670000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.800000,-1.535000,32.638900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.800000,-1.535000,34.290000>}
box{<0,0,-0.127000><1.651100,0.035000,0.127000> rotate<0,90.000000,0> translate<50.800000,-1.535000,34.290000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.800000,0.000000,34.290000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.800000,0.000000,36.830000>}
box{<0,0,-0.127000><2.540000,0.035000,0.127000> rotate<0,90.000000,0> translate<50.800000,0.000000,36.830000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.800000,0.000000,61.856200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.800000,0.000000,69.850000>}
box{<0,0,-0.127000><7.993800,0.035000,0.127000> rotate<0,90.000000,0> translate<50.800000,0.000000,69.850000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.800000,-1.535000,74.930000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.173800,-1.535000,74.930000>}
box{<0,0,-0.127000><0.373800,0.035000,0.127000> rotate<0,0.000000,0> translate<50.800000,-1.535000,74.930000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.922000,-1.535000,61.972000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.197600,-1.535000,61.972000>}
box{<0,0,-0.127000><8.275600,0.035000,0.127000> rotate<0,0.000000,0> translate<42.922000,-1.535000,61.972000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.800000,-1.535000,44.450000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.790700,-1.535000,44.450000>}
box{<0,0,-0.127000><0.990700,0.035000,0.127000> rotate<0,0.000000,0> translate<50.800000,-1.535000,44.450000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.197600,-1.535000,61.972000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<52.209600,-1.535000,60.960000>}
box{<0,0,-0.127000><1.431184,0.035000,0.127000> rotate<0,44.997030,0> translate<51.197600,-1.535000,61.972000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.790700,-1.535000,44.450000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<52.808400,-1.535000,43.432300>}
box{<0,0,-0.127000><1.439245,0.035000,0.127000> rotate<0,44.997030,0> translate<51.790700,-1.535000,44.450000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.911100,-1.535000,25.018900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.340000,-1.535000,21.590000>}
box{<0,0,-0.127000><4.849197,0.035000,0.127000> rotate<0,44.997030,0> translate<49.911100,-1.535000,25.018900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.340000,0.000000,17.145000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.340000,0.000000,21.590000>}
box{<0,0,-0.127000><4.445000,0.035000,0.127000> rotate<0,90.000000,0> translate<53.340000,0.000000,21.590000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.340000,0.000000,25.018900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.340000,0.000000,26.670000>}
box{<0,0,-0.127000><1.651100,0.035000,0.127000> rotate<0,90.000000,0> translate<53.340000,0.000000,26.670000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.340000,0.000000,34.290000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.340000,0.000000,36.830000>}
box{<0,0,-0.127000><2.540000,0.035000,0.127000> rotate<0,90.000000,0> translate<53.340000,0.000000,36.830000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.530000,-1.535000,53.340000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.340000,-1.535000,53.340000>}
box{<0,0,-0.127000><3.810000,0.035000,0.127000> rotate<0,0.000000,0> translate<49.530000,-1.535000,53.340000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<52.209600,-1.535000,60.960000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.340000,-1.535000,60.960000>}
box{<0,0,-0.127000><1.130400,0.035000,0.127000> rotate<0,0.000000,0> translate<52.209600,-1.535000,60.960000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.340000,-1.535000,44.450000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<54.330700,-1.535000,44.450000>}
box{<0,0,-0.127000><0.990700,0.035000,0.127000> rotate<0,0.000000,0> translate<53.340000,-1.535000,44.450000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<54.330700,-1.535000,44.450000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<54.330900,-1.535000,44.449800>}
box{<0,0,-0.127000><0.000283,0.035000,0.127000> rotate<0,44.997030,0> translate<54.330700,-1.535000,44.450000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.784000,0.000000,11.430000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<54.610000,0.000000,16.256000>}
box{<0,0,-0.127000><6.824995,0.035000,0.127000> rotate<0,-44.997030,0> translate<49.784000,0.000000,11.430000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<54.610000,0.000000,16.256000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<54.610000,0.000000,19.433000>}
box{<0,0,-0.127000><3.177000,0.035000,0.127000> rotate<0,90.000000,0> translate<54.610000,0.000000,19.433000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<54.848200,0.000000,29.352900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<54.848200,0.000000,46.654600>}
box{<0,0,-0.127000><17.301700,0.035000,0.127000> rotate<0,90.000000,0> translate<54.848200,0.000000,46.654600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.090700,0.000000,35.702900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.597400,0.000000,52.209600>}
box{<0,0,-0.127000><23.343999,0.035000,0.127000> rotate<0,-44.997030,0> translate<39.090700,0.000000,35.702900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<54.848200,0.000000,29.352900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.880000,0.000000,28.321100>}
box{<0,0,-0.127000><1.459186,0.035000,0.127000> rotate<0,44.997030,0> translate<54.848200,0.000000,29.352900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.880000,0.000000,26.670000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.880000,0.000000,28.321100>}
box{<0,0,-0.127000><1.651100,0.035000,0.127000> rotate<0,90.000000,0> translate<55.880000,0.000000,28.321100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.880000,0.000000,34.290000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.880000,0.000000,38.100000>}
box{<0,0,-0.127000><3.810000,0.035000,0.127000> rotate<0,90.000000,0> translate<55.880000,0.000000,38.100000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.597400,0.000000,52.209600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.880000,0.000000,52.209600>}
box{<0,0,-0.127000><0.282600,0.035000,0.127000> rotate<0,0.000000,0> translate<55.597400,0.000000,52.209600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.880000,0.000000,52.209600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.880000,0.000000,53.340000>}
box{<0,0,-0.127000><1.130400,0.035000,0.127000> rotate<0,90.000000,0> translate<55.880000,0.000000,53.340000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.880000,0.000000,59.829600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.880000,0.000000,60.960000>}
box{<0,0,-0.127000><1.130400,0.035000,0.127000> rotate<0,90.000000,0> translate<55.880000,0.000000,60.960000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.340000,0.000000,25.018900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.307800,0.000000,25.018900>}
box{<0,0,-0.127000><2.967800,0.035000,0.127000> rotate<0,0.000000,0> translate<53.340000,0.000000,25.018900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.307800,0.000000,25.018900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<57.150000,0.000000,25.861100>}
box{<0,0,-0.127000><1.191051,0.035000,0.127000> rotate<0,-44.997030,0> translate<56.307800,0.000000,25.018900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<57.150000,0.000000,25.861100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<57.150000,0.000000,37.316900>}
box{<0,0,-0.127000><11.455800,0.035000,0.127000> rotate<0,90.000000,0> translate<57.150000,0.000000,37.316900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<57.150000,0.000000,40.640000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<57.150000,0.000000,45.720000>}
box{<0,0,-0.127000><5.080000,0.035000,0.127000> rotate<0,90.000000,0> translate<57.150000,0.000000,45.720000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.800000,0.000000,61.856200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.185800,0.000000,54.470400>}
box{<0,0,-0.127000><10.445099,0.035000,0.127000> rotate<0,44.997030,0> translate<50.800000,0.000000,61.856200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.103400,0.000000,24.552500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.373300,0.000000,24.552500>}
box{<0,0,-0.127000><20.269900,0.035000,0.127000> rotate<0,0.000000,0> translate<38.103400,0.000000,24.552500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<54.330900,-1.535000,44.449800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.419800,-1.535000,44.449800>}
box{<0,0,-0.127000><4.088900,0.035000,0.127000> rotate<0,0.000000,0> translate<54.330900,-1.535000,44.449800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.420000,-1.535000,26.670000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.420000,-1.535000,28.321100>}
box{<0,0,-0.127000><1.651100,0.035000,0.127000> rotate<0,90.000000,0> translate<58.420000,-1.535000,28.321100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.420000,0.000000,32.638900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.420000,0.000000,34.290000>}
box{<0,0,-0.127000><1.651100,0.035000,0.127000> rotate<0,90.000000,0> translate<58.420000,0.000000,34.290000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.420000,0.000000,54.470400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.420000,0.000000,53.340000>}
box{<0,0,-0.127000><1.130400,0.035000,0.127000> rotate<0,-90.000000,0> translate<58.420000,0.000000,53.340000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.185800,0.000000,54.470400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.420000,0.000000,54.470400>}
box{<0,0,-0.127000><0.234200,0.035000,0.127000> rotate<0,0.000000,0> translate<58.185800,0.000000,54.470400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.800000,0.000000,77.470000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.420000,0.000000,69.850000>}
box{<0,0,-0.127000><10.776307,0.035000,0.127000> rotate<0,44.997030,0> translate<50.800000,0.000000,77.470000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.420000,0.000000,60.960000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.420000,0.000000,69.850000>}
box{<0,0,-0.127000><8.890000,0.035000,0.127000> rotate<0,90.000000,0> translate<58.420000,0.000000,69.850000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.373300,0.000000,24.552500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<59.410800,0.000000,25.590000>}
box{<0,0,-0.127000><1.467247,0.035000,0.127000> rotate<0,-44.997030,0> translate<58.373300,0.000000,24.552500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.420000,0.000000,32.638900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<59.410800,0.000000,31.648100>}
box{<0,0,-0.127000><1.401203,0.035000,0.127000> rotate<0,44.997030,0> translate<58.420000,0.000000,32.638900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<59.410800,0.000000,25.590000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<59.410800,0.000000,31.648100>}
box{<0,0,-0.127000><6.058100,0.035000,0.127000> rotate<0,90.000000,0> translate<59.410800,0.000000,31.648100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<54.848200,0.000000,46.654600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<59.570900,0.000000,51.377300>}
box{<0,0,-0.127000><6.678906,0.035000,0.127000> rotate<0,-44.997030,0> translate<54.848200,0.000000,46.654600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.880000,0.000000,59.829600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<59.570900,0.000000,56.138700>}
box{<0,0,-0.127000><5.219721,0.035000,0.127000> rotate<0,44.997030,0> translate<55.880000,0.000000,59.829600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<59.570900,0.000000,51.377300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<59.570900,0.000000,56.138700>}
box{<0,0,-0.127000><4.761400,0.035000,0.127000> rotate<0,90.000000,0> translate<59.570900,0.000000,56.138700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.419800,-1.535000,44.449800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<59.690000,-1.535000,45.720000>}
box{<0,0,-0.127000><1.796334,0.035000,0.127000> rotate<0,-44.997030,0> translate<58.419800,-1.535000,44.449800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.800000,-1.535000,72.390000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<59.690000,-1.535000,63.500000>}
box{<0,0,-0.127000><12.572359,0.035000,0.127000> rotate<0,44.997030,0> translate<50.800000,-1.535000,72.390000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<59.690000,-1.535000,60.586200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<59.690000,-1.535000,63.500000>}
box{<0,0,-0.127000><2.913800,0.035000,0.127000> rotate<0,90.000000,0> translate<59.690000,-1.535000,63.500000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.420000,-1.535000,28.321100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<60.858200,-1.535000,28.321100>}
box{<0,0,-0.127000><2.438200,0.035000,0.127000> rotate<0,0.000000,0> translate<58.420000,-1.535000,28.321100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<60.858200,-1.535000,28.321100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<62.509300,-1.535000,26.670000>}
box{<0,0,-0.127000><2.335008,0.035000,0.127000> rotate<0,44.997030,0> translate<60.858200,-1.535000,28.321100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<62.509300,-1.535000,26.670000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<63.500000,-1.535000,26.670000>}
box{<0,0,-0.127000><0.990700,0.035000,0.127000> rotate<0,0.000000,0> translate<62.509300,-1.535000,26.670000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<54.610000,0.000000,19.433000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<63.500000,0.000000,28.323000>}
box{<0,0,-0.127000><12.572359,0.035000,0.127000> rotate<0,-44.997030,0> translate<54.610000,0.000000,19.433000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<63.500000,0.000000,28.323000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<63.500000,0.000000,34.290000>}
box{<0,0,-0.127000><5.967000,0.035000,0.127000> rotate<0,90.000000,0> translate<63.500000,0.000000,34.290000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<63.500000,0.000000,34.290000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<63.500000,0.000000,38.100000>}
box{<0,0,-0.127000><3.810000,0.035000,0.127000> rotate<0,90.000000,0> translate<63.500000,0.000000,38.100000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<64.909600,-1.535000,61.194200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<64.909600,-1.535000,60.960000>}
box{<0,0,-0.127000><0.234200,0.035000,0.127000> rotate<0,-90.000000,0> translate<64.909600,-1.535000,60.960000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.173800,-1.535000,74.930000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<64.909600,-1.535000,61.194200>}
box{<0,0,-0.127000><19.425355,0.035000,0.127000> rotate<0,44.997030,0> translate<51.173800,-1.535000,74.930000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<59.690000,-1.535000,60.586200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<65.805800,-1.535000,54.470400>}
box{<0,0,-0.127000><8.649047,0.035000,0.127000> rotate<0,44.997030,0> translate<59.690000,-1.535000,60.586200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<66.040000,-1.535000,54.470400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<66.040000,-1.535000,53.340000>}
box{<0,0,-0.127000><1.130400,0.035000,0.127000> rotate<0,-90.000000,0> translate<66.040000,-1.535000,53.340000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<65.805800,-1.535000,54.470400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<66.040000,-1.535000,54.470400>}
box{<0,0,-0.127000><0.234200,0.035000,0.127000> rotate<0,0.000000,0> translate<65.805800,-1.535000,54.470400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<64.909600,-1.535000,60.960000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<66.040000,-1.535000,60.960000>}
box{<0,0,-0.127000><1.130400,0.035000,0.127000> rotate<0,0.000000,0> translate<64.909600,-1.535000,60.960000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<57.150000,0.000000,37.316900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<67.449600,0.000000,47.616500>}
box{<0,0,-0.127000><14.565834,0.035000,0.127000> rotate<0,-44.997030,0> translate<57.150000,0.000000,37.316900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<67.449600,0.000000,47.616500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<67.449600,0.000000,58.699200>}
box{<0,0,-0.127000><11.082700,0.035000,0.127000> rotate<0,90.000000,0> translate<67.449600,0.000000,58.699200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<68.580000,0.000000,40.640000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<68.580000,0.000000,45.720000>}
box{<0,0,-0.127000><5.080000,0.035000,0.127000> rotate<0,90.000000,0> translate<68.580000,0.000000,45.720000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<67.449600,0.000000,58.699200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<68.580000,0.000000,59.829600>}
box{<0,0,-0.127000><1.598627,0.035000,0.127000> rotate<0,-44.997030,0> translate<67.449600,0.000000,58.699200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<68.580000,0.000000,59.829600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<68.580000,0.000000,60.960000>}
box{<0,0,-0.127000><1.130400,0.035000,0.127000> rotate<0,90.000000,0> translate<68.580000,0.000000,60.960000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<52.808400,-1.535000,43.432300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<68.832300,-1.535000,43.432300>}
box{<0,0,-0.127000><16.023900,0.035000,0.127000> rotate<0,0.000000,0> translate<52.808400,-1.535000,43.432300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.857300,-1.535000,28.778400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<69.011500,-1.535000,28.778400>}
box{<0,0,-0.127000><43.154200,0.035000,0.127000> rotate<0,0.000000,0> translate<25.857300,-1.535000,28.778400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.800000,-1.535000,32.638900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<69.468800,-1.535000,32.638900>}
box{<0,0,-0.127000><18.668800,0.035000,0.127000> rotate<0,0.000000,0> translate<50.800000,-1.535000,32.638900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<68.580000,-1.535000,53.340000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<69.710400,-1.535000,53.340000>}
box{<0,0,-0.127000><1.130400,0.035000,0.127000> rotate<0,0.000000,0> translate<68.580000,-1.535000,53.340000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<69.710400,-1.535000,53.057300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<69.710400,-1.535000,53.340000>}
box{<0,0,-0.127000><0.282700,0.035000,0.127000> rotate<0,90.000000,0> translate<69.710400,-1.535000,53.340000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<69.011500,-1.535000,28.778400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<69.849900,-1.535000,27.940000>}
box{<0,0,-0.127000><1.185677,0.035000,0.127000> rotate<0,44.997030,0> translate<69.011500,-1.535000,28.778400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<69.468800,-1.535000,32.638900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<69.849900,-1.535000,33.020000>}
box{<0,0,-0.127000><0.538957,0.035000,0.127000> rotate<0,-44.997030,0> translate<69.468800,-1.535000,32.638900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<69.710400,-1.535000,53.057300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<70.558100,-1.535000,52.209600>}
box{<0,0,-0.127000><1.198829,0.035000,0.127000> rotate<0,44.997030,0> translate<69.710400,-1.535000,53.057300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<69.849900,-1.535000,27.940000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<71.120000,-1.535000,27.940000>}
box{<0,0,-0.127000><1.270100,0.035000,0.127000> rotate<0,0.000000,0> translate<69.849900,-1.535000,27.940000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.418900,-1.535000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<71.120000,-1.535000,30.480000>}
box{<0,0,-0.127000><20.701100,0.035000,0.127000> rotate<0,0.000000,0> translate<50.418900,-1.535000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<69.849900,-1.535000,33.020000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<71.120000,-1.535000,33.020000>}
box{<0,0,-0.127000><1.270100,0.035000,0.127000> rotate<0,0.000000,0> translate<69.849900,-1.535000,33.020000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<68.832300,-1.535000,43.432300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<71.120000,-1.535000,45.720000>}
box{<0,0,-0.127000><3.235296,0.035000,0.127000> rotate<0,-44.997030,0> translate<68.832300,-1.535000,43.432300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<70.558100,-1.535000,52.209600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<71.389600,-1.535000,52.209600>}
box{<0,0,-0.127000><0.831500,0.035000,0.127000> rotate<0,0.000000,0> translate<70.558100,-1.535000,52.209600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.340000,-1.535000,36.830000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<71.695200,-1.535000,36.830000>}
box{<0,0,-0.127000><18.355200,0.035000,0.127000> rotate<0,0.000000,0> translate<53.340000,-1.535000,36.830000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<71.389600,-1.535000,52.209600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<72.275800,-1.535000,51.323400>}
box{<0,0,-0.127000><1.253276,0.035000,0.127000> rotate<0,44.997030,0> translate<71.389600,-1.535000,52.209600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<72.275800,-1.535000,50.072100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<72.275800,-1.535000,51.323400>}
box{<0,0,-0.127000><1.251300,0.035000,0.127000> rotate<0,90.000000,0> translate<72.275800,-1.535000,51.323400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.800000,-1.535000,25.018900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<72.614400,-1.535000,25.018900>}
box{<0,0,-0.127000><21.814400,0.035000,0.127000> rotate<0,0.000000,0> translate<50.800000,-1.535000,25.018900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<71.120000,-1.535000,60.960000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<74.930000,-1.535000,60.960000>}
box{<0,0,-0.127000><3.810000,0.035000,0.127000> rotate<0,0.000000,0> translate<71.120000,-1.535000,60.960000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<73.660000,-1.535000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<74.934300,-1.535000,31.754300>}
box{<0,0,-0.127000><1.802132,0.035000,0.127000> rotate<0,-44.997030,0> translate<73.660000,-1.535000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<74.934300,-1.535000,33.590900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<74.934300,-1.535000,31.754300>}
box{<0,0,-0.127000><1.836600,0.035000,0.127000> rotate<0,-90.000000,0> translate<74.934300,-1.535000,31.754300> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<71.695200,-1.535000,36.830000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<74.934300,-1.535000,33.590900>}
box{<0,0,-0.127000><4.580779,0.035000,0.127000> rotate<0,44.997030,0> translate<71.695200,-1.535000,36.830000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<72.275800,-1.535000,50.072100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<75.162900,-1.535000,47.185000>}
box{<0,0,-0.127000><4.082976,0.035000,0.127000> rotate<0,44.997030,0> translate<72.275800,-1.535000,50.072100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<75.162900,-1.535000,34.632000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<75.162900,-1.535000,47.185000>}
box{<0,0,-0.127000><12.553000,0.035000,0.127000> rotate<0,90.000000,0> translate<75.162900,-1.535000,47.185000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<72.614400,-1.535000,25.018900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<75.424700,-1.535000,27.829200>}
box{<0,0,-0.127000><3.974364,0.035000,0.127000> rotate<0,-44.997030,0> translate<72.614400,-1.535000,25.018900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<75.162900,-1.535000,34.632000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<75.424700,-1.535000,34.370200>}
box{<0,0,-0.127000><0.370241,0.035000,0.127000> rotate<0,44.997030,0> translate<75.162900,-1.535000,34.632000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<75.424700,-1.535000,27.829200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<75.424700,-1.535000,34.370200>}
box{<0,0,-0.127000><6.541000,0.035000,0.127000> rotate<0,90.000000,0> translate<75.424700,-1.535000,34.370200> }
//Text
//Rect
union{
texture{col_pds}
}
texture{col_wrs}
}
#end
#if(pcb_polygons=on)
union{
//Polygons
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.000000,0.000000,0.000000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<82.550000,0.000000,0.000000>}
box{<0,0,-0.203200><82.550000,0.035000,0.203200> rotate<0,0.000000,0> translate<0.000000,0.000000,0.000000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.000000,-1.535000,0.000000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<82.550000,-1.535000,0.000000>}
box{<0,0,-0.203200><82.550000,0.035000,0.203200> rotate<0,0.000000,0> translate<0.000000,-1.535000,0.000000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.000000,0.000000,82.550000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.000000,0.000000,0.000000>}
box{<0,0,-0.203200><82.550000,0.035000,0.203200> rotate<0,-90.000000,0> translate<0.000000,0.000000,0.000000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.000000,-1.535000,82.550000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.000000,-1.535000,0.000000>}
box{<0,0,-0.203200><82.550000,0.035000,0.203200> rotate<0,-90.000000,0> translate<0.000000,-1.535000,0.000000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.000000,0.000000,82.550000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<82.550000,0.000000,82.550000>}
box{<0,0,-0.203200><82.550000,0.035000,0.203200> rotate<0,0.000000,0> translate<0.000000,0.000000,82.550000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.000000,-1.535000,82.550000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<82.550000,-1.535000,82.550000>}
box{<0,0,-0.203200><82.550000,0.035000,0.203200> rotate<0,0.000000,0> translate<0.000000,-1.535000,82.550000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<82.550000,0.000000,0.000000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<82.550000,0.000000,82.550000>}
box{<0,0,-0.203200><82.550000,0.035000,0.203200> rotate<0,90.000000,0> translate<82.550000,0.000000,82.550000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<82.550000,-1.535000,0.000000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<82.550000,-1.535000,82.550000>}
box{<0,0,-0.203200><82.550000,0.035000,0.203200> rotate<0,90.000000,0> translate<82.550000,-1.535000,82.550000> }
texture{col_pol}
}
#end
union{
cylinder{<48.260000,0.038000,17.145000><48.260000,-1.538000,17.145000>0.350000}
cylinder{<45.720000,0.038000,17.145000><45.720000,-1.538000,17.145000>0.350000}
cylinder{<53.340000,0.038000,17.145000><53.340000,-1.538000,17.145000>0.350000}
cylinder{<55.880000,0.038000,17.145000><55.880000,-1.538000,17.145000>0.350000}
cylinder{<45.720000,0.038000,38.100000><45.720000,-1.538000,38.100000>0.350000}
cylinder{<45.720000,0.038000,40.640000><45.720000,-1.538000,40.640000>0.350000}
cylinder{<71.120000,0.038000,50.800000><71.120000,-1.538000,50.800000>0.350000}
cylinder{<73.660000,0.038000,50.800000><73.660000,-1.538000,50.800000>0.350000}
cylinder{<30.480000,0.038000,50.800000><30.480000,-1.538000,50.800000>0.350000}
cylinder{<33.020000,0.038000,50.800000><33.020000,-1.538000,50.800000>0.350000}
cylinder{<31.496000,0.038000,10.160000><31.496000,-1.538000,10.160000>0.450000}
cylinder{<24.384000,0.038000,10.160000><24.384000,-1.538000,10.160000>0.450000}
cylinder{<49.784000,0.038000,11.430000><49.784000,-1.538000,11.430000>0.450000}
cylinder{<56.896000,0.038000,11.430000><56.896000,-1.538000,11.430000>0.450000}
cylinder{<25.400000,0.038000,26.670000><25.400000,-1.538000,26.670000>0.406400}
cylinder{<27.940000,0.038000,26.670000><27.940000,-1.538000,26.670000>0.406400}
cylinder{<30.480000,0.038000,26.670000><30.480000,-1.538000,26.670000>0.406400}
cylinder{<33.020000,0.038000,26.670000><33.020000,-1.538000,26.670000>0.406400}
cylinder{<35.560000,0.038000,26.670000><35.560000,-1.538000,26.670000>0.406400}
cylinder{<38.100000,0.038000,26.670000><38.100000,-1.538000,26.670000>0.406400}
cylinder{<40.640000,0.038000,26.670000><40.640000,-1.538000,26.670000>0.406400}
cylinder{<43.180000,0.038000,26.670000><43.180000,-1.538000,26.670000>0.406400}
cylinder{<45.720000,0.038000,26.670000><45.720000,-1.538000,26.670000>0.406400}
cylinder{<48.260000,0.038000,26.670000><48.260000,-1.538000,26.670000>0.406400}
cylinder{<50.800000,0.038000,26.670000><50.800000,-1.538000,26.670000>0.406400}
cylinder{<53.340000,0.038000,26.670000><53.340000,-1.538000,26.670000>0.406400}
cylinder{<55.880000,0.038000,26.670000><55.880000,-1.538000,26.670000>0.406400}
cylinder{<58.420000,0.038000,26.670000><58.420000,-1.538000,26.670000>0.406400}
cylinder{<58.420000,0.038000,34.290000><58.420000,-1.538000,34.290000>0.406400}
cylinder{<55.880000,0.038000,34.290000><55.880000,-1.538000,34.290000>0.406400}
cylinder{<53.340000,0.038000,34.290000><53.340000,-1.538000,34.290000>0.406400}
cylinder{<50.800000,0.038000,34.290000><50.800000,-1.538000,34.290000>0.406400}
cylinder{<48.260000,0.038000,34.290000><48.260000,-1.538000,34.290000>0.406400}
cylinder{<45.720000,0.038000,34.290000><45.720000,-1.538000,34.290000>0.406400}
cylinder{<43.180000,0.038000,34.290000><43.180000,-1.538000,34.290000>0.406400}
cylinder{<40.640000,0.038000,34.290000><40.640000,-1.538000,34.290000>0.406400}
cylinder{<38.100000,0.038000,34.290000><38.100000,-1.538000,34.290000>0.406400}
cylinder{<35.560000,0.038000,34.290000><35.560000,-1.538000,34.290000>0.406400}
cylinder{<33.020000,0.038000,34.290000><33.020000,-1.538000,34.290000>0.406400}
cylinder{<30.480000,0.038000,34.290000><30.480000,-1.538000,34.290000>0.406400}
cylinder{<27.940000,0.038000,34.290000><27.940000,-1.538000,34.290000>0.406400}
cylinder{<25.400000,0.038000,34.290000><25.400000,-1.538000,34.290000>0.406400}
cylinder{<12.700000,0.038000,53.340000><12.700000,-1.538000,53.340000>0.406400}
cylinder{<15.240000,0.038000,53.340000><15.240000,-1.538000,53.340000>0.406400}
cylinder{<17.780000,0.038000,53.340000><17.780000,-1.538000,53.340000>0.406400}
cylinder{<20.320000,0.038000,53.340000><20.320000,-1.538000,53.340000>0.406400}
cylinder{<22.860000,0.038000,53.340000><22.860000,-1.538000,53.340000>0.406400}
cylinder{<25.400000,0.038000,53.340000><25.400000,-1.538000,53.340000>0.406400}
cylinder{<27.940000,0.038000,53.340000><27.940000,-1.538000,53.340000>0.406400}
cylinder{<30.480000,0.038000,53.340000><30.480000,-1.538000,53.340000>0.406400}
cylinder{<30.480000,0.038000,60.960000><30.480000,-1.538000,60.960000>0.406400}
cylinder{<27.940000,0.038000,60.960000><27.940000,-1.538000,60.960000>0.406400}
cylinder{<25.400000,0.038000,60.960000><25.400000,-1.538000,60.960000>0.406400}
cylinder{<22.860000,0.038000,60.960000><22.860000,-1.538000,60.960000>0.406400}
cylinder{<20.320000,0.038000,60.960000><20.320000,-1.538000,60.960000>0.406400}
cylinder{<17.780000,0.038000,60.960000><17.780000,-1.538000,60.960000>0.406400}
cylinder{<15.240000,0.038000,60.960000><15.240000,-1.538000,60.960000>0.406400}
cylinder{<12.700000,0.038000,60.960000><12.700000,-1.538000,60.960000>0.406400}
cylinder{<53.340000,0.038000,53.340000><53.340000,-1.538000,53.340000>0.406400}
cylinder{<55.880000,0.038000,53.340000><55.880000,-1.538000,53.340000>0.406400}
cylinder{<58.420000,0.038000,53.340000><58.420000,-1.538000,53.340000>0.406400}
cylinder{<60.960000,0.038000,53.340000><60.960000,-1.538000,53.340000>0.406400}
cylinder{<63.500000,0.038000,53.340000><63.500000,-1.538000,53.340000>0.406400}
cylinder{<66.040000,0.038000,53.340000><66.040000,-1.538000,53.340000>0.406400}
cylinder{<68.580000,0.038000,53.340000><68.580000,-1.538000,53.340000>0.406400}
cylinder{<71.120000,0.038000,53.340000><71.120000,-1.538000,53.340000>0.406400}
cylinder{<71.120000,0.038000,60.960000><71.120000,-1.538000,60.960000>0.406400}
cylinder{<68.580000,0.038000,60.960000><68.580000,-1.538000,60.960000>0.406400}
cylinder{<66.040000,0.038000,60.960000><66.040000,-1.538000,60.960000>0.406400}
cylinder{<63.500000,0.038000,60.960000><63.500000,-1.538000,60.960000>0.406400}
cylinder{<60.960000,0.038000,60.960000><60.960000,-1.538000,60.960000>0.406400}
cylinder{<58.420000,0.038000,60.960000><58.420000,-1.538000,60.960000>0.406400}
cylinder{<55.880000,0.038000,60.960000><55.880000,-1.538000,60.960000>0.406400}
cylinder{<53.340000,0.038000,60.960000><53.340000,-1.538000,60.960000>0.406400}
cylinder{<71.120000,0.038000,33.020000><71.120000,-1.538000,33.020000>0.508000}
cylinder{<73.660000,0.038000,33.020000><73.660000,-1.538000,33.020000>0.508000}
cylinder{<71.120000,0.038000,30.480000><71.120000,-1.538000,30.480000>0.508000}
cylinder{<73.660000,0.038000,30.480000><73.660000,-1.538000,30.480000>0.508000}
cylinder{<71.120000,0.038000,27.940000><71.120000,-1.538000,27.940000>0.508000}
cylinder{<73.660000,0.038000,27.940000><73.660000,-1.538000,27.940000>0.508000}
cylinder{<40.640000,0.038000,59.690000><40.640000,-1.538000,59.690000>0.508000}
cylinder{<43.180000,0.038000,59.690000><43.180000,-1.538000,59.690000>0.508000}
cylinder{<27.940000,0.038000,40.640000><27.940000,-1.538000,40.640000>0.508000}
cylinder{<25.400000,0.038000,40.640000><25.400000,-1.538000,40.640000>0.508000}
cylinder{<22.860000,0.038000,40.640000><22.860000,-1.538000,40.640000>0.508000}
cylinder{<22.860000,0.038000,20.320000><22.860000,-1.538000,20.320000>0.508000}
cylinder{<25.400000,0.038000,20.320000><25.400000,-1.538000,20.320000>0.508000}
cylinder{<27.940000,0.038000,20.320000><27.940000,-1.538000,20.320000>0.508000}
cylinder{<36.830000,0.038000,19.050000><36.830000,-1.538000,19.050000>0.508000}
cylinder{<39.370000,0.038000,19.050000><39.370000,-1.538000,19.050000>0.508000}
cylinder{<30.480000,0.038000,69.850000><30.480000,-1.538000,69.850000>0.508000}
cylinder{<30.480000,0.038000,72.390000><30.480000,-1.538000,72.390000>0.508000}
cylinder{<30.480000,0.038000,74.930000><30.480000,-1.538000,74.930000>0.508000}
cylinder{<30.480000,0.038000,77.470000><30.480000,-1.538000,77.470000>0.508000}
cylinder{<50.800000,0.038000,69.850000><50.800000,-1.538000,69.850000>0.508000}
cylinder{<50.800000,0.038000,72.390000><50.800000,-1.538000,72.390000>0.508000}
cylinder{<50.800000,0.038000,74.930000><50.800000,-1.538000,74.930000>0.508000}
cylinder{<50.800000,0.038000,77.470000><50.800000,-1.538000,77.470000>0.508000}
cylinder{<57.150000,0.038000,45.720000><57.150000,-1.538000,45.720000>0.508000}
cylinder{<59.690000,0.038000,45.720000><59.690000,-1.538000,45.720000>0.508000}
cylinder{<62.230000,0.038000,45.720000><62.230000,-1.538000,45.720000>0.508000}
cylinder{<68.580000,0.038000,45.720000><68.580000,-1.538000,45.720000>0.508000}
cylinder{<71.120000,0.038000,45.720000><71.120000,-1.538000,45.720000>0.508000}
cylinder{<73.660000,0.038000,45.720000><73.660000,-1.538000,45.720000>0.508000}
cylinder{<10.160000,0.038000,43.180000><10.160000,-1.538000,43.180000>0.406400}
cylinder{<12.700000,0.038000,43.180000><12.700000,-1.538000,43.180000>0.406400}
cylinder{<12.700000,0.038000,68.580000><12.700000,-1.538000,68.580000>0.406400}
cylinder{<10.160000,0.038000,68.580000><10.160000,-1.538000,68.580000>0.406400}
cylinder{<48.260000,0.038000,21.590000><48.260000,-1.538000,21.590000>0.406400}
cylinder{<53.340000,0.038000,21.590000><53.340000,-1.538000,21.590000>0.406400}
cylinder{<31.750000,0.038000,22.860000><31.750000,-1.538000,22.860000>0.406400}
cylinder{<31.750000,0.038000,15.240000><31.750000,-1.538000,15.240000>0.406400}
cylinder{<63.500000,0.038000,26.670000><63.500000,-1.538000,26.670000>0.406400}
cylinder{<63.500000,0.038000,34.290000><63.500000,-1.538000,34.290000>0.406400}
cylinder{<55.880000,0.038000,38.100000><55.880000,-1.538000,38.100000>0.406400}
cylinder{<63.500000,0.038000,38.100000><63.500000,-1.538000,38.100000>0.406400}
cylinder{<31.750000,0.038000,12.700000><31.750000,-1.538000,12.700000>0.406400}
cylinder{<24.130000,0.038000,12.700000><24.130000,-1.538000,12.700000>0.406400}
cylinder{<5.080000,0.038000,48.260000><5.080000,-1.538000,48.260000>0.406400}
cylinder{<12.700000,0.038000,48.260000><12.700000,-1.538000,48.260000>0.406400}
cylinder{<17.780000,0.038000,73.660000><17.780000,-1.538000,73.660000>0.406400}
cylinder{<10.160000,0.038000,73.660000><10.160000,-1.538000,73.660000>0.406400}
cylinder{<43.180000,0.038000,44.450000><43.180000,-1.538000,44.450000>0.406400}
cylinder{<43.180000,0.038000,36.830000><43.180000,-1.538000,36.830000>0.406400}
cylinder{<21.590000,0.038000,26.670000><21.590000,-1.538000,26.670000>0.406400}
cylinder{<21.590000,0.038000,34.290000><21.590000,-1.538000,34.290000>0.406400}
cylinder{<35.560000,0.038000,23.495000><35.560000,-1.538000,23.495000>0.406400}
cylinder{<43.180000,0.038000,23.495000><43.180000,-1.538000,23.495000>0.406400}
cylinder{<8.890000,0.038000,53.340000><8.890000,-1.538000,53.340000>0.406400}
cylinder{<8.890000,0.038000,60.960000><8.890000,-1.538000,60.960000>0.406400}
cylinder{<34.290000,0.038000,53.340000><34.290000,-1.538000,53.340000>0.406400}
cylinder{<34.290000,0.038000,60.960000><34.290000,-1.538000,60.960000>0.406400}
cylinder{<57.150000,0.038000,40.640000><57.150000,-1.538000,40.640000>0.406400}
cylinder{<64.770000,0.038000,40.640000><64.770000,-1.538000,40.640000>0.406400}
cylinder{<49.530000,0.038000,53.340000><49.530000,-1.538000,53.340000>0.406400}
cylinder{<49.530000,0.038000,60.960000><49.530000,-1.538000,60.960000>0.406400}
cylinder{<74.930000,0.038000,53.340000><74.930000,-1.538000,53.340000>0.406400}
cylinder{<74.930000,0.038000,60.960000><74.930000,-1.538000,60.960000>0.406400}
cylinder{<53.340000,0.038000,36.830000><53.340000,-1.538000,36.830000>0.406400}
cylinder{<53.340000,0.038000,44.450000><53.340000,-1.538000,44.450000>0.406400}
cylinder{<68.580000,0.038000,40.640000><68.580000,-1.538000,40.640000>0.406400}
cylinder{<76.200000,0.038000,40.640000><76.200000,-1.538000,40.640000>0.406400}
cylinder{<50.800000,0.038000,36.830000><50.800000,-1.538000,36.830000>0.406400}
cylinder{<50.800000,0.038000,44.450000><50.800000,-1.538000,44.450000>0.406400}
cylinder{<9.169400,0.038000,27.228800><9.169400,-1.538000,27.228800>0.508000}
cylinder{<9.169400,0.038000,33.731200><9.169400,-1.538000,33.731200>0.508000}
cylinder{<13.690600,0.038000,27.228800><13.690600,-1.538000,27.228800>0.508000}
cylinder{<13.690600,0.038000,33.731200><13.690600,-1.538000,33.731200>0.508000}
cylinder{<40.386000,0.038000,5.664200><40.386000,-1.538000,5.664200>0.457200}
cylinder{<40.386000,0.038000,8.864600><40.386000,-1.538000,8.864600>0.457200}
cylinder{<42.875200,0.038000,5.664200><42.875200,-1.538000,5.664200>0.457200}
cylinder{<42.875200,0.038000,8.864600><42.875200,-1.538000,8.864600>0.457200}
//Holes(fast)/Vias
//Holes(fast)/Board
texture{col_hls}
}
#if(pcb_silkscreen=on)
//Silk Screen
union{
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.696200,0.000000,24.206200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.696200,0.000000,25.833100>}
box{<0,0,-0.076200><1.626900,0.036000,0.076200> rotate<0,90.000000,0> translate<7.696200,0.000000,25.833100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.696200,0.000000,25.833100>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.509600,0.000000,25.833100>}
box{<0,0,-0.076200><0.813400,0.036000,0.076200> rotate<0,0.000000,0> translate<7.696200,0.000000,25.833100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.509600,0.000000,25.833100>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.780800,0.000000,25.562000>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,44.986466,0> translate<8.509600,0.000000,25.833100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.780800,0.000000,25.562000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.780800,0.000000,25.019600>}
box{<0,0,-0.076200><0.542400,0.036000,0.076200> rotate<0,-90.000000,0> translate<8.780800,0.000000,25.019600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.780800,0.000000,25.019600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.509600,0.000000,24.748500>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,-44.986466,0> translate<8.509600,0.000000,24.748500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.509600,0.000000,24.748500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.696200,0.000000,24.748500>}
box{<0,0,-0.076200><0.813400,0.036000,0.076200> rotate<0,0.000000,0> translate<7.696200,0.000000,24.748500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.238500,0.000000,24.748500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.780800,0.000000,24.206200>}
box{<0,0,-0.076200><0.766928,0.036000,0.076200> rotate<0,44.997030,0> translate<8.238500,0.000000,24.748500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.146700,0.000000,24.206200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.604400,0.000000,24.206200>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,0.000000,0> translate<9.604400,0.000000,24.206200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.604400,0.000000,24.206200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.333300,0.000000,24.477300>}
box{<0,0,-0.076200><0.383393,0.036000,0.076200> rotate<0,44.997030,0> translate<9.333300,0.000000,24.477300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.333300,0.000000,24.477300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.333300,0.000000,25.019600>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,90.000000,0> translate<9.333300,0.000000,25.019600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.333300,0.000000,25.019600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.604400,0.000000,25.290800>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,-45.007595,0> translate<9.333300,0.000000,25.019600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.604400,0.000000,25.290800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.146700,0.000000,25.290800>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,0.000000,0> translate<9.604400,0.000000,25.290800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.146700,0.000000,25.290800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.417900,0.000000,25.019600>}
box{<0,0,-0.076200><0.383535,0.036000,0.076200> rotate<0,44.997030,0> translate<10.146700,0.000000,25.290800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.417900,0.000000,25.019600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.417900,0.000000,24.748500>}
box{<0,0,-0.076200><0.271100,0.036000,0.076200> rotate<0,-90.000000,0> translate<10.417900,0.000000,24.748500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.417900,0.000000,24.748500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.333300,0.000000,24.748500>}
box{<0,0,-0.076200><1.084600,0.036000,0.076200> rotate<0,0.000000,0> translate<9.333300,0.000000,24.748500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.970400,0.000000,24.206200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.783800,0.000000,24.206200>}
box{<0,0,-0.076200><0.813400,0.036000,0.076200> rotate<0,0.000000,0> translate<10.970400,0.000000,24.206200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.783800,0.000000,24.206200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.055000,0.000000,24.477300>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,-44.986466,0> translate<11.783800,0.000000,24.206200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.055000,0.000000,24.477300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.783800,0.000000,24.748500>}
box{<0,0,-0.076200><0.383535,0.036000,0.076200> rotate<0,44.997030,0> translate<11.783800,0.000000,24.748500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.783800,0.000000,24.748500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.241500,0.000000,24.748500>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,0.000000,0> translate<11.241500,0.000000,24.748500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.241500,0.000000,24.748500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.970400,0.000000,25.019600>}
box{<0,0,-0.076200><0.383393,0.036000,0.076200> rotate<0,44.997030,0> translate<10.970400,0.000000,25.019600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.970400,0.000000,25.019600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.241500,0.000000,25.290800>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,-45.007595,0> translate<10.970400,0.000000,25.019600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.241500,0.000000,25.290800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.055000,0.000000,25.290800>}
box{<0,0,-0.076200><0.813500,0.036000,0.076200> rotate<0,0.000000,0> translate<11.241500,0.000000,25.290800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.420900,0.000000,24.206200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.878600,0.000000,24.206200>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,0.000000,0> translate<12.878600,0.000000,24.206200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.878600,0.000000,24.206200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.607500,0.000000,24.477300>}
box{<0,0,-0.076200><0.383393,0.036000,0.076200> rotate<0,44.997030,0> translate<12.607500,0.000000,24.477300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.607500,0.000000,24.477300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.607500,0.000000,25.019600>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,90.000000,0> translate<12.607500,0.000000,25.019600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.607500,0.000000,25.019600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.878600,0.000000,25.290800>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,-45.007595,0> translate<12.607500,0.000000,25.019600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.878600,0.000000,25.290800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.420900,0.000000,25.290800>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,0.000000,0> translate<12.878600,0.000000,25.290800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.420900,0.000000,25.290800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.692100,0.000000,25.019600>}
box{<0,0,-0.076200><0.383535,0.036000,0.076200> rotate<0,44.997030,0> translate<13.420900,0.000000,25.290800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.692100,0.000000,25.019600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.692100,0.000000,24.748500>}
box{<0,0,-0.076200><0.271100,0.036000,0.076200> rotate<0,-90.000000,0> translate<13.692100,0.000000,24.748500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.692100,0.000000,24.748500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.607500,0.000000,24.748500>}
box{<0,0,-0.076200><1.084600,0.036000,0.076200> rotate<0,0.000000,0> translate<12.607500,0.000000,24.748500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.515700,0.000000,25.562000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.515700,0.000000,24.477300>}
box{<0,0,-0.076200><1.084700,0.036000,0.076200> rotate<0,-90.000000,0> translate<14.515700,0.000000,24.477300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.515700,0.000000,24.477300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.786900,0.000000,24.206200>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,44.986466,0> translate<14.515700,0.000000,24.477300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.244600,0.000000,25.290800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.786900,0.000000,25.290800>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,0.000000,0> translate<14.244600,0.000000,25.290800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.483800,0.000000,69.291200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.856900,0.000000,69.291200>}
box{<0,0,-0.076200><1.626900,0.036000,0.076200> rotate<0,0.000000,0> translate<33.856900,0.000000,69.291200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.856900,0.000000,69.291200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.399200,0.000000,69.833500>}
box{<0,0,-0.076200><0.766928,0.036000,0.076200> rotate<0,-44.997030,0> translate<33.856900,0.000000,69.291200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.399200,0.000000,69.833500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.856900,0.000000,70.375800>}
box{<0,0,-0.076200><0.766928,0.036000,0.076200> rotate<0,44.997030,0> translate<33.856900,0.000000,70.375800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.856900,0.000000,70.375800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.483800,0.000000,70.375800>}
box{<0,0,-0.076200><1.626900,0.036000,0.076200> rotate<0,0.000000,0> translate<33.856900,0.000000,70.375800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.483800,0.000000,71.199400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.483800,0.000000,71.741700>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,90.000000,0> translate<35.483800,0.000000,71.741700> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.483800,0.000000,71.741700>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.212700,0.000000,72.012900>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,45.007595,0> translate<35.212700,0.000000,72.012900> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.212700,0.000000,72.012900>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.670400,0.000000,72.012900>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,0.000000,0> translate<34.670400,0.000000,72.012900> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.670400,0.000000,72.012900>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.399200,0.000000,71.741700>}
box{<0,0,-0.076200><0.383535,0.036000,0.076200> rotate<0,-44.997030,0> translate<34.399200,0.000000,71.741700> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.399200,0.000000,71.741700>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.399200,0.000000,71.199400>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,-90.000000,0> translate<34.399200,0.000000,71.199400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.399200,0.000000,71.199400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.670400,0.000000,70.928300>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,44.986466,0> translate<34.399200,0.000000,71.199400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.670400,0.000000,70.928300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.212700,0.000000,70.928300>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,0.000000,0> translate<34.670400,0.000000,70.928300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.212700,0.000000,70.928300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.483800,0.000000,71.199400>}
box{<0,0,-0.076200><0.383393,0.036000,0.076200> rotate<0,-44.997030,0> translate<35.212700,0.000000,70.928300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.128000,0.000000,72.836500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.212700,0.000000,72.836500>}
box{<0,0,-0.076200><1.084700,0.036000,0.076200> rotate<0,0.000000,0> translate<34.128000,0.000000,72.836500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.212700,0.000000,72.836500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.483800,0.000000,73.107700>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,-45.007595,0> translate<35.212700,0.000000,72.836500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.399200,0.000000,72.565400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.399200,0.000000,73.107700>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,90.000000,0> translate<34.399200,0.000000,73.107700> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.483800,0.000000,73.927900>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.483800,0.000000,74.470200>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,90.000000,0> translate<35.483800,0.000000,74.470200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.483800,0.000000,74.470200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.212700,0.000000,74.741400>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,45.007595,0> translate<35.212700,0.000000,74.741400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.212700,0.000000,74.741400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.670400,0.000000,74.741400>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,0.000000,0> translate<34.670400,0.000000,74.741400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.670400,0.000000,74.741400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.399200,0.000000,74.470200>}
box{<0,0,-0.076200><0.383535,0.036000,0.076200> rotate<0,-44.997030,0> translate<34.399200,0.000000,74.470200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.399200,0.000000,74.470200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.399200,0.000000,73.927900>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,-90.000000,0> translate<34.399200,0.000000,73.927900> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.399200,0.000000,73.927900>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.670400,0.000000,73.656800>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,44.986466,0> translate<34.399200,0.000000,73.927900> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.670400,0.000000,73.656800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.212700,0.000000,73.656800>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,0.000000,0> translate<34.670400,0.000000,73.656800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.212700,0.000000,73.656800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.483800,0.000000,73.927900>}
box{<0,0,-0.076200><0.383393,0.036000,0.076200> rotate<0,-44.997030,0> translate<35.212700,0.000000,73.656800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.483800,0.000000,75.293900>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.399200,0.000000,75.293900>}
box{<0,0,-0.076200><1.084600,0.036000,0.076200> rotate<0,0.000000,0> translate<34.399200,0.000000,75.293900> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.941500,0.000000,75.293900>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.399200,0.000000,75.836200>}
box{<0,0,-0.076200><0.766928,0.036000,0.076200> rotate<0,44.997030,0> translate<34.399200,0.000000,75.836200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.399200,0.000000,75.836200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.399200,0.000000,76.107300>}
box{<0,0,-0.076200><0.271100,0.036000,0.076200> rotate<0,90.000000,0> translate<34.399200,0.000000,76.107300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.399200,0.000000,76.658100>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.856900,0.000000,77.200400>}
box{<0,0,-0.076200><0.766928,0.036000,0.076200> rotate<0,44.997030,0> translate<33.856900,0.000000,77.200400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.856900,0.000000,77.200400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.483800,0.000000,77.200400>}
box{<0,0,-0.076200><1.626900,0.036000,0.076200> rotate<0,0.000000,0> translate<33.856900,0.000000,77.200400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.483800,0.000000,76.658100>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.483800,0.000000,77.742700>}
box{<0,0,-0.076200><1.084600,0.036000,0.076200> rotate<0,90.000000,0> translate<35.483800,0.000000,77.742700> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.803800,0.000000,69.291200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.176900,0.000000,69.291200>}
box{<0,0,-0.076200><1.626900,0.036000,0.076200> rotate<0,0.000000,0> translate<54.176900,0.000000,69.291200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.176900,0.000000,69.291200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.719200,0.000000,69.833500>}
box{<0,0,-0.076200><0.766928,0.036000,0.076200> rotate<0,-44.997030,0> translate<54.176900,0.000000,69.291200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.719200,0.000000,69.833500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.176900,0.000000,70.375800>}
box{<0,0,-0.076200><0.766928,0.036000,0.076200> rotate<0,44.997030,0> translate<54.176900,0.000000,70.375800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.176900,0.000000,70.375800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.803800,0.000000,70.375800>}
box{<0,0,-0.076200><1.626900,0.036000,0.076200> rotate<0,0.000000,0> translate<54.176900,0.000000,70.375800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.803800,0.000000,71.199400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.803800,0.000000,71.741700>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,90.000000,0> translate<55.803800,0.000000,71.741700> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.803800,0.000000,71.741700>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.532700,0.000000,72.012900>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,45.007595,0> translate<55.532700,0.000000,72.012900> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.532700,0.000000,72.012900>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.990400,0.000000,72.012900>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,0.000000,0> translate<54.990400,0.000000,72.012900> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.990400,0.000000,72.012900>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.719200,0.000000,71.741700>}
box{<0,0,-0.076200><0.383535,0.036000,0.076200> rotate<0,-44.997030,0> translate<54.719200,0.000000,71.741700> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.719200,0.000000,71.741700>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.719200,0.000000,71.199400>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,-90.000000,0> translate<54.719200,0.000000,71.199400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.719200,0.000000,71.199400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.990400,0.000000,70.928300>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,44.986466,0> translate<54.719200,0.000000,71.199400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.990400,0.000000,70.928300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.532700,0.000000,70.928300>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,0.000000,0> translate<54.990400,0.000000,70.928300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.532700,0.000000,70.928300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.803800,0.000000,71.199400>}
box{<0,0,-0.076200><0.383393,0.036000,0.076200> rotate<0,-44.997030,0> translate<55.532700,0.000000,70.928300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.448000,0.000000,72.836500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.532700,0.000000,72.836500>}
box{<0,0,-0.076200><1.084700,0.036000,0.076200> rotate<0,0.000000,0> translate<54.448000,0.000000,72.836500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.532700,0.000000,72.836500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.803800,0.000000,73.107700>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,-45.007595,0> translate<55.532700,0.000000,72.836500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.719200,0.000000,72.565400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.719200,0.000000,73.107700>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,90.000000,0> translate<54.719200,0.000000,73.107700> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.803800,0.000000,73.927900>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.803800,0.000000,74.470200>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,90.000000,0> translate<55.803800,0.000000,74.470200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.803800,0.000000,74.470200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.532700,0.000000,74.741400>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,45.007595,0> translate<55.532700,0.000000,74.741400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.532700,0.000000,74.741400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.990400,0.000000,74.741400>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,0.000000,0> translate<54.990400,0.000000,74.741400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.990400,0.000000,74.741400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.719200,0.000000,74.470200>}
box{<0,0,-0.076200><0.383535,0.036000,0.076200> rotate<0,-44.997030,0> translate<54.719200,0.000000,74.470200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.719200,0.000000,74.470200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.719200,0.000000,73.927900>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,-90.000000,0> translate<54.719200,0.000000,73.927900> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.719200,0.000000,73.927900>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.990400,0.000000,73.656800>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,44.986466,0> translate<54.719200,0.000000,73.927900> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.990400,0.000000,73.656800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.532700,0.000000,73.656800>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,0.000000,0> translate<54.990400,0.000000,73.656800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.532700,0.000000,73.656800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.803800,0.000000,73.927900>}
box{<0,0,-0.076200><0.383393,0.036000,0.076200> rotate<0,-44.997030,0> translate<55.532700,0.000000,73.656800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.803800,0.000000,75.293900>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.719200,0.000000,75.293900>}
box{<0,0,-0.076200><1.084600,0.036000,0.076200> rotate<0,0.000000,0> translate<54.719200,0.000000,75.293900> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.261500,0.000000,75.293900>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.719200,0.000000,75.836200>}
box{<0,0,-0.076200><0.766928,0.036000,0.076200> rotate<0,44.997030,0> translate<54.719200,0.000000,75.836200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.719200,0.000000,75.836200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.719200,0.000000,76.107300>}
box{<0,0,-0.076200><0.271100,0.036000,0.076200> rotate<0,90.000000,0> translate<54.719200,0.000000,76.107300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.803800,0.000000,77.742700>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.803800,0.000000,76.658100>}
box{<0,0,-0.076200><1.084600,0.036000,0.076200> rotate<0,-90.000000,0> translate<55.803800,0.000000,76.658100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.803800,0.000000,76.658100>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.719200,0.000000,77.742700>}
box{<0,0,-0.076200><1.533856,0.036000,0.076200> rotate<0,44.997030,0> translate<54.719200,0.000000,77.742700> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.719200,0.000000,77.742700>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.448000,0.000000,77.742700>}
box{<0,0,-0.076200><0.271200,0.036000,0.076200> rotate<0,0.000000,0> translate<54.448000,0.000000,77.742700> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.448000,0.000000,77.742700>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.176900,0.000000,77.471500>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,-45.007595,0> translate<54.176900,0.000000,77.471500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.176900,0.000000,77.471500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.176900,0.000000,76.929200>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,-90.000000,0> translate<54.176900,0.000000,76.929200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.176900,0.000000,76.929200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.448000,0.000000,76.658100>}
box{<0,0,-0.076200><0.383393,0.036000,0.076200> rotate<0,44.997030,0> translate<54.176900,0.000000,76.929200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.906200,0.000000,63.576200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.906200,0.000000,65.203100>}
box{<0,0,-0.076200><1.626900,0.036000,0.076200> rotate<0,90.000000,0> translate<36.906200,0.000000,65.203100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.906200,0.000000,65.203100>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.448500,0.000000,64.660800>}
box{<0,0,-0.076200><0.766928,0.036000,0.076200> rotate<0,44.997030,0> translate<36.906200,0.000000,65.203100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.448500,0.000000,64.660800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.990800,0.000000,65.203100>}
box{<0,0,-0.076200><0.766928,0.036000,0.076200> rotate<0,-44.997030,0> translate<37.448500,0.000000,64.660800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.990800,0.000000,65.203100>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.990800,0.000000,63.576200>}
box{<0,0,-0.076200><1.626900,0.036000,0.076200> rotate<0,-90.000000,0> translate<37.990800,0.000000,63.576200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.085600,0.000000,63.576200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.085600,0.000000,65.203100>}
box{<0,0,-0.076200><1.626900,0.036000,0.076200> rotate<0,90.000000,0> translate<39.085600,0.000000,65.203100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.543300,0.000000,65.203100>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.627900,0.000000,65.203100>}
box{<0,0,-0.076200><1.084600,0.036000,0.076200> rotate<0,0.000000,0> translate<38.543300,0.000000,65.203100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.180400,0.000000,63.576200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.180400,0.000000,65.203100>}
box{<0,0,-0.076200><1.626900,0.036000,0.076200> rotate<0,90.000000,0> translate<40.180400,0.000000,65.203100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.180400,0.000000,65.203100>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.993800,0.000000,65.203100>}
box{<0,0,-0.076200><0.813400,0.036000,0.076200> rotate<0,0.000000,0> translate<40.180400,0.000000,65.203100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.993800,0.000000,65.203100>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.265000,0.000000,64.932000>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,44.986466,0> translate<40.993800,0.000000,65.203100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.265000,0.000000,64.932000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.265000,0.000000,64.389600>}
box{<0,0,-0.076200><0.542400,0.036000,0.076200> rotate<0,-90.000000,0> translate<41.265000,0.000000,64.389600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.265000,0.000000,64.389600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.993800,0.000000,64.118500>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,-44.986466,0> translate<40.993800,0.000000,64.118500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.993800,0.000000,64.118500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.180400,0.000000,64.118500>}
box{<0,0,-0.076200><0.813400,0.036000,0.076200> rotate<0,0.000000,0> translate<40.180400,0.000000,64.118500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.722700,0.000000,64.118500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.265000,0.000000,63.576200>}
box{<0,0,-0.076200><0.766928,0.036000,0.076200> rotate<0,44.997030,0> translate<40.722700,0.000000,64.118500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.454600,0.000000,63.576200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.454600,0.000000,65.203100>}
box{<0,0,-0.076200><1.626900,0.036000,0.076200> rotate<0,90.000000,0> translate<43.454600,0.000000,65.203100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.454600,0.000000,65.203100>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.268000,0.000000,65.203100>}
box{<0,0,-0.076200><0.813400,0.036000,0.076200> rotate<0,0.000000,0> translate<43.454600,0.000000,65.203100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.268000,0.000000,65.203100>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.539200,0.000000,64.932000>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,44.986466,0> translate<44.268000,0.000000,65.203100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.539200,0.000000,64.932000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.539200,0.000000,64.389600>}
box{<0,0,-0.076200><0.542400,0.036000,0.076200> rotate<0,-90.000000,0> translate<44.539200,0.000000,64.389600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.539200,0.000000,64.389600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.268000,0.000000,64.118500>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,-44.986466,0> translate<44.268000,0.000000,64.118500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.268000,0.000000,64.118500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.454600,0.000000,64.118500>}
box{<0,0,-0.076200><0.813400,0.036000,0.076200> rotate<0,0.000000,0> translate<43.454600,0.000000,64.118500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.091700,0.000000,65.203100>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.091700,0.000000,63.576200>}
box{<0,0,-0.076200><1.626900,0.036000,0.076200> rotate<0,-90.000000,0> translate<45.091700,0.000000,63.576200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.091700,0.000000,63.576200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.634000,0.000000,64.118500>}
box{<0,0,-0.076200><0.766928,0.036000,0.076200> rotate<0,-44.997030,0> translate<45.091700,0.000000,63.576200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.634000,0.000000,64.118500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.176300,0.000000,63.576200>}
box{<0,0,-0.076200><0.766928,0.036000,0.076200> rotate<0,44.997030,0> translate<45.634000,0.000000,64.118500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.176300,0.000000,63.576200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.176300,0.000000,65.203100>}
box{<0,0,-0.076200><1.626900,0.036000,0.076200> rotate<0,90.000000,0> translate<46.176300,0.000000,65.203100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.728800,0.000000,63.576200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.728800,0.000000,65.203100>}
box{<0,0,-0.076200><1.626900,0.036000,0.076200> rotate<0,90.000000,0> translate<46.728800,0.000000,65.203100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.728800,0.000000,65.203100>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.542200,0.000000,65.203100>}
box{<0,0,-0.076200><0.813400,0.036000,0.076200> rotate<0,0.000000,0> translate<46.728800,0.000000,65.203100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.542200,0.000000,65.203100>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.813400,0.000000,64.932000>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,44.986466,0> translate<47.542200,0.000000,65.203100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.813400,0.000000,64.932000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.813400,0.000000,64.389600>}
box{<0,0,-0.076200><0.542400,0.036000,0.076200> rotate<0,-90.000000,0> translate<47.813400,0.000000,64.389600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.813400,0.000000,64.389600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.542200,0.000000,64.118500>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,-44.986466,0> translate<47.542200,0.000000,64.118500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.542200,0.000000,64.118500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.728800,0.000000,64.118500>}
box{<0,0,-0.076200><0.813400,0.036000,0.076200> rotate<0,0.000000,0> translate<46.728800,0.000000,64.118500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.271100,0.000000,64.118500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.813400,0.000000,63.576200>}
box{<0,0,-0.076200><0.766928,0.036000,0.076200> rotate<0,44.997030,0> translate<47.271100,0.000000,64.118500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.385800,0.000000,45.518100>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.301200,0.000000,45.518100>}
box{<0,0,-0.076200><1.084600,0.036000,0.076200> rotate<0,0.000000,0> translate<22.301200,0.000000,45.518100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.301200,0.000000,45.518100>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.301200,0.000000,43.891200>}
box{<0,0,-0.076200><1.626900,0.036000,0.076200> rotate<0,-90.000000,0> translate<22.301200,0.000000,43.891200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.301200,0.000000,43.891200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.385800,0.000000,43.891200>}
box{<0,0,-0.076200><1.084600,0.036000,0.076200> rotate<0,0.000000,0> translate<22.301200,0.000000,43.891200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.301200,0.000000,44.704600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.843500,0.000000,44.704600>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,0.000000,0> translate<22.301200,0.000000,44.704600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.938300,0.000000,43.891200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.938300,0.000000,45.518100>}
box{<0,0,-0.076200><1.626900,0.036000,0.076200> rotate<0,90.000000,0> translate<23.938300,0.000000,45.518100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.938300,0.000000,45.518100>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.022900,0.000000,43.891200>}
box{<0,0,-0.076200><1.955290,0.036000,0.076200> rotate<0,56.306216,0> translate<23.938300,0.000000,45.518100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.022900,0.000000,43.891200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.022900,0.000000,45.518100>}
box{<0,0,-0.076200><1.626900,0.036000,0.076200> rotate<0,90.000000,0> translate<25.022900,0.000000,45.518100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.660000,0.000000,45.247000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.388800,0.000000,45.518100>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,44.986466,0> translate<26.388800,0.000000,45.518100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.388800,0.000000,45.518100>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.846500,0.000000,45.518100>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,0.000000,0> translate<25.846500,0.000000,45.518100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.846500,0.000000,45.518100>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.575400,0.000000,45.247000>}
box{<0,0,-0.076200><0.383393,0.036000,0.076200> rotate<0,-44.997030,0> translate<25.575400,0.000000,45.247000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.575400,0.000000,45.247000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.575400,0.000000,44.162300>}
box{<0,0,-0.076200><1.084700,0.036000,0.076200> rotate<0,-90.000000,0> translate<25.575400,0.000000,44.162300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.575400,0.000000,44.162300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.846500,0.000000,43.891200>}
box{<0,0,-0.076200><0.383393,0.036000,0.076200> rotate<0,44.997030,0> translate<25.575400,0.000000,44.162300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.846500,0.000000,43.891200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.388800,0.000000,43.891200>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,0.000000,0> translate<25.846500,0.000000,43.891200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.388800,0.000000,43.891200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.660000,0.000000,44.162300>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,-44.986466,0> translate<26.388800,0.000000,43.891200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.212500,0.000000,44.975800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.754800,0.000000,45.518100>}
box{<0,0,-0.076200><0.766928,0.036000,0.076200> rotate<0,-44.997030,0> translate<27.212500,0.000000,44.975800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.754800,0.000000,45.518100>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.754800,0.000000,43.891200>}
box{<0,0,-0.076200><1.626900,0.036000,0.076200> rotate<0,-90.000000,0> translate<27.754800,0.000000,43.891200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.212500,0.000000,43.891200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.297100,0.000000,43.891200>}
box{<0,0,-0.076200><1.084600,0.036000,0.076200> rotate<0,0.000000,0> translate<27.212500,0.000000,43.891200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.187200,0.000000,17.070100>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.102600,0.000000,17.070100>}
box{<0,0,-0.076200><1.084600,0.036000,0.076200> rotate<0,0.000000,0> translate<22.102600,0.000000,17.070100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.102600,0.000000,17.070100>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.102600,0.000000,15.443200>}
box{<0,0,-0.076200><1.626900,0.036000,0.076200> rotate<0,-90.000000,0> translate<22.102600,0.000000,15.443200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.102600,0.000000,15.443200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.187200,0.000000,15.443200>}
box{<0,0,-0.076200><1.084600,0.036000,0.076200> rotate<0,0.000000,0> translate<22.102600,0.000000,15.443200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.102600,0.000000,16.256600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.644900,0.000000,16.256600>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,0.000000,0> translate<22.102600,0.000000,16.256600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.739700,0.000000,15.443200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.739700,0.000000,17.070100>}
box{<0,0,-0.076200><1.626900,0.036000,0.076200> rotate<0,90.000000,0> translate<23.739700,0.000000,17.070100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.739700,0.000000,17.070100>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.824300,0.000000,15.443200>}
box{<0,0,-0.076200><1.955290,0.036000,0.076200> rotate<0,56.306216,0> translate<23.739700,0.000000,17.070100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.824300,0.000000,15.443200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.824300,0.000000,17.070100>}
box{<0,0,-0.076200><1.626900,0.036000,0.076200> rotate<0,90.000000,0> translate<24.824300,0.000000,17.070100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.461400,0.000000,16.799000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.190200,0.000000,17.070100>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,44.986466,0> translate<26.190200,0.000000,17.070100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.190200,0.000000,17.070100>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.647900,0.000000,17.070100>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,0.000000,0> translate<25.647900,0.000000,17.070100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.647900,0.000000,17.070100>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.376800,0.000000,16.799000>}
box{<0,0,-0.076200><0.383393,0.036000,0.076200> rotate<0,-44.997030,0> translate<25.376800,0.000000,16.799000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.376800,0.000000,16.799000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.376800,0.000000,15.714300>}
box{<0,0,-0.076200><1.084700,0.036000,0.076200> rotate<0,-90.000000,0> translate<25.376800,0.000000,15.714300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.376800,0.000000,15.714300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.647900,0.000000,15.443200>}
box{<0,0,-0.076200><0.383393,0.036000,0.076200> rotate<0,44.997030,0> translate<25.376800,0.000000,15.714300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.647900,0.000000,15.443200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.190200,0.000000,15.443200>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,0.000000,0> translate<25.647900,0.000000,15.443200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.190200,0.000000,15.443200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.461400,0.000000,15.714300>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,-44.986466,0> translate<26.190200,0.000000,15.443200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.098500,0.000000,15.443200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.013900,0.000000,15.443200>}
box{<0,0,-0.076200><1.084600,0.036000,0.076200> rotate<0,0.000000,0> translate<27.013900,0.000000,15.443200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.013900,0.000000,15.443200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.098500,0.000000,16.527800>}
box{<0,0,-0.076200><1.533856,0.036000,0.076200> rotate<0,-44.997030,0> translate<27.013900,0.000000,15.443200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.098500,0.000000,16.527800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.098500,0.000000,16.799000>}
box{<0,0,-0.076200><0.271200,0.036000,0.076200> rotate<0,90.000000,0> translate<28.098500,0.000000,16.799000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.098500,0.000000,16.799000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.827300,0.000000,17.070100>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,44.986466,0> translate<27.827300,0.000000,17.070100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.827300,0.000000,17.070100>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.285000,0.000000,17.070100>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,0.000000,0> translate<27.285000,0.000000,17.070100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.285000,0.000000,17.070100>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.013900,0.000000,16.799000>}
box{<0,0,-0.076200><0.383393,0.036000,0.076200> rotate<0,-44.997030,0> translate<27.013900,0.000000,16.799000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.520100,0.000000,15.800100>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.435500,0.000000,15.800100>}
box{<0,0,-0.076200><1.084600,0.036000,0.076200> rotate<0,0.000000,0> translate<34.435500,0.000000,15.800100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.435500,0.000000,15.800100>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.435500,0.000000,14.173200>}
box{<0,0,-0.076200><1.626900,0.036000,0.076200> rotate<0,-90.000000,0> translate<34.435500,0.000000,14.173200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.435500,0.000000,14.173200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.520100,0.000000,14.173200>}
box{<0,0,-0.076200><1.084600,0.036000,0.076200> rotate<0,0.000000,0> translate<34.435500,0.000000,14.173200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.435500,0.000000,14.986600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.977800,0.000000,14.986600>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,0.000000,0> translate<34.435500,0.000000,14.986600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.072600,0.000000,14.173200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.072600,0.000000,15.800100>}
box{<0,0,-0.076200><1.626900,0.036000,0.076200> rotate<0,90.000000,0> translate<36.072600,0.000000,15.800100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.072600,0.000000,15.800100>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.157200,0.000000,14.173200>}
box{<0,0,-0.076200><1.955290,0.036000,0.076200> rotate<0,56.306216,0> translate<36.072600,0.000000,15.800100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.157200,0.000000,14.173200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.157200,0.000000,15.800100>}
box{<0,0,-0.076200><1.626900,0.036000,0.076200> rotate<0,90.000000,0> translate<37.157200,0.000000,15.800100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.794300,0.000000,15.529000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.523100,0.000000,15.800100>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,44.986466,0> translate<38.523100,0.000000,15.800100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.523100,0.000000,15.800100>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.980800,0.000000,15.800100>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,0.000000,0> translate<37.980800,0.000000,15.800100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.980800,0.000000,15.800100>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.709700,0.000000,15.529000>}
box{<0,0,-0.076200><0.383393,0.036000,0.076200> rotate<0,-44.997030,0> translate<37.709700,0.000000,15.529000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.709700,0.000000,15.529000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.709700,0.000000,14.444300>}
box{<0,0,-0.076200><1.084700,0.036000,0.076200> rotate<0,-90.000000,0> translate<37.709700,0.000000,14.444300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.709700,0.000000,14.444300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.980800,0.000000,14.173200>}
box{<0,0,-0.076200><0.383393,0.036000,0.076200> rotate<0,44.997030,0> translate<37.709700,0.000000,14.444300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.980800,0.000000,14.173200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.523100,0.000000,14.173200>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,0.000000,0> translate<37.980800,0.000000,14.173200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.523100,0.000000,14.173200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.794300,0.000000,14.444300>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,-44.986466,0> translate<38.523100,0.000000,14.173200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.431400,0.000000,15.529000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.160200,0.000000,15.800100>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,44.986466,0> translate<40.160200,0.000000,15.800100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.160200,0.000000,15.800100>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.617900,0.000000,15.800100>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,0.000000,0> translate<39.617900,0.000000,15.800100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.617900,0.000000,15.800100>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.346800,0.000000,15.529000>}
box{<0,0,-0.076200><0.383393,0.036000,0.076200> rotate<0,-44.997030,0> translate<39.346800,0.000000,15.529000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.346800,0.000000,15.529000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.346800,0.000000,15.257800>}
box{<0,0,-0.076200><0.271200,0.036000,0.076200> rotate<0,-90.000000,0> translate<39.346800,0.000000,15.257800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.346800,0.000000,15.257800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.617900,0.000000,14.986600>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,45.007595,0> translate<39.346800,0.000000,15.257800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.617900,0.000000,14.986600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.160200,0.000000,14.986600>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,0.000000,0> translate<39.617900,0.000000,14.986600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.160200,0.000000,14.986600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.431400,0.000000,14.715500>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,44.986466,0> translate<40.160200,0.000000,14.986600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.431400,0.000000,14.715500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.431400,0.000000,14.444300>}
box{<0,0,-0.076200><0.271200,0.036000,0.076200> rotate<0,-90.000000,0> translate<40.431400,0.000000,14.444300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.431400,0.000000,14.444300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.160200,0.000000,14.173200>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,-44.986466,0> translate<40.160200,0.000000,14.173200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.160200,0.000000,14.173200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.617900,0.000000,14.173200>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,0.000000,0> translate<39.617900,0.000000,14.173200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.617900,0.000000,14.173200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.346800,0.000000,14.444300>}
box{<0,0,-0.076200><0.383393,0.036000,0.076200> rotate<0,44.997030,0> translate<39.346800,0.000000,14.444300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.983900,0.000000,15.800100>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.983900,0.000000,14.173200>}
box{<0,0,-0.076200><1.626900,0.036000,0.076200> rotate<0,-90.000000,0> translate<40.983900,0.000000,14.173200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.983900,0.000000,14.173200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.526200,0.000000,14.715500>}
box{<0,0,-0.076200><0.766928,0.036000,0.076200> rotate<0,-44.997030,0> translate<40.983900,0.000000,14.173200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.526200,0.000000,14.715500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.068500,0.000000,14.173200>}
box{<0,0,-0.076200><0.766928,0.036000,0.076200> rotate<0,44.997030,0> translate<41.526200,0.000000,14.715500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.068500,0.000000,14.173200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.068500,0.000000,15.800100>}
box{<0,0,-0.076200><1.626900,0.036000,0.076200> rotate<0,90.000000,0> translate<42.068500,0.000000,15.800100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<63.701900,0.000000,43.256200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<65.328800,0.000000,43.256200>}
box{<0,0,-0.076200><1.626900,0.036000,0.076200> rotate<0,0.000000,0> translate<63.701900,0.000000,43.256200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<65.328800,0.000000,43.256200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<65.328800,0.000000,44.340800>}
box{<0,0,-0.076200><1.084600,0.036000,0.076200> rotate<0,90.000000,0> translate<65.328800,0.000000,44.340800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<65.328800,0.000000,44.893300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<65.328800,0.000000,45.435600>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,90.000000,0> translate<65.328800,0.000000,45.435600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<65.328800,0.000000,45.164400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<63.701900,0.000000,45.164400>}
box{<0,0,-0.076200><1.626900,0.036000,0.076200> rotate<0,0.000000,0> translate<63.701900,0.000000,45.164400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<63.701900,0.000000,44.893300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<63.701900,0.000000,45.435600>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,90.000000,0> translate<63.701900,0.000000,45.435600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<65.328800,0.000000,45.984700>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<63.701900,0.000000,45.984700>}
box{<0,0,-0.076200><1.626900,0.036000,0.076200> rotate<0,0.000000,0> translate<63.701900,0.000000,45.984700> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<63.701900,0.000000,45.984700>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<64.244200,0.000000,46.527000>}
box{<0,0,-0.076200><0.766928,0.036000,0.076200> rotate<0,-44.997030,0> translate<63.701900,0.000000,45.984700> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<64.244200,0.000000,46.527000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<63.701900,0.000000,47.069300>}
box{<0,0,-0.076200><0.766928,0.036000,0.076200> rotate<0,44.997030,0> translate<63.701900,0.000000,47.069300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<63.701900,0.000000,47.069300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<65.328800,0.000000,47.069300>}
box{<0,0,-0.076200><1.626900,0.036000,0.076200> rotate<0,0.000000,0> translate<63.701900,0.000000,47.069300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<64.244200,0.000000,47.621800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<63.701900,0.000000,48.164100>}
box{<0,0,-0.076200><0.766928,0.036000,0.076200> rotate<0,44.997030,0> translate<63.701900,0.000000,48.164100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<63.701900,0.000000,48.164100>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<65.328800,0.000000,48.164100>}
box{<0,0,-0.076200><1.626900,0.036000,0.076200> rotate<0,0.000000,0> translate<63.701900,0.000000,48.164100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<65.328800,0.000000,47.621800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<65.328800,0.000000,48.706400>}
box{<0,0,-0.076200><1.084600,0.036000,0.076200> rotate<0,90.000000,0> translate<65.328800,0.000000,48.706400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<75.131900,0.000000,43.256200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<76.758800,0.000000,43.256200>}
box{<0,0,-0.076200><1.626900,0.036000,0.076200> rotate<0,0.000000,0> translate<75.131900,0.000000,43.256200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<76.758800,0.000000,43.256200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<76.758800,0.000000,44.340800>}
box{<0,0,-0.076200><1.084600,0.036000,0.076200> rotate<0,90.000000,0> translate<76.758800,0.000000,44.340800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<76.758800,0.000000,44.893300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<76.758800,0.000000,45.435600>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,90.000000,0> translate<76.758800,0.000000,45.435600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<76.758800,0.000000,45.164400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<75.131900,0.000000,45.164400>}
box{<0,0,-0.076200><1.626900,0.036000,0.076200> rotate<0,0.000000,0> translate<75.131900,0.000000,45.164400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<75.131900,0.000000,44.893300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<75.131900,0.000000,45.435600>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,90.000000,0> translate<75.131900,0.000000,45.435600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<76.758800,0.000000,45.984700>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<75.131900,0.000000,45.984700>}
box{<0,0,-0.076200><1.626900,0.036000,0.076200> rotate<0,0.000000,0> translate<75.131900,0.000000,45.984700> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<75.131900,0.000000,45.984700>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<75.674200,0.000000,46.527000>}
box{<0,0,-0.076200><0.766928,0.036000,0.076200> rotate<0,-44.997030,0> translate<75.131900,0.000000,45.984700> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<75.674200,0.000000,46.527000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<75.131900,0.000000,47.069300>}
box{<0,0,-0.076200><0.766928,0.036000,0.076200> rotate<0,44.997030,0> translate<75.131900,0.000000,47.069300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<75.131900,0.000000,47.069300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<76.758800,0.000000,47.069300>}
box{<0,0,-0.076200><1.626900,0.036000,0.076200> rotate<0,0.000000,0> translate<75.131900,0.000000,47.069300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<76.758800,0.000000,48.706400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<76.758800,0.000000,47.621800>}
box{<0,0,-0.076200><1.084600,0.036000,0.076200> rotate<0,-90.000000,0> translate<76.758800,0.000000,47.621800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<76.758800,0.000000,47.621800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<75.674200,0.000000,48.706400>}
box{<0,0,-0.076200><1.533856,0.036000,0.076200> rotate<0,44.997030,0> translate<75.674200,0.000000,48.706400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<75.674200,0.000000,48.706400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<75.403000,0.000000,48.706400>}
box{<0,0,-0.076200><0.271200,0.036000,0.076200> rotate<0,0.000000,0> translate<75.403000,0.000000,48.706400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<75.403000,0.000000,48.706400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<75.131900,0.000000,48.435200>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,-45.007595,0> translate<75.131900,0.000000,48.435200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<75.131900,0.000000,48.435200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<75.131900,0.000000,47.892900>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,-90.000000,0> translate<75.131900,0.000000,47.892900> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<75.131900,0.000000,47.892900>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<75.403000,0.000000,47.621800>}
box{<0,0,-0.076200><0.383393,0.036000,0.076200> rotate<0,44.997030,0> translate<75.131900,0.000000,47.892900> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.119200,0.000000,5.156200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.932700,0.000000,5.156200>}
box{<0,0,-0.076200><0.813500,0.036000,0.076200> rotate<0,0.000000,0> translate<80.119200,0.000000,5.156200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.932700,0.000000,5.156200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<81.203800,0.000000,5.427300>}
box{<0,0,-0.076200><0.383393,0.036000,0.076200> rotate<0,-44.997030,0> translate<80.932700,0.000000,5.156200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<81.203800,0.000000,5.427300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<81.203800,0.000000,6.240800>}
box{<0,0,-0.076200><0.813500,0.036000,0.076200> rotate<0,90.000000,0> translate<81.203800,0.000000,6.240800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<81.203800,0.000000,6.240800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.119200,0.000000,6.240800>}
box{<0,0,-0.076200><1.084600,0.036000,0.076200> rotate<0,0.000000,0> translate<80.119200,0.000000,6.240800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<81.203800,0.000000,6.793300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<81.203800,0.000000,7.606700>}
box{<0,0,-0.076200><0.813400,0.036000,0.076200> rotate<0,90.000000,0> translate<81.203800,0.000000,7.606700> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<81.203800,0.000000,7.606700>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.932700,0.000000,7.877900>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,45.007595,0> translate<80.932700,0.000000,7.877900> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.932700,0.000000,7.877900>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.661500,0.000000,7.606700>}
box{<0,0,-0.076200><0.383535,0.036000,0.076200> rotate<0,-44.997030,0> translate<80.661500,0.000000,7.606700> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.661500,0.000000,7.606700>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.661500,0.000000,7.064400>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,-90.000000,0> translate<80.661500,0.000000,7.064400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.661500,0.000000,7.064400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.390400,0.000000,6.793300>}
box{<0,0,-0.076200><0.383393,0.036000,0.076200> rotate<0,-44.997030,0> translate<80.390400,0.000000,6.793300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.390400,0.000000,6.793300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.119200,0.000000,7.064400>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,44.986466,0> translate<80.119200,0.000000,7.064400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.119200,0.000000,7.064400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.119200,0.000000,7.877900>}
box{<0,0,-0.076200><0.813500,0.036000,0.076200> rotate<0,90.000000,0> translate<80.119200,0.000000,7.877900> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<79.576900,0.000000,8.430400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<81.203800,0.000000,8.430400>}
box{<0,0,-0.076200><1.626900,0.036000,0.076200> rotate<0,0.000000,0> translate<79.576900,0.000000,8.430400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<81.203800,0.000000,8.430400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<81.203800,0.000000,9.243800>}
box{<0,0,-0.076200><0.813400,0.036000,0.076200> rotate<0,90.000000,0> translate<81.203800,0.000000,9.243800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<81.203800,0.000000,9.243800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.932700,0.000000,9.515000>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,45.007595,0> translate<80.932700,0.000000,9.515000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.932700,0.000000,9.515000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.390400,0.000000,9.515000>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,0.000000,0> translate<80.390400,0.000000,9.515000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.390400,0.000000,9.515000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.119200,0.000000,9.243800>}
box{<0,0,-0.076200><0.383535,0.036000,0.076200> rotate<0,-44.997030,0> translate<80.119200,0.000000,9.243800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.119200,0.000000,9.243800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.119200,0.000000,8.430400>}
box{<0,0,-0.076200><0.813400,0.036000,0.076200> rotate<0,-90.000000,0> translate<80.119200,0.000000,8.430400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<79.848000,0.000000,11.152100>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<79.576900,0.000000,10.880900>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,-45.007595,0> translate<79.576900,0.000000,10.880900> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<79.576900,0.000000,10.880900>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<79.576900,0.000000,10.338600>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,-90.000000,0> translate<79.576900,0.000000,10.338600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<79.576900,0.000000,10.338600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<79.848000,0.000000,10.067500>}
box{<0,0,-0.076200><0.383393,0.036000,0.076200> rotate<0,44.997030,0> translate<79.576900,0.000000,10.338600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<79.848000,0.000000,10.067500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.119200,0.000000,10.067500>}
box{<0,0,-0.076200><0.271200,0.036000,0.076200> rotate<0,0.000000,0> translate<79.848000,0.000000,10.067500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.119200,0.000000,10.067500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.390400,0.000000,10.338600>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,-44.986466,0> translate<80.119200,0.000000,10.067500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.390400,0.000000,10.338600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.390400,0.000000,10.880900>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,90.000000,0> translate<80.390400,0.000000,10.880900> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.390400,0.000000,10.880900>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.661500,0.000000,11.152100>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,-45.007595,0> translate<80.390400,0.000000,10.880900> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.661500,0.000000,11.152100>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.932700,0.000000,11.152100>}
box{<0,0,-0.076200><0.271200,0.036000,0.076200> rotate<0,0.000000,0> translate<80.661500,0.000000,11.152100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.932700,0.000000,11.152100>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<81.203800,0.000000,10.880900>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,45.007595,0> translate<80.932700,0.000000,11.152100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<81.203800,0.000000,10.880900>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<81.203800,0.000000,10.338600>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,-90.000000,0> translate<81.203800,0.000000,10.338600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<81.203800,0.000000,10.338600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.932700,0.000000,10.067500>}
box{<0,0,-0.076200><0.383393,0.036000,0.076200> rotate<0,-44.997030,0> translate<80.932700,0.000000,10.067500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.119200,0.000000,11.704600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.119200,0.000000,11.975700>}
box{<0,0,-0.076200><0.271100,0.036000,0.076200> rotate<0,90.000000,0> translate<80.119200,0.000000,11.975700> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.119200,0.000000,11.975700>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<81.203800,0.000000,11.975700>}
box{<0,0,-0.076200><1.084600,0.036000,0.076200> rotate<0,0.000000,0> translate<80.119200,0.000000,11.975700> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<81.203800,0.000000,11.704600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<81.203800,0.000000,12.246900>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,90.000000,0> translate<81.203800,0.000000,12.246900> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<79.305700,0.000000,11.975700>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<79.576900,0.000000,11.975700>}
box{<0,0,-0.076200><0.271200,0.036000,0.076200> rotate<0,0.000000,0> translate<79.305700,0.000000,11.975700> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<81.203800,0.000000,12.796000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.119200,0.000000,12.796000>}
box{<0,0,-0.076200><1.084600,0.036000,0.076200> rotate<0,0.000000,0> translate<80.119200,0.000000,12.796000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.119200,0.000000,12.796000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.119200,0.000000,13.067100>}
box{<0,0,-0.076200><0.271100,0.036000,0.076200> rotate<0,90.000000,0> translate<80.119200,0.000000,13.067100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.119200,0.000000,13.067100>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.390400,0.000000,13.338300>}
box{<0,0,-0.076200><0.383535,0.036000,0.076200> rotate<0,-44.997030,0> translate<80.119200,0.000000,13.067100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.390400,0.000000,13.338300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<81.203800,0.000000,13.338300>}
box{<0,0,-0.076200><0.813400,0.036000,0.076200> rotate<0,0.000000,0> translate<80.390400,0.000000,13.338300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.390400,0.000000,13.338300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.119200,0.000000,13.609400>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,44.986466,0> translate<80.119200,0.000000,13.609400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.119200,0.000000,13.609400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.390400,0.000000,13.880600>}
box{<0,0,-0.076200><0.383535,0.036000,0.076200> rotate<0,-44.997030,0> translate<80.119200,0.000000,13.609400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.390400,0.000000,13.880600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<81.203800,0.000000,13.880600>}
box{<0,0,-0.076200><0.813400,0.036000,0.076200> rotate<0,0.000000,0> translate<80.390400,0.000000,13.880600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<79.848000,0.000000,15.517700>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<79.576900,0.000000,15.246500>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,-45.007595,0> translate<79.576900,0.000000,15.246500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<79.576900,0.000000,15.246500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<79.576900,0.000000,14.704200>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,-90.000000,0> translate<79.576900,0.000000,14.704200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<79.576900,0.000000,14.704200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<79.848000,0.000000,14.433100>}
box{<0,0,-0.076200><0.383393,0.036000,0.076200> rotate<0,44.997030,0> translate<79.576900,0.000000,14.704200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<79.848000,0.000000,14.433100>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.119200,0.000000,14.433100>}
box{<0,0,-0.076200><0.271200,0.036000,0.076200> rotate<0,0.000000,0> translate<79.848000,0.000000,14.433100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.119200,0.000000,14.433100>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.390400,0.000000,14.704200>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,-44.986466,0> translate<80.119200,0.000000,14.433100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.390400,0.000000,14.704200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.390400,0.000000,15.246500>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,90.000000,0> translate<80.390400,0.000000,15.246500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.390400,0.000000,15.246500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.661500,0.000000,15.517700>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,-45.007595,0> translate<80.390400,0.000000,15.246500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.661500,0.000000,15.517700>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.932700,0.000000,15.517700>}
box{<0,0,-0.076200><0.271200,0.036000,0.076200> rotate<0,0.000000,0> translate<80.661500,0.000000,15.517700> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.932700,0.000000,15.517700>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<81.203800,0.000000,15.246500>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,45.007595,0> translate<80.932700,0.000000,15.517700> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<81.203800,0.000000,15.246500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<81.203800,0.000000,14.704200>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,-90.000000,0> translate<81.203800,0.000000,14.704200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<81.203800,0.000000,14.704200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.932700,0.000000,14.433100>}
box{<0,0,-0.076200><0.383393,0.036000,0.076200> rotate<0,-44.997030,0> translate<80.932700,0.000000,14.433100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<79.848000,0.000000,16.341300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.932700,0.000000,16.341300>}
box{<0,0,-0.076200><1.084700,0.036000,0.076200> rotate<0,0.000000,0> translate<79.848000,0.000000,16.341300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.932700,0.000000,16.341300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<81.203800,0.000000,16.612500>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,-45.007595,0> translate<80.932700,0.000000,16.341300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.119200,0.000000,16.070200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.119200,0.000000,16.612500>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,90.000000,0> translate<80.119200,0.000000,16.612500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<81.203800,0.000000,17.975000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<81.203800,0.000000,17.432700>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,-90.000000,0> translate<81.203800,0.000000,17.432700> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<81.203800,0.000000,17.432700>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.932700,0.000000,17.161600>}
box{<0,0,-0.076200><0.383393,0.036000,0.076200> rotate<0,-44.997030,0> translate<80.932700,0.000000,17.161600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.932700,0.000000,17.161600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.390400,0.000000,17.161600>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,0.000000,0> translate<80.390400,0.000000,17.161600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.390400,0.000000,17.161600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.119200,0.000000,17.432700>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,44.986466,0> translate<80.119200,0.000000,17.432700> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.119200,0.000000,17.432700>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.119200,0.000000,17.975000>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,90.000000,0> translate<80.119200,0.000000,17.975000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.119200,0.000000,17.975000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.390400,0.000000,18.246200>}
box{<0,0,-0.076200><0.383535,0.036000,0.076200> rotate<0,-44.997030,0> translate<80.119200,0.000000,17.975000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.390400,0.000000,18.246200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.661500,0.000000,18.246200>}
box{<0,0,-0.076200><0.271100,0.036000,0.076200> rotate<0,0.000000,0> translate<80.390400,0.000000,18.246200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.661500,0.000000,18.246200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.661500,0.000000,17.161600>}
box{<0,0,-0.076200><1.084600,0.036000,0.076200> rotate<0,-90.000000,0> translate<80.661500,0.000000,17.161600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<81.746100,0.000000,18.798700>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.119200,0.000000,18.798700>}
box{<0,0,-0.076200><1.626900,0.036000,0.076200> rotate<0,0.000000,0> translate<80.119200,0.000000,18.798700> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.119200,0.000000,18.798700>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.119200,0.000000,19.612100>}
box{<0,0,-0.076200><0.813400,0.036000,0.076200> rotate<0,90.000000,0> translate<80.119200,0.000000,19.612100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.119200,0.000000,19.612100>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.390400,0.000000,19.883300>}
box{<0,0,-0.076200><0.383535,0.036000,0.076200> rotate<0,-44.997030,0> translate<80.119200,0.000000,19.612100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.390400,0.000000,19.883300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.932700,0.000000,19.883300>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,0.000000,0> translate<80.390400,0.000000,19.883300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.932700,0.000000,19.883300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<81.203800,0.000000,19.612100>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,45.007595,0> translate<80.932700,0.000000,19.883300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<81.203800,0.000000,19.612100>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<81.203800,0.000000,18.798700>}
box{<0,0,-0.076200><0.813400,0.036000,0.076200> rotate<0,-90.000000,0> translate<81.203800,0.000000,18.798700> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<81.746100,0.000000,20.435800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.119200,0.000000,20.435800>}
box{<0,0,-0.076200><1.626900,0.036000,0.076200> rotate<0,0.000000,0> translate<80.119200,0.000000,20.435800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.119200,0.000000,20.435800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.119200,0.000000,21.249200>}
box{<0,0,-0.076200><0.813400,0.036000,0.076200> rotate<0,90.000000,0> translate<80.119200,0.000000,21.249200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.119200,0.000000,21.249200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.390400,0.000000,21.520400>}
box{<0,0,-0.076200><0.383535,0.036000,0.076200> rotate<0,-44.997030,0> translate<80.119200,0.000000,21.249200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.390400,0.000000,21.520400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.932700,0.000000,21.520400>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,0.000000,0> translate<80.390400,0.000000,21.520400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.932700,0.000000,21.520400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<81.203800,0.000000,21.249200>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,45.007595,0> translate<80.932700,0.000000,21.520400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<81.203800,0.000000,21.249200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<81.203800,0.000000,20.435800>}
box{<0,0,-0.076200><0.813400,0.036000,0.076200> rotate<0,-90.000000,0> translate<81.203800,0.000000,20.435800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<81.203800,0.000000,22.886300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<81.203800,0.000000,22.344000>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,-90.000000,0> translate<81.203800,0.000000,22.344000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<81.203800,0.000000,22.344000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.932700,0.000000,22.072900>}
box{<0,0,-0.076200><0.383393,0.036000,0.076200> rotate<0,-44.997030,0> translate<80.932700,0.000000,22.072900> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.932700,0.000000,22.072900>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.390400,0.000000,22.072900>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,0.000000,0> translate<80.390400,0.000000,22.072900> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.390400,0.000000,22.072900>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.119200,0.000000,22.344000>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,44.986466,0> translate<80.119200,0.000000,22.344000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.119200,0.000000,22.344000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.119200,0.000000,22.886300>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,90.000000,0> translate<80.119200,0.000000,22.886300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.119200,0.000000,22.886300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.390400,0.000000,23.157500>}
box{<0,0,-0.076200><0.383535,0.036000,0.076200> rotate<0,-44.997030,0> translate<80.119200,0.000000,22.886300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.390400,0.000000,23.157500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.661500,0.000000,23.157500>}
box{<0,0,-0.076200><0.271100,0.036000,0.076200> rotate<0,0.000000,0> translate<80.390400,0.000000,23.157500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.661500,0.000000,23.157500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.661500,0.000000,22.072900>}
box{<0,0,-0.076200><1.084600,0.036000,0.076200> rotate<0,-90.000000,0> translate<80.661500,0.000000,22.072900> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<81.203800,0.000000,23.710000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.119200,0.000000,23.710000>}
box{<0,0,-0.076200><1.084600,0.036000,0.076200> rotate<0,0.000000,0> translate<80.119200,0.000000,23.710000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.661500,0.000000,23.710000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.119200,0.000000,24.252300>}
box{<0,0,-0.076200><0.766928,0.036000,0.076200> rotate<0,44.997030,0> translate<80.119200,0.000000,24.252300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.119200,0.000000,24.252300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.119200,0.000000,24.523400>}
box{<0,0,-0.076200><0.271100,0.036000,0.076200> rotate<0,90.000000,0> translate<80.119200,0.000000,24.523400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.119200,0.000000,26.711300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<81.203800,0.000000,27.253600>}
box{<0,0,-0.076200><1.212620,0.036000,0.076200> rotate<0,-26.563298,0> translate<80.119200,0.000000,26.711300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<81.203800,0.000000,27.253600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.119200,0.000000,27.795900>}
box{<0,0,-0.076200><1.212620,0.036000,0.076200> rotate<0,26.563298,0> translate<80.119200,0.000000,27.795900> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.119200,0.000000,28.348400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<79.576900,0.000000,28.890700>}
box{<0,0,-0.076200><0.766928,0.036000,0.076200> rotate<0,44.997030,0> translate<79.576900,0.000000,28.890700> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<79.576900,0.000000,28.890700>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<81.203800,0.000000,28.890700>}
box{<0,0,-0.076200><1.626900,0.036000,0.076200> rotate<0,0.000000,0> translate<79.576900,0.000000,28.890700> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<81.203800,0.000000,28.348400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<81.203800,0.000000,29.433000>}
box{<0,0,-0.076200><1.084600,0.036000,0.076200> rotate<0,90.000000,0> translate<81.203800,0.000000,29.433000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<81.203800,0.000000,29.985500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.932700,0.000000,29.985500>}
box{<0,0,-0.076200><0.271100,0.036000,0.076200> rotate<0,0.000000,0> translate<80.932700,0.000000,29.985500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.932700,0.000000,29.985500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.932700,0.000000,30.256600>}
box{<0,0,-0.076200><0.271100,0.036000,0.076200> rotate<0,90.000000,0> translate<80.932700,0.000000,30.256600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.932700,0.000000,30.256600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<81.203800,0.000000,30.256600>}
box{<0,0,-0.076200><0.271100,0.036000,0.076200> rotate<0,0.000000,0> translate<80.932700,0.000000,30.256600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<81.203800,0.000000,30.256600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<81.203800,0.000000,29.985500>}
box{<0,0,-0.076200><0.271100,0.036000,0.076200> rotate<0,-90.000000,0> translate<81.203800,0.000000,29.985500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.932700,0.000000,30.804000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<79.848000,0.000000,30.804000>}
box{<0,0,-0.076200><1.084700,0.036000,0.076200> rotate<0,0.000000,0> translate<79.848000,0.000000,30.804000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<79.848000,0.000000,30.804000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<79.576900,0.000000,31.075100>}
box{<0,0,-0.076200><0.383393,0.036000,0.076200> rotate<0,44.997030,0> translate<79.576900,0.000000,31.075100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<79.576900,0.000000,31.075100>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<79.576900,0.000000,31.617400>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,90.000000,0> translate<79.576900,0.000000,31.617400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<79.576900,0.000000,31.617400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<79.848000,0.000000,31.888600>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,-45.007595,0> translate<79.576900,0.000000,31.617400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<79.848000,0.000000,31.888600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.932700,0.000000,31.888600>}
box{<0,0,-0.076200><1.084700,0.036000,0.076200> rotate<0,0.000000,0> translate<79.848000,0.000000,31.888600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.932700,0.000000,31.888600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<81.203800,0.000000,31.617400>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,45.007595,0> translate<80.932700,0.000000,31.888600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<81.203800,0.000000,31.617400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<81.203800,0.000000,31.075100>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,-90.000000,0> translate<81.203800,0.000000,31.075100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<81.203800,0.000000,31.075100>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.932700,0.000000,30.804000>}
box{<0,0,-0.076200><0.383393,0.036000,0.076200> rotate<0,-44.997030,0> translate<80.932700,0.000000,30.804000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.932700,0.000000,30.804000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<79.848000,0.000000,31.888600>}
box{<0,0,-0.076200><1.533927,0.036000,0.076200> rotate<0,44.994389,0> translate<79.848000,0.000000,31.888600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<79.576900,0.000000,38.176200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<81.203800,0.000000,38.176200>}
box{<0,0,-0.076200><1.626900,0.036000,0.076200> rotate<0,0.000000,0> translate<79.576900,0.000000,38.176200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.390400,0.000000,38.176200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.119200,0.000000,38.447300>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,44.986466,0> translate<80.119200,0.000000,38.447300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.119200,0.000000,38.447300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.119200,0.000000,38.989600>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,90.000000,0> translate<80.119200,0.000000,38.989600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.119200,0.000000,38.989600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.390400,0.000000,39.260800>}
box{<0,0,-0.076200><0.383535,0.036000,0.076200> rotate<0,-44.997030,0> translate<80.119200,0.000000,38.989600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.390400,0.000000,39.260800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<81.203800,0.000000,39.260800>}
box{<0,0,-0.076200><0.813400,0.036000,0.076200> rotate<0,0.000000,0> translate<80.390400,0.000000,39.260800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<79.848000,0.000000,40.084400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.932700,0.000000,40.084400>}
box{<0,0,-0.076200><1.084700,0.036000,0.076200> rotate<0,0.000000,0> translate<79.848000,0.000000,40.084400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.932700,0.000000,40.084400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<81.203800,0.000000,40.355600>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,-45.007595,0> translate<80.932700,0.000000,40.084400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.119200,0.000000,39.813300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.119200,0.000000,40.355600>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,90.000000,0> translate<80.119200,0.000000,40.355600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<79.848000,0.000000,41.175800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.932700,0.000000,41.175800>}
box{<0,0,-0.076200><1.084700,0.036000,0.076200> rotate<0,0.000000,0> translate<79.848000,0.000000,41.175800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.932700,0.000000,41.175800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<81.203800,0.000000,41.447000>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,-45.007595,0> translate<80.932700,0.000000,41.175800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.119200,0.000000,40.904700>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.119200,0.000000,41.447000>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,90.000000,0> translate<80.119200,0.000000,41.447000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<81.746100,0.000000,41.996100>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.119200,0.000000,41.996100>}
box{<0,0,-0.076200><1.626900,0.036000,0.076200> rotate<0,0.000000,0> translate<80.119200,0.000000,41.996100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.119200,0.000000,41.996100>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.119200,0.000000,42.809500>}
box{<0,0,-0.076200><0.813400,0.036000,0.076200> rotate<0,90.000000,0> translate<80.119200,0.000000,42.809500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.119200,0.000000,42.809500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.390400,0.000000,43.080700>}
box{<0,0,-0.076200><0.383535,0.036000,0.076200> rotate<0,-44.997030,0> translate<80.119200,0.000000,42.809500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.390400,0.000000,43.080700>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.932700,0.000000,43.080700>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,0.000000,0> translate<80.390400,0.000000,43.080700> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.932700,0.000000,43.080700>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<81.203800,0.000000,42.809500>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,45.007595,0> translate<80.932700,0.000000,43.080700> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<81.203800,0.000000,42.809500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<81.203800,0.000000,41.996100>}
box{<0,0,-0.076200><0.813400,0.036000,0.076200> rotate<0,-90.000000,0> translate<81.203800,0.000000,41.996100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.119200,0.000000,43.633200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.119200,0.000000,43.904300>}
box{<0,0,-0.076200><0.271100,0.036000,0.076200> rotate<0,90.000000,0> translate<80.119200,0.000000,43.904300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.119200,0.000000,43.904300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.390400,0.000000,43.904300>}
box{<0,0,-0.076200><0.271200,0.036000,0.076200> rotate<0,0.000000,0> translate<80.119200,0.000000,43.904300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.390400,0.000000,43.904300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.390400,0.000000,43.633200>}
box{<0,0,-0.076200><0.271100,0.036000,0.076200> rotate<0,-90.000000,0> translate<80.390400,0.000000,43.633200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.390400,0.000000,43.633200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.119200,0.000000,43.633200>}
box{<0,0,-0.076200><0.271200,0.036000,0.076200> rotate<0,0.000000,0> translate<80.119200,0.000000,43.633200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.932700,0.000000,43.633200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.932700,0.000000,43.904300>}
box{<0,0,-0.076200><0.271100,0.036000,0.076200> rotate<0,90.000000,0> translate<80.932700,0.000000,43.904300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.932700,0.000000,43.904300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<81.203800,0.000000,43.904300>}
box{<0,0,-0.076200><0.271100,0.036000,0.076200> rotate<0,0.000000,0> translate<80.932700,0.000000,43.904300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<81.203800,0.000000,43.904300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<81.203800,0.000000,43.633200>}
box{<0,0,-0.076200><0.271100,0.036000,0.076200> rotate<0,-90.000000,0> translate<81.203800,0.000000,43.633200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<81.203800,0.000000,43.633200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.932700,0.000000,43.633200>}
box{<0,0,-0.076200><0.271100,0.036000,0.076200> rotate<0,0.000000,0> translate<80.932700,0.000000,43.633200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<81.203800,0.000000,44.451700>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<79.576900,0.000000,45.536300>}
box{<0,0,-0.076200><1.955290,0.036000,0.076200> rotate<0,33.687844,0> translate<79.576900,0.000000,45.536300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<81.203800,0.000000,46.088800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<79.576900,0.000000,47.173400>}
box{<0,0,-0.076200><1.955290,0.036000,0.076200> rotate<0,33.687844,0> translate<79.576900,0.000000,47.173400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.119200,0.000000,47.725900>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.932700,0.000000,47.725900>}
box{<0,0,-0.076200><0.813500,0.036000,0.076200> rotate<0,0.000000,0> translate<80.119200,0.000000,47.725900> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.932700,0.000000,47.725900>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<81.203800,0.000000,47.997000>}
box{<0,0,-0.076200><0.383393,0.036000,0.076200> rotate<0,-44.997030,0> translate<80.932700,0.000000,47.725900> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<81.203800,0.000000,47.997000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.932700,0.000000,48.268200>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,45.007595,0> translate<80.932700,0.000000,48.268200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.932700,0.000000,48.268200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<81.203800,0.000000,48.539300>}
box{<0,0,-0.076200><0.383393,0.036000,0.076200> rotate<0,-44.997030,0> translate<80.932700,0.000000,48.268200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<81.203800,0.000000,48.539300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.932700,0.000000,48.810500>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,45.007595,0> translate<80.932700,0.000000,48.810500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.932700,0.000000,48.810500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.119200,0.000000,48.810500>}
box{<0,0,-0.076200><0.813500,0.036000,0.076200> rotate<0,0.000000,0> translate<80.119200,0.000000,48.810500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<81.203800,0.000000,49.634100>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<81.203800,0.000000,50.176400>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,90.000000,0> translate<81.203800,0.000000,50.176400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<81.203800,0.000000,50.176400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.932700,0.000000,50.447600>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,45.007595,0> translate<80.932700,0.000000,50.447600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.932700,0.000000,50.447600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.390400,0.000000,50.447600>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,0.000000,0> translate<80.390400,0.000000,50.447600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.390400,0.000000,50.447600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.119200,0.000000,50.176400>}
box{<0,0,-0.076200><0.383535,0.036000,0.076200> rotate<0,-44.997030,0> translate<80.119200,0.000000,50.176400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.119200,0.000000,50.176400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.119200,0.000000,49.634100>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,-90.000000,0> translate<80.119200,0.000000,49.634100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.119200,0.000000,49.634100>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.390400,0.000000,49.363000>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,44.986466,0> translate<80.119200,0.000000,49.634100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.390400,0.000000,49.363000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.932700,0.000000,49.363000>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,0.000000,0> translate<80.390400,0.000000,49.363000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.932700,0.000000,49.363000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<81.203800,0.000000,49.634100>}
box{<0,0,-0.076200><0.383393,0.036000,0.076200> rotate<0,-44.997030,0> translate<80.932700,0.000000,49.363000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<81.203800,0.000000,51.000100>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.119200,0.000000,51.000100>}
box{<0,0,-0.076200><1.084600,0.036000,0.076200> rotate<0,0.000000,0> translate<80.119200,0.000000,51.000100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.661500,0.000000,51.000100>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.119200,0.000000,51.542400>}
box{<0,0,-0.076200><0.766928,0.036000,0.076200> rotate<0,44.997030,0> translate<80.119200,0.000000,51.542400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.119200,0.000000,51.542400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.119200,0.000000,51.813500>}
box{<0,0,-0.076200><0.271100,0.036000,0.076200> rotate<0,90.000000,0> translate<80.119200,0.000000,51.813500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<81.203800,0.000000,52.364300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<79.576900,0.000000,52.364300>}
box{<0,0,-0.076200><1.626900,0.036000,0.076200> rotate<0,0.000000,0> translate<79.576900,0.000000,52.364300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<81.203800,0.000000,53.177700>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.661500,0.000000,52.364300>}
box{<0,0,-0.076200><0.977604,0.036000,0.076200> rotate<0,-56.304591,0> translate<80.661500,0.000000,52.364300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.661500,0.000000,52.364300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.119200,0.000000,53.177700>}
box{<0,0,-0.076200><0.977604,0.036000,0.076200> rotate<0,56.304591,0> translate<80.119200,0.000000,53.177700> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<79.576900,0.000000,53.728500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<81.203800,0.000000,53.728500>}
box{<0,0,-0.076200><1.626900,0.036000,0.076200> rotate<0,0.000000,0> translate<79.576900,0.000000,53.728500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<81.203800,0.000000,53.728500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<81.203800,0.000000,54.541900>}
box{<0,0,-0.076200><0.813400,0.036000,0.076200> rotate<0,90.000000,0> translate<81.203800,0.000000,54.541900> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<81.203800,0.000000,54.541900>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.932700,0.000000,54.813100>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,45.007595,0> translate<80.932700,0.000000,54.813100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.932700,0.000000,54.813100>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.390400,0.000000,54.813100>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,0.000000,0> translate<80.390400,0.000000,54.813100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.390400,0.000000,54.813100>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.119200,0.000000,54.541900>}
box{<0,0,-0.076200><0.383535,0.036000,0.076200> rotate<0,-44.997030,0> translate<80.119200,0.000000,54.541900> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.119200,0.000000,54.541900>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.119200,0.000000,53.728500>}
box{<0,0,-0.076200><0.813400,0.036000,0.076200> rotate<0,-90.000000,0> translate<80.119200,0.000000,53.728500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<81.203800,0.000000,56.179000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<81.203800,0.000000,55.636700>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,-90.000000,0> translate<81.203800,0.000000,55.636700> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<81.203800,0.000000,55.636700>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.932700,0.000000,55.365600>}
box{<0,0,-0.076200><0.383393,0.036000,0.076200> rotate<0,-44.997030,0> translate<80.932700,0.000000,55.365600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.932700,0.000000,55.365600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.390400,0.000000,55.365600>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,0.000000,0> translate<80.390400,0.000000,55.365600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.390400,0.000000,55.365600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.119200,0.000000,55.636700>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,44.986466,0> translate<80.119200,0.000000,55.636700> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.119200,0.000000,55.636700>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.119200,0.000000,56.179000>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,90.000000,0> translate<80.119200,0.000000,56.179000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.119200,0.000000,56.179000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.390400,0.000000,56.450200>}
box{<0,0,-0.076200><0.383535,0.036000,0.076200> rotate<0,-44.997030,0> translate<80.119200,0.000000,56.179000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.390400,0.000000,56.450200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.661500,0.000000,56.450200>}
box{<0,0,-0.076200><0.271100,0.036000,0.076200> rotate<0,0.000000,0> translate<80.390400,0.000000,56.450200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.661500,0.000000,56.450200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.661500,0.000000,55.365600>}
box{<0,0,-0.076200><1.084600,0.036000,0.076200> rotate<0,-90.000000,0> translate<80.661500,0.000000,55.365600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<81.203800,0.000000,57.002700>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.119200,0.000000,57.002700>}
box{<0,0,-0.076200><1.084600,0.036000,0.076200> rotate<0,0.000000,0> translate<80.119200,0.000000,57.002700> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.119200,0.000000,57.002700>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.119200,0.000000,57.816100>}
box{<0,0,-0.076200><0.813400,0.036000,0.076200> rotate<0,90.000000,0> translate<80.119200,0.000000,57.816100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.119200,0.000000,57.816100>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.390400,0.000000,58.087300>}
box{<0,0,-0.076200><0.383535,0.036000,0.076200> rotate<0,-44.997030,0> translate<80.119200,0.000000,57.816100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.390400,0.000000,58.087300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<81.203800,0.000000,58.087300>}
box{<0,0,-0.076200><0.813400,0.036000,0.076200> rotate<0,0.000000,0> translate<80.390400,0.000000,58.087300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.119200,0.000000,59.724400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.119200,0.000000,58.910900>}
box{<0,0,-0.076200><0.813500,0.036000,0.076200> rotate<0,-90.000000,0> translate<80.119200,0.000000,58.910900> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.119200,0.000000,58.910900>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.390400,0.000000,58.639800>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,44.986466,0> translate<80.119200,0.000000,58.910900> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.390400,0.000000,58.639800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.932700,0.000000,58.639800>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,0.000000,0> translate<80.390400,0.000000,58.639800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.932700,0.000000,58.639800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<81.203800,0.000000,58.910900>}
box{<0,0,-0.076200><0.383393,0.036000,0.076200> rotate<0,-44.997030,0> translate<80.932700,0.000000,58.639800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<81.203800,0.000000,58.910900>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<81.203800,0.000000,59.724400>}
box{<0,0,-0.076200><0.813500,0.036000,0.076200> rotate<0,90.000000,0> translate<81.203800,0.000000,59.724400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<79.576900,0.000000,60.276900>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<81.203800,0.000000,60.276900>}
box{<0,0,-0.076200><1.626900,0.036000,0.076200> rotate<0,0.000000,0> translate<79.576900,0.000000,60.276900> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.390400,0.000000,60.276900>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.119200,0.000000,60.548000>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,44.986466,0> translate<80.119200,0.000000,60.548000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.119200,0.000000,60.548000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.119200,0.000000,61.090300>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,90.000000,0> translate<80.119200,0.000000,61.090300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.119200,0.000000,61.090300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.390400,0.000000,61.361500>}
box{<0,0,-0.076200><0.383535,0.036000,0.076200> rotate<0,-44.997030,0> translate<80.119200,0.000000,61.090300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.390400,0.000000,61.361500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<81.203800,0.000000,61.361500>}
box{<0,0,-0.076200><0.813400,0.036000,0.076200> rotate<0,0.000000,0> translate<80.390400,0.000000,61.361500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<81.203800,0.000000,61.914000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.932700,0.000000,61.914000>}
box{<0,0,-0.076200><0.271100,0.036000,0.076200> rotate<0,0.000000,0> translate<80.932700,0.000000,61.914000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.932700,0.000000,61.914000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.932700,0.000000,62.185100>}
box{<0,0,-0.076200><0.271100,0.036000,0.076200> rotate<0,90.000000,0> translate<80.932700,0.000000,62.185100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.932700,0.000000,62.185100>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<81.203800,0.000000,62.185100>}
box{<0,0,-0.076200><0.271100,0.036000,0.076200> rotate<0,0.000000,0> translate<80.932700,0.000000,62.185100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<81.203800,0.000000,62.185100>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<81.203800,0.000000,61.914000>}
box{<0,0,-0.076200><0.271100,0.036000,0.076200> rotate<0,-90.000000,0> translate<81.203800,0.000000,61.914000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<81.203800,0.000000,63.003600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<79.848000,0.000000,63.003600>}
box{<0,0,-0.076200><1.355800,0.036000,0.076200> rotate<0,0.000000,0> translate<79.848000,0.000000,63.003600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<79.848000,0.000000,63.003600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<79.576900,0.000000,63.274800>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,45.007595,0> translate<79.576900,0.000000,63.274800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.390400,0.000000,62.732500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.390400,0.000000,63.274800>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,90.000000,0> translate<80.390400,0.000000,63.274800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<81.203800,0.000000,63.823900>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.119200,0.000000,63.823900>}
box{<0,0,-0.076200><1.084600,0.036000,0.076200> rotate<0,0.000000,0> translate<80.119200,0.000000,63.823900> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.661500,0.000000,63.823900>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.119200,0.000000,64.366200>}
box{<0,0,-0.076200><0.766928,0.036000,0.076200> rotate<0,44.997030,0> translate<80.119200,0.000000,64.366200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.119200,0.000000,64.366200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.119200,0.000000,64.637300>}
box{<0,0,-0.076200><0.271100,0.036000,0.076200> rotate<0,90.000000,0> translate<80.119200,0.000000,64.637300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<81.203800,0.000000,66.001500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<81.203800,0.000000,65.459200>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,-90.000000,0> translate<81.203800,0.000000,65.459200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<81.203800,0.000000,65.459200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.932700,0.000000,65.188100>}
box{<0,0,-0.076200><0.383393,0.036000,0.076200> rotate<0,-44.997030,0> translate<80.932700,0.000000,65.188100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.932700,0.000000,65.188100>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.390400,0.000000,65.188100>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,0.000000,0> translate<80.390400,0.000000,65.188100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.390400,0.000000,65.188100>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.119200,0.000000,65.459200>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,44.986466,0> translate<80.119200,0.000000,65.459200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.119200,0.000000,65.459200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.119200,0.000000,66.001500>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,90.000000,0> translate<80.119200,0.000000,66.001500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.119200,0.000000,66.001500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.390400,0.000000,66.272700>}
box{<0,0,-0.076200><0.383535,0.036000,0.076200> rotate<0,-44.997030,0> translate<80.119200,0.000000,66.001500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.390400,0.000000,66.272700>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.661500,0.000000,66.272700>}
box{<0,0,-0.076200><0.271100,0.036000,0.076200> rotate<0,0.000000,0> translate<80.390400,0.000000,66.272700> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.661500,0.000000,66.272700>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.661500,0.000000,65.188100>}
box{<0,0,-0.076200><1.084600,0.036000,0.076200> rotate<0,-90.000000,0> translate<80.661500,0.000000,65.188100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<81.203800,0.000000,67.638600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<81.203800,0.000000,67.096300>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,-90.000000,0> translate<81.203800,0.000000,67.096300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<81.203800,0.000000,67.096300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.932700,0.000000,66.825200>}
box{<0,0,-0.076200><0.383393,0.036000,0.076200> rotate<0,-44.997030,0> translate<80.932700,0.000000,66.825200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.932700,0.000000,66.825200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.390400,0.000000,66.825200>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,0.000000,0> translate<80.390400,0.000000,66.825200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.390400,0.000000,66.825200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.119200,0.000000,67.096300>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,44.986466,0> translate<80.119200,0.000000,67.096300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.119200,0.000000,67.096300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.119200,0.000000,67.638600>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,90.000000,0> translate<80.119200,0.000000,67.638600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.119200,0.000000,67.638600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.390400,0.000000,67.909800>}
box{<0,0,-0.076200><0.383535,0.036000,0.076200> rotate<0,-44.997030,0> translate<80.119200,0.000000,67.638600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.390400,0.000000,67.909800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.661500,0.000000,67.909800>}
box{<0,0,-0.076200><0.271100,0.036000,0.076200> rotate<0,0.000000,0> translate<80.390400,0.000000,67.909800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.661500,0.000000,67.909800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.661500,0.000000,66.825200>}
box{<0,0,-0.076200><1.084600,0.036000,0.076200> rotate<0,-90.000000,0> translate<80.661500,0.000000,66.825200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<79.848000,0.000000,68.733400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.932700,0.000000,68.733400>}
box{<0,0,-0.076200><1.084700,0.036000,0.076200> rotate<0,0.000000,0> translate<79.848000,0.000000,68.733400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.932700,0.000000,68.733400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<81.203800,0.000000,69.004600>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,-45.007595,0> translate<80.932700,0.000000,68.733400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.119200,0.000000,68.462300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.119200,0.000000,69.004600>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,90.000000,0> translate<80.119200,0.000000,69.004600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.119200,0.000000,70.638300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.119200,0.000000,69.824800>}
box{<0,0,-0.076200><0.813500,0.036000,0.076200> rotate<0,-90.000000,0> translate<80.119200,0.000000,69.824800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.119200,0.000000,69.824800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.390400,0.000000,69.553700>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,44.986466,0> translate<80.119200,0.000000,69.824800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.390400,0.000000,69.553700>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.932700,0.000000,69.553700>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,0.000000,0> translate<80.390400,0.000000,69.553700> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.932700,0.000000,69.553700>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<81.203800,0.000000,69.824800>}
box{<0,0,-0.076200><0.383393,0.036000,0.076200> rotate<0,-44.997030,0> translate<80.932700,0.000000,69.553700> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<81.203800,0.000000,69.824800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<81.203800,0.000000,70.638300>}
box{<0,0,-0.076200><0.813500,0.036000,0.076200> rotate<0,90.000000,0> translate<81.203800,0.000000,70.638300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<81.746100,0.000000,71.190800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.119200,0.000000,71.190800>}
box{<0,0,-0.076200><1.626900,0.036000,0.076200> rotate<0,0.000000,0> translate<80.119200,0.000000,71.190800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.119200,0.000000,71.190800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.119200,0.000000,72.004200>}
box{<0,0,-0.076200><0.813400,0.036000,0.076200> rotate<0,90.000000,0> translate<80.119200,0.000000,72.004200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.119200,0.000000,72.004200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.390400,0.000000,72.275400>}
box{<0,0,-0.076200><0.383535,0.036000,0.076200> rotate<0,-44.997030,0> translate<80.119200,0.000000,72.004200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.390400,0.000000,72.275400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.932700,0.000000,72.275400>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,0.000000,0> translate<80.390400,0.000000,72.275400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.932700,0.000000,72.275400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<81.203800,0.000000,72.004200>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,45.007595,0> translate<80.932700,0.000000,72.275400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<81.203800,0.000000,72.004200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<81.203800,0.000000,71.190800>}
box{<0,0,-0.076200><0.813400,0.036000,0.076200> rotate<0,-90.000000,0> translate<81.203800,0.000000,71.190800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<81.203800,0.000000,72.827900>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.932700,0.000000,72.827900>}
box{<0,0,-0.076200><0.271100,0.036000,0.076200> rotate<0,0.000000,0> translate<80.932700,0.000000,72.827900> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.932700,0.000000,72.827900>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.932700,0.000000,73.099000>}
box{<0,0,-0.076200><0.271100,0.036000,0.076200> rotate<0,90.000000,0> translate<80.932700,0.000000,73.099000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.932700,0.000000,73.099000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<81.203800,0.000000,73.099000>}
box{<0,0,-0.076200><0.271100,0.036000,0.076200> rotate<0,0.000000,0> translate<80.932700,0.000000,73.099000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<81.203800,0.000000,73.099000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<81.203800,0.000000,72.827900>}
box{<0,0,-0.076200><0.271100,0.036000,0.076200> rotate<0,-90.000000,0> translate<81.203800,0.000000,72.827900> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.119200,0.000000,74.731000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.119200,0.000000,73.917500>}
box{<0,0,-0.076200><0.813500,0.036000,0.076200> rotate<0,-90.000000,0> translate<80.119200,0.000000,73.917500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.119200,0.000000,73.917500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.390400,0.000000,73.646400>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,44.986466,0> translate<80.119200,0.000000,73.917500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.390400,0.000000,73.646400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.932700,0.000000,73.646400>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,0.000000,0> translate<80.390400,0.000000,73.646400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.932700,0.000000,73.646400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<81.203800,0.000000,73.917500>}
box{<0,0,-0.076200><0.383393,0.036000,0.076200> rotate<0,-44.997030,0> translate<80.932700,0.000000,73.646400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<81.203800,0.000000,73.917500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<81.203800,0.000000,74.731000>}
box{<0,0,-0.076200><0.813500,0.036000,0.076200> rotate<0,90.000000,0> translate<81.203800,0.000000,74.731000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<81.203800,0.000000,75.554600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<81.203800,0.000000,76.096900>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,90.000000,0> translate<81.203800,0.000000,76.096900> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<81.203800,0.000000,76.096900>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.932700,0.000000,76.368100>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,45.007595,0> translate<80.932700,0.000000,76.368100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.932700,0.000000,76.368100>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.390400,0.000000,76.368100>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,0.000000,0> translate<80.390400,0.000000,76.368100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.390400,0.000000,76.368100>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.119200,0.000000,76.096900>}
box{<0,0,-0.076200><0.383535,0.036000,0.076200> rotate<0,-44.997030,0> translate<80.119200,0.000000,76.096900> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.119200,0.000000,76.096900>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.119200,0.000000,75.554600>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,-90.000000,0> translate<80.119200,0.000000,75.554600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.119200,0.000000,75.554600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.390400,0.000000,75.283500>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,44.986466,0> translate<80.119200,0.000000,75.554600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.390400,0.000000,75.283500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.932700,0.000000,75.283500>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,0.000000,0> translate<80.390400,0.000000,75.283500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.932700,0.000000,75.283500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<81.203800,0.000000,75.554600>}
box{<0,0,-0.076200><0.383393,0.036000,0.076200> rotate<0,-44.997030,0> translate<80.932700,0.000000,75.283500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<81.203800,0.000000,76.920600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.119200,0.000000,76.920600>}
box{<0,0,-0.076200><1.084600,0.036000,0.076200> rotate<0,0.000000,0> translate<80.119200,0.000000,76.920600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.119200,0.000000,76.920600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.119200,0.000000,77.191700>}
box{<0,0,-0.076200><0.271100,0.036000,0.076200> rotate<0,90.000000,0> translate<80.119200,0.000000,77.191700> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.119200,0.000000,77.191700>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.390400,0.000000,77.462900>}
box{<0,0,-0.076200><0.383535,0.036000,0.076200> rotate<0,-44.997030,0> translate<80.119200,0.000000,77.191700> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.390400,0.000000,77.462900>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<81.203800,0.000000,77.462900>}
box{<0,0,-0.076200><0.813400,0.036000,0.076200> rotate<0,0.000000,0> translate<80.390400,0.000000,77.462900> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.390400,0.000000,77.462900>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.119200,0.000000,77.734000>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,44.986466,0> translate<80.119200,0.000000,77.734000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.119200,0.000000,77.734000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.390400,0.000000,78.005200>}
box{<0,0,-0.076200><0.383535,0.036000,0.076200> rotate<0,-44.997030,0> translate<80.119200,0.000000,77.734000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.390400,0.000000,78.005200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<81.203800,0.000000,78.005200>}
box{<0,0,-0.076200><0.813400,0.036000,0.076200> rotate<0,0.000000,0> translate<80.390400,0.000000,78.005200> }
//C1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<46.990000,0.000000,16.510000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<46.990000,0.000000,17.780000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,90.000000,0> translate<46.990000,0.000000,17.780000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<49.530000,0.000000,15.875000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<44.450000,0.000000,15.875000>}
box{<0,0,-0.101600><5.080000,0.036000,0.101600> rotate<0,0.000000,0> translate<44.450000,0.000000,15.875000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<44.450000,0.000000,15.875000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<44.450000,0.000000,18.415000>}
box{<0,0,-0.101600><2.540000,0.036000,0.101600> rotate<0,90.000000,0> translate<44.450000,0.000000,18.415000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<44.450000,0.000000,18.415000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<49.530000,0.000000,18.415000>}
box{<0,0,-0.101600><5.080000,0.036000,0.101600> rotate<0,0.000000,0> translate<44.450000,0.000000,18.415000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<49.530000,0.000000,18.415000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<49.530000,0.000000,15.875000>}
box{<0,0,-0.101600><2.540000,0.036000,0.101600> rotate<0,-90.000000,0> translate<49.530000,0.000000,15.875000> }
//C2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<54.610000,0.000000,17.780000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<54.610000,0.000000,16.510000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,-90.000000,0> translate<54.610000,0.000000,16.510000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<52.070000,0.000000,18.415000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<57.150000,0.000000,18.415000>}
box{<0,0,-0.101600><5.080000,0.036000,0.101600> rotate<0,0.000000,0> translate<52.070000,0.000000,18.415000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<57.150000,0.000000,18.415000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<57.150000,0.000000,15.875000>}
box{<0,0,-0.101600><2.540000,0.036000,0.101600> rotate<0,-90.000000,0> translate<57.150000,0.000000,15.875000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<57.150000,0.000000,15.875000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<52.070000,0.000000,15.875000>}
box{<0,0,-0.101600><5.080000,0.036000,0.101600> rotate<0,0.000000,0> translate<52.070000,0.000000,15.875000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<52.070000,0.000000,15.875000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<52.070000,0.000000,18.415000>}
box{<0,0,-0.101600><2.540000,0.036000,0.101600> rotate<0,90.000000,0> translate<52.070000,0.000000,18.415000> }
//C3 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<45.085000,0.000000,39.370000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<46.355000,0.000000,39.370000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,0.000000,0> translate<45.085000,0.000000,39.370000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<44.450000,0.000000,36.830000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<44.450000,0.000000,41.910000>}
box{<0,0,-0.101600><5.080000,0.036000,0.101600> rotate<0,90.000000,0> translate<44.450000,0.000000,41.910000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<44.450000,0.000000,41.910000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<46.990000,0.000000,41.910000>}
box{<0,0,-0.101600><2.540000,0.036000,0.101600> rotate<0,0.000000,0> translate<44.450000,0.000000,41.910000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<46.990000,0.000000,41.910000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<46.990000,0.000000,36.830000>}
box{<0,0,-0.101600><5.080000,0.036000,0.101600> rotate<0,-90.000000,0> translate<46.990000,0.000000,36.830000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<46.990000,0.000000,36.830000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<44.450000,0.000000,36.830000>}
box{<0,0,-0.101600><2.540000,0.036000,0.101600> rotate<0,0.000000,0> translate<44.450000,0.000000,36.830000> }
//C4 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<72.390000,0.000000,51.435000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<72.390000,0.000000,50.165000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,-90.000000,0> translate<72.390000,0.000000,50.165000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<69.850000,0.000000,52.070000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<74.930000,0.000000,52.070000>}
box{<0,0,-0.101600><5.080000,0.036000,0.101600> rotate<0,0.000000,0> translate<69.850000,0.000000,52.070000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<74.930000,0.000000,52.070000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<74.930000,0.000000,49.530000>}
box{<0,0,-0.101600><2.540000,0.036000,0.101600> rotate<0,-90.000000,0> translate<74.930000,0.000000,49.530000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<74.930000,0.000000,49.530000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<69.850000,0.000000,49.530000>}
box{<0,0,-0.101600><5.080000,0.036000,0.101600> rotate<0,0.000000,0> translate<69.850000,0.000000,49.530000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<69.850000,0.000000,49.530000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<69.850000,0.000000,52.070000>}
box{<0,0,-0.101600><2.540000,0.036000,0.101600> rotate<0,90.000000,0> translate<69.850000,0.000000,52.070000> }
//C5 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<31.750000,0.000000,51.435000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<31.750000,0.000000,50.165000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,-90.000000,0> translate<31.750000,0.000000,50.165000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<29.210000,0.000000,52.070000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<34.290000,0.000000,52.070000>}
box{<0,0,-0.101600><5.080000,0.036000,0.101600> rotate<0,0.000000,0> translate<29.210000,0.000000,52.070000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<34.290000,0.000000,52.070000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<34.290000,0.000000,49.530000>}
box{<0,0,-0.101600><2.540000,0.036000,0.101600> rotate<0,-90.000000,0> translate<34.290000,0.000000,49.530000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<34.290000,0.000000,49.530000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<29.210000,0.000000,49.530000>}
box{<0,0,-0.101600><5.080000,0.036000,0.101600> rotate<0,0.000000,0> translate<29.210000,0.000000,49.530000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<29.210000,0.000000,49.530000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<29.210000,0.000000,52.070000>}
box{<0,0,-0.101600><2.540000,0.036000,0.101600> rotate<0,90.000000,0> translate<29.210000,0.000000,52.070000> }
//D2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<29.718000,0.000000,9.398000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<26.162000,0.000000,9.398000>}
box{<0,0,-0.101600><3.556000,0.036000,0.101600> rotate<0,0.000000,0> translate<26.162000,0.000000,9.398000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<26.162000,0.000000,10.160000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<26.162000,0.000000,10.922000>}
box{<0,0,-0.101600><0.762000,0.036000,0.101600> rotate<0,90.000000,0> translate<26.162000,0.000000,10.922000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<26.162000,0.000000,10.922000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<29.718000,0.000000,10.922000>}
box{<0,0,-0.101600><3.556000,0.036000,0.101600> rotate<0,0.000000,0> translate<26.162000,0.000000,10.922000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<29.718000,0.000000,10.922000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<29.718000,0.000000,10.160000>}
box{<0,0,-0.101600><0.762000,0.036000,0.101600> rotate<0,-90.000000,0> translate<29.718000,0.000000,10.160000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<29.718000,0.000000,10.160000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<29.718000,0.000000,9.398000>}
box{<0,0,-0.101600><0.762000,0.036000,0.101600> rotate<0,-90.000000,0> translate<29.718000,0.000000,9.398000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<26.162000,0.000000,10.160000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<25.400000,0.000000,10.160000>}
box{<0,0,-0.101600><0.762000,0.036000,0.101600> rotate<0,0.000000,0> translate<25.400000,0.000000,10.160000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<29.718000,0.000000,10.160000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<30.480000,0.000000,10.160000>}
box{<0,0,-0.101600><0.762000,0.036000,0.101600> rotate<0,0.000000,0> translate<29.718000,0.000000,10.160000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<26.162000,0.000000,9.398000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<26.162000,0.000000,10.160000>}
box{<0,0,-0.101600><0.762000,0.036000,0.101600> rotate<0,90.000000,0> translate<26.162000,0.000000,10.160000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<29.210000,0.000000,9.525000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<29.210000,0.000000,10.795000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,90.000000,0> translate<29.210000,0.000000,10.795000> }
//D3 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<51.562000,0.000000,12.192000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<55.118000,0.000000,12.192000>}
box{<0,0,-0.101600><3.556000,0.036000,0.101600> rotate<0,0.000000,0> translate<51.562000,0.000000,12.192000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<55.118000,0.000000,11.430000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<55.118000,0.000000,10.668000>}
box{<0,0,-0.101600><0.762000,0.036000,0.101600> rotate<0,-90.000000,0> translate<55.118000,0.000000,10.668000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<55.118000,0.000000,10.668000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<51.562000,0.000000,10.668000>}
box{<0,0,-0.101600><3.556000,0.036000,0.101600> rotate<0,0.000000,0> translate<51.562000,0.000000,10.668000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<51.562000,0.000000,10.668000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<51.562000,0.000000,11.430000>}
box{<0,0,-0.101600><0.762000,0.036000,0.101600> rotate<0,90.000000,0> translate<51.562000,0.000000,11.430000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<51.562000,0.000000,11.430000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<51.562000,0.000000,12.192000>}
box{<0,0,-0.101600><0.762000,0.036000,0.101600> rotate<0,90.000000,0> translate<51.562000,0.000000,12.192000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<55.118000,0.000000,11.430000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<55.880000,0.000000,11.430000>}
box{<0,0,-0.101600><0.762000,0.036000,0.101600> rotate<0,0.000000,0> translate<55.118000,0.000000,11.430000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<51.562000,0.000000,11.430000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<50.800000,0.000000,11.430000>}
box{<0,0,-0.101600><0.762000,0.036000,0.101600> rotate<0,0.000000,0> translate<50.800000,0.000000,11.430000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<55.118000,0.000000,12.192000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<55.118000,0.000000,11.430000>}
box{<0,0,-0.101600><0.762000,0.036000,0.101600> rotate<0,-90.000000,0> translate<55.118000,0.000000,11.430000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<52.070000,0.000000,12.065000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<52.070000,0.000000,10.795000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,-90.000000,0> translate<52.070000,0.000000,10.795000> }
//IC1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<24.130000,0.000000,29.210000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<24.130000,0.000000,27.432000>}
box{<0,0,-0.101600><1.778000,0.036000,0.101600> rotate<0,-90.000000,0> translate<24.130000,0.000000,27.432000> }
object{ARC(1.270000,0.203200,270.000000,450.000000,0.036000) translate<24.130000,0.000000,30.480000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<59.690000,0.000000,27.432000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<59.690000,0.000000,33.528000>}
box{<0,0,-0.101600><6.096000,0.036000,0.101600> rotate<0,90.000000,0> translate<59.690000,0.000000,33.528000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<24.130000,0.000000,33.528000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<24.130000,0.000000,31.750000>}
box{<0,0,-0.101600><1.778000,0.036000,0.101600> rotate<0,-90.000000,0> translate<24.130000,0.000000,31.750000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<24.130000,0.000000,33.528000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<24.384000,0.000000,33.528000>}
box{<0,0,-0.101600><0.254000,0.036000,0.101600> rotate<0,0.000000,0> translate<24.130000,0.000000,33.528000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<24.130000,0.000000,27.432000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<24.384000,0.000000,27.432000>}
box{<0,0,-0.101600><0.254000,0.036000,0.101600> rotate<0,0.000000,0> translate<24.130000,0.000000,27.432000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<59.690000,0.000000,27.432000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<59.436000,0.000000,27.432000>}
box{<0,0,-0.101600><0.254000,0.036000,0.101600> rotate<0,0.000000,0> translate<59.436000,0.000000,27.432000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<59.690000,0.000000,33.528000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<59.436000,0.000000,33.528000>}
box{<0,0,-0.101600><0.254000,0.036000,0.101600> rotate<0,0.000000,0> translate<59.436000,0.000000,33.528000> }
//IC2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<11.430000,0.000000,56.515000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<11.430000,0.000000,54.356000>}
box{<0,0,-0.063500><2.159000,0.036000,0.063500> rotate<0,-90.000000,0> translate<11.430000,0.000000,54.356000> }
object{ARC(0.635000,0.127000,270.000000,450.000000,0.036000) translate<11.430000,0.000000,57.150000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<11.430000,0.000000,54.356000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<31.750000,0.000000,54.356000>}
box{<0,0,-0.063500><20.320000,0.036000,0.063500> rotate<0,0.000000,0> translate<11.430000,0.000000,54.356000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<31.750000,0.000000,54.356000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<31.750000,0.000000,59.944000>}
box{<0,0,-0.063500><5.588000,0.036000,0.063500> rotate<0,90.000000,0> translate<31.750000,0.000000,59.944000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<31.750000,0.000000,59.944000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<11.430000,0.000000,59.944000>}
box{<0,0,-0.063500><20.320000,0.036000,0.063500> rotate<0,0.000000,0> translate<11.430000,0.000000,59.944000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<11.430000,0.000000,59.944000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<11.430000,0.000000,57.785000>}
box{<0,0,-0.063500><2.159000,0.036000,0.063500> rotate<0,-90.000000,0> translate<11.430000,0.000000,57.785000> }
//IC3 silk screen
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<52.070000,0.000000,56.515000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<52.070000,0.000000,54.356000>}
box{<0,0,-0.063500><2.159000,0.036000,0.063500> rotate<0,-90.000000,0> translate<52.070000,0.000000,54.356000> }
object{ARC(0.635000,0.127000,270.000000,450.000000,0.036000) translate<52.070000,0.000000,57.150000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<52.070000,0.000000,54.356000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<72.390000,0.000000,54.356000>}
box{<0,0,-0.063500><20.320000,0.036000,0.063500> rotate<0,0.000000,0> translate<52.070000,0.000000,54.356000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<72.390000,0.000000,54.356000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<72.390000,0.000000,59.944000>}
box{<0,0,-0.063500><5.588000,0.036000,0.063500> rotate<0,90.000000,0> translate<72.390000,0.000000,59.944000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<72.390000,0.000000,59.944000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<52.070000,0.000000,59.944000>}
box{<0,0,-0.063500><20.320000,0.036000,0.063500> rotate<0,0.000000,0> translate<52.070000,0.000000,59.944000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<52.070000,0.000000,59.944000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<52.070000,0.000000,57.785000>}
box{<0,0,-0.063500><2.159000,0.036000,0.063500> rotate<0,-90.000000,0> translate<52.070000,0.000000,57.785000> }
//JP1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<70.485000,0.000000,34.290000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<69.850000,0.000000,33.655000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<69.850000,0.000000,33.655000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<69.850000,0.000000,32.385000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<70.485000,0.000000,31.750000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<69.850000,0.000000,32.385000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<70.485000,0.000000,31.750000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<69.850000,0.000000,31.115000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<69.850000,0.000000,31.115000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<69.850000,0.000000,29.845000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<70.485000,0.000000,29.210000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<69.850000,0.000000,29.845000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<70.485000,0.000000,29.210000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<69.850000,0.000000,28.575000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<69.850000,0.000000,28.575000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<69.850000,0.000000,27.305000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<70.485000,0.000000,26.670000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<69.850000,0.000000,27.305000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<70.485000,0.000000,34.290000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<74.295000,0.000000,34.290000>}
box{<0,0,-0.101600><3.810000,0.036000,0.101600> rotate<0,0.000000,0> translate<70.485000,0.000000,34.290000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<74.295000,0.000000,34.290000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<74.930000,0.000000,33.655000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<74.295000,0.000000,34.290000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<74.930000,0.000000,33.655000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<74.930000,0.000000,32.385000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,-90.000000,0> translate<74.930000,0.000000,32.385000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<74.930000,0.000000,32.385000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<74.295000,0.000000,31.750000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<74.295000,0.000000,31.750000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<74.295000,0.000000,31.750000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<74.930000,0.000000,31.115000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<74.295000,0.000000,31.750000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<74.930000,0.000000,31.115000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<74.930000,0.000000,29.845000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,-90.000000,0> translate<74.930000,0.000000,29.845000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<74.930000,0.000000,29.845000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<74.295000,0.000000,29.210000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<74.295000,0.000000,29.210000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<74.295000,0.000000,29.210000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<74.930000,0.000000,28.575000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<74.295000,0.000000,29.210000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<74.930000,0.000000,28.575000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<74.930000,0.000000,27.305000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,-90.000000,0> translate<74.930000,0.000000,27.305000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<74.930000,0.000000,27.305000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<74.295000,0.000000,26.670000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<74.295000,0.000000,26.670000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<74.295000,0.000000,31.750000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<70.485000,0.000000,31.750000>}
box{<0,0,-0.101600><3.810000,0.036000,0.101600> rotate<0,0.000000,0> translate<70.485000,0.000000,31.750000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<74.295000,0.000000,29.210000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<70.485000,0.000000,29.210000>}
box{<0,0,-0.101600><3.810000,0.036000,0.101600> rotate<0,0.000000,0> translate<70.485000,0.000000,29.210000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<74.295000,0.000000,26.670000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<70.485000,0.000000,26.670000>}
box{<0,0,-0.101600><3.810000,0.036000,0.101600> rotate<0,0.000000,0> translate<70.485000,0.000000,26.670000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<69.850000,0.000000,28.575000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<69.850000,0.000000,27.305000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,-90.000000,0> translate<69.850000,0.000000,27.305000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<69.850000,0.000000,31.115000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<69.850000,0.000000,29.845000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,-90.000000,0> translate<69.850000,0.000000,29.845000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<69.850000,0.000000,33.655000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<69.850000,0.000000,32.385000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,-90.000000,0> translate<69.850000,0.000000,32.385000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<69.515000,0.000000,32.385000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<69.515000,0.000000,33.655000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,90.000000,0> translate<69.515000,0.000000,33.655000> }
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<71.120000,0.000000,33.020000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<73.660000,0.000000,33.020000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<73.660000,0.000000,30.480000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<71.120000,0.000000,30.480000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<73.660000,0.000000,27.940000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<71.120000,0.000000,27.940000>}
//JP2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<39.370000,0.000000,62.738000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<39.370000,0.000000,57.150000>}
box{<0,0,-0.063500><5.588000,0.036000,0.063500> rotate<0,-90.000000,0> translate<39.370000,0.000000,57.150000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<44.450000,0.000000,62.738000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<44.450000,0.000000,57.150000>}
box{<0,0,-0.063500><5.588000,0.036000,0.063500> rotate<0,-90.000000,0> translate<44.450000,0.000000,57.150000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<44.450000,0.000000,62.738000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<39.370000,0.000000,62.738000>}
box{<0,0,-0.063500><5.080000,0.036000,0.063500> rotate<0,0.000000,0> translate<39.370000,0.000000,62.738000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<44.450000,0.000000,57.150000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<43.180000,0.000000,57.150000>}
box{<0,0,-0.063500><1.270000,0.036000,0.063500> rotate<0,0.000000,0> translate<43.180000,0.000000,57.150000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<43.180000,0.000000,57.150000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<40.640000,0.000000,57.150000>}
box{<0,0,-0.063500><2.540000,0.036000,0.063500> rotate<0,0.000000,0> translate<40.640000,0.000000,57.150000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<40.640000,0.000000,57.150000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<39.370000,0.000000,57.150000>}
box{<0,0,-0.063500><1.270000,0.036000,0.063500> rotate<0,0.000000,0> translate<39.370000,0.000000,57.150000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<40.640000,0.000000,57.150000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<40.640000,0.000000,58.420000>}
box{<0,0,-0.063500><1.270000,0.036000,0.063500> rotate<0,90.000000,0> translate<40.640000,0.000000,58.420000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<40.640000,0.000000,58.420000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<43.180000,0.000000,58.420000>}
box{<0,0,-0.063500><2.540000,0.036000,0.063500> rotate<0,0.000000,0> translate<40.640000,0.000000,58.420000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<43.180000,0.000000,58.420000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<43.180000,0.000000,57.150000>}
box{<0,0,-0.063500><1.270000,0.036000,0.063500> rotate<0,-90.000000,0> translate<43.180000,0.000000,57.150000> }
//JP3 silk screen
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<29.210000,0.000000,37.592000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<29.210000,0.000000,43.180000>}
box{<0,0,-0.063500><5.588000,0.036000,0.063500> rotate<0,90.000000,0> translate<29.210000,0.000000,43.180000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<21.590000,0.000000,37.592000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<21.590000,0.000000,43.180000>}
box{<0,0,-0.063500><5.588000,0.036000,0.063500> rotate<0,90.000000,0> translate<21.590000,0.000000,43.180000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<21.590000,0.000000,37.592000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<29.210000,0.000000,37.592000>}
box{<0,0,-0.063500><7.620000,0.036000,0.063500> rotate<0,0.000000,0> translate<21.590000,0.000000,37.592000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<21.590000,0.000000,43.180000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<22.860000,0.000000,43.180000>}
box{<0,0,-0.063500><1.270000,0.036000,0.063500> rotate<0,0.000000,0> translate<21.590000,0.000000,43.180000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<22.860000,0.000000,43.180000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<27.940000,0.000000,43.180000>}
box{<0,0,-0.063500><5.080000,0.036000,0.063500> rotate<0,0.000000,0> translate<22.860000,0.000000,43.180000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<27.940000,0.000000,43.180000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<29.210000,0.000000,43.180000>}
box{<0,0,-0.063500><1.270000,0.036000,0.063500> rotate<0,0.000000,0> translate<27.940000,0.000000,43.180000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<27.940000,0.000000,43.180000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<27.940000,0.000000,41.910000>}
box{<0,0,-0.063500><1.270000,0.036000,0.063500> rotate<0,-90.000000,0> translate<27.940000,0.000000,41.910000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<27.940000,0.000000,41.910000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<22.860000,0.000000,41.910000>}
box{<0,0,-0.063500><5.080000,0.036000,0.063500> rotate<0,0.000000,0> translate<22.860000,0.000000,41.910000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<22.860000,0.000000,41.910000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<22.860000,0.000000,43.180000>}
box{<0,0,-0.063500><1.270000,0.036000,0.063500> rotate<0,90.000000,0> translate<22.860000,0.000000,43.180000> }
//JP4 silk screen
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<21.590000,0.000000,23.368000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<21.590000,0.000000,17.780000>}
box{<0,0,-0.063500><5.588000,0.036000,0.063500> rotate<0,-90.000000,0> translate<21.590000,0.000000,17.780000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<29.210000,0.000000,23.368000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<29.210000,0.000000,17.780000>}
box{<0,0,-0.063500><5.588000,0.036000,0.063500> rotate<0,-90.000000,0> translate<29.210000,0.000000,17.780000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<29.210000,0.000000,23.368000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<21.590000,0.000000,23.368000>}
box{<0,0,-0.063500><7.620000,0.036000,0.063500> rotate<0,0.000000,0> translate<21.590000,0.000000,23.368000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<29.210000,0.000000,17.780000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<27.940000,0.000000,17.780000>}
box{<0,0,-0.063500><1.270000,0.036000,0.063500> rotate<0,0.000000,0> translate<27.940000,0.000000,17.780000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<27.940000,0.000000,17.780000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<22.860000,0.000000,17.780000>}
box{<0,0,-0.063500><5.080000,0.036000,0.063500> rotate<0,0.000000,0> translate<22.860000,0.000000,17.780000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<22.860000,0.000000,17.780000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<21.590000,0.000000,17.780000>}
box{<0,0,-0.063500><1.270000,0.036000,0.063500> rotate<0,0.000000,0> translate<21.590000,0.000000,17.780000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<22.860000,0.000000,17.780000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<22.860000,0.000000,19.050000>}
box{<0,0,-0.063500><1.270000,0.036000,0.063500> rotate<0,90.000000,0> translate<22.860000,0.000000,19.050000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<22.860000,0.000000,19.050000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<27.940000,0.000000,19.050000>}
box{<0,0,-0.063500><5.080000,0.036000,0.063500> rotate<0,0.000000,0> translate<22.860000,0.000000,19.050000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<27.940000,0.000000,19.050000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<27.940000,0.000000,17.780000>}
box{<0,0,-0.063500><1.270000,0.036000,0.063500> rotate<0,-90.000000,0> translate<27.940000,0.000000,17.780000> }
//JP5 silk screen
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<35.560000,0.000000,22.098000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<35.560000,0.000000,16.510000>}
box{<0,0,-0.063500><5.588000,0.036000,0.063500> rotate<0,-90.000000,0> translate<35.560000,0.000000,16.510000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<40.640000,0.000000,22.098000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<40.640000,0.000000,16.510000>}
box{<0,0,-0.063500><5.588000,0.036000,0.063500> rotate<0,-90.000000,0> translate<40.640000,0.000000,16.510000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<40.640000,0.000000,22.098000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<35.560000,0.000000,22.098000>}
box{<0,0,-0.063500><5.080000,0.036000,0.063500> rotate<0,0.000000,0> translate<35.560000,0.000000,22.098000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<40.640000,0.000000,16.510000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<39.370000,0.000000,16.510000>}
box{<0,0,-0.063500><1.270000,0.036000,0.063500> rotate<0,0.000000,0> translate<39.370000,0.000000,16.510000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<39.370000,0.000000,16.510000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<36.830000,0.000000,16.510000>}
box{<0,0,-0.063500><2.540000,0.036000,0.063500> rotate<0,0.000000,0> translate<36.830000,0.000000,16.510000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<36.830000,0.000000,16.510000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<35.560000,0.000000,16.510000>}
box{<0,0,-0.063500><1.270000,0.036000,0.063500> rotate<0,0.000000,0> translate<35.560000,0.000000,16.510000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<36.830000,0.000000,16.510000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<36.830000,0.000000,17.780000>}
box{<0,0,-0.063500><1.270000,0.036000,0.063500> rotate<0,90.000000,0> translate<36.830000,0.000000,17.780000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<36.830000,0.000000,17.780000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<39.370000,0.000000,17.780000>}
box{<0,0,-0.063500><2.540000,0.036000,0.063500> rotate<0,0.000000,0> translate<36.830000,0.000000,17.780000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<39.370000,0.000000,17.780000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<39.370000,0.000000,16.510000>}
box{<0,0,-0.063500><1.270000,0.036000,0.063500> rotate<0,-90.000000,0> translate<39.370000,0.000000,16.510000> }
//JP6 silk screen
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<27.432000,0.000000,68.580000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<33.020000,0.000000,68.580000>}
box{<0,0,-0.063500><5.588000,0.036000,0.063500> rotate<0,0.000000,0> translate<27.432000,0.000000,68.580000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<27.432000,0.000000,78.740000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<33.020000,0.000000,78.740000>}
box{<0,0,-0.063500><5.588000,0.036000,0.063500> rotate<0,0.000000,0> translate<27.432000,0.000000,78.740000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<27.432000,0.000000,78.740000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<27.432000,0.000000,68.580000>}
box{<0,0,-0.063500><10.160000,0.036000,0.063500> rotate<0,-90.000000,0> translate<27.432000,0.000000,68.580000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<33.020000,0.000000,78.740000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<33.020000,0.000000,77.470000>}
box{<0,0,-0.063500><1.270000,0.036000,0.063500> rotate<0,-90.000000,0> translate<33.020000,0.000000,77.470000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<33.020000,0.000000,77.470000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<33.020000,0.000000,69.850000>}
box{<0,0,-0.063500><7.620000,0.036000,0.063500> rotate<0,-90.000000,0> translate<33.020000,0.000000,69.850000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<33.020000,0.000000,69.850000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<33.020000,0.000000,68.580000>}
box{<0,0,-0.063500><1.270000,0.036000,0.063500> rotate<0,-90.000000,0> translate<33.020000,0.000000,68.580000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<33.020000,0.000000,69.850000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<31.750000,0.000000,69.850000>}
box{<0,0,-0.063500><1.270000,0.036000,0.063500> rotate<0,0.000000,0> translate<31.750000,0.000000,69.850000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<31.750000,0.000000,69.850000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<31.750000,0.000000,77.470000>}
box{<0,0,-0.063500><7.620000,0.036000,0.063500> rotate<0,90.000000,0> translate<31.750000,0.000000,77.470000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<31.750000,0.000000,77.470000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<33.020000,0.000000,77.470000>}
box{<0,0,-0.063500><1.270000,0.036000,0.063500> rotate<0,0.000000,0> translate<31.750000,0.000000,77.470000> }
//JP7 silk screen
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<47.752000,0.000000,68.580000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<53.340000,0.000000,68.580000>}
box{<0,0,-0.063500><5.588000,0.036000,0.063500> rotate<0,0.000000,0> translate<47.752000,0.000000,68.580000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<47.752000,0.000000,78.740000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<53.340000,0.000000,78.740000>}
box{<0,0,-0.063500><5.588000,0.036000,0.063500> rotate<0,0.000000,0> translate<47.752000,0.000000,78.740000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<47.752000,0.000000,78.740000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<47.752000,0.000000,68.580000>}
box{<0,0,-0.063500><10.160000,0.036000,0.063500> rotate<0,-90.000000,0> translate<47.752000,0.000000,68.580000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<53.340000,0.000000,78.740000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<53.340000,0.000000,77.470000>}
box{<0,0,-0.063500><1.270000,0.036000,0.063500> rotate<0,-90.000000,0> translate<53.340000,0.000000,77.470000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<53.340000,0.000000,77.470000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<53.340000,0.000000,69.850000>}
box{<0,0,-0.063500><7.620000,0.036000,0.063500> rotate<0,-90.000000,0> translate<53.340000,0.000000,69.850000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<53.340000,0.000000,69.850000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<53.340000,0.000000,68.580000>}
box{<0,0,-0.063500><1.270000,0.036000,0.063500> rotate<0,-90.000000,0> translate<53.340000,0.000000,68.580000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<53.340000,0.000000,69.850000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<52.070000,0.000000,69.850000>}
box{<0,0,-0.063500><1.270000,0.036000,0.063500> rotate<0,0.000000,0> translate<52.070000,0.000000,69.850000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<52.070000,0.000000,69.850000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<52.070000,0.000000,77.470000>}
box{<0,0,-0.063500><7.620000,0.036000,0.063500> rotate<0,90.000000,0> translate<52.070000,0.000000,77.470000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<52.070000,0.000000,77.470000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<53.340000,0.000000,77.470000>}
box{<0,0,-0.063500><1.270000,0.036000,0.063500> rotate<0,0.000000,0> translate<52.070000,0.000000,77.470000> }
//JP8 silk screen
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<55.880000,0.000000,48.768000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<55.880000,0.000000,43.180000>}
box{<0,0,-0.063500><5.588000,0.036000,0.063500> rotate<0,-90.000000,0> translate<55.880000,0.000000,43.180000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<63.500000,0.000000,48.768000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<63.500000,0.000000,43.180000>}
box{<0,0,-0.063500><5.588000,0.036000,0.063500> rotate<0,-90.000000,0> translate<63.500000,0.000000,43.180000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<63.500000,0.000000,48.768000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<55.880000,0.000000,48.768000>}
box{<0,0,-0.063500><7.620000,0.036000,0.063500> rotate<0,0.000000,0> translate<55.880000,0.000000,48.768000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<63.500000,0.000000,43.180000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<62.230000,0.000000,43.180000>}
box{<0,0,-0.063500><1.270000,0.036000,0.063500> rotate<0,0.000000,0> translate<62.230000,0.000000,43.180000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<62.230000,0.000000,43.180000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<57.150000,0.000000,43.180000>}
box{<0,0,-0.063500><5.080000,0.036000,0.063500> rotate<0,0.000000,0> translate<57.150000,0.000000,43.180000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<57.150000,0.000000,43.180000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<55.880000,0.000000,43.180000>}
box{<0,0,-0.063500><1.270000,0.036000,0.063500> rotate<0,0.000000,0> translate<55.880000,0.000000,43.180000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<57.150000,0.000000,43.180000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<57.150000,0.000000,44.450000>}
box{<0,0,-0.063500><1.270000,0.036000,0.063500> rotate<0,90.000000,0> translate<57.150000,0.000000,44.450000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<57.150000,0.000000,44.450000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<62.230000,0.000000,44.450000>}
box{<0,0,-0.063500><5.080000,0.036000,0.063500> rotate<0,0.000000,0> translate<57.150000,0.000000,44.450000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<62.230000,0.000000,44.450000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<62.230000,0.000000,43.180000>}
box{<0,0,-0.063500><1.270000,0.036000,0.063500> rotate<0,-90.000000,0> translate<62.230000,0.000000,43.180000> }
//JP9 silk screen
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<67.310000,0.000000,48.768000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<67.310000,0.000000,43.180000>}
box{<0,0,-0.063500><5.588000,0.036000,0.063500> rotate<0,-90.000000,0> translate<67.310000,0.000000,43.180000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<74.930000,0.000000,48.768000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<74.930000,0.000000,43.180000>}
box{<0,0,-0.063500><5.588000,0.036000,0.063500> rotate<0,-90.000000,0> translate<74.930000,0.000000,43.180000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<74.930000,0.000000,48.768000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<67.310000,0.000000,48.768000>}
box{<0,0,-0.063500><7.620000,0.036000,0.063500> rotate<0,0.000000,0> translate<67.310000,0.000000,48.768000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<74.930000,0.000000,43.180000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<73.660000,0.000000,43.180000>}
box{<0,0,-0.063500><1.270000,0.036000,0.063500> rotate<0,0.000000,0> translate<73.660000,0.000000,43.180000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<73.660000,0.000000,43.180000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<68.580000,0.000000,43.180000>}
box{<0,0,-0.063500><5.080000,0.036000,0.063500> rotate<0,0.000000,0> translate<68.580000,0.000000,43.180000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<68.580000,0.000000,43.180000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<67.310000,0.000000,43.180000>}
box{<0,0,-0.063500><1.270000,0.036000,0.063500> rotate<0,0.000000,0> translate<67.310000,0.000000,43.180000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<68.580000,0.000000,43.180000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<68.580000,0.000000,44.450000>}
box{<0,0,-0.063500><1.270000,0.036000,0.063500> rotate<0,90.000000,0> translate<68.580000,0.000000,44.450000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<68.580000,0.000000,44.450000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<73.660000,0.000000,44.450000>}
box{<0,0,-0.063500><5.080000,0.036000,0.063500> rotate<0,0.000000,0> translate<68.580000,0.000000,44.450000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<73.660000,0.000000,44.450000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<73.660000,0.000000,43.180000>}
box{<0,0,-0.063500><1.270000,0.036000,0.063500> rotate<0,-90.000000,0> translate<73.660000,0.000000,43.180000> }
//LED1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<13.970000,0.000000,41.275000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<13.970000,0.000000,45.085000>}
box{<0,0,-0.101600><3.810000,0.036000,0.101600> rotate<0,90.000000,0> translate<13.970000,0.000000,45.085000> }
object{ARC(3.175000,0.254000,36.869898,323.130102,0.036000) translate<11.430000,0.000000,43.180000>}
difference{
cylinder{<11.430000,0,43.180000><11.430000,0.036000,43.180000>2.616200 translate<0,0.000000,0>}
cylinder{<11.430000,-0.1,43.180000><11.430000,0.135000,43.180000>2.463800 translate<0,0.000000,0>}}
//LED2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<8.890000,0.000000,70.485000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<8.890000,0.000000,66.675000>}
box{<0,0,-0.101600><3.810000,0.036000,0.101600> rotate<0,-90.000000,0> translate<8.890000,0.000000,66.675000> }
object{ARC(3.175000,0.254000,216.869898,503.130102,0.036000) translate<11.430000,0.000000,68.580000>}
difference{
cylinder{<11.430000,0,68.580000><11.430000,0.036000,68.580000>2.616200 translate<0,0.000000,0>}
cylinder{<11.430000,-0.1,68.580000><11.430000,0.135000,68.580000>2.463800 translate<0,0.000000,0>}}
//Q1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<47.371000,0.000000,19.304000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<54.229000,0.000000,19.304000>}
box{<0,0,-0.101600><6.858000,0.036000,0.101600> rotate<0,0.000000,0> translate<47.371000,0.000000,19.304000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<54.229000,0.000000,23.876000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<47.371000,0.000000,23.876000>}
box{<0,0,-0.101600><6.858000,0.036000,0.101600> rotate<0,0.000000,0> translate<47.371000,0.000000,23.876000> }
object{ARC(2.286000,0.203200,270.000000,450.000000,0.036000) translate<54.229000,0.000000,21.590000>}
object{ARC(2.286000,0.203200,90.000000,270.000000,0.036000) translate<47.371000,0.000000,21.590000>}
//R1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<31.750000,0.000000,15.240000>}
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<31.750000,0.000000,16.129000>}
box{<0,0,-0.254000><0.889000,0.036000,0.254000> rotate<0,90.000000,0> translate<31.750000,0.000000,16.129000> }
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<31.750000,0.000000,22.860000>}
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<31.750000,0.000000,21.971000>}
box{<0,0,-0.254000><0.889000,0.036000,0.254000> rotate<0,-90.000000,0> translate<31.750000,0.000000,21.971000> }
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<32.512000,0.000000,21.336000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<30.988000,0.000000,21.336000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<30.988000,0.000000,16.764000>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<32.512000,0.000000,16.764000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.988000,0.000000,21.590000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.512000,0.000000,21.590000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,0.000000,0> translate<30.988000,0.000000,21.590000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.766000,0.000000,21.336000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.766000,0.000000,20.955000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<32.766000,0.000000,20.955000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.639000,0.000000,20.828000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.766000,0.000000,20.955000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<32.639000,0.000000,20.828000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.734000,0.000000,21.336000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.734000,0.000000,20.955000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<30.734000,0.000000,20.955000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.861000,0.000000,20.828000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.734000,0.000000,20.955000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<30.734000,0.000000,20.955000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.639000,0.000000,17.272000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.766000,0.000000,17.145000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<32.639000,0.000000,17.272000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.639000,0.000000,17.272000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.639000,0.000000,20.828000>}
box{<0,0,-0.076200><3.556000,0.036000,0.076200> rotate<0,90.000000,0> translate<32.639000,0.000000,20.828000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.861000,0.000000,17.272000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.734000,0.000000,17.145000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<30.734000,0.000000,17.145000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.861000,0.000000,17.272000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.861000,0.000000,20.828000>}
box{<0,0,-0.076200><3.556000,0.036000,0.076200> rotate<0,90.000000,0> translate<30.861000,0.000000,20.828000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.766000,0.000000,16.764000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.766000,0.000000,17.145000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<32.766000,0.000000,17.145000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.734000,0.000000,16.764000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.734000,0.000000,17.145000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<30.734000,0.000000,17.145000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.988000,0.000000,16.510000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.512000,0.000000,16.510000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,0.000000,0> translate<30.988000,0.000000,16.510000> }
box{<-0.190500,0,-0.254000><0.190500,0.036000,0.254000> rotate<0,-270.000000,0> translate<31.750000,0.000000,16.319500>}
box{<-0.190500,0,-0.254000><0.190500,0.036000,0.254000> rotate<0,-270.000000,0> translate<31.750000,0.000000,21.780500>}
//R2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<63.500000,0.000000,34.290000>}
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<63.500000,0.000000,33.401000>}
box{<0,0,-0.254000><0.889000,0.036000,0.254000> rotate<0,-90.000000,0> translate<63.500000,0.000000,33.401000> }
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<63.500000,0.000000,26.670000>}
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<63.500000,0.000000,27.559000>}
box{<0,0,-0.254000><0.889000,0.036000,0.254000> rotate<0,90.000000,0> translate<63.500000,0.000000,27.559000> }
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<62.738000,0.000000,28.194000>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<64.262000,0.000000,28.194000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<64.262000,0.000000,32.766000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<62.738000,0.000000,32.766000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<64.262000,0.000000,27.940000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.738000,0.000000,27.940000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,0.000000,0> translate<62.738000,0.000000,27.940000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.484000,0.000000,28.194000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.484000,0.000000,28.575000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<62.484000,0.000000,28.575000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.611000,0.000000,28.702000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.484000,0.000000,28.575000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<62.484000,0.000000,28.575000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<64.516000,0.000000,28.194000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<64.516000,0.000000,28.575000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<64.516000,0.000000,28.575000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<64.389000,0.000000,28.702000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<64.516000,0.000000,28.575000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<64.389000,0.000000,28.702000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.611000,0.000000,32.258000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.484000,0.000000,32.385000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<62.484000,0.000000,32.385000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.611000,0.000000,32.258000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.611000,0.000000,28.702000>}
box{<0,0,-0.076200><3.556000,0.036000,0.076200> rotate<0,-90.000000,0> translate<62.611000,0.000000,28.702000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<64.389000,0.000000,32.258000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<64.516000,0.000000,32.385000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<64.389000,0.000000,32.258000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<64.389000,0.000000,32.258000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<64.389000,0.000000,28.702000>}
box{<0,0,-0.076200><3.556000,0.036000,0.076200> rotate<0,-90.000000,0> translate<64.389000,0.000000,28.702000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.484000,0.000000,32.766000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.484000,0.000000,32.385000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<62.484000,0.000000,32.385000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<64.516000,0.000000,32.766000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<64.516000,0.000000,32.385000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<64.516000,0.000000,32.385000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<64.262000,0.000000,33.020000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.738000,0.000000,33.020000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,0.000000,0> translate<62.738000,0.000000,33.020000> }
box{<-0.190500,0,-0.254000><0.190500,0.036000,0.254000> rotate<0,-90.000000,0> translate<63.500000,0.000000,33.210500>}
box{<-0.190500,0,-0.254000><0.190500,0.036000,0.254000> rotate<0,-90.000000,0> translate<63.500000,0.000000,27.749500>}
//R3 silk screen
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<63.500000,0.000000,38.100000>}
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<62.611000,0.000000,38.100000>}
box{<0,0,-0.254000><0.889000,0.036000,0.254000> rotate<0,0.000000,0> translate<62.611000,0.000000,38.100000> }
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<55.880000,0.000000,38.100000>}
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<56.769000,0.000000,38.100000>}
box{<0,0,-0.254000><0.889000,0.036000,0.254000> rotate<0,0.000000,0> translate<55.880000,0.000000,38.100000> }
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<57.404000,0.000000,38.862000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<57.404000,0.000000,37.338000>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<61.976000,0.000000,37.338000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<61.976000,0.000000,38.862000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.150000,0.000000,37.338000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.150000,0.000000,38.862000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,90.000000,0> translate<57.150000,0.000000,38.862000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.404000,0.000000,39.116000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.785000,0.000000,39.116000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<57.404000,0.000000,39.116000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.912000,0.000000,38.989000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.785000,0.000000,39.116000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<57.785000,0.000000,39.116000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.404000,0.000000,37.084000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.785000,0.000000,37.084000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<57.404000,0.000000,37.084000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.912000,0.000000,37.211000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.785000,0.000000,37.084000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<57.785000,0.000000,37.084000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<61.468000,0.000000,38.989000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<61.595000,0.000000,39.116000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<61.468000,0.000000,38.989000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<61.468000,0.000000,38.989000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.912000,0.000000,38.989000>}
box{<0,0,-0.076200><3.556000,0.036000,0.076200> rotate<0,0.000000,0> translate<57.912000,0.000000,38.989000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<61.468000,0.000000,37.211000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<61.595000,0.000000,37.084000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<61.468000,0.000000,37.211000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<61.468000,0.000000,37.211000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.912000,0.000000,37.211000>}
box{<0,0,-0.076200><3.556000,0.036000,0.076200> rotate<0,0.000000,0> translate<57.912000,0.000000,37.211000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<61.976000,0.000000,39.116000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<61.595000,0.000000,39.116000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<61.595000,0.000000,39.116000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<61.976000,0.000000,37.084000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<61.595000,0.000000,37.084000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<61.595000,0.000000,37.084000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.230000,0.000000,37.338000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.230000,0.000000,38.862000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,90.000000,0> translate<62.230000,0.000000,38.862000> }
box{<-0.190500,0,-0.254000><0.190500,0.036000,0.254000> rotate<0,-0.000000,0> translate<62.420500,0.000000,38.100000>}
box{<-0.190500,0,-0.254000><0.190500,0.036000,0.254000> rotate<0,-0.000000,0> translate<56.959500,0.000000,38.100000>}
//R4 silk screen
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<24.130000,0.000000,12.700000>}
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<25.019000,0.000000,12.700000>}
box{<0,0,-0.254000><0.889000,0.036000,0.254000> rotate<0,0.000000,0> translate<24.130000,0.000000,12.700000> }
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<31.750000,0.000000,12.700000>}
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<30.861000,0.000000,12.700000>}
box{<0,0,-0.254000><0.889000,0.036000,0.254000> rotate<0,0.000000,0> translate<30.861000,0.000000,12.700000> }
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<30.226000,0.000000,11.938000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<30.226000,0.000000,13.462000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<25.654000,0.000000,13.462000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<25.654000,0.000000,11.938000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.480000,0.000000,13.462000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.480000,0.000000,11.938000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,-90.000000,0> translate<30.480000,0.000000,11.938000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.226000,0.000000,11.684000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.845000,0.000000,11.684000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<29.845000,0.000000,11.684000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.718000,0.000000,11.811000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.845000,0.000000,11.684000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<29.718000,0.000000,11.811000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.226000,0.000000,13.716000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.845000,0.000000,13.716000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<29.845000,0.000000,13.716000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.718000,0.000000,13.589000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.845000,0.000000,13.716000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<29.718000,0.000000,13.589000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.162000,0.000000,11.811000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.035000,0.000000,11.684000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<26.035000,0.000000,11.684000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.162000,0.000000,11.811000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.718000,0.000000,11.811000>}
box{<0,0,-0.076200><3.556000,0.036000,0.076200> rotate<0,0.000000,0> translate<26.162000,0.000000,11.811000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.162000,0.000000,13.589000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.035000,0.000000,13.716000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<26.035000,0.000000,13.716000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.162000,0.000000,13.589000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.718000,0.000000,13.589000>}
box{<0,0,-0.076200><3.556000,0.036000,0.076200> rotate<0,0.000000,0> translate<26.162000,0.000000,13.589000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.654000,0.000000,11.684000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.035000,0.000000,11.684000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<25.654000,0.000000,11.684000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.654000,0.000000,13.716000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.035000,0.000000,13.716000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<25.654000,0.000000,13.716000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.400000,0.000000,13.462000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.400000,0.000000,11.938000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,-90.000000,0> translate<25.400000,0.000000,11.938000> }
box{<-0.190500,0,-0.254000><0.190500,0.036000,0.254000> rotate<0,-180.000000,0> translate<25.209500,0.000000,12.700000>}
box{<-0.190500,0,-0.254000><0.190500,0.036000,0.254000> rotate<0,-180.000000,0> translate<30.670500,0.000000,12.700000>}
//R5 silk screen
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<12.700000,0.000000,48.260000>}
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<11.811000,0.000000,48.260000>}
box{<0,0,-0.254000><0.889000,0.036000,0.254000> rotate<0,0.000000,0> translate<11.811000,0.000000,48.260000> }
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<5.080000,0.000000,48.260000>}
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<5.969000,0.000000,48.260000>}
box{<0,0,-0.254000><0.889000,0.036000,0.254000> rotate<0,0.000000,0> translate<5.080000,0.000000,48.260000> }
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<6.604000,0.000000,49.022000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<6.604000,0.000000,47.498000>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<11.176000,0.000000,47.498000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<11.176000,0.000000,49.022000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.350000,0.000000,47.498000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.350000,0.000000,49.022000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,90.000000,0> translate<6.350000,0.000000,49.022000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.604000,0.000000,49.276000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.985000,0.000000,49.276000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<6.604000,0.000000,49.276000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.112000,0.000000,49.149000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.985000,0.000000,49.276000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<6.985000,0.000000,49.276000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.604000,0.000000,47.244000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.985000,0.000000,47.244000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<6.604000,0.000000,47.244000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.112000,0.000000,47.371000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.985000,0.000000,47.244000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<6.985000,0.000000,47.244000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.668000,0.000000,49.149000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.795000,0.000000,49.276000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<10.668000,0.000000,49.149000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.668000,0.000000,49.149000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.112000,0.000000,49.149000>}
box{<0,0,-0.076200><3.556000,0.036000,0.076200> rotate<0,0.000000,0> translate<7.112000,0.000000,49.149000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.668000,0.000000,47.371000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.795000,0.000000,47.244000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<10.668000,0.000000,47.371000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.668000,0.000000,47.371000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.112000,0.000000,47.371000>}
box{<0,0,-0.076200><3.556000,0.036000,0.076200> rotate<0,0.000000,0> translate<7.112000,0.000000,47.371000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.176000,0.000000,49.276000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.795000,0.000000,49.276000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<10.795000,0.000000,49.276000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.176000,0.000000,47.244000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.795000,0.000000,47.244000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<10.795000,0.000000,47.244000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.430000,0.000000,47.498000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.430000,0.000000,49.022000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,90.000000,0> translate<11.430000,0.000000,49.022000> }
box{<-0.190500,0,-0.254000><0.190500,0.036000,0.254000> rotate<0,-0.000000,0> translate<11.620500,0.000000,48.260000>}
box{<-0.190500,0,-0.254000><0.190500,0.036000,0.254000> rotate<0,-0.000000,0> translate<6.159500,0.000000,48.260000>}
//R6 silk screen
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<10.160000,0.000000,73.660000>}
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<11.049000,0.000000,73.660000>}
box{<0,0,-0.254000><0.889000,0.036000,0.254000> rotate<0,0.000000,0> translate<10.160000,0.000000,73.660000> }
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<17.780000,0.000000,73.660000>}
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<16.891000,0.000000,73.660000>}
box{<0,0,-0.254000><0.889000,0.036000,0.254000> rotate<0,0.000000,0> translate<16.891000,0.000000,73.660000> }
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<16.256000,0.000000,72.898000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<16.256000,0.000000,74.422000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<11.684000,0.000000,74.422000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<11.684000,0.000000,72.898000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.510000,0.000000,74.422000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.510000,0.000000,72.898000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,-90.000000,0> translate<16.510000,0.000000,72.898000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.256000,0.000000,72.644000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.875000,0.000000,72.644000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<15.875000,0.000000,72.644000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.748000,0.000000,72.771000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.875000,0.000000,72.644000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<15.748000,0.000000,72.771000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.256000,0.000000,74.676000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.875000,0.000000,74.676000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<15.875000,0.000000,74.676000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.748000,0.000000,74.549000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.875000,0.000000,74.676000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<15.748000,0.000000,74.549000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.192000,0.000000,72.771000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.065000,0.000000,72.644000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<12.065000,0.000000,72.644000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.192000,0.000000,72.771000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.748000,0.000000,72.771000>}
box{<0,0,-0.076200><3.556000,0.036000,0.076200> rotate<0,0.000000,0> translate<12.192000,0.000000,72.771000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.192000,0.000000,74.549000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.065000,0.000000,74.676000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<12.065000,0.000000,74.676000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.192000,0.000000,74.549000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.748000,0.000000,74.549000>}
box{<0,0,-0.076200><3.556000,0.036000,0.076200> rotate<0,0.000000,0> translate<12.192000,0.000000,74.549000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.684000,0.000000,72.644000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.065000,0.000000,72.644000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<11.684000,0.000000,72.644000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.684000,0.000000,74.676000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.065000,0.000000,74.676000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<11.684000,0.000000,74.676000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.430000,0.000000,74.422000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.430000,0.000000,72.898000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,-90.000000,0> translate<11.430000,0.000000,72.898000> }
box{<-0.190500,0,-0.254000><0.190500,0.036000,0.254000> rotate<0,-180.000000,0> translate<11.239500,0.000000,73.660000>}
box{<-0.190500,0,-0.254000><0.190500,0.036000,0.254000> rotate<0,-180.000000,0> translate<16.700500,0.000000,73.660000>}
//R7 silk screen
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<43.180000,0.000000,36.830000>}
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<43.180000,0.000000,37.719000>}
box{<0,0,-0.254000><0.889000,0.036000,0.254000> rotate<0,90.000000,0> translate<43.180000,0.000000,37.719000> }
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<43.180000,0.000000,44.450000>}
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<43.180000,0.000000,43.561000>}
box{<0,0,-0.254000><0.889000,0.036000,0.254000> rotate<0,-90.000000,0> translate<43.180000,0.000000,43.561000> }
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<43.942000,0.000000,42.926000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<42.418000,0.000000,42.926000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<42.418000,0.000000,38.354000>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<43.942000,0.000000,38.354000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.418000,0.000000,43.180000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.942000,0.000000,43.180000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,0.000000,0> translate<42.418000,0.000000,43.180000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.196000,0.000000,42.926000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.196000,0.000000,42.545000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<44.196000,0.000000,42.545000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.069000,0.000000,42.418000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.196000,0.000000,42.545000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<44.069000,0.000000,42.418000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.164000,0.000000,42.926000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.164000,0.000000,42.545000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<42.164000,0.000000,42.545000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.291000,0.000000,42.418000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.164000,0.000000,42.545000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<42.164000,0.000000,42.545000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.069000,0.000000,38.862000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.196000,0.000000,38.735000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<44.069000,0.000000,38.862000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.069000,0.000000,38.862000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.069000,0.000000,42.418000>}
box{<0,0,-0.076200><3.556000,0.036000,0.076200> rotate<0,90.000000,0> translate<44.069000,0.000000,42.418000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.291000,0.000000,38.862000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.164000,0.000000,38.735000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<42.164000,0.000000,38.735000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.291000,0.000000,38.862000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.291000,0.000000,42.418000>}
box{<0,0,-0.076200><3.556000,0.036000,0.076200> rotate<0,90.000000,0> translate<42.291000,0.000000,42.418000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.196000,0.000000,38.354000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.196000,0.000000,38.735000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<44.196000,0.000000,38.735000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.164000,0.000000,38.354000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.164000,0.000000,38.735000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<42.164000,0.000000,38.735000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.418000,0.000000,38.100000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.942000,0.000000,38.100000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,0.000000,0> translate<42.418000,0.000000,38.100000> }
box{<-0.190500,0,-0.254000><0.190500,0.036000,0.254000> rotate<0,-270.000000,0> translate<43.180000,0.000000,37.909500>}
box{<-0.190500,0,-0.254000><0.190500,0.036000,0.254000> rotate<0,-270.000000,0> translate<43.180000,0.000000,43.370500>}
//R8 silk screen
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<21.590000,0.000000,34.290000>}
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<21.590000,0.000000,33.401000>}
box{<0,0,-0.254000><0.889000,0.036000,0.254000> rotate<0,-90.000000,0> translate<21.590000,0.000000,33.401000> }
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<21.590000,0.000000,26.670000>}
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<21.590000,0.000000,27.559000>}
box{<0,0,-0.254000><0.889000,0.036000,0.254000> rotate<0,90.000000,0> translate<21.590000,0.000000,27.559000> }
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<20.828000,0.000000,28.194000>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<22.352000,0.000000,28.194000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<22.352000,0.000000,32.766000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<20.828000,0.000000,32.766000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.352000,0.000000,27.940000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.828000,0.000000,27.940000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,0.000000,0> translate<20.828000,0.000000,27.940000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.574000,0.000000,28.194000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.574000,0.000000,28.575000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<20.574000,0.000000,28.575000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.701000,0.000000,28.702000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.574000,0.000000,28.575000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<20.574000,0.000000,28.575000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.606000,0.000000,28.194000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.606000,0.000000,28.575000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<22.606000,0.000000,28.575000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.479000,0.000000,28.702000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.606000,0.000000,28.575000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<22.479000,0.000000,28.702000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.701000,0.000000,32.258000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.574000,0.000000,32.385000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<20.574000,0.000000,32.385000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.701000,0.000000,32.258000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.701000,0.000000,28.702000>}
box{<0,0,-0.076200><3.556000,0.036000,0.076200> rotate<0,-90.000000,0> translate<20.701000,0.000000,28.702000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.479000,0.000000,32.258000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.606000,0.000000,32.385000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<22.479000,0.000000,32.258000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.479000,0.000000,32.258000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.479000,0.000000,28.702000>}
box{<0,0,-0.076200><3.556000,0.036000,0.076200> rotate<0,-90.000000,0> translate<22.479000,0.000000,28.702000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.574000,0.000000,32.766000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.574000,0.000000,32.385000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<20.574000,0.000000,32.385000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.606000,0.000000,32.766000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.606000,0.000000,32.385000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<22.606000,0.000000,32.385000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.352000,0.000000,33.020000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.828000,0.000000,33.020000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,0.000000,0> translate<20.828000,0.000000,33.020000> }
box{<-0.190500,0,-0.254000><0.190500,0.036000,0.254000> rotate<0,-90.000000,0> translate<21.590000,0.000000,33.210500>}
box{<-0.190500,0,-0.254000><0.190500,0.036000,0.254000> rotate<0,-90.000000,0> translate<21.590000,0.000000,27.749500>}
//R9 silk screen
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<43.180000,0.000000,23.495000>}
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<42.291000,0.000000,23.495000>}
box{<0,0,-0.254000><0.889000,0.036000,0.254000> rotate<0,0.000000,0> translate<42.291000,0.000000,23.495000> }
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<35.560000,0.000000,23.495000>}
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<36.449000,0.000000,23.495000>}
box{<0,0,-0.254000><0.889000,0.036000,0.254000> rotate<0,0.000000,0> translate<35.560000,0.000000,23.495000> }
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<37.084000,0.000000,24.257000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<37.084000,0.000000,22.733000>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<41.656000,0.000000,22.733000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<41.656000,0.000000,24.257000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.830000,0.000000,22.733000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.830000,0.000000,24.257000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,90.000000,0> translate<36.830000,0.000000,24.257000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.084000,0.000000,24.511000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.465000,0.000000,24.511000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<37.084000,0.000000,24.511000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.592000,0.000000,24.384000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.465000,0.000000,24.511000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<37.465000,0.000000,24.511000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.084000,0.000000,22.479000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.465000,0.000000,22.479000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<37.084000,0.000000,22.479000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.592000,0.000000,22.606000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.465000,0.000000,22.479000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<37.465000,0.000000,22.479000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.148000,0.000000,24.384000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.275000,0.000000,24.511000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<41.148000,0.000000,24.384000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.148000,0.000000,24.384000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.592000,0.000000,24.384000>}
box{<0,0,-0.076200><3.556000,0.036000,0.076200> rotate<0,0.000000,0> translate<37.592000,0.000000,24.384000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.148000,0.000000,22.606000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.275000,0.000000,22.479000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<41.148000,0.000000,22.606000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.148000,0.000000,22.606000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.592000,0.000000,22.606000>}
box{<0,0,-0.076200><3.556000,0.036000,0.076200> rotate<0,0.000000,0> translate<37.592000,0.000000,22.606000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.656000,0.000000,24.511000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.275000,0.000000,24.511000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<41.275000,0.000000,24.511000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.656000,0.000000,22.479000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.275000,0.000000,22.479000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<41.275000,0.000000,22.479000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.910000,0.000000,22.733000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.910000,0.000000,24.257000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,90.000000,0> translate<41.910000,0.000000,24.257000> }
box{<-0.190500,0,-0.254000><0.190500,0.036000,0.254000> rotate<0,-0.000000,0> translate<42.100500,0.000000,23.495000>}
box{<-0.190500,0,-0.254000><0.190500,0.036000,0.254000> rotate<0,-0.000000,0> translate<36.639500,0.000000,23.495000>}
//R10 silk screen
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<8.890000,0.000000,60.960000>}
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<8.890000,0.000000,60.071000>}
box{<0,0,-0.254000><0.889000,0.036000,0.254000> rotate<0,-90.000000,0> translate<8.890000,0.000000,60.071000> }
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<8.890000,0.000000,53.340000>}
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<8.890000,0.000000,54.229000>}
box{<0,0,-0.254000><0.889000,0.036000,0.254000> rotate<0,90.000000,0> translate<8.890000,0.000000,54.229000> }
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<8.128000,0.000000,54.864000>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<9.652000,0.000000,54.864000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<9.652000,0.000000,59.436000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<8.128000,0.000000,59.436000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.652000,0.000000,54.610000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.128000,0.000000,54.610000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,0.000000,0> translate<8.128000,0.000000,54.610000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.874000,0.000000,54.864000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.874000,0.000000,55.245000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<7.874000,0.000000,55.245000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.001000,0.000000,55.372000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.874000,0.000000,55.245000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<7.874000,0.000000,55.245000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.906000,0.000000,54.864000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.906000,0.000000,55.245000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<9.906000,0.000000,55.245000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.779000,0.000000,55.372000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.906000,0.000000,55.245000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<9.779000,0.000000,55.372000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.001000,0.000000,58.928000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.874000,0.000000,59.055000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<7.874000,0.000000,59.055000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.001000,0.000000,58.928000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.001000,0.000000,55.372000>}
box{<0,0,-0.076200><3.556000,0.036000,0.076200> rotate<0,-90.000000,0> translate<8.001000,0.000000,55.372000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.779000,0.000000,58.928000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.906000,0.000000,59.055000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<9.779000,0.000000,58.928000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.779000,0.000000,58.928000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.779000,0.000000,55.372000>}
box{<0,0,-0.076200><3.556000,0.036000,0.076200> rotate<0,-90.000000,0> translate<9.779000,0.000000,55.372000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.874000,0.000000,59.436000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.874000,0.000000,59.055000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<7.874000,0.000000,59.055000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.906000,0.000000,59.436000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.906000,0.000000,59.055000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<9.906000,0.000000,59.055000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.652000,0.000000,59.690000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.128000,0.000000,59.690000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,0.000000,0> translate<8.128000,0.000000,59.690000> }
box{<-0.190500,0,-0.254000><0.190500,0.036000,0.254000> rotate<0,-90.000000,0> translate<8.890000,0.000000,59.880500>}
box{<-0.190500,0,-0.254000><0.190500,0.036000,0.254000> rotate<0,-90.000000,0> translate<8.890000,0.000000,54.419500>}
//R11 silk screen
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<34.290000,0.000000,60.960000>}
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<34.290000,0.000000,60.071000>}
box{<0,0,-0.254000><0.889000,0.036000,0.254000> rotate<0,-90.000000,0> translate<34.290000,0.000000,60.071000> }
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<34.290000,0.000000,53.340000>}
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<34.290000,0.000000,54.229000>}
box{<0,0,-0.254000><0.889000,0.036000,0.254000> rotate<0,90.000000,0> translate<34.290000,0.000000,54.229000> }
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<33.528000,0.000000,54.864000>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<35.052000,0.000000,54.864000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<35.052000,0.000000,59.436000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<33.528000,0.000000,59.436000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.052000,0.000000,54.610000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.528000,0.000000,54.610000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,0.000000,0> translate<33.528000,0.000000,54.610000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.274000,0.000000,54.864000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.274000,0.000000,55.245000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<33.274000,0.000000,55.245000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.401000,0.000000,55.372000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.274000,0.000000,55.245000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<33.274000,0.000000,55.245000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.306000,0.000000,54.864000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.306000,0.000000,55.245000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<35.306000,0.000000,55.245000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.179000,0.000000,55.372000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.306000,0.000000,55.245000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<35.179000,0.000000,55.372000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.401000,0.000000,58.928000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.274000,0.000000,59.055000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<33.274000,0.000000,59.055000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.401000,0.000000,58.928000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.401000,0.000000,55.372000>}
box{<0,0,-0.076200><3.556000,0.036000,0.076200> rotate<0,-90.000000,0> translate<33.401000,0.000000,55.372000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.179000,0.000000,58.928000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.306000,0.000000,59.055000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<35.179000,0.000000,58.928000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.179000,0.000000,58.928000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.179000,0.000000,55.372000>}
box{<0,0,-0.076200><3.556000,0.036000,0.076200> rotate<0,-90.000000,0> translate<35.179000,0.000000,55.372000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.274000,0.000000,59.436000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.274000,0.000000,59.055000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<33.274000,0.000000,59.055000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.306000,0.000000,59.436000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.306000,0.000000,59.055000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<35.306000,0.000000,59.055000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.052000,0.000000,59.690000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.528000,0.000000,59.690000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,0.000000,0> translate<33.528000,0.000000,59.690000> }
box{<-0.190500,0,-0.254000><0.190500,0.036000,0.254000> rotate<0,-90.000000,0> translate<34.290000,0.000000,59.880500>}
box{<-0.190500,0,-0.254000><0.190500,0.036000,0.254000> rotate<0,-90.000000,0> translate<34.290000,0.000000,54.419500>}
//R12 silk screen
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<64.770000,0.000000,40.640000>}
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<63.881000,0.000000,40.640000>}
box{<0,0,-0.254000><0.889000,0.036000,0.254000> rotate<0,0.000000,0> translate<63.881000,0.000000,40.640000> }
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<57.150000,0.000000,40.640000>}
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<58.039000,0.000000,40.640000>}
box{<0,0,-0.254000><0.889000,0.036000,0.254000> rotate<0,0.000000,0> translate<57.150000,0.000000,40.640000> }
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<58.674000,0.000000,41.402000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<58.674000,0.000000,39.878000>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<63.246000,0.000000,39.878000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<63.246000,0.000000,41.402000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<58.420000,0.000000,39.878000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<58.420000,0.000000,41.402000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,90.000000,0> translate<58.420000,0.000000,41.402000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<58.674000,0.000000,41.656000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.055000,0.000000,41.656000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<58.674000,0.000000,41.656000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.182000,0.000000,41.529000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.055000,0.000000,41.656000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<59.055000,0.000000,41.656000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<58.674000,0.000000,39.624000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.055000,0.000000,39.624000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<58.674000,0.000000,39.624000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.182000,0.000000,39.751000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.055000,0.000000,39.624000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<59.055000,0.000000,39.624000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.738000,0.000000,41.529000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.865000,0.000000,41.656000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<62.738000,0.000000,41.529000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.738000,0.000000,41.529000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.182000,0.000000,41.529000>}
box{<0,0,-0.076200><3.556000,0.036000,0.076200> rotate<0,0.000000,0> translate<59.182000,0.000000,41.529000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.738000,0.000000,39.751000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.865000,0.000000,39.624000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<62.738000,0.000000,39.751000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.738000,0.000000,39.751000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.182000,0.000000,39.751000>}
box{<0,0,-0.076200><3.556000,0.036000,0.076200> rotate<0,0.000000,0> translate<59.182000,0.000000,39.751000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<63.246000,0.000000,41.656000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.865000,0.000000,41.656000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<62.865000,0.000000,41.656000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<63.246000,0.000000,39.624000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.865000,0.000000,39.624000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<62.865000,0.000000,39.624000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<63.500000,0.000000,39.878000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<63.500000,0.000000,41.402000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,90.000000,0> translate<63.500000,0.000000,41.402000> }
box{<-0.190500,0,-0.254000><0.190500,0.036000,0.254000> rotate<0,-0.000000,0> translate<63.690500,0.000000,40.640000>}
box{<-0.190500,0,-0.254000><0.190500,0.036000,0.254000> rotate<0,-0.000000,0> translate<58.229500,0.000000,40.640000>}
//R13 silk screen
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<49.530000,0.000000,60.960000>}
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<49.530000,0.000000,60.071000>}
box{<0,0,-0.254000><0.889000,0.036000,0.254000> rotate<0,-90.000000,0> translate<49.530000,0.000000,60.071000> }
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<49.530000,0.000000,53.340000>}
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<49.530000,0.000000,54.229000>}
box{<0,0,-0.254000><0.889000,0.036000,0.254000> rotate<0,90.000000,0> translate<49.530000,0.000000,54.229000> }
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<48.768000,0.000000,54.864000>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<50.292000,0.000000,54.864000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<50.292000,0.000000,59.436000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<48.768000,0.000000,59.436000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.292000,0.000000,54.610000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.768000,0.000000,54.610000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,0.000000,0> translate<48.768000,0.000000,54.610000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.514000,0.000000,54.864000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.514000,0.000000,55.245000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<48.514000,0.000000,55.245000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.641000,0.000000,55.372000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.514000,0.000000,55.245000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<48.514000,0.000000,55.245000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.546000,0.000000,54.864000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.546000,0.000000,55.245000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<50.546000,0.000000,55.245000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.419000,0.000000,55.372000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.546000,0.000000,55.245000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<50.419000,0.000000,55.372000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.641000,0.000000,58.928000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.514000,0.000000,59.055000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<48.514000,0.000000,59.055000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.641000,0.000000,58.928000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.641000,0.000000,55.372000>}
box{<0,0,-0.076200><3.556000,0.036000,0.076200> rotate<0,-90.000000,0> translate<48.641000,0.000000,55.372000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.419000,0.000000,58.928000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.546000,0.000000,59.055000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<50.419000,0.000000,58.928000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.419000,0.000000,58.928000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.419000,0.000000,55.372000>}
box{<0,0,-0.076200><3.556000,0.036000,0.076200> rotate<0,-90.000000,0> translate<50.419000,0.000000,55.372000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.514000,0.000000,59.436000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.514000,0.000000,59.055000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<48.514000,0.000000,59.055000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.546000,0.000000,59.436000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.546000,0.000000,59.055000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<50.546000,0.000000,59.055000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.292000,0.000000,59.690000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.768000,0.000000,59.690000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,0.000000,0> translate<48.768000,0.000000,59.690000> }
box{<-0.190500,0,-0.254000><0.190500,0.036000,0.254000> rotate<0,-90.000000,0> translate<49.530000,0.000000,59.880500>}
box{<-0.190500,0,-0.254000><0.190500,0.036000,0.254000> rotate<0,-90.000000,0> translate<49.530000,0.000000,54.419500>}
//R14 silk screen
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<74.930000,0.000000,60.960000>}
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<74.930000,0.000000,60.071000>}
box{<0,0,-0.254000><0.889000,0.036000,0.254000> rotate<0,-90.000000,0> translate<74.930000,0.000000,60.071000> }
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<74.930000,0.000000,53.340000>}
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<74.930000,0.000000,54.229000>}
box{<0,0,-0.254000><0.889000,0.036000,0.254000> rotate<0,90.000000,0> translate<74.930000,0.000000,54.229000> }
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<74.168000,0.000000,54.864000>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<75.692000,0.000000,54.864000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<75.692000,0.000000,59.436000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<74.168000,0.000000,59.436000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<75.692000,0.000000,54.610000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<74.168000,0.000000,54.610000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,0.000000,0> translate<74.168000,0.000000,54.610000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<73.914000,0.000000,54.864000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<73.914000,0.000000,55.245000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<73.914000,0.000000,55.245000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<74.041000,0.000000,55.372000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<73.914000,0.000000,55.245000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<73.914000,0.000000,55.245000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<75.946000,0.000000,54.864000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<75.946000,0.000000,55.245000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<75.946000,0.000000,55.245000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<75.819000,0.000000,55.372000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<75.946000,0.000000,55.245000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<75.819000,0.000000,55.372000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<74.041000,0.000000,58.928000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<73.914000,0.000000,59.055000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<73.914000,0.000000,59.055000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<74.041000,0.000000,58.928000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<74.041000,0.000000,55.372000>}
box{<0,0,-0.076200><3.556000,0.036000,0.076200> rotate<0,-90.000000,0> translate<74.041000,0.000000,55.372000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<75.819000,0.000000,58.928000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<75.946000,0.000000,59.055000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<75.819000,0.000000,58.928000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<75.819000,0.000000,58.928000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<75.819000,0.000000,55.372000>}
box{<0,0,-0.076200><3.556000,0.036000,0.076200> rotate<0,-90.000000,0> translate<75.819000,0.000000,55.372000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<73.914000,0.000000,59.436000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<73.914000,0.000000,59.055000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<73.914000,0.000000,59.055000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<75.946000,0.000000,59.436000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<75.946000,0.000000,59.055000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<75.946000,0.000000,59.055000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<75.692000,0.000000,59.690000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<74.168000,0.000000,59.690000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,0.000000,0> translate<74.168000,0.000000,59.690000> }
box{<-0.190500,0,-0.254000><0.190500,0.036000,0.254000> rotate<0,-90.000000,0> translate<74.930000,0.000000,59.880500>}
box{<-0.190500,0,-0.254000><0.190500,0.036000,0.254000> rotate<0,-90.000000,0> translate<74.930000,0.000000,54.419500>}
//R15 silk screen
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<53.340000,0.000000,44.450000>}
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<53.340000,0.000000,43.561000>}
box{<0,0,-0.254000><0.889000,0.036000,0.254000> rotate<0,-90.000000,0> translate<53.340000,0.000000,43.561000> }
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<53.340000,0.000000,36.830000>}
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<53.340000,0.000000,37.719000>}
box{<0,0,-0.254000><0.889000,0.036000,0.254000> rotate<0,90.000000,0> translate<53.340000,0.000000,37.719000> }
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<52.578000,0.000000,38.354000>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<54.102000,0.000000,38.354000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<54.102000,0.000000,42.926000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<52.578000,0.000000,42.926000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.102000,0.000000,38.100000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.578000,0.000000,38.100000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,0.000000,0> translate<52.578000,0.000000,38.100000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.324000,0.000000,38.354000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.324000,0.000000,38.735000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<52.324000,0.000000,38.735000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.451000,0.000000,38.862000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.324000,0.000000,38.735000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<52.324000,0.000000,38.735000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.356000,0.000000,38.354000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.356000,0.000000,38.735000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<54.356000,0.000000,38.735000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.229000,0.000000,38.862000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.356000,0.000000,38.735000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<54.229000,0.000000,38.862000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.451000,0.000000,42.418000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.324000,0.000000,42.545000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<52.324000,0.000000,42.545000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.451000,0.000000,42.418000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.451000,0.000000,38.862000>}
box{<0,0,-0.076200><3.556000,0.036000,0.076200> rotate<0,-90.000000,0> translate<52.451000,0.000000,38.862000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.229000,0.000000,42.418000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.356000,0.000000,42.545000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<54.229000,0.000000,42.418000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.229000,0.000000,42.418000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.229000,0.000000,38.862000>}
box{<0,0,-0.076200><3.556000,0.036000,0.076200> rotate<0,-90.000000,0> translate<54.229000,0.000000,38.862000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.324000,0.000000,42.926000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.324000,0.000000,42.545000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<52.324000,0.000000,42.545000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.356000,0.000000,42.926000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.356000,0.000000,42.545000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<54.356000,0.000000,42.545000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.102000,0.000000,43.180000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.578000,0.000000,43.180000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,0.000000,0> translate<52.578000,0.000000,43.180000> }
box{<-0.190500,0,-0.254000><0.190500,0.036000,0.254000> rotate<0,-90.000000,0> translate<53.340000,0.000000,43.370500>}
box{<-0.190500,0,-0.254000><0.190500,0.036000,0.254000> rotate<0,-90.000000,0> translate<53.340000,0.000000,37.909500>}
//R16 silk screen
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<76.200000,0.000000,40.640000>}
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<75.311000,0.000000,40.640000>}
box{<0,0,-0.254000><0.889000,0.036000,0.254000> rotate<0,0.000000,0> translate<75.311000,0.000000,40.640000> }
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<68.580000,0.000000,40.640000>}
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<69.469000,0.000000,40.640000>}
box{<0,0,-0.254000><0.889000,0.036000,0.254000> rotate<0,0.000000,0> translate<68.580000,0.000000,40.640000> }
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<70.104000,0.000000,41.402000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<70.104000,0.000000,39.878000>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<74.676000,0.000000,39.878000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<74.676000,0.000000,41.402000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<69.850000,0.000000,39.878000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<69.850000,0.000000,41.402000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,90.000000,0> translate<69.850000,0.000000,41.402000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<70.104000,0.000000,41.656000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<70.485000,0.000000,41.656000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<70.104000,0.000000,41.656000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<70.612000,0.000000,41.529000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<70.485000,0.000000,41.656000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<70.485000,0.000000,41.656000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<70.104000,0.000000,39.624000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<70.485000,0.000000,39.624000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<70.104000,0.000000,39.624000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<70.612000,0.000000,39.751000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<70.485000,0.000000,39.624000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<70.485000,0.000000,39.624000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<74.168000,0.000000,41.529000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<74.295000,0.000000,41.656000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<74.168000,0.000000,41.529000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<74.168000,0.000000,41.529000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<70.612000,0.000000,41.529000>}
box{<0,0,-0.076200><3.556000,0.036000,0.076200> rotate<0,0.000000,0> translate<70.612000,0.000000,41.529000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<74.168000,0.000000,39.751000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<74.295000,0.000000,39.624000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<74.168000,0.000000,39.751000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<74.168000,0.000000,39.751000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<70.612000,0.000000,39.751000>}
box{<0,0,-0.076200><3.556000,0.036000,0.076200> rotate<0,0.000000,0> translate<70.612000,0.000000,39.751000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<74.676000,0.000000,41.656000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<74.295000,0.000000,41.656000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<74.295000,0.000000,41.656000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<74.676000,0.000000,39.624000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<74.295000,0.000000,39.624000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<74.295000,0.000000,39.624000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<74.930000,0.000000,39.878000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<74.930000,0.000000,41.402000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,90.000000,0> translate<74.930000,0.000000,41.402000> }
box{<-0.190500,0,-0.254000><0.190500,0.036000,0.254000> rotate<0,-0.000000,0> translate<75.120500,0.000000,40.640000>}
box{<-0.190500,0,-0.254000><0.190500,0.036000,0.254000> rotate<0,-0.000000,0> translate<69.659500,0.000000,40.640000>}
//R17 silk screen
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<50.800000,0.000000,44.450000>}
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<50.800000,0.000000,43.561000>}
box{<0,0,-0.254000><0.889000,0.036000,0.254000> rotate<0,-90.000000,0> translate<50.800000,0.000000,43.561000> }
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<50.800000,0.000000,36.830000>}
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<50.800000,0.000000,37.719000>}
box{<0,0,-0.254000><0.889000,0.036000,0.254000> rotate<0,90.000000,0> translate<50.800000,0.000000,37.719000> }
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<50.038000,0.000000,38.354000>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<51.562000,0.000000,38.354000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<51.562000,0.000000,42.926000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<50.038000,0.000000,42.926000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.562000,0.000000,38.100000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.038000,0.000000,38.100000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,0.000000,0> translate<50.038000,0.000000,38.100000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.784000,0.000000,38.354000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.784000,0.000000,38.735000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<49.784000,0.000000,38.735000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.911000,0.000000,38.862000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.784000,0.000000,38.735000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<49.784000,0.000000,38.735000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.816000,0.000000,38.354000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.816000,0.000000,38.735000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<51.816000,0.000000,38.735000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.689000,0.000000,38.862000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.816000,0.000000,38.735000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<51.689000,0.000000,38.862000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.911000,0.000000,42.418000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.784000,0.000000,42.545000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<49.784000,0.000000,42.545000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.911000,0.000000,42.418000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.911000,0.000000,38.862000>}
box{<0,0,-0.076200><3.556000,0.036000,0.076200> rotate<0,-90.000000,0> translate<49.911000,0.000000,38.862000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.689000,0.000000,42.418000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.816000,0.000000,42.545000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<51.689000,0.000000,42.418000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.689000,0.000000,42.418000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.689000,0.000000,38.862000>}
box{<0,0,-0.076200><3.556000,0.036000,0.076200> rotate<0,-90.000000,0> translate<51.689000,0.000000,38.862000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.784000,0.000000,42.926000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.784000,0.000000,42.545000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<49.784000,0.000000,42.545000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.816000,0.000000,42.926000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.816000,0.000000,42.545000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<51.816000,0.000000,42.545000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.562000,0.000000,43.180000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.038000,0.000000,43.180000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,0.000000,0> translate<50.038000,0.000000,43.180000> }
box{<-0.190500,0,-0.254000><0.190500,0.036000,0.254000> rotate<0,-90.000000,0> translate<50.800000,0.000000,43.370500>}
box{<-0.190500,0,-0.254000><0.190500,0.036000,0.254000> rotate<0,-90.000000,0> translate<50.800000,0.000000,37.909500>}
//S1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<10.414000,0.000000,33.528000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<8.890000,0.000000,33.528000>}
box{<0,0,-0.101600><1.524000,0.036000,0.101600> rotate<0,0.000000,0> translate<8.890000,0.000000,33.528000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<8.890000,0.000000,33.528000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<8.382000,0.000000,33.020000>}
box{<0,0,-0.101600><0.718420,0.036000,0.101600> rotate<0,-44.997030,0> translate<8.382000,0.000000,33.020000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<14.478000,0.000000,33.020000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<13.970000,0.000000,33.528000>}
box{<0,0,-0.101600><0.718420,0.036000,0.101600> rotate<0,44.997030,0> translate<13.970000,0.000000,33.528000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<13.970000,0.000000,33.528000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<12.446000,0.000000,33.528000>}
box{<0,0,-0.101600><1.524000,0.036000,0.101600> rotate<0,0.000000,0> translate<12.446000,0.000000,33.528000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<8.382000,0.000000,27.940000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<8.890000,0.000000,27.432000>}
box{<0,0,-0.101600><0.718420,0.036000,0.101600> rotate<0,44.997030,0> translate<8.382000,0.000000,27.940000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<8.890000,0.000000,27.432000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<10.414000,0.000000,27.432000>}
box{<0,0,-0.101600><1.524000,0.036000,0.101600> rotate<0,0.000000,0> translate<8.890000,0.000000,27.432000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<14.478000,0.000000,27.940000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<13.970000,0.000000,27.432000>}
box{<0,0,-0.101600><0.718420,0.036000,0.101600> rotate<0,-44.997030,0> translate<13.970000,0.000000,27.432000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<13.970000,0.000000,27.432000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<12.446000,0.000000,27.432000>}
box{<0,0,-0.101600><1.524000,0.036000,0.101600> rotate<0,0.000000,0> translate<12.446000,0.000000,27.432000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<14.478000,0.000000,33.020000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<14.478000,0.000000,32.639000>}
box{<0,0,-0.101600><0.381000,0.036000,0.101600> rotate<0,-90.000000,0> translate<14.478000,0.000000,32.639000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<14.478000,0.000000,27.940000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<14.478000,0.000000,28.321000>}
box{<0,0,-0.101600><0.381000,0.036000,0.101600> rotate<0,90.000000,0> translate<14.478000,0.000000,28.321000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<8.382000,0.000000,27.940000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<8.382000,0.000000,28.321000>}
box{<0,0,-0.101600><0.381000,0.036000,0.101600> rotate<0,90.000000,0> translate<8.382000,0.000000,28.321000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<8.382000,0.000000,33.020000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<8.382000,0.000000,32.639000>}
box{<0,0,-0.101600><0.381000,0.036000,0.101600> rotate<0,-90.000000,0> translate<8.382000,0.000000,32.639000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<8.382000,0.000000,32.639000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<8.382000,0.000000,28.321000>}
box{<0,0,-0.101600><4.318000,0.036000,0.101600> rotate<0,-90.000000,0> translate<8.382000,0.000000,28.321000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<14.478000,0.000000,28.321000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<14.478000,0.000000,32.639000>}
box{<0,0,-0.101600><4.318000,0.036000,0.101600> rotate<0,90.000000,0> translate<14.478000,0.000000,32.639000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<10.432000,0.000000,33.528000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<12.446000,0.000000,33.528000>}
box{<0,0,-0.101600><2.014000,0.036000,0.101600> rotate<0,0.000000,0> translate<10.432000,0.000000,33.528000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<10.402000,0.000000,27.432000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<12.446000,0.000000,27.432000>}
box{<0,0,-0.101600><2.044000,0.036000,0.101600> rotate<0,0.000000,0> translate<10.402000,0.000000,27.432000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<10.160000,0.000000,27.940000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<10.922000,0.000000,27.940000>}
box{<0,0,-0.101600><0.762000,0.036000,0.101600> rotate<0,0.000000,0> translate<10.160000,0.000000,27.940000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<11.938000,0.000000,27.940000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<12.700000,0.000000,27.940000>}
box{<0,0,-0.101600><0.762000,0.036000,0.101600> rotate<0,0.000000,0> translate<11.938000,0.000000,27.940000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<10.922000,0.000000,27.940000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<11.811000,0.000000,28.321000>}
box{<0,0,-0.101600><0.967203,0.036000,0.101600> rotate<0,-23.197059,0> translate<10.922000,0.000000,27.940000> }
difference{
cylinder{<11.430000,0,30.480000><11.430000,0.036000,30.480000>1.879600 translate<0,0.000000,0>}
cylinder{<11.430000,-0.1,30.480000><11.430000,0.135000,30.480000>1.676400 translate<0,0.000000,0>}}
//U$1 silk screen
//U$2 silk screen
//U$3 silk screen
//U$4 silk screen
//X1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<35.560000,0.000000,1.270000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<47.498000,0.000000,1.270000>}
box{<0,0,-0.127000><11.938000,0.036000,0.127000> rotate<0,0.000000,0> translate<35.560000,0.000000,1.270000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<47.498000,0.000000,12.573000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<35.560000,0.000000,12.573000>}
box{<0,0,-0.127000><11.938000,0.036000,0.127000> rotate<0,0.000000,0> translate<35.560000,0.000000,12.573000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<36.830000,0.000000,2.540000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<46.355000,0.000000,2.540000>}
box{<0,0,-0.127000><9.525000,0.036000,0.127000> rotate<0,0.000000,0> translate<36.830000,0.000000,2.540000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<46.355000,0.000000,9.525000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<44.450000,0.000000,11.430000>}
box{<0,0,-0.127000><2.694077,0.036000,0.127000> rotate<0,44.997030,0> translate<44.450000,0.000000,11.430000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<44.450000,0.000000,11.430000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<38.735000,0.000000,11.430000>}
box{<0,0,-0.127000><5.715000,0.036000,0.127000> rotate<0,0.000000,0> translate<38.735000,0.000000,11.430000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<38.735000,0.000000,11.430000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<36.830000,0.000000,9.525000>}
box{<0,0,-0.127000><2.694077,0.036000,0.127000> rotate<0,-44.997030,0> translate<36.830000,0.000000,9.525000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<35.560000,0.000000,12.700000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<35.560000,0.000000,8.255000>}
box{<0,0,-0.063500><4.445000,0.036000,0.063500> rotate<0,-90.000000,0> translate<35.560000,0.000000,8.255000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<35.560000,0.000000,1.270000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<35.560000,0.000000,3.810000>}
box{<0,0,-0.063500><2.540000,0.036000,0.063500> rotate<0,90.000000,0> translate<35.560000,0.000000,3.810000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<47.625000,0.000000,1.270000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<47.625000,0.000000,3.810000>}
box{<0,0,-0.063500><2.540000,0.036000,0.063500> rotate<0,90.000000,0> translate<47.625000,0.000000,3.810000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<47.625000,0.000000,12.700000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<47.625000,0.000000,8.255000>}
box{<0,0,-0.063500><4.445000,0.036000,0.063500> rotate<0,-90.000000,0> translate<47.625000,0.000000,8.255000> }
texture{col_slk}
}
#end
translate<mac_x_ver,mac_y_ver,mac_z_ver>
rotate<mac_x_rot,mac_y_rot,mac_z_rot>
}//End union
#end

#if(use_file_as_inc=off)
object{  USBSIMSTEPPER_V1_0(-41.110000,0,-41.270000,pcb_rotate_x,pcb_rotate_y,pcb_rotate_z)
#if(pcb_upsidedown=on)
rotate pcb_rotdir*180
#end
}
#end


//Parts not found in 3dpack.dat or 3dusrpac.dat are:
//C1	22pf	CAP-PTH-SMALL2
//C2	22pf	CAP-PTH-SMALL2
//C3	.1	CAP-PTH-SMALL2
//C4	.1	CAP-PTH-SMALL2
//C5	.1	CAP-PTH-SMALL2
//D2	3V3	DIODE-ZENER
//D3	3V3	DIODE-ZENER
//JP1	ISP	2X3-NS
//JP2	MOTOR	MOLEX-1X2
//JP3	ENCODER1	MOLEX-1X3
//JP4	ENCODER2	MOLEX-1X3
//JP5	ENCODERSW	MOLEX-1X2
//JP6	MOTOR1	MOLEX-1X4
//JP7	MOTOR2	MOLEX-1X4
//JP8	LIMIT1	MOLEX-1X3
//JP9	LIMIT2	MOLEX-1X3
//Q1	12MHz	HC49US
//S1	RESET	TACTILE-PTH
//U$1		STAND-OFF
//U$2		STAND-OFF
//U$3		STAND-OFF
//U$4		STAND-OFF
//X1	USB	USB-B-PTH-VERTICAL
