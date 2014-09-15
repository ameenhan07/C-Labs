#include <stdio.h>
#include <stdlib.h>
#include <sys/shm.h>
#include <time.h>

struct string
{
	int wt1,wt2;
	int flag1,flag2,flag3;
	char str1[5],str2[5],c;
}*ptr;

int main()
{
	int running=1,i,j,rnd,shm_id;
	srand(time(0));


	void *shared_memory=(void*)0;

	shm_id = shmget((key_t)1492,sizeof(struct string),0666|IPC_CREAT);
	if (shm_id==-1)
		printf("nahin chala");

	shared_memory=shmat(shm_id ,(void*)0,0);

	ptr=(struct string *)shared_memory;
	ptr->flag2=0;
	ptr->flag3=0;
	fflush(stdout); 

	while(running)
	{
		if(ptr->flag2==0)
		{
			//GENERATE STRING 1
			ptr->str2[5]='\0';
			for(i=0;i<5;i++)
			{
				rnd=rand() % 2;
				if(rnd==0)
						j=rand() % (26)+65;
					
				else
						j=rand() % (26)+97;
				ptr->str2[i]=j;
			}
		
		printf("STRING 2:\n");				
		puts(ptr->str2);
		
		ptr->flag2=1;

		}

		/*while(ptr->flag2==1 && ptr->flag3==0)
		{
			printf("\nWaiting for P3...");
			sleep(20);
		}*/
		
		
		if(ptr->flag3==1)
		{
			fflush(stdin);
			if( (ptr->wt1) > (ptr->wt2) )
				printf("\n%s has more weight:(%d)",ptr->str1,ptr->wt1);
	

			if( ptr->wt1 < ptr->wt2 )
				printf("\n%s has more weight:(%d)",ptr->str2,ptr->wt2);
	
		ptr->flag2=0;
		sleep(5);	
		ptr->flag3=0;

		if(ptr->c=='n')	exit(0);
		printf("\nDO YOU WANT TO CONTINUE(y/n?\n");scanf("\n%c",&ptr->c);
		if(ptr->c=='n')	exit(0);
		}
		
		
	}
return 0;
}