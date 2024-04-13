`timescale 1ns / 1ps
///////////////////////////////////////////////////////////
// Project Code		:	JP_24001
// Author			:	Surya Narayana Rangavajhala
// 
// Creation Date 	:	13.04.2024 21:59:00
// Design Name		:	I2C Protocol
// Module Name		:	i2c_master
// Version			:	1.0.0
// Target Device	:	None
// Tool Version		:	Standalone source
// Description		:	I2C Protocol - Master module
///////////////////////////////////////////////////////////

module i2c_master #(SPEED=0) (
	input iclk, rst, tx, 
	input [7:0] wdata,   	//8 bit write data
	input [6:0] addr,  		//7 bit address of slave
	inout sda,
	output reg [7:0] rdata, //8 bit read data
	output reg scl
);
	// i2c_Speed
	localparam 
		100Kbps = 0,
		400Kbps = 1,
		1Mbps 	= 2,
		3.3Mbps = 3,
		5Mbps	= 4;
	
	// i2c_state
	localparam 
		idle		= 0, 	// Idle state
		start		= 1, 	// Start of Operation
		transmit	= 2,	// A transmit counter state. Bit by bit operation.
		wr_ack		= 3,	// Check for Ack from slave.
		write		= 1,
		read		= 2;
		
	// Registers
	wr_en = 1; // Active Low
	rd_en = 0; 
	
	// Reset Logic
	always @(posedge rst) begin
		sda = 1'b1;
		scl = 1'b1;
	end
	
	// Serial Clock Generation
	always @(*) begin
		
	end

endmodule