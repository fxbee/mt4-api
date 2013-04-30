//+------------------------------------------------------------------+
//|                                                          api.mq4 |
//|                                   Copyright 2013, Jaromir Muller |
//|                                     http://www.jaromirmuller.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2013, Jaromir Muller"
#property link      "http://www.jaromirmuller.com"

#property library

//+------------------------------------------------------------------+
//| parse_serialized_string_array parses serialized string           |
//| it splits string by separator char, serialized string has to be  |
//| in format:                                                       |
//|   {COUNT}{SEPARATOR}{VALUE}{SEPARATOR}{VALUE}                    |
//| where {COUNT} is nummber of values to parse                      |
//|       {SEPARATOR} is delimiting char, ie. pipe (|)               |
//|       {VALUE} is string value                                    |
//+------------------------------------------------------------------+

int parse_serialized_string_array(string serialized, string& result_data[], string separator="|") {

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
//+------------------------------------------------------------------+