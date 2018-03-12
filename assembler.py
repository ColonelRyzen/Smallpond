import os
import sys
import time

#Instruction mnemonics by type
a_type = {"ADD":"000001","AND":"000010","ASR":"000011","LSL":"000100","LSR":"000101","NAND":"000110","NOR":"000111","NOT":"001000","OR":"001001","SUB":"001010","XNOR":"001011","XOR":"001100"}

i_type = {"ADDI":"011000","ANDI":"011001","ASRI":"011010","LDR":"011011","LDRB":"011100","LDRBU":"011101","LDRH":"011110","LDRHU":"011111","LSLI":"100000","LSRI":"100001","LUI":"100010","NANDI":"100011","NORI":"100100","ORI":"100101","STR":"100110","STRB":"100111","STRH":"101000","SUBI":"101001","XNORI":"101010","XORI":"101011"}

j_type = {"J":"111111"}

b_type = {"B":"111100","BL":"111101","BR":"111110"}

#Register names to values

registers = {"r0":"00000","r1":"00001","r2":"00010","r3":"00011","r4":"00100","r5":"00101","r6":"00110","r7":"00111","r8":"01000","r9":"01001","r10":"01010","r11":"01011","r12":"01100","r13":"01101","r14":"01110","r15":"01111","r16":"10000","r17":"10001","r18":"10010","r19":"10011","r20":"10100","r21":"10101","r22":"10110","r23":"10111","r24":"11000","r25":"11001","r26":"11010","r27":"11011","r28":"11100","r29":"11101","r30":"11110","r31":"11111"}

#Condition Codes
cond_codes = {"AL":"0000","EQ":"0001","NE":"0010","CA":"0011","CC":"0100","NG":"0101","PZ":"0110","VS":"0111","VC":"1000","HI":"1001","LS":"1010","GE":"1011","LT":"1100","GT":"1101","LE":"1110"}



filename = sys.argv[1]


file = open(filename,"r")
lines = file.readlines()

bin_outfile = open("binary_output.txt","w")
hex_outfile = open("hex_output.txt","w")

bin_instruction = ""
hex_instruction = ""
s_bit = ''
c_bit = ''

for line in lines:
    bin_instruction = ""
    hex_instruction = ""
    if len(line.strip()) != 0:
        # line = line.strip('\n')
        line = line.split(' ')

        # Check for instruction type
        if line[0] in a_type:
            print "a_type"
            # Check for the S and C bit based on length of mnemonic
            # OR ending with EITHER S or C
            if len(line[0]) == 3:
                # Check for S bit
                if line[0].endswith("S"):
                    s_bit = '1'
                    c_bit = '0'
                elif line[0].endswith("C"):
                    c_bit = '1'
                    s_bit = '0'
                else:
                    s_bit = '0'
                    c_bit = '0'

            # OR ending with SC or CS
            elif len(line[0]) == 4 and line[0][:1] == "OR":
                if line[0].endswith("SC") or line[0].endswith("CS"):
                    s_bit = '1'
                    c_bit = '1'
                else:
                    s_bit = '0'
                    c_bit = '0'

            # Other instructions that are not OR ending with EITHER S or C
            elif len(line[0]) == 4 and line[0][:1] != "OR":
                if line[0].endswith("S"):
                    s_bit = '1'
                    c_bit = '0'
                elif line[0].endswith("C"):
                    c_bit = '1'
                    s_bit = '0'
                else:
                    s_bit = '0'
                    c_bit = '0'

            # Not NAND and XNOR ending with SC or CS
            elif len(line[0]) == 5 and (line[0][:3] != "NAND" and line[0][:3] != "XNOR"):
                if line[0].endswith("SC") or line[0].endswith("CS"):
                    s_bit = '1'
                    c_bit = '1'
                else:
                    s_bit = '0'
                    c_bit = '0'

            # NAND or XNOR ending with EITHER S or C
            elif len(line[0]) == 5 and (line[0][:3] == "NAND" or line[0][:3] == "XNOR"):
                if line[0].endswith("S"):
                    s_bit = '1'
                    c_bit = '0'
                elif line[0].endswith("C"):
                    c_bit = '1'
                    s_bit = '0'
                else:
                    s_bit = '0'
                    c_bit = '0'

            # NAND or XNOR ending with SC or CS
            elif len(line[0]) == 6 and (line[0][:3] == "NAND" or line[0][:3] == "XNOR"):
                if line[0].endswith("SC") or line[0].endswith("CS"):
                    s_bit = '1'
                    c_bit = '1'
                else:
                    s_bit = '0'
                    c_bit = '0'

            print s_bit
            print c_bit
        elif line[0] in i_type:

            print "i_type"
        elif line[0] in b_type:
            if (len(line[0]) == 2 and line[0][1] == 'C') or len(line[0] == 3):
                c_bit = '1'
            else:
                c_bit = '0'

            print "b_type"
        elif line[0] in j_type:
            if line[1].startswith("#"):
                immediate = int(line[1][1:].strip('\n'))
                immediate = bin(immediate).zfill(25)
            elif line[1].startswith("0x")
                immediate = bin(int(line[1][2:].strip('\n'),16)).zfill(25)
            bin_instruction = j_type[line[0]] + str(immediate)
            print "j_type"
            #print token
        #print line
    else:
        continue

file.close()
bin_outfile.close()
hex_outfile.close()
