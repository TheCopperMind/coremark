#include "../lib/csr.h" 
#include "threading.c"
#define NUM_THREADS 32

extern void put_ssd(unsigned long ssd);

void do_work(void* args)
{  
  
  char *quotePtr = args;
  thread_print(quotePtr);
  
  exit_thread();
}
int main(){
    char quote[] = "Hello, world!";
    for(int i=1; i<NUM_THREADS;i++)
    {
      spawn_thread(i, (int) &do_work, 1, (void*)quote);
    }
    // for(int i=1; i<10;i++)
    // {
    //   join(i);
    // }

    do_work(quote);

    while(1);

}