package utils;

    parameter int physAddrBits = 12;

    typedef enum logic[1:0] {_word, _half, _byte} dataWidth;

    typedef bit[6:0] opCode;

    localparam opCode opLd = 7'b0000011;

endpackage