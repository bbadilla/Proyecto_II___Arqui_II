transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+C:/Users/Bryan/Desktop/GitHub/Proyecto_II___Arqui_II/Proyecto_Arqui2/quartus {C:/Users/Bryan/Desktop/GitHub/Proyecto_II___Arqui_II/Proyecto_Arqui2/quartus/data_memory.sv}
vlog -sv -work work +incdir+C:/Users/Bryan/Desktop/GitHub/Proyecto_II___Arqui_II/Proyecto_Arqui2/quartus {C:/Users/Bryan/Desktop/GitHub/Proyecto_II___Arqui_II/Proyecto_Arqui2/quartus/histogram.sv}
vlog -sv -work work +incdir+C:/Users/Bryan/Desktop/GitHub/Proyecto_II___Arqui_II/Proyecto_Arqui2/quartus {C:/Users/Bryan/Desktop/GitHub/Proyecto_II___Arqui_II/Proyecto_Arqui2/quartus/deco_hist.sv}
vlog -sv -work work +incdir+C:/Users/Bryan/Desktop/GitHub/Proyecto_II___Arqui_II/Proyecto_Arqui2/quartus {C:/Users/Bryan/Desktop/GitHub/Proyecto_II___Arqui_II/Proyecto_Arqui2/quartus/Add_8.sv}

