module dnn(
    x0, x1, x2, x3,
    //INITIAL FEATURE INPUTS FROM NEIGHBOOURS
    fA0, fA1, fA2, fA3,
    fB0, fB1, fB2, fB3,
    //INTERMEDIATE NEIGHBOURING NODE INPUTS
    A4, A5, A6, A7, 
    B4, B5, B6, B7,
    //WEIGHTS 
    w04, w05, w06, w07, 
    w14, w15, w16, w17, 
    w24, w25, w26, w27, 
    w34, w35, w36, w37, 
    w48, w58, 
    w49, w59, 
    w68, w69, 
    w78, w79, 

    Y4, Y5, Y6, Y7, //INTERMEDIATE OUTPUTS
    out0, out1, //FINAL STAGE OUTPUTS
    in_ready, //INPUT READY SIGNALS
    out0_ready, out1_ready, //FINAL STAGE OUTPUT READY SIGNALS
    clk
); 
 
input clk; 
input [4:0] w04, w05, w06, w07, w14, w15, w16, w17, w24, w25, w26, w27, w34, w35, w36, w37, w48, w58, w49, w59, w68, w69, w78, w79;
input signed [4:0] x0, x1, x2, x3;
input signed [4:0] fA0, fA1, fA2, fA3, fB0, fB1, fB2, fB3;
input signed [13:0] A4, A5, A6, A7, B4, B5, B6, B7; 
input in_ready; 
output [20:0] out0, out1; 
output signed [13:0] Y4, Y5, Y6, Y7;
output out0_ready, out1_ready; 
 
// Implementation of the neural network 

//Activation IP/OP
reg signed [6:0] w0, w1, w2, w3;
reg signed [13:0] w4, w5, w6, w7;
reg signed [13:0] w4_relu, w5_relu, w6_relu, w7_relu;
reg signed [15:0] a4, a5, a6, a7;
reg signed [20:0] w8, w9;
reg signed [20:0] a8, a9;
  
//Weights MAC Layer 1
  wire signed [4:0] wt04, wt05, wt06, wt07;
  wire signed [4:0] wt14, wt15, wt16, wt17;
  wire signed [4:0] wt24, wt25, wt26, wt27;
  wire signed [4:0] wt34, wt35, wt36, wt37;

//Weights MAC Layer 2
  wire signed [4:0] wt48, wt58, wt68, wt78;
  wire signed [4:0] wt49, wt59, wt69, wt79;

assign out0 = a8;
assign out1 = a9;
  
//First MAC Layer's signed weights
assign wt04 = w04;
assign wt14 = w14;
assign wt24 = w24;
assign wt34 = w34;
assign wt05 = w05;
assign wt15 = w15;
assign wt25 = w25;
assign wt35 = w35;
assign wt06 = w06;
assign wt16 = w16;
assign wt26 = w26;
assign wt36 = w36;
assign wt07 = w07;
assign wt17 = w17;
assign wt27 = w27;
assign wt37 = w37;
  
//Second MAC Layer's signed weights
assign wt48 = w48;
assign wt58 = w58;
assign wt68 = w68;
assign wt78 = w78;

assign wt49 = w49;
assign wt59 = w59;
assign wt69 = w69;
assign wt79 = w79;

//Intermediate Output Values Returned
assign Y4 = w4_relu;
assign Y5 = w5_relu;
assign Y6 = w6_relu;
assign Y7 = w7_relu;

reg stage1, stage2, stage3, stage4, stage5, stage6;

always@(posedge clk) begin
	//Stage - 1

	if(in_ready) begin
		w0 <= x0 + fA0 + fB0;
		w1 <= x1 + fA1 + fB1;
		w2 <= x2 + fA2 + fB2;
		w3 <= x3 + fA3 + fB3;	
		stage1 <= 1'b1;
	end
	else begin
		stage1 <= 1'b0;	
	end

	//Stage - 2
	if(stage1 && in_ready) begin
      w4 <= (w0*wt04) + (w3*wt34) + (w2*wt24) + (w1*wt14);
      w5 <= (w0*wt05) + (w3*wt35) + (w2*wt25) + (w1*wt15);
      w6 <= (w0*wt06) + (w3*wt36) + (w2*wt26) + (w1*wt16);
      w7 <= (w0*wt07) + (w3*wt37) + (w2*wt27) + (w1*wt17);
		stage2 <= 1'b1;
	end
	else begin
		stage2 <= 1'b0;	
	end

	//Stage - 3
	if(stage2 && in_ready) begin
		w4_relu <= (w4[13]==1'b1) ? 0 : w4;
		w5_relu <= (w5[13]==1'b1) ? 0 : w5;
		w6_relu <= (w6[13]==1'b1) ? 0 : w6;
		w7_relu <= (w7[13]==1'b1) ? 0 : w7;	
		stage3 <= 1'b1;
	end
	else begin
		stage3 <= 1'b0;	
	end

	//Stage - 4
	if(stage3 && in_ready) begin
		a4 <= w4_relu + A4 + B4;
		a5 <= w5_relu + A5 + B5;
		a6 <= w6_relu + A6 + B6;
		a7 <= w7_relu + A7 + B7;
		stage4 <= 1'b1;
	end
	else begin
		stage4 <= 1'b0;	
	end

	
	//Stage - 5
	if(stage4 && in_ready) begin
      w8 <= (a4*wt48) + (a5*wt58) + (a6*wt68) + (a7*wt78);
      w9 <= (a4*wt49) + (a5*wt59) + (a6*wt69) + (a7*wt79);	
		stage5 <= 1'b1;
	end
	else begin
		stage5 <= 1'b0;	
	end

	//Stage - 6
	if(stage5 && in_ready) begin
		a8 <= w8;
		a9 <= w9;	
		stage6 <= 1'b1;
	end
	else begin
		stage6 <= 1'b0;	
	end
end

assign out0_ready = stage6;
assign out1_ready = stage6;

endmodule 