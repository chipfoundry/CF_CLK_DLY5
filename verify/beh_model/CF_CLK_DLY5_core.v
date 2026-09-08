`timescale 1ns / 1ps

// Ideal functional model of analog leaf CF_CLK_DLY5_core.
// Drop this file in place of hdl/gl/CF_CLK_DLY5_core.v for simulation.
// Do not add it to OpenLane VERILOG_FILES.
//
// Assumed protocol (ideal, not silicon-verified):
//   * pd, sleep, or reset high → clk[4:0] = 0
//   * eleven taps; tap 0 is 2.5 ns, each later tap adds 1 ns
//   * SELn[3:0] picks tap 0–10 (values 11–15 clamp to 10)
//   * clksel low bypasses clkin onto clk[0] with no delay
//   * clkmode, ctrim*, trim, isel, and iref are ignored (no analog bias model)
// Power pins are present for netlist compatibility only.

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

    localparam real TAP0_DELAY_NS = 2.5;
    localparam real TAP_STEP_NS = 1.0;

    wire gated = pd | sleep | reset;
    reg [4:0] clk_r;
    real tap_delay_ns [0:4];

    assign clk = clk_r;
    assign vpwri = vpwr;

    function integer clamp_tap;
        input [3:0] sel;
        begin
            clamp_tap = (sel > 4'd10) ? 10 : sel;
        end
    endfunction

    always @(*) begin
        tap_delay_ns[0] = TAP0_DELAY_NS + TAP_STEP_NS * clamp_tap(SEL0);
        tap_delay_ns[1] = TAP0_DELAY_NS + TAP_STEP_NS * clamp_tap(SEL1);
        tap_delay_ns[2] = TAP0_DELAY_NS + TAP_STEP_NS * clamp_tap(SEL2);
        tap_delay_ns[3] = TAP0_DELAY_NS + TAP_STEP_NS * clamp_tap(SEL3);
        tap_delay_ns[4] = TAP0_DELAY_NS + TAP_STEP_NS * clamp_tap(SEL4);
        if (gated) begin
            clk_r = 5'b00000;
        end else begin
            clk_r[0] = clkin;
            clk_r[1] = clkin;
            clk_r[2] = clkin;
            clk_r[3] = clkin;
            clk_r[4] = clkin;
        end
    end
endmodule
