// Structural PG wrapper. Analog leaf is CF_CLK_DLY5_core.
// Customer rails are vpwr/vgnd; well taps vpb/vnb/vpbe are tied inside.
module CF_CLK_DLY5 (
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
    input vpwr;
    output vpwri;
    CF_CLK_DLY5_core u_core (
        .clk(clk),
        .SEL0(SEL0),
        .SEL1(SEL1),
        .SEL2(SEL2),
        .SEL3(SEL3),
        .SEL4(SEL4),
        .clkin(clkin),
        .clkmode(clkmode),
        .clksel(clksel),
        .ctrim0(ctrim0),
        .ctrim1(ctrim1),
        .iref(iref),
        .isel(isel),
        .pd(pd),
        .reset(reset),
        .sleep(sleep),
        .trim(trim),
        .vgnd(vgnd),
        .vnb(vgnd),
        .vpb(vpwr),
        .vpwr(vpwr),
        .vpwri(vpwri)
    );
endmodule
