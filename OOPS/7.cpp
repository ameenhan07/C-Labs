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
    int counter;
    public:
        //overloaded increment function
        C operator++(int){ 
            counter++;
        }
        // overloaded decrement function
        C operator--(int){
            counter--;
        }
        //constructor initalising counter to zero, for that instantiation
        C() {
            counter=0;
        }
        //return counter for that instantiation
        int disp() {
            return counter;
        }
};

int main()
{
    C obj;
    cout<<endl<<"No of persons in bank initially : "<<obj.disp();
    obj++;
    obj++;
    obj++;
    obj++;
    cout<<endl<<"No of persons in bank (at time t1) : "<<obj.disp();
    obj--;
    obj--;
    cout<<endl<<"No of persons in bank (at time t2) : "<<obj.disp();
    return 0;
}