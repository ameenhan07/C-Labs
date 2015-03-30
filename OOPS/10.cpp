/*
* Write a C++ program to to accept 5 different nos by creating a class call friendfunc1 
* and friendfunc2 taking 2 and 3 arguments respectively and 
* calculate the average of these nos by passing object of the class to friend function.
*/
#include <iostream>
using namespace std;

// DECLARATION OF CLASSES
class friendfunc1;
class friendfunc2;

//DEFINITION OF CLASSES
class friendfunc1
{
    float x , y ;
    friend float avg(friendfunc1 & , friendfunc2 & );
    public:
        void inp()
        {
            cout<<endl<<"\nEnter 2 numbers: "<<endl;
            cin>>x>>y;
        }
};
class friendfunc2
{
    float a , b , c ;
    friend float avg( friendfunc1 &,friendfunc2 & );
    public:
        void inp()
        {
            cout<<endl<<"\nEnter 3 numbers: "<<endl;
            cin>>a>>b>>c;
        }
};

// Function to claculate average ; FRIEND FUNCTION
float avg( friendfunc1 &func1 , friendfunc2 &func2 )
{
    float result = ( func1.x + func1.y + func2.a + func2.b + func2.c) / 5;
    return result;
}

// MAIN
int main()
{
    friendfunc1 obj1;
    friendfunc2 obj2;
    obj1.inp();
    obj2.inp();
    cout <<"Average (from both the classes) is : " << avg(obj1,obj2) << endl;
    return 0;
}