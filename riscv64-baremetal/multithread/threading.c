#include "../lib/csr.h" 
#define NUM_VTHREADS 32

#define TABLE_DO_NOTHING        0
#define TABLE_READ_PC           1
#define TABLE_WRITE_PC          2
#define TABLE_READ_STATE        3
#define TABLE_WRITE_STATE       4
#define TABLE_READ_PRIORITY     5
#define TABLE_WRITE_PRIORITY    6

#define CSR_THREAD_ADDRESS      0x9C0
#define CSR_THREAD_WDATA        0x9C1
#define CSR_THREAD_COMMAND      0x9C2
#define CSR_THREAD_RDATA        0xDC0
#define CSR_CURRENT_VTHREAD_ID  0xDC1

#define CSR_SINGLE_THREAD_LOCK  0xBC0

#define  HALTED       0
#define  RUNNABLE     1
#define  RUNNING      2
#define  WAITING      3
#define  SCHEDULING   4
#define  DESCHEDULING 5
#define  UNDEFINED    6


extern int _thread_mem_size;
extern int _ram_start;
extern void _thread_start();
int initial_pc[NUM_VTHREADS];
void*      thread_args[NUM_VTHREADS];


void thread_print_char(char c)
{
    csr_write(0xBC1, c);
}

void thread_print(const char *c)
{
    while(*c != '\0')
    {
        csr_write(0xBC1, *c);
        c++;
    }
}

int get_current_thread_id()
{
    return csr_read(0xDC1);
}

void _thread_start()
{
    int thread_id = csr_read(0xDC1);
    int start_address_stack = ((int)&_ram_start + (1+thread_id) * (int)&_thread_mem_size);
    int start_address_tls   = start_address_stack - (int)&_thread_mem_size;
    // set our own stack and thread pointer
    __asm__ __volatile__ ("add sp,zero, %0": : "r"(start_address_stack));
    __asm__ __volatile__ ("add tp,zero, %0": : "r"(start_address_tls));
    __asm__ __volatile__ ("addi sp,sp,-4");
    // set args
    __asm__ __volatile__ ("mv a0, %0": : "r"(thread_args[thread_id]));
    __asm__ __volatile__ ("jalr zero, %0" : : "r"(initial_pc[thread_id]));
    return;
}

void update_table(int vthread_id, int data, int command)
{
    csr_write(0x9C0,    vthread_id);
    csr_write(0x9C1,    data);
    csr_write(0x9C2,    command);
}
int spawn_thread(int vthread_id, int pc, int prio, void* args)
{
    // acquire thread lock
    while(!csr_read(0xBC0)){}
    // set thread's PC
    initial_pc[vthread_id]  = pc;
    // set arguments
    thread_args[vthread_id] = args;
    update_table(vthread_id, (int) &_thread_start, TABLE_WRITE_PC);
    // set thread's priority
    update_table(vthread_id, prio, TABLE_WRITE_PRIORITY);
    //set its state to runnable
    update_table(vthread_id, RUNNABLE, TABLE_WRITE_STATE);
    // release thread lock
    csr_read(0xBC0);
}
int yield()
{
    // acquire thread lock
    while(!csr_read(0xBC0)){}
    int vthread_id = get_current_thread_id();
    //set own state to waiting
    update_table(vthread_id, RUNNABLE, TABLE_WRITE_STATE);
    // release thread lock
    csr_read(0xBC0);
    return vthread_id;
}
void exit_thread()
{
    // acquire thread lock
    while(!csr_read(0xBC0)){}
    int vthread_id = get_current_thread_id();
    //set own state to waiting
    update_table(vthread_id, HALTED, TABLE_WRITE_STATE);
    // release thread lock
    csr_read(0xBC0);

}
int join_thread(int vthread_id)
{
    int state = UNDEFINED;
    // while the vthread is not halted
    while(state != HALTED)
    {
        csr_write(0x9C3, 1);
        // acquire thread lock
        while(!csr_read(0xBC0)){}
        // place state of vthread in read register
        update_table(vthread_id, 0, TABLE_READ_STATE);
        // read table data register
        state = csr_read(0xDC0);
        // release thread lock
        csr_read(0xBC0);
        //csr_write(0x9C3, 1);
    }
    return 0;
}


