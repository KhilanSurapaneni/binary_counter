module ucsbece152a_counter #(
  parameter WIDTH = 3
) (
    input logic clk,
    input logic rst, 
    output logic [WIDTH-1:0] count_o,
    
    //part-2
    input logic enable_i, 
    input logic dir_i
);

logic [WIDTH-1:0] max = '1;
//flip-flop logic
always_ff @(posedge clk or posedge rst or posedge enable_i or posedge dir_i) begin
  if(rst) begin
    count_o <= '0;
  end else begin
    count_o <= count_o;
    if(enable_i)begin
      count_o <= count_o;
    end else if(!dir_i) begin
      // incrementing logic here
      if(count_o == max) begin
        count_o <= '0;
      end else begin  
        count_o <= count_o + 1;
      end
    end else begin
      //decrementing logic here
      if(count_o == 0) begin
        count_o <= '1;
      end else begin  
        count_o <= count_o - 1;
      end
    end
  end
end



endmodule
