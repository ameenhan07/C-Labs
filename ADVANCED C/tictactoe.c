#include<stdio.h>

int main()
{
    int m,i,j,x,y,flag,ch,temp;
    int z,s,search[10];
    char board[3][3],pos;
    board[0][0]='1';
    board[0][1]='2';
    board[0][2]='3';
    board[1][0]='4';
    board[1][1]='5';
    board[1][2]='6';
    board[2][0]='7';
    board[2][1]='8';
    board[2][2]='9';
    
    //DISPLAY BOARD
    printf("\n----------TIC TAC TOE BOARD------------\n");
    for (i=0;i<3;i++)
    {
        for (j=0;j<3;j++)
        {
            printf(" %c ",board[i][j]);
        }
        printf("\n\n");
        
    }
 
    i=1;
    while (i<=9)        //works for only 9 steps
    {
        m=i;
        if(i%2==1){
                printf("\nPLAYER 1 TURN (1-9) :\n-> ");}
        if(i%2==0){
                printf("\nPLAYER 2 TURN (1-9) :\n-> ");}
        
        scanf("%d",&ch);
        if(ch>9 || ch<1)
            continue;
        search[i]=ch;               //stores position in an array search
        pos = (char)(ch+'0');       //converts choice from integer to character 
        
        s=0;
        for(z=0;z<i;z++)        //scan the array search if play on 'ch' has already been made or not
        {           
            if(search[z]==ch)
            {
                s=1;
            }                         
        }
        if(s==0)
            i++; 
        else if(s==1)
            continue;               
        
        //searches for character equality of position in board
        for(x=0;x<3;x++)
        {
            for(y=0;y<3;y++)
            {
                if(board[x][y]== pos )
                    if (m%2==1) {           //odd moves goes to PLAYER 1
                        board[x][y]='O';}
                    else{                   //even moves goes to PLAYER 2
                        board[x][y]='X'; }                   
            }
        }
        
        
        //Prints the BOARD after replacing 
        for (x=0;x<3;x++)
        {
            for (y=0;y<3;y++)
            {
                printf(" %c ",board[x][y]);
            }
            printf("\n\n");        
        }
        
        //condition to check if row/column/diagonal is equal or not
        if(m>4)
        {
            if(m%2==1)
            {
                flag = checko(board,ch);//player 1 check function
                if(flag==1)
                {
                    break;
                }
            }
            if(m%2==0)
            {
                flag = checkx(board,ch);//player 2 check function
                if( flag==1)
                {
                    break;
                }
            }
            
        }
        if(i==9)
        {   
            printf("-------DRAW-------");
            break;
        }
        
        
    }
    return 0;    
}

//CHECK FUNCTION FOR PLAYER 1
int checko(char board[3][3])
{
    int flag=0,line;
    //row & column check
    for(line = 0; line <=2; line++)
    {
        if((board[line][0]==board[line][1] && board[line][0]==board[line][2])||(board[0][line]==board[1][line] && board[0][line]==board[2][line]))
        {printf("*******Player 1 WINS*******");
        flag=1;}
    }

    //DIAGONAL CHECK
    if((board[0][0]==board[1][1]==board[2][2])||(board[0][2]==board[1][1]==board[2][0]))
    {
        printf("*******Player 1 WINS*******");
        flag=1;
    } 
    
    return flag;
}
//CHECK FUNCTION FOR PLAYER 2
int checkx(char board[3][3])
{
    int flag=0,line;
    //row & column check
    for(line = 0; line <=2; line++)
    {
        if((board[line][0]==board[line][1] && board[line][0]==board[line][2])||(board[0][line]==board[1][line] && board[0][line]==board[2][line]))
        {printf("*******Player 2 WINS*******");
        flag=1;}
    }

    //DIAGONAL CHECK
    if((board[0][0]==board[1][1] && board[0][0]==board[2][2]) ||(board[0][2]==board[1][1] && board[0][2]==board[2][0]))
    {
        printf("*******Player 2 WINS*******");
        flag=1;
    }
    return flag; 
}       


