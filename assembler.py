import numpy
import os
import sys

# to parpspep use "as a dog".split(" ")
# this will split each word and produce a list like
# ['as', 'a', 'dog']
#check size of list to ccheck argument size




if __name__ == "__main__":
    if len(sys.argv) < 3:
        print "ERROR: Usage <executable> <infile> <outfile>"
        exit(1)
    
    
    infile = sys.argv[1]
    outfile = sys.argv[2]

    # Fill op codes here
    op_map = {}
    op_map["and"] = "000"
    op_map["slt"] = "000"
    op_map["or"] = "000"
    op_map["jr"] = "000"

    op_map["add"] = "001"

    op_map["lw"] = "010"
    op_map["sw"] = "010"

    op_map["srl"] ="100"
    op_map["sra"] = "100"

    op_map["tr"] = "011"
    op_map["addi"] = "101"
    op_map["beq"] = "110"
    op_map["halt"] = "111"

    # Sub op codes here
    subop_map = {}
    subop_map["and"] = 0
    subop_map["slt"] = 1
    subop_map["or"] = 2
    subop_map["jr"] = 3

    subop_map["lw"] = 0
    subop_map["sw"] = 1

    subop_map["srl"] = 0
    subop_map["sra"] = 1
    
    with open(infile, 'r') as v:
        f = v.readlines()
    print f
        for line in f:

            key = line.split()[0]

            op = ""
            rs = 0
            rt = 0
            rd = 0

            subop = ""
            imm1 = 0
            imm2 = 0


            if key in op_map:
                op = op_map[key]

            if key in subop_map:
                subop = subop_map[key]


            # handle specially formatted instructions
            if(key == "add"):
                rs = int(line.split()[1]) - 4
                rt = int(line.split()[2]) 
                rd = int(line.split()[3]) - 8
                mach = op + format(rs, '02b') + format(rt, '02b') + format(rd, '02b') 


            if(key == "lw"):
                rs = int(line.split()[1]) - 4
                rd = int(line.split()[2]) - 8
                mach = op + format(rs, '02b') + format(rd, '02b') + subop

            if(key == "sw"):
                rs = int(line.split()[1]) - 4
                rt = int(line.split()[2])
                mach = op + format(rs, '02b') + format(rt, '02b') + subop               

            if(key == "tr"):
                imm1 = int(line.split()[1])
                imm2 = int(line.split()[2])
                mach = op + format(imm1, '03b') + format(imm2, '03b')


            if(key == "addi"):
                rs = int(line.split()[1]) - 4
                rt = int(line.split()[2])
                imm1 = int(line.split()[3]) 
                mach = op + format(rs, '02b') + format(rt, '02b') + format(imm1, '02b')


            if(key == "beq"):
                rs = int(line.split()[1]) - 4
                rt = int(line.split()[2])
                rd = int(line.split()[3]) - 8
                mach = op + format(rs, '02b') + format(rt, '02b') + format(rd, '02b')

            if(key == "halt"):
                imm1 = 0
                mach = op + format(imm1, '06b')

            else:
                rs = int(line.split()[1]) - 4
                rt = int(line.split()[2]) 
                mach = op + format(rs, '02b') + format(rt, '02b') + subop

            print line, ": ", mach
