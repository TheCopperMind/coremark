#include "../lib/csr.h" 
#include "threading.c"

int test = 2;
extern void put_ssd(unsigned long ssd);
int do_work()
{
  int current_vthread = get_current_thread_id();
  
  while(1)
  {

    put_ssd(test);
    
  }
}
int main(){
  int current_vthread = get_current_thread_id();
  if(current_vthread == 0)
  {
      spawn_thread(1, (int) &main, 31);
      //spawn_thread(2, (int) &do_work, 31);
      //spawn_thread(3, (int) &do_work, 31);
      do_work();
  }
  // while (1) {
  //   if(current_vthread == 1)
  //   {
  //     spawn_thread(4, (int) &do_work, 0);
  //     do_work();
  //   }
  // }
}