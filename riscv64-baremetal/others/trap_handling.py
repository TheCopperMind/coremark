

def trap_handler():
    # an interrupt happens
    trap = int(mcause[0:31])
    if(mcause[31] == 1 and mstatus[3] == 1):
        if(mip[trap] and mie[trap]):


    #an exception happens 
    else:


def mret():
    pc = mepc


