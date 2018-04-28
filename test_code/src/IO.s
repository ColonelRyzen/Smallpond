MAIN    ADDI R5, R0, #0xFFFF
        LSLI R5, R5, #0xF
        ADDI R5, R5, #0xFFFF
        ADDI R4, R0, #0xFFFF
        STR R4, R5, #0
        SUBI R5, R5, #4
        ADDI R6, R0, #0x0FFF
        STR R6, R5, #0
