# Example RISC-V assembly program used
# during the development of our own
# processors

    addi t0, x0, 10     # Load the constant 10 into t0
    lui t1, 0x1         # Load the address 0x1000 into t1
L1: slli t2, t0, 2      # Put 4 * t0 into t2
    add t3, t1, t2      # Put t1 + t2 = 0x1000 + 4 * t0 into t3
    sw t0, 0(t3)        # Store t0 in memory at address t3
    addi t0, t0, -1     # Decrement t0 
    bge t0, x0, L1      # If t0 >= 0 then go to L1
L2: jal x0, L2          # Finally get stuck here
    