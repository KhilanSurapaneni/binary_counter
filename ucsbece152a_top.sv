module ucsbece152a_top(
  input logic clk,
  input logic rst,
  input logic enable_i,
  input logic dir_i,
  output logic [6:0] seven_segment_display_o
);

logic [2:0] count;

ucsbece152a_counter #(
  .WIDTH(3)
) counter (
  .clk(clk),
  .rst(rst),
  .count_o(count),
  .enable_i(enable_i),
  .dir_i(dir_i)
);

ucsbece152a_ssdd ssdd (
  .data_i(count),
  .seven_segment_display_o(seven_segment_display_o)
);

endmodule