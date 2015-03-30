#include <iostream>
#include <stdio.h>
using namespace std;
const int MAX = 300;

bool isVowel(char ch) {
   if(ch=='a' || ch=='e' || ch=='i' || ch=='o' || ch=='u')
      return true;
   else return false;
}

int main ()
{
   char str[MAX];
   // int  var[MAX] = {10, 100, 200};
   char  *ptr ;
   int counter=1;

   cout<<"Enter the string -> ";
   cin.getline(str,30);

   for ( ptr=str ; *ptr != '\0' ; ptr++ )
   {
      if( isVowel( *ptr ) ) {
         counter++;
      }
      // point to the next location
      ptr++;
   }
   cout<<"No of Vowels -> "<<counter;
   return 0;
}
