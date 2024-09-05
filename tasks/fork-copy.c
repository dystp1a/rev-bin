#include <stdio.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/wait.h>

int main(void){
    pid_t despMe2,despMe,despMe1,despMe3;
    despMe=fork();
    if(!despMe){
    printf("hi iam B my pid is %dand i was birthed by %d\n",getpid(),getppid());}
   else{
        despMe1 = fork();
        if (!despMe1){
             printf("hi iam C my pid is %dand i was birthed by %d\n",getpid(),getppid());
            despMe2 = fork();
            if (!despMe2){ printf("hi iam E my pid is %dand i was birthed by %d\n",getpid(),getppid());}
            else{if(!fork()){
                 printf("hi iam F my pid is %dand i was birthed by %d\n",getpid(),getppid());
            }
            }}
        else {
            wait(NULL);
        if (!fork()){
            printf("hi iam D my pid is %dand i was birthed by %d\n",getpid(),getppid());
            if (!fork()){
                printf("hi iam G my pid is %dand i was birthed by %d\n",getpid(),getppid());
                despMe3=fork();
                if (!despMe3){
                    printf(" iam H my pid is %dand i was birthed by %d\n",getpid(),getppid());
                }else{
                    if (!fork()){
                        printf(" iam I my pid is %dand i was birthed by %d\n",getpid(),getppid());
                    }
                }

            }wait(NULL);
        }
    }}
    wait(NULL);
    return 0;

}
