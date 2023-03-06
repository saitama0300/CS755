
module top ( 
    //Node Inputs
    x0_node0, x1_node0, x2_node0, x3_node0, 
    x0_node1, x1_node1, x2_node1, x3_node1, 
    x0_node2, x1_node2, x2_node2, x3_node2, 
    x0_node3, x1_node3, x2_node3, x3_node3, 

    //Weights
    w04, w14, w24, w34, 
    w05, w15, w25, w35, 
    w06, w16, w26, w36, 
    w07, w17, w27, w37, 
    w48, w58, w68, w78, 
    w49, w59, w69, w79, 

    //Node Outputs
    out0_node0, out1_node0, 
    out0_node1, out1_node1, 
    out0_node2, out1_node2, 
    out0_node3, out1_node3, 

    //Input redy signal
    in_ready, 

    //Output ready signals
    out10_ready_node0, out11_ready_node0, 
    out10_ready_node1, out11_ready_node1, 
    out10_ready_node2, out11_ready_node2, 
    out10_ready_node3, out11_ready_node3, 

    //clk
    clk
); 
 
input signed [4:0] x0_node0, x1_node0, x2_node0, x3_node0; 
input signed [4:0] x0_node1, x1_node1, x2_node1, x3_node1; 
input signed [4:0] x0_node2, x1_node2, x2_node2, x3_node2; 
input signed [4:0] x0_node3, x1_node3, x2_node3, x3_node3; 
input signed [4:0] w04, w14, w24, w34; 
input signed [4:0] w05, w15, w25, w35; 
input signed [4:0] w06, w16, w26, w36; 
input signed [4:0] w07, w17, w27, w37; 
input signed [4:0] w48, w58, w68, w78; 
input signed [4:0] w49, w59, w69, w79; 
 
input clk, in_ready; 
 
output signed [20:0] out0_node0, out1_node0;
output signed [20:0] out0_node1, out1_node1;
output signed [20:0] out0_node2, out1_node2;
output signed [20:0] out0_node3, out1_node3;

output out10_ready_node0, out11_ready_node0; 
output out10_ready_node1, out11_ready_node1; 
output out10_ready_node2, out11_ready_node2; 
output out10_ready_node3, out11_ready_node3; 

wire signed [13:0] n04, n05, n06, n07;
wire signed [13:0] n14, n15, n16, n17;
wire signed [13:0] n24, n25, n26, n27;
wire signed [13:0] n34, n35, n36, n37;

dnn n0(
    .x0(x0_node0), .x1(x1_node0), .x2(x2_node0), .x3(x3_node0),

    .fA0(x0_node1), .fA1(x1_node1), .fA2(x2_node1), .fA3(x3_node1),
    .fB0(x0_node2), .fB1(x1_node2), .fB2(x2_node2), .fB3(x3_node2),

    .A4(n14), .A5(n15), .A6(n16), .A7(n17), 
    .B4(n24), .B5(n25), .B6(n26), .B7(n27),

    .w04(w04), .w05(w05), .w06(w06), .w07(w07), 
    .w14(w14), .w15(w15), .w16(w16), .w17(w17), 
    .w24(w24), .w25(w25), .w26(w26), .w27(w27), 
    .w34(w34), .w35(w35), .w36(w36), .w37(w37), 
    .w48(w48), .w58(w58), 
    .w49(w49), .w59(w59), 
    .w68(w68), .w69(w69), 
    .w78(w78), .w79(w79), 

    .Y4(n04), .Y5(n05), .Y6(n06), .Y7(n07), 
    .out0(out0_node0), .out1(out1_node0), 
    .in_ready(in_ready), 
    .out0_ready(out10_ready_node0), .out1_ready(out11_ready_node0),   
    .clk(clk)
);

dnn n1(
    .x0(x0_node1), .x1(x1_node1), .x2(x2_node1), .x3(x3_node1),

    .fA0(x0_node0), .fA1(x1_node0), .fA2(x2_node0), .fA3(x3_node0),
    .fB0(x0_node3), .fB1(x1_node3), .fB2(x2_node3), .fB3(x3_node3),

    .A4(n04), .A5(n05), .A6(n06), .A7(n07), 
    .B4(n34), .B5(n35), .B6(n36), .B7(n37),

    .w04(w04), .w05(w05), .w06(w06), .w07(w07), 
    .w14(w14), .w15(w15), .w16(w16), .w17(w17), 
    .w24(w24), .w25(w25), .w26(w26), .w27(w27), 
    .w34(w34), .w35(w35), .w36(w36), .w37(w37), 
    .w48(w48), .w58(w58), 
    .w49(w49), .w59(w59), 
    .w68(w68), .w69(w69), 
    .w78(w78), .w79(w79), 

    .Y4(n14), .Y5(n15), .Y6(n16), .Y7(n17), 
    .out0(out0_node1), .out1(out1_node1), 
    .in_ready(in_ready), 
    .out0_ready(out10_ready_node1), .out1_ready(out11_ready_node1),   
    .clk(clk)
); 

dnn n2(
    .x0(x0_node2), .x1(x1_node2), .x2(x2_node2), .x3(x3_node2),

    .fA0(x0_node0), .fA1(x1_node0), .fA2(x2_node0), .fA3(x3_node0),
    .fB0(x0_node3), .fB1(x1_node3), .fB2(x2_node3), .fB3(x3_node3),

    .A4(n04), .A5(n05), .A6(n06), .A7(n07), 
    .B4(n34), .B5(n35), .B6(n36), .B7(n37),

    .w04(w04), .w05(w05), .w06(w06), .w07(w07), 
    .w14(w14), .w15(w15), .w16(w16), .w17(w17), 
    .w24(w24), .w25(w25), .w26(w26), .w27(w27), 
    .w34(w34), .w35(w35), .w36(w36), .w37(w37), 
    .w48(w48), .w58(w58), 
    .w49(w49), .w59(w59), 
    .w68(w68), .w69(w69), 
    .w78(w78), .w79(w79), 

    .Y4(n24), .Y5(n25), .Y6(n26), .Y7(n27), 
    .out0(out0_node2), .out1(out1_node2), 
    .in_ready(in_ready), 
    .out0_ready(out10_ready_node2), .out1_ready(out11_ready_node2),   
    .clk(clk)
); 

dnn n3(
    .x0(x0_node3), .x1(x1_node3), .x2(x2_node3), .x3(x3_node3),

    .fA0(x0_node1), .fA1(x1_node1), .fA2(x2_node1), .fA3(x3_node1),
    .fB0(x0_node2), .fB1(x1_node2), .fB2(x2_node2), .fB3(x3_node2),

    .A4(n14), .A5(n15), .A6(n16), .A7(n17), 
    .B4(n24), .B5(n25), .B6(n26), .B7(n27),

    .w04(w04), .w05(w05), .w06(w06), .w07(w07), 
    .w14(w14), .w15(w15), .w16(w16), .w17(w17), 
    .w24(w24), .w25(w25), .w26(w26), .w27(w27), 
    .w34(w34), .w35(w35), .w36(w36), .w37(w37), 
    .w48(w48), .w58(w58), 
    .w49(w49), .w59(w59), 
    .w68(w68), .w69(w69), 
    .w78(w78), .w79(w79), 

    .Y4(n34), .Y5(n35), .Y6(n36), .Y7(n37), 
    .out0(out0_node3), .out1(out1_node3), 
    .in_ready(in_ready), 
    .out0_ready(out10_ready_node3), .out1_ready(out11_ready_node3),   
    .clk(clk)
); 

endmodule