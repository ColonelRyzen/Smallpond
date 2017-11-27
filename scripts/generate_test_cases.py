import os
from random import randint

# This script is used to generate the text for the control unit test bench
# The first instruction will be added manually to allow for the extra 5ns needed for signal settle

op_code_tb_in = ""
reset_tb_in = 0
cpsr_bits_tb_in = ""
counter_bit_tb_in = 0
cpsr_set_bit_tb_in = 0
condition_code_tb_in = ""
wait = "wait for 50 ns;\n\n"
reset = "reset_tb_in <= '0';\n"
condition_t_or_f = True
total_sim_time = 20
number_A_test_cases = 0
number_I_test_cases = 0
number_J_test_cases = 0
number_B_test_cases = 0
number_test_cases = 0

instr_a_type = ["000001","000010","000011","000100","000101","000110","000111","001000","001001","001010","001011","001100"]
instr_a_name = ["ADD","AND","ASR","LSL","LSR","NAND","NOR","NOT","OR","SUB","XNOR","XOR"]
instr_i_type = ["011000","011001","011010","011011","011100","011101","011110","011111","100000","100001","100010","100011","100100","100101","100110","100111","101000","101001","101010","101011"]
instr_i_name = ["ADDI","ANDI","ASRI","LDR","LDRB","LDRBU","LDRH","LDRHU","LSLI","LSRI","LUI","NANDI","NORI","ORI","STR","STRB","STRH","SUBI","XNORI","XORI"]
instr_j_type = ["111111"] # list isn't needed, but it keeps script format standard and easily expandable
instr_j_name = ["J"]
instr_b_type = ["111100","111101","111110"]
instr_b_name = ["B","BL","BR"]

# Z set, C set, N set, V set, Z,C,N,V clear, N Set and V set
# C set && Z clear = 1
# Z set || C clear = 0,2,3,4,5
# N==V = 4 || 5
# N!=V = 2 || 3
# Z==0 && N==V = 4 || 5
# Z==1 || N!=V = 0,2,3
cpsr_bits = ["0100","0010","1000","0001","0000","1001"]

condition_codes = ["0000","0001","0010","0011","0100","0101","0110","0111","1000","1001","1010","1011","1100","1101","1110"]
condition_names = ["AL","EQ","NE","CA","CC","NG","PZ","VS","VC","HI","LS","GE","LT","GT","LE"]
# Generating A type tests
# format is
# instruction
#   condition
#       TRUE
#           counter
#           cpsr_set
#       FALSE
#           counter
#           cpsr_set

tb_text = open("control_unit_tb_text.txt",'w')
# loop thorugh all a type instructions
for a_instr in range (0,len(instr_a_type)):
    for cond in range (0,len(condition_codes)):
        for counter in range(0,2):
            for cpsr in range (0,2):
                number_A_test_cases += 1
                if condition_t_or_f == True:
                    # Condition is true
                    # Writing comment line
                    tb_text.write("--" + instr_a_name[a_instr] + ", Cond: " + condition_names[cond] + ", TRUE, Count: " + str(counter) + ", CPSR_set: " + str(cpsr) + "\n")
                    # Writing the reset line
                    tb_text.write(reset)
                    # Writing the opcode
                    tb_text.write("op_code_tb_in <= \"" + instr_a_type[a_instr] + "\";\n")
                    # Writing the condition code line
                    tb_text.write("condition_code_tb_in <= \"" + condition_codes[cond] + "\";\n")
                    # Writing the cpsr bits line depending on the condition code
                    if cond == "0000":                  # ALWAYS
                        tb_text.write("cpsr_bits_tb_in <= \"" + cpsr_bits[randint(0,5)] + "\";\n")
                    elif cond == "0001":             # EQUAL
                        tb_text.write("cpsr_bits_tb_in <= \"" + cpsr_bits[0] + "\";\n")
                    elif cond == "0010":             # NOT EQUAL
                        tb_text.write("cpsr_bits_tb_in <= \"" + cpsr_bits[4] + "\";\n")
                    elif cond == "0011":             # CARRY SET
                        tb_text.write("cpsr_bits_tb_in <= \"" + cpsr_bits[1] + "\";\n")
                    elif cond == "0100":             # CARRY CLEAR
                        tb_text.write("cpsr_bits_tb_in <= \"" + cpsr_bits[4] + "\";\n")
                    elif cond == "0101":             # NEGATIVE
                        tb_text.write("cpsr_bits_tb_in <= \"" + cpsr_bits[2] + "\";\n")
                    elif cond == "0110":             # POSITIVE OR ZERO
                        tb_text.write("cpsr_bits_tb_in <= \"" + cpsr_bits[4] + "\";\n")
                    elif cond == "0111":             # OVERFLOW SET
                        tb_text.write("cpsr_bits_tb_in <= \"" + cpsr_bits[3] + "\";\n")
                    elif cond == "1000":             # OVERFLOW CLEAR
                        tb_text.write("cpsr_bits_tb_in <= \"" + cpsr_bits[4] + "\";\n")
                    elif cond == "1001":             # UNSIGNED HIGHER
                        tb_text.write("cpsr_bits_tb_in <= \"" + cpsr_bits[1] + "\";\n")
                    elif cond == "1010":             # UNSIGNED LOWER OR SAME
                        ls_true_list = [0,2,3,4,5]
                        tb_text.write("cpsr_bits_tb_in <= \"" + cpsr_bits[ls_true_list[randint(0,4)]] + "\";\n")
                    elif cond == "1011":             # SIGNED GREATER THAN OR EQUAL
                        ge_true_list = [0,1,2,3]
                        tb_text.write("cpsr_bits_tb_in <= \"" + cpsr_bits[ge_true_list[randint(0,3)]] + "\";\n")
                    elif cond == "1100":             # SIGNED LESS THAN
                        lt_true_list = [0,1,4,5]
                        tb_text.write("cpsr_bits_tb_in <= \"" + cpsr_bits[lt_true_list[randint(0,3)]] + "\";\n")
                    elif cond == "1101":             # SIGNED GREATER THAN
                        gt_true_list = [0,1,2,3]
                        tb_text.write("cpsr_bits_tb_in <= \"" + cpsr_bits[gt_true_list[randint(0,3)]] + "\";\n")
                    elif cond == "1110":             # SIGNED LESS THAN OR EQUAL
                        le_true_list = [1,4,5]
                        tb_text.write("cpsr_bits_tb_in <= \"" + cpsr_bits[le_true_list[randint(0,2)]] + "\";\n")

                    # Writing the counter bit line
                    tb_text.write("counter_bit_tb_in <= \'" + str(counter) + "\';\n")
                    # Writing the cpsr set bit line
                    tb_text.write("cpsr_set_bit_tb_in <= \'" + str(cpsr) + "\';\n")
                    # write wait line
                    tb_text.write(wait)
                    condition_t_or_f = False
                    total_sim_time += 50
                else:
                    # Conditon is false
                    # Writing comment line
                    tb_text.write("--" + instr_a_name[a_instr] + ", Cond: " + condition_names[cond] + ", FALSE, Count: " + str(counter) + ", CPSR_set: " + str(cpsr) + "\n")
                    # Writing the reset line
                    tb_text.write(reset)
                    # Writing the opcode
                    tb_text.write("op_code_tb_in <= \"" + instr_a_type[a_instr] + "\";\n")
                    # Writing the condition code line
                    tb_text.write("condition_code_tb_in <= \"" + condition_codes[cond] + "\";\n")
                    # Writing the cpsr bits line depending on the condition code
                    if cond == "0000":                  # ALWAYS (Can't be false, nothing changes)
                        tb_text.write("cpsr_bits_tb_in <= \"" + cpsr_bits[randint(0,5)] + "\";\n")
                    elif cond == "0001":             # EQUAL
                        tb_text.write("cpsr_bits_tb_in <= \"" + cpsr_bits[4] + "\";\n")
                    elif cond == "0010":             # NOT EQUAL
                        tb_text.write("cpsr_bits_tb_in <= \"" + cpsr_bits[0] + "\";\n")
                    elif cond == "0011":             # CARRY SET
                        tb_text.write("cpsr_bits_tb_in <= \"" + cpsr_bits[4] + "\";\n")
                    elif cond == "0100":             # CARRY CLEAR
                        tb_text.write("cpsr_bits_tb_in <= \"" + cpsr_bits[1] + "\";\n")
                    elif cond == "0101":             # NEGATIVE
                        tb_text.write("cpsr_bits_tb_in <= \"" + cpsr_bits[4] + "\";\n")
                    elif cond == "0110":             # POSITIVE OR ZERO
                        tb_text.write("cpsr_bits_tb_in <= \"" + cpsr_bits[2] + "\";\n")
                    elif cond == "0111":             # OVERFLOW SET
                        tb_text.write("cpsr_bits_tb_in <= \"" + cpsr_bits[4] + "\";\n")
                    elif cond == "1000":             # OVERFLOW CLEAR
                        tb_text.write("cpsr_bits_tb_in <= \"" + cpsr_bits[3] + "\";\n")
                    elif cond == "1001":             # UNSIGNED HIGHER
                        hi_false_list = [1,2,3,4,5]
                        tb_text.write("cpsr_bits_tb_in <= \"" + cpsr_bits[hi_false_list[randint(0,4)]] + "\";\n")
                    elif cond == "1010":             # UNSIGNED LOWER OR SAME
                        tb_text.write("cpsr_bits_tb_in <= \"" + cpsr_bits[1] + "\";\n")
                    elif cond == "1011":             # SIGNED GREATER THAN OR EQUAL
                        ge_false_list = [4,5]
                        tb_text.write("cpsr_bits_tb_in <= \"" + cpsr_bits[ge_false_list[randint(0,1)]] + "\";\n")
                    elif cond == "1100":             # SIGNED LESS THAN
                        lt_false_list = [2,3]
                        tb_text.write("cpsr_bits_tb_in <= \"" + cpsr_bits[lt_false_list[randint(0,1)]] + "\";\n")
                    elif cond == "1101":             # SIGNED GREATER THAN
                        gt_false_list = [4,5]
                        tb_text.write("cpsr_bits_tb_in <= \"" + cpsr_bits[gt_false_list[randint(0,1)]] + "\";\n")
                    elif cond == "1110":             # SIGNED LESS THAN OR EQUAL
                        le_false_list = [0,2,3]
                        tb_text.write("cpsr_bits_tb_in <= \"" + cpsr_bits[le_false_list[randint(0,2)]] + "\";\n")

                    # Writing the counter bit line
                    tb_text.write("counter_bit_tb_in <= \'" + str(counter) + "\';\n")
                    # Writing the cpsr set bit line
                    tb_text.write("cpsr_set_bit_tb_in <= \'" + str(cpsr) + "\';\n")
                    # write wait line
                    tb_text.write(wait)
                    condition_t_or_f = True
                    total_sim_time += 50

print "Number of A cases: ", number_A_test_cases
#print "Total Sim Time: ", total_sim_time, " ns"

tb_text.write("-----------------------------------------------\n--------------I Type Instructions--------------\n-----------------------------------------------\n\n")
# Loop through all I type instructions
for i_instr in range (0,len(instr_i_type)):
    # Writing comment line
    tb_text.write("--" + instr_i_name[i_instr] + "\n")
    # Writing the reset line
    tb_text.write(reset)
    # Writing opcode
    tb_text.write("op_code_tb_in <= \"" + instr_i_type[i_instr] + "\";\n")
    tb_text.write(wait)
    number_I_test_cases += 1
    total_sim_time += 50

print "Number of I cases: ", number_I_test_cases
#print "Total Sim Time: ", total_sim_time, " ns"

tb_text.write("-----------------------------------------------\n--------------J Type Instructions--------------\n-----------------------------------------------\n\n")
# Writing Jump instruction
tb_text.write("--J\n")
tb_text.write(reset)
tb_text.write("op_code_tb_in <= \"" + instr_j_type[0] + "\";\n")
tb_text.write(wait)
number_J_test_cases += 1
total_sim_time += 50

print "Number of J cases: ", number_J_test_cases
print "Total Sim Time: ", total_sim_time, " ns"

tb_text.close()
