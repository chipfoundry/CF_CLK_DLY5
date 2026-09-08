// Empty blackbox stub for hierarchical integration LVS.
module CF_CLK_DLY5_core (
    clk,
    SEL0,
    SEL1,
    SEL2,
    SEL3,
    SEL4,
    clkin,
    clkmode,
    clksel,
    ctrim0,
    ctrim1,
    iref,
    isel,
    pd,
    reset,
    sleep,
    trim,
    vgnd,
    vnb,
    vpb,
    vpwr,
    vpwri
);
    output [4:0] clk;
    input [3:0] SEL0;
    input [3:0] SEL1;
    input [3:0] SEL2;
    input [3:0] SEL3;
    input [3:0] SEL4;
    input clkin;
    input clkmode;
    input clksel;
    input ctrim0;
    input ctrim1;
    input iref;
    input isel;
    input pd;
    input reset;
    input sleep;
    input [4:0] trim;
    input vgnd;
    input vnb;
    input vpb;
    input vpwr;
    output vpwri;
endmodule
