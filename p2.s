L0: addi t0, x0, 10
    lui t1, 0x80000
L1: slli t2, t0, 2
    add t3, t1, t2
    sw t0, 0(t3)
    addi t0, t0, -1
    bgez t0, L1
    jal x0, L0
