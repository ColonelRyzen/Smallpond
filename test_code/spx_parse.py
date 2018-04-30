import sys
import os

char_counter = 0
word = ""
address = 0

if sys.argv[1] == "-coe":
    filename = sys.argv[2]
    output_file = sys.argv[3]
    with open(filename, "r") as f:
        with open(output_file, "w") as o:
            o.write("; This .COE file specifies initialization values for a block\n")
            o.write("; memory of depth=1024, and width=32. In this case, values are\n")
            o.write("; specified in hexadecimal format.\n")
            o.write("memory_initialization_radix=16;\n")
            o.write("memory_initialization_vector=\n")
            for line in f:
                for char in line:
                    if char_counter < 8:
                        word += str(char)
                        print char," : ",char_counter
                        char_counter += 1
                    else:
                        char_counter = 1
                        o.write(word + ',' + '\n')
                        #print word
                        word = char
            o.write(";")
        o.close()
    f.close()

elif sys.argv[1] == "-l":
    from dbg import cpu
    filename = sys.argv[2]
    with open(filename, "r") as f:
        for line in f:
            for char in line:
                if char_counter != 8:
                    word += str(char)
                    char_counter += 1
                    #print char_counter
                else:
                    char_counter = 0
                    print(hex(int("{:08x}".format(address),16)),hex(int(word,16)))
                    cpu.write_mem_word(int("{:08x}".format(address),16), int(word,16))
                    address += 4
                    #print word
                    word = ""

elif sys.argv[1] == "-help":
    print ("To generate a memory coefficients file add -coe as argument 1.")
    print ("Example: \'python3 spx_parse.py -coe input_file.spx output_file.coe\'")
    print ("To push memory to the board add -l as argument 1\n")
    print ("Example: \'python3 spx_parse.py -l input_file.spx")
    print ("If only an input file is given then it will print the output.")

else:
    filename = sys.argv[1]
    with open(filename, "r") as f:
        for line in f:
            for char in line:
                if char_counter != 8:
                    word += str(char)
                    char_counter += 1
                    #print char_counter
                else:
                    char_counter = 0
                    print (word)
                    word = ""
    f.close()
