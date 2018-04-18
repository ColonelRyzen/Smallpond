from sys import platform
if platform == "linux" or platform == "linux2":
    port = "ttyUSB2"
elif platform == "darwin":
    port = "ttyUSB1"
elif platform == "win32":
    port = "COM"


import serial
import time


class smallpond:
    def __init__(self, port):
        self.ser = serial.Serial('/dev/' + port, 115200)
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
            print('0x{:04x}:'.format(begin & ~width), end='')
            for x in range(begin & ~width, begin):
                print('   ', end='')

        for addr in range(begin, end):
            if (addr % width == 0):
                print('0x{:04x}:'.format(addr), end='')
            elif (addr % 8 == 0):
                print(' ', end='')
            byte = self.read_mem_byte(addr)
            print(' {:02x}'.format(byte), end='')
            if (addr % width == width - 1):
                print()

        if (end % width != 0):
            print()

    def step(self):
        self.ser.write(b's')
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
        self.hp = self.register_dict[24]

    def jump(self, addr):
        self.write_reg('P', addr >> 8)
        self.write_reg('Q', addr & 0xFF)

    def print_regs(self):
        print('SP: 0x{:08x}'.format(self.sp))
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
