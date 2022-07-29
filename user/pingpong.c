#include "../kernel/types.h"
#include "user.h"

int main(){
    int parentRead[2];
    int childRead[2];  
    pipe(parentRead);
    pipe(childRead);
    int pid = fork();
    if (pid == 0){
        // child process
        close(childRead[1]);
        close(parentRead[0]);
        char buf[4];
        read(childRead[0],buf,4);
        close(childRead[0]);
        fprintf(1,"%d: received ping\n",getpid());
        write(parentRead[1],"pong",4);
        close(parentRead[1]);
        exit(0);
    }else if (pid > 0){
        // parent process
        char buf[4];
        close(childRead[0]);
        close(parentRead[1]);
        write(childRead[1],"ping",4);
        close(childRead[1]);
        read(parentRead[0],buf,4);
        close(parentRead[0]);
        fprintf(1,"%d: received pong\n",getpid());
        wait(&pid);
    }else{
        // fork error
        fprintf(2,"Fork Error!\n");
        exit(1);
    }
    exit(0);
}
