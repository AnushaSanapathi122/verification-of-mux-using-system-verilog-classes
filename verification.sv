// Code your testbench here
// or browse Examples


// INTERFACE

interface fa_if;
    logic a,b,s0;
    logic y;
endinterface

// TRANSACTION

class transaction;
    rand bit a,b,s0;
    bit y;
endclass


// GENERATOR

class generator;

    mailbox gen2drv;

    function new(mailbox gen2drv);
        this.gen2drv = gen2drv;
    endfunction

    task run();
        transaction tr;
        repeat(4) begin
            tr = new();
            if (!tr.randomize())
                $fatal("Randomization Failed");
            gen2drv.put(tr);
        end
    endtask

endclass


// DRIVER

class driver;

    virtual fa_if vif;
    mailbox gen2drv;

    function new(virtual fa_if vif, mailbox gen2drv);
        this.vif = vif;
        this.gen2drv = gen2drv;
    endfunction

    task run();
        transaction tr;
      repeat(4) begin
            gen2drv.get(tr);
            vif.a = tr.a;
            vif.b = tr.b;
            vif.s0 = tr.s0;
            #5;
        end
    endtask

endclass

// MONITOR

class monitor;

    virtual fa_if vif;
    mailbox mon2scb;

    function new(virtual fa_if vif, mailbox mon2scb);
        this.vif = vif;
        this.mon2scb = mon2scb;
    endfunction

    task run();
        transaction tr;
      repeat(4) begin
            #6;
            tr = new();
            tr.a = vif.a;
            tr.b = vif.b;
            tr.s0 = vif.s0;
            tr.y = vif.y;
            mon2scb.put(tr);
        end
    endtask

endclass



// SCOREBOARD

class scoreboard;

    mailbox mon2scb;

    function new(mailbox mon2scb);
        this.mon2scb = mon2scb;
    endfunction

    task run();
        transaction tr;
        bit exp_y;

      repeat(4) begin
            mon2scb.get(tr);

            exp_y   = tr.a&(~tr.s0)|tr.b&tr.s0;

            if (tr.y == exp_y)
                $display("PASS");
            else
                $display("FAIL");
        end
    endtask

endclass


// ENVIRONMENT
class environment;

    generator gen;
    driver drv;
    monitor mon;
    scoreboard scb;

    mailbox gen2drv;
    mailbox mon2scb;

    function new(virtual fa_if vif);

        gen2drv = new();
        mon2scb = new();

        gen = new(gen2drv);
        drv = new(vif, gen2drv);
        mon = new(vif, mon2scb);
        scb = new(mon2scb);

    endfunction

    task run();
        fork
            gen.run();
            drv.run();
            mon.run();
            scb.run();
        join
    endtask

endclass


// TOP TESTBENCH
module tb;

    fa_if vif();

    mux dut (
        .a(vif.a),
        .b(vif.b),
        .s0(vif.s0),
        .y(vif.y)
    );

    environment env;

    initial begin
        env = new(vif);
        env.run();
        #200;
        $finish;
    end

endmodule
