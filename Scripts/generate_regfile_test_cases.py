from random import randint
import os,binascii


reset_tb_in = 0
read_register_1_tb_in = ""
read_register_2_tb_in = ""
write_register_tb_in = ""
write_data_tb_in = ""
reg_write_tb_in = ''
pc_write_tb_in = ''
counter_bit_tb_in = ''
cpsr_set_bit_in = ''
wait = "wait for 50 ns;\n\n"
reset = "reset_tb_in <= '0';\n"
total_time = 0

register_list = ["00000","00001","00010","00011","00100","00101","00110","00111","01000","01001","01010","01011","01100","01101","01110","01111","10000","10001","10010","10011","10100","10101","10110","10111","11000","11001","11010","11011","11100","11101","11110","11111"]
read_1_register_list = ["00000","00001","00010","00011","00100","00101","00110","00111","01000","01001","01010","01011","01100","01101","01110","01111","10000","10001","10010","10011","10100","10101","10110","10111","11000","11001","11010","11011","11100","11101","11110","11111"]
read_2_register_list = ["00000","00001","00010","00011","00100","00101","00110","00111","01000","01001","01010","01011","01100","01101","01110","01111","10000","10001","10010","10011","10100","10101","10110","10111","11000","11001","11010","11011","11100","11101","11110","11111"]
# Generate cases for random reads and write_register_tb_in
tb_text = open("register_file_tb_text.txt",'w')
tb_text.write("-----------------------------------------------\n--------------Random Reads/Writes--------------\n-----------------------------------------------\n\n")
for i in range (0,len(register_list)):
    # Generating random values
    write_data_in = str(binascii.b2a_hex(os.urandom(4))).upper()
    read_register_1_tb_in = read_1_register_list[randint(0,31)]
    read_register_2_tb_in = read_2_register_list[randint(0,31)]

    # Generating auto comments
    tb_text.write("-- Write Register: "+ register_list[i] +", Write Data: "+ write_data_in +"\n")
    tb_text.write("-- Read Register 1: "+ read_register_1_tb_in + ", Read Register 2: "+ read_register_2_tb_in +"\n")
    # Test case generation
    tb_text.write(reset)
    tb_text.write("read_register_1_tb_in <= \""+ read_register_1_tb_in +"\";\n")
    tb_text.write("read_register_2_tb_in <= \""+ read_register_2_tb_in +"\";\n")
    tb_text.write("write_register_tb_in <= \""+ register_list[i] +"\";\n")
    tb_text.write("write_data_tb_in <= x\""+ write_data_in +"\";\n")
    tb_text.write("reg_write_tb_in <= '1';\n")
    tb_text.write("pc_write_tb_in <= '0';\n")
    tb_text.write("counter_bit_tb_in <= '0';\n")
    tb_text.write("cpsr_set_bit_tb_in <= '0';\n")
    tb_text.write(wait)
    total_time += 50

tb_text.write("-----------------------------------------------\n--------------Extra Reads--------------\n-----------------------------------------------\n\n")

for reg in read_1_register_list:
    read_register_1_tb_in = read_1_register_list[randint(0,31)]
    read_register_2_tb_in = read_2_register_list[randint(0,31)]
    # Generating auto comments
    tb_text.write("-- Read Register 1: "+ read_register_1_tb_in + ", Read Register 2: "+ read_register_2_tb_in +"\n")
    # Test case generation
    tb_text.write(reset)
    tb_text.write("read_register_1_tb_in <= \""+ read_register_1_tb_in +"\";\n")
    tb_text.write("read_register_2_tb_in <= \""+ read_register_2_tb_in +"\";\n")
    tb_text.write("write_register_tb_in <= \""+ register_list[i] +"\";\n")
    tb_text.write("write_data_tb_in <= x\"00000000\";\n")
    tb_text.write("reg_write_tb_in <= '0';\n")
    tb_text.write("pc_write_tb_in <= '0';\n")
    tb_text.write("counter_bit_tb_in <= '0';\n")
    tb_text.write("cpsr_set_bit_tb_in <= '0';\n")
    tb_text.write(wait)
    total_time += 50

print "Total Sim Time: ", total_time + 25, " ns"
