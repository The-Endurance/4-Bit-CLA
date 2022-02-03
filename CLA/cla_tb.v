`include "cla.v"

module cla_tb();

reg [3:0] a,b;
reg cin;
wire [3:0] s;
wire cout;

cla uut(
    .a(a),
    .b(b),
    .s(s),
    .cin(cin),
    .cout(cout)
);

initial begin
    $dumpfile("cla.vcd");
    $dumpvars(0,cla_tb);
    a = 4'b0;
    b = 4'b0;
    cin = 1'b0;

    #256 $finish;
end

always #1 a = a + 1;
always #16 b = b + 1;

endmodule
