/*
* Write a C++ program to create a class matrix overloaded +.- operator 
* to perform matrix addition and subtraction.
*/
/*
* Write a C++ program to to count the no of persons inside a bank, 
* by increasing count whenever a person enters a bank, 
* using an increment(++) operator overloading function and decrease
* the count whenever a person leaves the bank using a decrement(--) 
* operator oveloading fnction inside a class.
*/

#include <iostream>
using namespace std;

class C
{
    int matrix[3][3];
    public:
        //overloaded matrix addition function
        C operator + (C c){ 
            C obj;
            for(int i=0;i<3;i++){
                for (int j = 0; j < 4; j++)
                {
                    obj.matrix[i][j] = matrix[i][j] + c.matrix[i][j];
                }                
            } 
            return obj;         
        }
        //overloaded matrix subtraction function
        C operator - (C c){ 
            C obj;
            for(int i=0;i<3;i++){
                for (int j = 0; j < 4; j++)
                {
                    obj.matrix[i][j] = matrix[i][j] - c.matrix[i][j];
                }                
            }  
            return obj;        
        }
        //function for matrix input
        void inp (){
            cout<<"Enter the matrix"<<endl;
            for (int i = 0; i < 3; i++)
            {
                for (int j = 0; j < 3; ++j)
                {
                    cin>>matrix[i][j];
                }
            }
        }
        //function for matrix print
        void disp() {
            for (int i = 0; i < 3; ++i)
            {
                for (int j = 0; j < 3; ++j)
                {
                    cout<<matrix[i][j]<<" ";
                }cout<<endl;
            }
        }
};

int main()
{
    C obj[2] , add , sub ;

    obj[1].inp();
    obj[2].inp();

    cout<<endl<<"MATRIX 1:"<<endl;
    obj[1].disp();
    cout<<endl<<"MATRIX 2 "<<endl;
    obj[2].disp();

    add = obj[1] + obj[2];
    cout<<endl<<"MATRIX ADDITION:"<<endl;
    add.disp();

    sub = obj[1] - obj[2];
    cout<<endl<<"MATRIX SUBTRACTION"<<endl;
    sub.disp();

    return 0;
    
}