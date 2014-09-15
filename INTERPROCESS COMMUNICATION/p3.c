#include <stdio.h>
#include <sys/shm.h>
#include <stdlib.h>
#include <time.h>

struct string
{
	int wt1 , wt2 ;
	int flag1 , flag2 , flag3;
	char str1[5],str2[5],c;
}*ptr;

int main()
{
	int running=1,i,j,f1=0,f2=0,shm_id,rnd;
	srand(time(NULL));

	void *shared_memory=(void*)0;

	shm_id = shmget((key_t)1492,sizeof(struct string),0666|IPC_CREAT);
	if (shm_id==-1)
		printf("nahin chala");

	shared_memory=shmat(shm_id , (void *)0,0);

	ptr=(struct string *)shared_memory;

	ptr->flag3=0;

	ptr->wt1=0;
	ptr->wt2=0;
	
	while(running)
	{
		if(ptr->c=='n')	exit(0);
/*-----------------------------------WAITING CONDITION----------------------------------*/
		while(ptr->flag2==0 && ptr->flag1==0)
		{
			printf("\nWaiting for both P1 and P2...");
			sleep(10);
			if(ptr->c=='n')	exit(0);
		}
		while(ptr->flag1==0)//indicating P3 work in process or waiting for process 2
		{
			printf("\nWaiting for P1...");
			sleep(10);
			if(ptr->c=='n')	exit(0);
		}
		while(ptr->flag2==0)
		{
			printf("\nWaiting for P2...");
			sleep(10);
			if(ptr->c=='n')	exit(0);
		}
/*---------------------------------------------------------------------------------------*/
			
		if(ptr->flag1==1 && ptr->flag2==1)
		{ptr->wt1=0;ptr->wt2=0;
			//creating weights of strings 
			for(i=0;i<5;i++)
			{
				j=ptr->str1[i];
				ptr->wt1+=j;
				if(ptr->str1[i]=='a'||ptr->str1[i]=='e'||ptr->str1[i]=='i'||ptr->str1[i]=='o'||ptr->str1[i]=='u'||ptr->str1[i]=='A'||ptr->str1[i]=='E'||ptr->str1[i]=='I'||ptr->str1[i]=='O'||ptr->str1[i]=='U')
					f1=1;
			}

			if(f1==1)
				ptr->wt1*=2;

			for(i=0;i<5;i++)
			{
				j=ptr->str2[i];
				ptr->wt2+=j;
				if(ptr->str2[i]=='a'||ptr->str2[i]=='e'||ptr->str2[i]=='i'||ptr->str2[i]=='o'||ptr->str2[i]=='u'||ptr->str2[i]=='A'||ptr->str2[i]=='E'||ptr->str2[i]=='I'||ptr->str2[i]=='O'||ptr->str2[i]=='U')
					f2=1;
			}	
			
			if(f2==1)
				ptr->wt2*=2;

		ptr->flag3=1;//indicating the P3 work is complete
		sleep(2);
		}
		
/*---------------------------------------------------------------------------------------*/
		if(ptr->flag3==1)//indicating the P3 work is complete
		{
			sleep(5);
			printf("\nProcess complete.\n");
			sleep(5);
			ptr->flag3=0;//restarting p3

		}
/*---------------------------------------------------------------------------------------*/

		

	}
return 0;
}