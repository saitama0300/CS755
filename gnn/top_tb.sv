module tb_top();

reg [4:0] x0_node0, x1_node0, x2_node0, x3_node0;
reg [4:0] x0_node1, x1_node1, x2_node1, x3_node1;
reg [4:0] x0_node2, x1_node2, x2_node2, x3_node2;
reg [4:0] x0_node3, x1_node3, x2_node3, x3_node3;
reg [4:0] w04, w14, w24, w34;
reg [4:0] w05, w15, w25, w35;
reg [4:0] w06, w16, w26, w36;
reg [4:0] w07, w17, w27, w37;
reg [4:0] w48, w58, w68, w78;
reg [4:0] w49, w59, w69, w79;

reg clk;

wire signed [20:0] out0_node0, out1_node0;
wire signed [20:0] out0_node1, out1_node1;
wire signed [20:0] out0_node2, out1_node2;
wire signed [20:0] out0_node3, out1_node3;

wire out10_ready_node0, out11_ready_node0;
wire out10_ready_node1, out11_ready_node1;
wire out10_ready_node2, out11_ready_node2;
wire out10_ready_node3, out11_ready_node3;

reg in_ready;
// Top module
// Instantiation of top module
// Please replace the instantiation with the top module of your gate level model
// Look for 'test failed' in the message. If there is no such message then your output matches the golden outputs. 


top top(.x0_node0(x0_node0), .x1_node0(x1_node0), .x2_node0(x2_node0), .x3_node0(x3_node0), 
        .x0_node1(x0_node1), .x1_node1(x1_node1), .x2_node1(x2_node1), .x3_node1(x3_node1), 
        .x0_node2(x0_node2), .x1_node2(x1_node2), .x2_node2(x2_node2), .x3_node2(x3_node2), 
        .x0_node3(x0_node3), .x1_node3(x1_node3), .x2_node3(x2_node3), .x3_node3(x3_node3), 
        .w04(w04), .w14(w14), .w24(w24), .w34(w34), 
        .w05(w05), .w15(w15), .w25(w25), .w35(w35),
        .w06(w06), .w16(w16), .w26(w26), .w36(w36),
        .w07(w07), .w17(w17), .w27(w27), .w37(w37),
        .w48(w48), .w58(w58), .w68(w68), .w78(w78),
        .w49(w49), .w59(w59), .w69(w69), .w79(w79),
        .out0_node0(out0_node0), .out1_node0(out1_node0),
        .out0_node1(out0_node1), .out1_node1(out1_node1),
        .out0_node2(out0_node2), .out1_node2(out1_node2),
        .out0_node3(out0_node3), .out1_node3(out1_node3),
        .in_ready(in_ready),
        .out10_ready_node0(out10_ready_node0), .out11_ready_node0(out11_ready_node0),
        .out10_ready_node1(out10_ready_node1), .out11_ready_node1(out11_ready_node1),
        .out10_ready_node2(out10_ready_node2), .out11_ready_node2(out11_ready_node2),
        .out10_ready_node3(out10_ready_node3), .out11_ready_node3(out11_ready_node3),
        .clk(clk));

initial begin

    clk = 0;
    in_ready = 1; 
    
    x0_node0 = 4;
    x1_node0 = 2;
    x2_node0 = 4;
    x3_node0 = 1;
    
    x0_node1 = 6;
    x1_node1 = 4;
    x2_node1 = 4;
    x3_node1 = 1;
    
    x0_node2 = 8;
    x1_node2 = 6;
    x2_node2 = 4;
    x3_node2 = 1;
    
    x0_node3 = 6;
    x1_node3 = 4;
    x2_node3 = 4;
    x3_node3 = 1;
    
    w04 = 3;
    w14 = 2;
    w24 = 13;
    w34 = -6;
    w05 = -9;
    w15 = 1;
    w25 = -4;
    w35 = 14;
    w06 = 3;
    w16 = 6;
    w26 = -15;
    w36 = 15;
    w07 = 9;
    w17 = -10;
    w27 = 15;
    w37 = -10;
    w48 = 0;
    w58 = -1;
    w68 = 3;
    w78 = -11;
    w49 = -12;
    w59 = -15;
    w69 = -15;
    w79 = 6;

    #50
	$display("Node 0 -> out0: %d, out1: %d\n",out0_node0, out1_node0);
	$display("Node 1 -> out0: %d, out1: %d\n",out0_node1, out1_node1);
	$display("Node 2 -> out0: %d, out1: %d\n",out0_node2, out1_node2);
	$display("Node 3 -> out0: %d, out1: %d\n",out0_node3, out1_node3);
end


always
    #1 clk = !clk;


initial
    #100 $finish;


endmodule
