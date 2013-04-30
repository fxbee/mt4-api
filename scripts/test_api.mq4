//+------------------------------------------------------------------+
//|                                                         test.mq4 |
//|                                   Copyright 2013, Jaromir Muller |
//|                                     http://www.jaromirmuller.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2013, Jaromir Muller"
#property link      "http://www.jaromirmuller.com"

#include <api.mqh>

bool assert( bool condition, string error_message="", string success_message="" ) {

   if ( condition == true ) {
      if ( success_message != "" ) {
         Print( success_message );
      }
   } else {
      if ( error_message != "" ) {
         Print( error_message );
      }
   }
   
   return (condition);

}


bool test_suite_serialization ( ) {

   string data[];

   int passed = 0;
   int failed = 0;
   
   parse_serialized_string_array( "1|TEST", data, "|");
   if ( assert( data[0] == "TEST", "FAILED 1|TEST", "SUCCESS" ) == true ) {
      passed ++;
   } else {
      failed ++;
   }
   
   parse_serialized_string_array( "2|TEST1|TEST2", data, "|");
   if ( assert( data[1] == "TEST2", "FAILED 2|TEST1|TEST2", "SUCCESS" ) == true ) {
      passed ++;
   } else {
      failed ++;
   }
   
   parse_serialized_string_array( "2||TEST2", data, "|");
   if( assert( data[0] == "", "FAILED 2||TEST2 - case 1", "SUCCESS" ) == true )  {
      passed ++;
   } else {
      failed ++;
   }
   
   if ( assert( data[1] == "TEST2", "FAILED 2||TEST2 - case 2", "SUCCESS" ) == true ) {
      passed ++;
   } else {
      failed ++;
   }
   
   parse_serialized_string_array( "3|||TEST3", data, "|");
   if( assert( data[0] == "", "FAILED 3|||TEST3 - case 1", "SUCCESS" ) == true )  {
      passed ++;
   } else {
      failed ++;
   }
   
   if( assert( data[1] == "", "FAILED 3|||TEST3 - case 2", "SUCCESS" ) == true )  {
      passed ++;
   } else {
      failed ++;
   }
   
   if( assert( data[2] == "TEST3", "FAILED 3|||TEST3 - case 3", "SUCCESS" ) == true )  {
      passed ++;
   } else {
      failed ++;
   }
   
   parse_serialized_string_array( "3|TEST1||", data, "|");
   if( assert( data[0] == "TEST1", "FAILED 3|TEST1|| - case 1", "SUCCESS" ) == true )  {
      passed ++;
   } else {
      failed ++;
   }
   
   if( assert( data[1] == "", "FAILED 3|TEST1|| - case 2", "SUCCESS" ) == true )  {
      passed ++;
   } else {
      failed ++;
   }
   
   if( assert( data[3] == "", "FAILED 3|TEST1|| - case 3", "SUCCESS" ) == true )  {
      passed ++;
   } else {
      failed ++;
   }
   
   Print( "TESTING RESULT: passed ", passed, " from ", passed+failed);
   
   
}

//+------------------------------------------------------------------+
//| script program start function                                    |
//+------------------------------------------------------------------+
int start()
  {
//----

   int result = test_suite_serialization(); 
   
//----
   return(0);
  }
//+------------------------------------------------------------------+