.globl main
        .type   main, @function
main:
    addi    s1,s1,1
    sw      s1,256(s0)
    lw      s3,256(s0)

