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
 
input [4:0] x0_node0, x1_node0, x2_node0, x3_node0; 
input [4:0] x0_node1, x1_node1, x2_node1, x3_node1; 
input [4:0] x0_node2, x1_node2, x2_node2, x3_node2; 
input [4:0] x0_node3, x1_node3, x2_node3, x3_node3; 
input [4:0] w04, w14, w24, w34; 
input [4:0] w05, w15, w25, w35; 
input [4:0] w06, w16, w26, w36; 
input [4:0] w07, w17, w27, w37; 
input [4:0] w48, w58, w68, w78; 
input [4:0] w49, w59, w69, w79; 
 
input clk; 
 
output [20:0] out0_node0, out1_node0;

wire[11:0] n04, n05, n06, n07;
wire[11:0] n14, n15, n16, n17;
wire[11:0] n24, n25, n26, n27;
wire[11:0] n34, n35, n36, n37;

dnn n0(
    .x0(), .x1(), .x2(), .x3(),

    .fA0(), .fA1(), .fA2(), .fA3(),
    .fB0(), .fB1(), .fB2(), .fB3(),

    .A4(), .A5(), .A6(), .A7(), 
    .B4(), .B5(), .B6(), .B7(),

    .w04(), .w05(), .w06(), .w07(), 
    .w14(), .w15(), .w16(), .w17(), 
    .w24(), .w25(), .w26(), .w27(), 
    .w34(), .w35(), .w36(), .w37(), 
    .w48(), .w58(), 
    .w49(), .w59(), 
    .w68(), .w69(), 
    .w78(), .w79(), 

    .Y4(), .Y5(), .Y6(), .Y7(), 
    .out0(), .out1(), 
    .in_ready(), 
    .out0_ready(), .out1_ready(),   
    .clk()
);

dnn n1(
    .x0(), .x1(), .x2(), .x3(),

    .fA0(), .fA1(), .fA2(), .fA3(),
    .fB0(), .fB1(), .fB2(), .fB3(),

    .A4(), .A5(), .A6(), .A7(), 
    .B4(), .B5(), .B6(), .B7(),

    .w04(), .w05(), .w06(), .w07(), 
    .w14(), .w15(), .w16(), .w17(), 
    .w24(), .w25(), .w26(), .w27(), 
    .w34(), .w35(), .w36(), .w37(), 
    .w48(), .w58(), 
    .w49(), .w59(), 
    .w68(), .w69(), 
    .w78(), .w79(), 

    .Y4(), .Y5(), .Y6(), .Y7(), 
    .out0(), .out1(), 
    .in_ready(), 
    .out0_ready(), .out1_ready(),  
    .clk()
); 

dnn n2(
    .x0(), .x1(), .x2(), .x3(),

    .fA0(), .fA1(), .fA2(), .fA3(),
    .fB0(), .fB1(), .fB2(), .fB3(),

    .A4(), .A5(), .A6(), .A7(), 
    .B4(), .B5(), .B6(), .B7(),

    .w04(), .w05(), .w06(), .w07(), 
    .w14(), .w15(), .w16(), .w17(), 
    .w24(), .w25(), .w26(), .w27(), 
    .w34(), .w35(), .w36(), .w37(), 
    .w48(), .w58(), 
    .w49(), .w59(), 
    .w68(), .w69(), 
    .w78(), .w79(), 

    .Y4(), .Y5(), .Y6(), .Y7(), 
    .out0(), .out1(), 
    .in_ready(), 
    .out0_ready(), .out1_ready(),  
    .clk()
); 

dnn n3(
    .x0(), .x1(), .x2(), .x3(),

    .fA0(), .fA1(), .fA2(), .fA3(),
    .fB0(), .fB1(), .fB2(), .fB3(),

    .A4(), .A5(), .A6(), .A7(), 
    .B4(), .B5(), .B6(), .B7(),

    .w04(), .w05(), .w06(), .w07(), 
    .w14(), .w15(), .w16(), .w17(), 
    .w24(), .w25(), .w26(), .w27(), 
    .w34(), .w35(), .w36(), .w37(), 
    .w48(), .w58(), 
    .w49(), .w59(), 
    .w68(), .w69(), 
    .w78(), .w79(), 

    .Y4(), .Y5(), .Y6(), .Y7(), 
    .out0(), .out1(), 
    .in_ready(),
    .out0_ready(), .out1_ready(),  
    .clk()
); 

endmodule