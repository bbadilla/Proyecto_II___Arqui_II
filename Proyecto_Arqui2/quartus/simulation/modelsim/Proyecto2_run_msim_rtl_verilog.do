transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/Bryan/Desktop/GitHub/Proyecto_II___Arqui_II/Proyecto_Arqui2/quartus/RAM {C:/Users/Bryan/Desktop/GitHub/Proyecto_II___Arqui_II/Proyecto_Arqui2/quartus/RAM/original_image.v}
vlog -sv -work work +incdir+C:/Users/Bryan/Desktop/GitHub/Proyecto_II___Arqui_II/Proyecto_Arqui2/quartus {C:/Users/Bryan/Desktop/GitHub/Proyecto_II___Arqui_II/Proyecto_Arqui2/quartus/deco_hist.sv}
vlog -sv -work work +incdir+C:/Users/Bryan/Desktop/GitHub/Proyecto_II___Arqui_II/Proyecto_Arqui2/quartus {C:/Users/Bryan/Desktop/GitHub/Proyecto_II___Arqui_II/Proyecto_Arqui2/quartus/Add_8.sv}
vlog -sv -work work +incdir+C:/Users/Bryan/Desktop/GitHub/Proyecto_II___Arqui_II/Proyecto_Arqui2/quartus {C:/Users/Bryan/Desktop/GitHub/Proyecto_II___Arqui_II/Proyecto_Arqui2/quartus/register_file.sv}
vlog -sv -work work +incdir+C:/Users/Bryan/Desktop/GitHub/Proyecto_II___Arqui_II/Proyecto_Arqui2/quartus {C:/Users/Bryan/Desktop/GitHub/Proyecto_II___Arqui_II/Proyecto_Arqui2/quartus/mux_4_x_1.sv}
vlog -sv -work work +incdir+C:/Users/Bryan/Desktop/GitHub/Proyecto_II___Arqui_II/Proyecto_Arqui2/quartus {C:/Users/Bryan/Desktop/GitHub/Proyecto_II___Arqui_II/Proyecto_Arqui2/quartus/mux_2_x_1.sv}
vlog -sv -work work +incdir+C:/Users/Bryan/Desktop/GitHub/Proyecto_II___Arqui_II/Proyecto_Arqui2/quartus {C:/Users/Bryan/Desktop/GitHub/Proyecto_II___Arqui_II/Proyecto_Arqui2/quartus/instruction_memory.sv}
vlog -sv -work work +incdir+C:/Users/Bryan/Desktop/GitHub/Proyecto_II___Arqui_II/Proyecto_Arqui2/quartus {C:/Users/Bryan/Desktop/GitHub/Proyecto_II___Arqui_II/Proyecto_Arqui2/quartus/flip_flop_D.sv}
vlog -sv -work work +incdir+C:/Users/Bryan/Desktop/GitHub/Proyecto_II___Arqui_II/Proyecto_Arqui2/quartus {C:/Users/Bryan/Desktop/GitHub/Proyecto_II___Arqui_II/Proyecto_Arqui2/quartus/DataPath.sv}
vlog -sv -work work +incdir+C:/Users/Bryan/Desktop/GitHub/Proyecto_II___Arqui_II/Proyecto_Arqui2/quartus {C:/Users/Bryan/Desktop/GitHub/Proyecto_II___Arqui_II/Proyecto_Arqui2/quartus/Control_Unit.sv}
vlog -sv -work work +incdir+C:/Users/Bryan/Desktop/GitHub/Proyecto_II___Arqui_II/Proyecto_Arqui2/quartus {C:/Users/Bryan/Desktop/GitHub/Proyecto_II___Arqui_II/Proyecto_Arqui2/quartus/Add_pc.sv}
vlog -sv -work work +incdir+C:/Users/Bryan/Desktop/GitHub/Proyecto_II___Arqui_II/Proyecto_Arqui2/quartus {C:/Users/Bryan/Desktop/GitHub/Proyecto_II___Arqui_II/Proyecto_Arqui2/quartus/Add_param.sv}
vlog -sv -work work +incdir+C:/Users/Bryan/Desktop/GitHub/Proyecto_II___Arqui_II/Proyecto_Arqui2/quartus {C:/Users/Bryan/Desktop/GitHub/Proyecto_II___Arqui_II/Proyecto_Arqui2/quartus/data_memory.sv}
vlog -sv -work work +incdir+C:/Users/Bryan/Desktop/GitHub/Proyecto_II___Arqui_II/Proyecto_Arqui2/quartus {C:/Users/Bryan/Desktop/GitHub/Proyecto_II___Arqui_II/Proyecto_Arqui2/quartus/test.sv}
vlog -sv -work work +incdir+C:/Users/Bryan/Desktop/GitHub/Proyecto_II___Arqui_II/Proyecto_Arqui2/quartus {C:/Users/Bryan/Desktop/GitHub/Proyecto_II___Arqui_II/Proyecto_Arqui2/quartus/alu.sv}
vlog -sv -work work +incdir+C:/Users/Bryan/Desktop/GitHub/Proyecto_II___Arqui_II/Proyecto_Arqui2/quartus {C:/Users/Bryan/Desktop/GitHub/Proyecto_II___Arqui_II/Proyecto_Arqui2/quartus/cond_logic.sv}
vlog -sv -work work +incdir+C:/Users/Bryan/Desktop/GitHub/Proyecto_II___Arqui_II/Proyecto_Arqui2/quartus {C:/Users/Bryan/Desktop/GitHub/Proyecto_II___Arqui_II/Proyecto_Arqui2/quartus/flip_flop_D_neg.sv}
vlog -sv -work work +incdir+C:/Users/Bryan/Desktop/GitHub/Proyecto_II___Arqui_II/Proyecto_Arqui2/quartus {C:/Users/Bryan/Desktop/GitHub/Proyecto_II___Arqui_II/Proyecto_Arqui2/quartus/cond_check.sv}
vlog -sv -work work +incdir+C:/Users/Bryan/Desktop/GitHub/Proyecto_II___Arqui_II/Proyecto_Arqui2/quartus {C:/Users/Bryan/Desktop/GitHub/Proyecto_II___Arqui_II/Proyecto_Arqui2/quartus/acumulator.sv}
vlog -sv -work work +incdir+C:/Users/Bryan/Desktop/GitHub/Proyecto_II___Arqui_II/Proyecto_Arqui2/quartus {C:/Users/Bryan/Desktop/GitHub/Proyecto_II___Arqui_II/Proyecto_Arqui2/quartus/shifts.sv}

