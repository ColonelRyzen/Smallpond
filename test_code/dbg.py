from sys import platform
import glob
if platform == "linux" or platform == "linux2":
    #port = "ttyUSB1"
    port = glob.glob('/dev/ttyUSB[0-9]*')[0]
elif platform == "darwin":
    #port = "ttyUSB1"
    port = glob.glob('/dev/tty.*')
elif platform == "win32":
    port = ['COM%s' % (i + 1) for i in range(256)]
    #port = "COM"


import serial
import time


class smallpond:
    def __init__(self, port):
        self.ser = serial.Serial(port, 115200)
        self.get_regs()

    def read_reg(self, reg):
        self.ser.write(b'p')
        self.ser.write(bytes([reg]))
        return ord(self.ser.read()) << 24 | ord(self.ser.read()) << 16 | ord(self.ser.read()) << 8 | ord(self.ser.read())

    def write_reg(self, reg, val):
        self.ser.write(b'P')
        self.ser.write(bytes([reg, (val >> 24) & 0xFF, (val >> 16) & 0xFF ,(val >> 8) & 0xFF , val & 0xFF]))
        self.get_regs()

    def read_mem_byte(self, addr):
        self.ser.write(b'b')
        self.ser.write(bytes([(addr >> 24) & 0xFF, (addr >> 16) & 0xFF ,(addr >> 8) & 0xFF , addr & 0xFF]))
        return ord(self.ser.read())

    def write_mem_byte(self, addr, val):
        self.ser.write(b'B')
        self.ser.write(bytes([(addr >> 24) & 0xFF, (addr >> 16) & 0xFF ,(addr >> 8) & 0xFF , addr & 0xFF, val]))

    def read_mem_word(self, addr):
        self.ser.write(b'w')
        self.ser.write(bytes([(addr >> 24) & 0xFF, (addr >> 16) & 0xFF ,(addr >> 8) & 0xFF , addr & 0xFF]))
        return ord(self.ser.read()) << 24 | ord(self.ser.read()) << 16 | ord(self.ser.read()) << 8 | ord(self.ser.read())

    def write_mem_word(self, addr, val):
        self.ser.write(b'W')
        self.ser.write(bytes([(addr >> 24) & 0xFF, (addr >> 16) & 0xFF ,(addr >> 8) & 0xFF , addr & 0xFF]))
        self.ser.write(bytes([(val >> 24) & 0xFF, (val >> 16) & 0xFF ,(val >> 8) & 0xFF , val & 0xFF]))


    def dump_mem(self, begin, end, width=16):

        if (begin % width != 0):
            print('0x{:08x}:'.format(begin & ~(width-1)), end='')
            for x in range(begin & ~(width-1), begin,4):
                print('   ', end='')

        for addr in range(begin, end + 4, 4):
            if (addr % width == 0):
                print('\n0x{:08x}:'.format(addr), end='')
            elif (addr % 8 == 0):
                print(' ', end='')
            word = self.read_mem_word(addr)
            print(' {:08x}'.format(word), end='')
            if (addr % width == width - 1):
                print()
        print('\n')
        if (end % width != 0):
            print()

    def step(self):
        self.ser.write(b's')
        self.ser.read()
        self.ser.read()
        self.get_regs()

    def cont(self):
        self.ser.write(b'c')
        self.ser.read()
        self.get_regs()

    def set_bp(self, addr):
        self.ser.write(b'z')
        self.ser.write(bytes([addr >> 8, addr & 0xFF]))

    def del_bp(self):
        self.ser.write(b'd')

    def get_regs(self):
        self.register_dict = {}
        for i in range(0,32):
            self.register_dict[i]=self.read_reg(i)
        self.pc = self.register_dict[30]
        self.cpsr = self.register_dict[31]
        self.lr0 = self.register_dict[26]
        self.sp = self.register_dict[25]
        self.hp = self.register_dict[23]
        self.fp = self.register_dict[24]

    def jump(self, addr):
        self.write_reg(int("FE",16), int(addr,16))


    def print_regs(self):
        print('R0: 0x{:08x}'.format(self.register_dict[0]))
        print('Arg0: 0x{:08x}'.format(self.register_dict[1]))
        print('Arg1: 0x{:08x}'.format(self.register_dict[2]))
        print('Arg2: 0x{:08x}'.format(self.register_dict[3]))
        print('Arg3: 0x{:08x}'.format(self.register_dict[4]))
        print('T0: 0x{:08x}'.format(self.register_dict[5]))
        print('T1: 0x{:08x}'.format(self.register_dict[6]))
        print('T2: 0x{:08x}'.format(self.register_dict[7]))
        print('T3: 0x{:08x}'.format(self.register_dict[8]))
        print('T4: 0x{:08x}'.format(self.register_dict[9]))
        print('T5: 0x{:08x}'.format(self.register_dict[10]))
        print('T6: 0x{:08x}'.format(self.register_dict[11]))
        print('T7: 0x{:08x}'.format(self.register_dict[12]))
        print('S0: 0x{:08x}'.format(self.register_dict[13]))
        print('S1: 0x{:08x}'.format(self.register_dict[14]))
        print('S2: 0x{:08x}'.format(self.register_dict[15]))
        print('S3: 0x{:08x}'.format(self.register_dict[16]))
        print('S4: 0x{:08x}'.format(self.register_dict[17]))
        print('S5: 0x{:08x}'.format(self.register_dict[18]))
        print('+/-: 0x{:08x}'.format(self.register_dict[19]))
        print('+/-: 0x{:08x}'.format(self.register_dict[20]))
        print('C+: 0x{:08x}'.format(self.register_dict[21]))
        print('C-: 0x{:08x}'.format(self.register_dict[22]))
        print('HP: 0x{:08x}'.format(self.hp))
        print('FP: 0x{:08x}'.format(self.fp))
        print('SP: 0x{:08x}'.format(self.sp))
        print('LR0: 0x{:08x}'.format(self.lr0))
        print('LR1: 0x{:08x}'.format(self.register_dict[27]))
        print('LR2: 0x{:08x}'.format(self.register_dict[28]))
        print('LR3: 0x{:08x}'.format(self.register_dict[29]))
        print('PC: 0x{:08x}'.format(self.pc))
        print('CPSR: 0x{:08x}'.format(self.cpsr))

cpu = smallpond(port)

# while (cpu.pc) < 0x000C:
#     print('AF: 0x{:04x}'.format(cpu.a << 8 | cpu.f))
#     print('BC: 0x{:04x}'.format(cpu.b << 8 | cpu.c))
#     print('DE: 0x{:04x}'.format(cpu.d << 8 | cpu.e))
#     print('HL: 0x{:04x}'.format(cpu.h << 8 | cpu.l))
#     print()
#     print('SP: 0x{:04x}'.format(cpu.sp))
#     print('PC: 0x{:04x}'.format(cpu.pc))
#     cpu.step()
#     # time.sleep(0.25)
