#include "../kernel/types.h"
#include "user.h"
int main(int argc, char* argv[]){
    if(argc != 2){
        fprintf(2,"Usage: sleep [microseconds]\n");
        exit(0);
    }  
    int second = atoi(argv[1]);
    sleep(second);
    exit(0);
}
