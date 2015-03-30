#include <iostream>
using namespace std;

//Global counter variable
int count=0;

class Test
{
    public:
    Test();
    ~Test();
};

//Constructor for class Test
Test::Test()
{
    count++;    //incrementing object count
    cout<<"The number of Object created "<<count<<endl;
}

//Destructor for class Test
Test::~Test()
{
    cout<<"The number of Object destroyed "<<count<<endl;
    count--;    //decrementing bject count
}

//Main
int main()
{
    //Creating objects of class Test
    Test T1,T2,T3,T4;
    //Block 1
    {
        cout<<"Block number 1"<<endl;
        Test T5;
    }
    //Block 2
    {
        cout<<"Block number 2"<<endl;
        Test T6;
    }
    cout<<"Reenter in Main"<<endl;
    Test T7;
    return 0;
}