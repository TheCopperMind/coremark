#include "../lib/csr.h" 
#include <stdio.h>
#include "../mbrot/threading.c"

#define TABLE_DO_NOTHING        0
#define TABLE_READ_PC           1
#define TABLE_WRITE_PC          2
#define TABLE_READ_STATE        3
#define TABLE_WRITE_STATE       4
#define TABLE_READ_PRIORITY     5
#define TABLE_WRITE_PRIORITY    6

#define CSR_THREAD_ADDRESS      0xDC0
#define CSR_THREAD_WDATA        0xDC1
#define CSR_THREAD_COMMAND      0xDC2
#define CSR_THREAD_RDATA        0xDC3
#define CSR_CURRENT_VTHREAD_ID  0xDC4
#define CSR_SINGLE_THREAD_LOCK  0xBC0

int main(){
    

    int current_vthread = get_current_thread_id();
    if(current_vthread == 0)
    {
        spawn_thread(1, (int) &main);
        spawn_thread(2, (int) &main);
        spawn_thread(3, (int) &main);
    }
    else
    {
        while(1){}
    }
    
    //spawn a new thread PC
    // int lock = csr_read(0xBC0);
    // csr_write(0xDC0,    1);
    // csr_write(0xDC1,    40);
    // csr_write(0xDC2,    TABLE_WRITE_PC);

    // //set it's state to runnable
    // csr_write(0xDC0, 1);
    // csr_write(0xDC1,   1);
    // csr_write(0xDC2, TABLE_WRITE_STATE);
    // lock = csr_read(0xBC0);

    //set own state to waiting
    // csr_write(0xDC0, 0);
    // csr_write(0xDC1,   0);
    // csr_write(0xDC2, TABLE_WRITE_STATE);



}

