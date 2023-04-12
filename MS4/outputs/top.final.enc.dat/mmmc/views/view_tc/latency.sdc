set_clock_latency -source -early -max -rise  -114.012 [get_ports {clk}] -clock clk 
set_clock_latency -source -early -max -fall  -117.311 [get_ports {clk}] -clock clk 
set_clock_latency -source -late -max -rise  -114.012 [get_ports {clk}] -clock clk 
set_clock_latency -source -late -max -fall  -117.311 [get_ports {clk}] -clock clk 
