// Code your design here
module mux(a,b,s0,y);
  input a,b, s0;
  output logic y;
  always @ * begin
    case(s0) 
      0:y=a;
      1:y=b;
    endcase
  end
endmodule
