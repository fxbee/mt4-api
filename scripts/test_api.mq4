//+------------------------------------------------------------------+
//|                                                         test.mq4 |
//|                                   Copyright 2013, Jaromir Muller |
//|                                     http://www.jaromirmuller.com |
//|                                                                  |
//| The MIT License (MIT)                                            |
//| Copyright 2013, Jaromir Muller                                   |
//|                                                                  |
//| Permission is hereby granted, free of charge, to any person      |
//| obtaining a copy of this software and associated documentation   |
//| files (the "Software"), to deal in the Software without          |
//| restriction, including without limitation the rights to use,     |
//| copy, modify, merge, publish, distribute, sublicense,            |
//| and/or sell copies of the Software, and to permit persons to     |
//| whom the Software is furnished to do so, subject to the following|
//| conditions:                                                      |
//|                                                                  |
//| The above copyright notice and this permission notice shall be   |
//| included in all copies or substantial portions of the Software.  |
//|                                                                  |
//| THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,  |
//| EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES  |
//| OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND         |
//| NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT      |
//| HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,     |
//| WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING     |
//| FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR    |
//| OTHER DEALINGS IN THE SOFTWARE.                                  |
//|                                                                  |
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

bool test_api_serialize ( ) {

   int passed = 0;
   int failed = 0;

   string result = "";
   
   string case1[];
   ArrayResize(case1, 1);
   case1[0] = "TEST0";
   
   result = api_serialize( case1 );
   if ( assert( result == "1|TEST0", "FAILED case1", "SUCCESS" ) == true ) {
      passed ++;
   } else {
      failed ++;
   }
   
   string case2[];
   ArrayResize(case2, 2);
   case2[0] = "TEST0";
   case2[1] = "TEST1";
   
   result = api_serialize( case2 );
   if ( assert( result == "2|TEST0|TEST1", "FAILED case2", "SUCCESS" ) == true ) {
      passed ++;
   } else {
      failed ++;
   }
   
   string case3[];
   ArrayResize(case3, 2);
   case3[1] = "TEST1";
   
   result = api_serialize( case3 );
   if ( assert( result == "2||TEST1", "FAILED case3", "SUCCESS" ) == true ) {
      passed ++;
   } else {
      failed ++;
   }  
   
   string case4[];
   ArrayResize(case4, 3);
      
   result = api_serialize( case4 );
   if ( assert( result == "3|||", "FAILED case4", "SUCCESS" ) == true ) {
      passed ++;
   } else {
      failed ++;
   }  
   
   Print( "test_api_serialize: passed ", passed, " from ", passed+failed);
}

bool test_api_unserialize ( ) {

   string data[];

   int passed = 0;
   int failed = 0;
   
   api_unserialize( "1|TEST", data, "|");
   if ( assert( data[0] == "TEST", "FAILED 1|TEST", "SUCCESS" ) == true ) {
      passed ++;
   } else {
      failed ++;
   }
   
   api_unserialize( "2|TEST1|TEST2", data, "|");
   if ( assert( data[1] == "TEST2", "FAILED 2|TEST1|TEST2", "SUCCESS" ) == true ) {
      passed ++;
   } else {
      failed ++;
   }
   
   api_unserialize( "2||TEST2", data, "|");
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
   
   api_unserialize( "3|||TEST3", data, "|");
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
   
   api_unserialize( "3|TEST1||", data, "|");
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
   
   Print( "test_api_unserialize: passed ", passed, " from ", passed+failed);
      
}

bool test_api_AccountBalance ( ) {

   int passed = 0;
   int failed = 0;

   string result = "";
   
   result = api_AccountBalance();
   if ( assert( "1|" == StringSubstr(result,0,2), "FAILED case1", "SUCCESS" ) == true ) {
      passed ++;
   } else {
      failed ++;
   }  
   
   Print( "test_api_AccountBalance: passed ", passed, " from ", passed+failed);
}

bool test_api_AccountCredit ( ) {

   int passed = 0;
   int failed = 0;

   string result = "";
   
   result = api_AccountCredit();
   if ( assert( "1|" == StringSubstr(result,0,2), "FAILED case1", "SUCCESS" ) == true ) {
      passed ++;
   } else {
      failed ++;
   }  
   
   Print( "test_api_AccountCredit: passed ", passed, " from ", passed+failed);
}

bool test_api_AccountCompany ( ) {

   int passed = 0;
   int failed = 0;

   string result = "";
   
   result = api_AccountCompany();
   if ( assert( "1|" == StringSubstr(result,0,2), "FAILED case1", "SUCCESS" ) == true ) {
      passed ++;
   } else {
      failed ++;
   }  
   
   Print( "test_api_AccountCompany: passed ", passed, " from ", passed+failed);
}

bool test_api_AccountCurrency ( ) {

   int passed = 0;
   int failed = 0;

   string result = "";
   
   result = api_AccountCurrency();
   if ( assert( "1|" == StringSubstr(result,0,2), "FAILED case1", "SUCCESS" ) == true ) {
      passed ++;
   } else {
      failed ++;
   }  
   
   Print( "test_api_AccountCurrency: passed ", passed, " from ", passed+failed);
}

bool test_api_AccountEquity ( ) {

   int passed = 0;
   int failed = 0;

   string result = "";
   
   result = api_AccountEquity();
   if ( assert( "1|" == StringSubstr(result,0,2), "FAILED case1", "SUCCESS" ) == true ) {
      passed ++;
   } else {
      failed ++;
   }  
   
   Print( "test_api_AccountEquity: passed ", passed, " from ", passed+failed);
}

bool test_api_AccountFreeMargin ( ) {

   int passed = 0;
   int failed = 0;

   string result = "";
   
   result = api_AccountFreeMargin();
   if ( assert( "1|" == StringSubstr(result,0,2), "FAILED case1", "SUCCESS" ) == true ) {
      passed ++;
   } else {
      failed ++;
   }  
   
   Print( "test_api_AccountFreeMargin: passed ", passed, " from ", passed+failed);
}

bool test_api_AccountFreeMarginCheck ( ) {

   int passed = 0;
   int failed = 0;

   string result = "";
   
   result = api_AccountFreeMarginCheck(Symbol(), OP_BUY, 0.01);
   if ( assert( "3|" == StringSubstr(result,0,2), "FAILED case1", "SUCCESS" ) == true ) {
      passed ++;
   } else {
      failed ++;
   }  
   
   result = api_AccountFreeMarginCheck(Symbol(), OP_SELL, 0.01);
   if ( assert( "3|" == StringSubstr(result,0,2), "FAILED case2", "SUCCESS" ) == true ) {
      passed ++;
   } else {
      failed ++;
   }
   
   result = api_AccountFreeMarginCheck(Symbol(), OP_BUY, 100);
   if ( assert( "3|" == StringSubstr(result,0,2), "FAILED case3", "SUCCESS" ) == true ) {
      passed ++;
   } else {
      failed ++;
   }  
   
   result = api_AccountFreeMarginCheck(Symbol(), OP_SELL, 100);
   
   if ( assert( "3|" == StringSubstr(result,0,2), "FAILED case4", "SUCCESS" ) == true ) {
      passed ++;
   } else {
      failed ++;
   }
   
   Print( "test_api_AccountFreeMarginCheck: passed ", passed, " from ", passed+failed);
}

bool test_api_AccountFreeMarginMode ( ) {

   int passed = 0;
   int failed = 0;

   string result = "";
   
   result = api_AccountFreeMarginMode();
   if ( assert( "1|" == StringSubstr(result,0,2), "FAILED case1", "SUCCESS" ) == true ) {
      passed ++;
   } else {
      failed ++;
   }  
   
   Print( "test_api_AccountFreeMarginMode: passed ", passed, " from ", passed+failed);
}

bool test_api_AccountLeverage ( ) {

   int passed = 0;
   int failed = 0;

   string result = "";
   
   result = api_AccountLeverage();
   if ( assert( "1|" == StringSubstr(result,0,2), "FAILED case1", "SUCCESS" ) == true ) {
      passed ++;
   } else {
      failed ++;
   }  
   
   Print( "test_api_AccountLeverage: passed ", passed, " from ", passed+failed);
}

bool test_api_AccountMargin ( ) {

   int passed = 0;
   int failed = 0;

   string result = "";
   
   result = api_AccountMargin();
   if ( assert( "1|" == StringSubstr(result,0,2), "FAILED case1", "SUCCESS" ) == true ) {
      passed ++;
   } else {
      failed ++;
   }  
   
   Print( "test_api_AccountMargin: passed ", passed, " from ", passed+failed);
}

bool test_api_AccountName ( ) {

   int passed = 0;
   int failed = 0;

   string result = "";
   
   result = api_AccountName();   
   if ( assert( "1|" == StringSubstr(result,0,2), "FAILED case1", "SUCCESS" ) == true ) {
      passed ++;
   } else {
      failed ++;
   }  
   
   Print( "test_api_AccountName: passed ", passed, " from ", passed+failed);
}

bool test_api_AccountNumber ( ) {

   int passed = 0;
   int failed = 0;

   string result = "";
   
   result = api_AccountNumber();   
   if ( assert( "1|" == StringSubstr(result,0,2), "FAILED case1", "SUCCESS" ) == true ) {
      passed ++;
   } else {
      failed ++;
   }  
   
   Print( "test_api_AccountNumber: passed ", passed, " from ", passed+failed);
}

bool test_api_AccountProfit ( ) {

   int passed = 0;
   int failed = 0;

   string result = "";
   
   result = api_AccountProfit();   
   if ( assert( "1|" == StringSubstr(result,0,2), "FAILED case1", "SUCCESS" ) == true ) {
      passed ++;
   } else {
      failed ++;
   }  
   
   Print( "test_api_AccountProfit: passed ", passed, " from ", passed+failed);
}

bool test_api_AccountServer ( ) {

   int passed = 0;
   int failed = 0;

   string result = "";
   
   result = api_AccountServer();   
   if ( assert( "1|" == StringSubstr(result,0,2), "FAILED case1", "SUCCESS" ) == true ) {
      passed ++;
   } else {
      failed ++;
   }  
   
   Print( "test_api_AccountServer: passed ", passed, " from ", passed+failed);
}

bool test_api_AccountStopoutLevel ( ) {

   int passed = 0;
   int failed = 0;

   string result = "";
   
   result = api_AccountStopoutLevel();   
   if ( assert( "1|" == StringSubstr(result,0,2), "FAILED case1", "SUCCESS" ) == true ) {
      passed ++;
   } else {
      failed ++;
   }  
   
   Print( "test_api_AccountStopoutLevel: passed ", passed, " from ", passed+failed);
}

bool test_api_AccountStopoutMode ( ) {

   int passed = 0;
   int failed = 0;

   string result = "";
   
   result = api_AccountStopoutMode();   
   if ( assert( "1|" == StringSubstr(result,0,2), "FAILED case1", "SUCCESS" ) == true ) {
      passed ++;
   } else {
      failed ++;
   }  
   
   Print( "test_api_AccountStopoutMode: passed ", passed, " from ", passed+failed);
}

bool test_api_GetAccountInformation ( ) {

   int passed = 0;
   int failed = 0;

   string result = "";
   
   result = api_GetAccountInformation("json");   
   
   Print( result );
   
   if ( assert( "{" == StringSubstr(result,0,1), "FAILED case1", "SUCCESS" ) == true ) {
      passed ++;
   } else {
      failed ++;
   }  
   
   Print( "test_api_GetAccountInformation: passed ", passed, " from ", passed+failed);
}

bool test_api_GetAllOpenedOrders ( ) {

   int passed = 0;
   int failed = 0;

   string result = "";
   
   result = api_GetAllOpenedOrders("json");   
   
   int handle = FileOpen("test_api\\test.json", FILE_WRITE);
   FileWrite( handle, result );
   FileClose( handle );
   
   
   if ( assert( "{" == StringSubstr(result,0,1), "FAILED case1", "SUCCESS" ) == true ) {
      passed ++;
   } else {
      failed ++;
   }  
   
   Print( "test_api_GetAllOpenedOrders: passed ", passed, " from ", passed+failed);
}

//+------------------------------------------------------------------+
//| script program start function                                    |
//+------------------------------------------------------------------+
int start()
  {
//----

      
   test_api_unserialize(); 
   test_api_serialize();
   
   test_api_AccountBalance();
   test_api_AccountCredit();   
   test_api_AccountCompany(); 
   test_api_AccountCurrency();
   test_api_AccountEquity();
   test_api_AccountFreeMargin();
   test_api_AccountFreeMarginCheck();
   test_api_AccountFreeMarginMode();
   test_api_AccountLeverage();
   test_api_AccountMargin();
   test_api_AccountName();
   test_api_AccountNumber();
   test_api_AccountProfit();
   test_api_AccountServer();
   test_api_AccountStopoutLevel();
   test_api_AccountStopoutMode();
   
   test_api_GetAccountInformation();
   
   test_api_GetAllOpenedOrders();
   
   
//----
   return(0);
  }
//+------------------------------------------------------------------+