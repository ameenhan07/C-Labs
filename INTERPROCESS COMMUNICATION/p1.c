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
	srand(time(NULL));


	void *shared_memory=(void*)0;

	shm_id = shmget((key_t)1492,sizeof(struct string),0666|IPC_CREAT);
	
	shared_memory=shmat(shm_id ,(void*)0,0);

	ptr=(struct string *)shared_memory;

	ptr->str1[5]='\0';
	ptr->flag1=0;
	ptr->flag3=0;
	fflush(stdin);

	while(running)
	{
		if(ptr->flag1==0)
		{	ptr->str1[5]='\0';
			//GENERATE STRING 1
			for(i=0;i<5;i++)
			{
				rnd=rand() % 2;
				if(rnd==0)
						j=rand() % (26)+65;
					
				else
						j=rand() % (26)+97;
				ptr->str1[i]=j;
			}

		printf("STRING 1:\n");
		puts(ptr->str1);
		
		ptr->flag1=1;	
		
		}
		
		/*while(ptr->flag1==1 && ptr->flag3==0)
		{
			printf("\nWaiting for P3...");
			sleep(20);
		}
*/
		
		if(ptr->flag3==1)
		{
			if(ptr->wt1>ptr->wt2)
				printf("\n%s has more weight:(%d)",ptr->str1,ptr->wt1);

			if(ptr->wt1<ptr->wt2)
				printf("\n%s has more weight:(%d)",ptr->str2,ptr->wt2);
			// if(ptr->wt1>ptr->wt2){
			// 	puts(ptr->str1);
			// 	printf("|%d",ptr->wt1);
			// }
			// if(ptr->wt1<ptr->wt2){
			// 	puts(ptr->str2);
			// 	printf("|%d",ptr->wt2);
		
		ptr->flag1=0;
		sleep(5);
		ptr->flag3=0;
		
		if(ptr->c=='n')
			running=0;
		printf("\nDO YOU WANT TO CONTINUE(y/n?\n");scanf("\n%c",&ptr->c);
		if(ptr->c=='n')
			running=0;
		}
		
	}
return 0;
}