//+------------------------------------------------------------------+
//|                                                          api.mq4 |
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

#property library

#include <stderror.mqh>

#define API_SERIALIZE_SEPARATOR "|"

//+------------------------------------------------------------------+
//| parse_serialized_string_array parses serialized string           |
//| it splits string by separator char, serialized string has to be  |
//| in format:                                                       |
//|   {COUNT}{SEPARATOR}{VALUE}{SEPARATOR}{VALUE}                    |
//| where {COUNT} is nummber of values to parse                      |
//|       {SEPARATOR} is delimiting char, ie. pipe (|)               |
//|       {VALUE} is string value                                    |
//+------------------------------------------------------------------+

int api_unserialize(string serialized, string& result_data[], string separator="|") {

   int      n              = 0;   
   int      first_sep      = StringFind( serialized, separator, 0);
   string   length_str     = StringSubstr( serialized, 0, first_sep);
   int      number_of_items = StrToInteger(length_str);
   int      r              = ArrayResize(result_data, number_of_items);         
   string   str            = StringSubstr( serialized, first_sep+1 ); 
     
   while( 1==1 ) {   
      int next_sep = StringFind( str, separator);
      
      if ( next_sep == 0 ) { 
         result_data[n] = "";
      } else {
         result_data[n] = StringSubstr( str, 0, next_sep);
      }

      n++;
      str = StringSubstr( str, next_sep+1);
      
      if ( next_sep == -1 ) {
         break;
      }         
   }
}

string api_serialize(string array[]) {

   string result = "";
   
   if ( ArraySize(array) > 0 ) {
      result = ArraySize(array);
 
      for( int i=0; i<ArraySize(array); i++) {
         result = StringConcatenate(result, API_SERIALIZE_SEPARATOR, array[i]);
      }
   }  

   return (result);   
}

//+------------------------------------------------------------------+
//| Account Information                                              |
//|                                                                  |
//| http://docs.mql4.com/account                                     |
//+------------------------------------------------------------------+

string api_AccountBalance() {

   double result = AccountBalance();
   string str_result[1];
   
   str_result[0] = DoubleToStr(result, 5);
   
   return (api_serialize(str_result));
}

string api_AccountCredit(){

   double result = AccountCredit();
   string str_result[1];
   
   str_result[0] = DoubleToStr(result, 5);
   
   return (api_serialize(str_result));
}

string api_AccountCompany(){

   string result = AccountCompany();
   string str_result[1];
   
   str_result[0] = result;
   
   return (api_serialize(str_result));
}
 
string api_AccountCurrency(){

   string result = AccountCurrency();
   string str_result[1];
   
   str_result[0] = result;
   
   return (api_serialize(str_result));
}

string api_AccountEquity(){

   double result = AccountEquity();
   string str_result[1];
   
   str_result[0] = DoubleToStr(result, 5);
   
   return (api_serialize(str_result));
}

string api_AccountFreeMargin(){

   double result = AccountFreeMargin();
   string str_result[1];
   
   str_result[0] = DoubleToStr(result, 5);
   
   return (api_serialize(str_result));
}

string api_AccountFreeMarginCheck(string symbol, int cmd, double volume) {

   double result = AccountFreeMarginCheck(symbol, cmd, volume);
   string str_result[3];

   if ( result <= 0 || GetLastError() == ERR_NOT_ENOUGH_MONEY ) {
      str_result[0] = 0.0;
      str_result[1] = "ERR_NOT_ENOUGH_MONEY";
      str_result[2] = ERR_NOT_ENOUGH_MONEY;
   } else {   
      str_result[0] = DoubleToStr(result, 5);
      str_result[1] = "ERR_NO_ERROR";
      str_result[2] = ERR_NO_ERROR;  
   }
   
   return (api_serialize(str_result));
}

string api_AccountFreeMarginMode(){

   double result = AccountFreeMarginMode();
   string str_result[1];
   
   str_result[0] = DoubleToStr(result, 5);
   
   return (api_serialize(str_result));
}

string api_AccountLeverage(){

   int result = AccountLeverage();
   string str_result[1];
   
   str_result[0] = result;
   
   return (api_serialize(str_result));
}

string api_AccountMargin(){

   double result = AccountMargin();
   string str_result[1];
   
   str_result[0] = DoubleToStr(result, 5);
   
   return (api_serialize(str_result));
}

string api_AccountName(){

   string result = AccountName();
   string str_result[1];
   
   str_result[0] = result;
   
   return (api_serialize(str_result));
}

string api_AccountNumber(){

   int result = AccountNumber();
   string str_result[1];
   
   str_result[0] = result;
   
   return (api_serialize(str_result));
}

string api_AccountProfit(){

   double result = AccountProfit();
   string str_result[1];
   
   str_result[0] = DoubleToStr(result, 5);
   
   return (api_serialize(str_result));
}

string api_AccountServer(){

   string result = AccountServer();
   string str_result[1];
   
   str_result[0] = result;
   
   return (api_serialize(str_result));
}

string api_AccountStopoutLevel(){

   int result = AccountStopoutLevel();
   string str_result[1];
   
   str_result[0] = result;
   
   return (api_serialize(str_result));
}

string api_AccountStopoutMode(){

   double result = AccountStopoutMode();
   string str_result[1];
   
   str_result[0] = result;
   
   return (api_serialize(str_result));
}

