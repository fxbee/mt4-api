//+------------------------------------------------------------------+
//|                                                          api.mq4 |
//|                                   Copyright 2013, Jaromir Muller |
//|                                     http://www.jaromirmuller.com |
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
   int parse_serialized_string_array(string serialized, string& result_data[], string separator="|");
   int return123();
#import
//+------------------------------------------------------------------+