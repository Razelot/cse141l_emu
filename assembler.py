import os
import sys

if __name__ == "__main__":
    if len(sys.argv) < 2:
        print "ERROR: Usage <executable> <infile>"
        exit(1)


    infile = sys.argv[1]
    # outfile = sys.argv[2]
    file = open("./pattern_search_test/output.txt", "write")
    # Fill op codes here
    op_map = {}
    op_map["and"] = "000"
    op_map["slt"] = "000"
    op_map["or"] = "000"
    op_map["beq"] = "000"

    op_map["lw"] = "001"
    op_map["sw"] = "001"
    op_map["inc"] = "001"
    op_map["not"] = "001"

    op_map["add"] = "010"

    op_map["addi"] = "011"

    op_map["sub"] = "100"

    op_map["tr"] = "101"

    op_map["jr"] = "110"

    op_map["srl"] ="111"
    op_map["sra"] = "111"
    op_map["sll"] = "111"
    op_map["halt"] = "111"

    # Sub op codes here
    subop_map = {}
    subop_map["and"] = "00"
    subop_map["slt"] = "01"
    subop_map["or"] = "10"
    subop_map["beq"] = "11"

    subop_map["lw"] = "00"
    subop_map["sw"] = "01"
    subop_map["inc"] = "10"
    subop_map["not"] = "11"

    subop_map["srl"] = "00"
    subop_map["sra"] = "01"
    subop_map["sll"] = "10"

    with open(infile, 'r') as v:
        f = v.readlines()
        i = 0
        for line in f:

            # ignore empty line
            try:
                key = line.split()[0]
            except:
                continue

            # comments
            if key[0:2] == "//":
                continue

            op = ""
            rs = 0
            rt = 0
            rd = 0

            subop = ""
            imm1 = 0
            imm2 = 0
            mach = 0

            if key in op_map:
                op = op_map[key]

            if key in subop_map:
                subop = subop_map[key]


            # handle specially formatted instructions
            if(key == "add" or key == "sub"):
                rs = int(line.split()[1]) - 4
                rt = int(line.split()[2])
                rd = int(line.split()[3]) - 8
                mach = op + format(rs, '02b') + format(rt, '02b') + format(rd, '02b')

            elif(key == "lw"):
                rs = int(line.split()[1]) - 4
                rt = int(line.split()[2])
                mach = op + format(rs, '02b') + format(rt, '02b') + subop


            elif(key == "sw"):
                rs = int(line.split()[1]) - 4
                rt = int(line.split()[2])
                mach = op + format(rs, '02b') + format(rt, '02b') + subop


            elif(key == "tr"):
                imm1 = int(line.split()[1]) - 1
                imm2 = int(line.split()[2]) - 5
                mach = op + format(imm1, '03b') + format(imm2, '03b')

            elif(key == "addi"):
                rd = int(line.split()[1]) - 8
                rt = int(line.split()[2])
                imm1 = int(line.split()[3])
                mach = op + format(rd, '02b') + format(rt, '02b') + format(imm1, '02b')

            elif(key == "beq"):
                rt = int(line.split()[1])
                rd = int(line.split()[2]) - 8
                mach = op + format(rt, '02b') + format(rd, '02b') +subop

            elif(key == "jr"):
                imm1 = int(line.split()[1])
                imm1 = bin(((1 << 6) - 1) & imm1)
                mach = op + format(imm1[2:].zfill(6))

            elif(key == "inc" or key == "not"):
                reg = int(line.split()[1])
                mach = op + format(reg, '04b') + subop

            elif(key == "halt"):
                imm1 = 0
                mach = op + format(imm1, '06b')

            else:

                rs = int(line.split()[1]) - 4
                rt = int(line.split()[2])
                mach = op + format(rs, '02b') + format(rt, '02b') + subop

            if(len(sys.argv) > 2):
                file.write("assign rom[" + str(i) + "] = 'b" + mach + "; | " + line[:len(line)-1])
            else:
                file.write("assign rom[" + str(i) + "] = 'b" + mach + ";")

            i = i + 1
    file.close()
