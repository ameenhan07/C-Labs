/*
* Write a C++ program to function template called Min to determine the 
* smaller of two arguments. The program should work for integers, characters 
* and floating point numbers as arguments to this function.
*/
#include <iostream>
using namespace std;

template <class T>

T Min (T a, T b)
{
    if (a > b)
        return a;
    else
        return b;
}
int main(){
    char ch1, ch2, ch;
    int a , b , c;
    float x , y , z;

    cout<<endl<<"Enter two characters : "<<endl;
    cin>>ch1>>ch2;
    ch=Min(ch1,ch2);
    cout<<endl<<"Max of the 2 characters given is : "<<ch;
    
    cout<<endl<<"Enter two integers : "<<endl;
    cin>>a>>b;
    c = Min( a , b );
    cout<<endl<<"Max of the 2 integers given is : "<<c;

    cout<<endl<<"Enter two floats : "<<endl;
    cin>>x>>y;
    z = Min( x , y );
    cout<<endl<<"Max of the 2 floats given is : "<<z;

    return 0;
}