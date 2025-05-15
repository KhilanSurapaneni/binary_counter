module ucsbece152a_counter_tb();
// Parameters
parameter WIDTH = 3;
// Create clock signal
logic clk = 0;
always #(10) clk = ~clk; // flip `clk` every 10 timesteps
// Instantiate counter nets
logic rst;
logic [WIDTH-1:0] count;
logic [6:0] seven_segment_display_o;
logic enable; 
logic dir; 
// Instantiate the "Design Under Test"
ucsbece152a_counter #(
  .WIDTH(WIDTH)
) DUT (
  .clk(clk),
  .rst(rst),
  .count_o(count),
// part 2
  .enable_i(enable),
  .dir_i(dir)
);


ucsbece152a_ssdd ssdd (
  .data_i(count),
  .seven_segment_display_o(seven_segment_display_o)
);

// Simulation
integer i;
initial begin
$display( "Begin simulation.");

//\\ =========================== \\//

// Initialize counter
rst = 1;
enable = 0;
dir = 0;
@(negedge clk);

// Turn off rst to enable counting
rst = 0;

// Count 16 times
for (i = 0 ; i < 16; i++) begin
  if (count != i%(2**WIDTH))
    $display(
      "Error: expected %d, received %d",
      $unsigned(i), count
    );
  @(negedge clk);
end

// Test reset
rst = 1;
@(negedge clk);
if (count != 0)
  $display("Error: expected %d, received %d", 0, count);
rst = 0;

//decrement test and enable test - Part 2
//\\ =========================== \\//
//@(negedge clk);
//Flip direction
dir = 1;

// Count 16 times for decremention
for (i = 15 ; i > -1; i--) begin
  if (count != i%(2**WIDTH))
    $display(
      "Error: expected %d, received %d",
      $unsigned(i), count
    );
  @(negedge clk);
end

//reset
rst = 1;
@(negedge clk);
if (count != 0)
  $display("Error: expected %d, received %d", 0, count);
rst = 0;

//two clock cycles for decremention
for (i = 15 ; i > 13; i--) begin
  if (count != i%(2**WIDTH))
    $display(
      "Error: expected %d, received %d",
      $unsigned(i), count
    );
  @(negedge clk);
end

//test enable
enable=1;
//two clock cycles to visually confirm the holding of previous state
for (i = 15 ; i > 13; i--) begin
  @(negedge clk);
end


//test enable with reset
rst = 1;
@(negedge clk);
if (count != 0)
  $display("Error: expected %d, received %d", 0, count);
rst = 0;





$display( "End simulation.");
$stop;
end

endmodule

