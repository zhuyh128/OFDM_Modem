    
// -----------------------------------------------------------------------------
// Copyright (c) 2018 All rights reserved
// -----------------------------------------------------------------------------
// Author : Miyutin & Petrovsky 
// File   : counter_rom.v
// Create : 2018-12-21 14:59:07
// Editor : sublime text3, tab size (4)
// -----------------------------------------------------------------------------
module counter_rom
(   
	input clk, en, rst, ready_in,
	output reg [9:0] addr
);
  
initial
begin
	addr = 0;
end

always @(posedge clk or posedge rst) 
begin
	if (rst) addr <= 0;
	else if(addr == 10'd1023) addr <= 0;
	else if(en && ready_in) addr <= addr + 1; 
	else addr <= addr;
end

endmodule

