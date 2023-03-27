lappend search_path "/filespace/a/arathi4/MS_3_Synthesis"

analyze -library work -format sverilog \
 {./top.sv \
	 ./dnn.sv 
}
