#include <iostream>
using namespace std;

//Reverse of number, no value is being returned
void rev1(int n)
{
  int reverse=0 ;
  while (n != 0)
  {
    reverse = reverse * 10;
    reverse = reverse + n%10;
    n = n/10;
  }
  cout<<endl<<"Reverse of entered number, using a function with   NO   return type is -> " << reverse ;
}
//Reverse of number, reverse is being returned
int rev2(int n)
{
  int reverse=0;
  while (n != 0)
  {
    reverse = reverse * 10;
    reverse = reverse + n%10;
    n = n/10;
  }   
  return reverse;
}
//Main
int main ()
{
   int number;
   cout<<endl<<"Enter a number -> ";
   cin>>number;
   rev1(number);
   cout<<endl<<"Reverse of entered number, using a function with        return type is -> " <<rev2(number);
   return 0;
}
