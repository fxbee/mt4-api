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

//+------------------------------------------------------------------+
//| defines                                                          |
//+------------------------------------------------------------------+
// #define MacrosHello   "Hello, world!"
// #define MacrosYear    2005

//+------------------------------------------------------------------+
//| DLL imports                                                      |
//+------------------------------------------------------------------+
// #import "user32.dll"
//   int      SendMessageA(int hWnd,int Msg,int wParam,int lParam);

// #import "my_expert.dll"
//   int      ExpertRecalculate(int wParam,int lParam);
// #import

//+------------------------------------------------------------------+
//| EX4 imports                                                      |
//+------------------------------------------------------------------+
#import "api.ex4"

   int    api_unserialize(string serialized, string& result_data[], string separator="|");
   string api_serialize(string array[]);   
   
   string api_AccountBalance();
   string api_AccountCredit();
   string api_AccountCompany(); 
   string api_AccountCurrency();
   string api_AccountEquity();
   string api_AccountFreeMargin();
   string api_AccountFreeMarginCheck(string symbol, int cmd, double volume);
   string api_AccountFreeMarginMode();
   string api_AccountLeverage();
   string api_AccountMargin();
   string api_AccountName();
   string api_AccountNumber();
   string api_AccountProfit();
   string api_AccountServer();
   string api_AccountStopoutLevel();
   string api_AccountStopoutMode();
   
#import
//+------------------------------------------------------------------+