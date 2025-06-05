# Example RISC-V assembly program used
# during the development of our own
# processors at step nine

L0: addi t0, x0, 10     # Load the constant 10 into t0
    lui t1, 0x80000     # *** Load the address 0x80000000 into t1
L1: nop                 # ***
    nop                 # ***
    sb t0, 0(t1)        # *** Write t0 to FPGA board leds
    addi t0, t0, -1     # Decrement t0 
    bge t0, x0, L1      # If t0 >= 0 then go to L1
    jal x0, L0          # *** Start over!
    