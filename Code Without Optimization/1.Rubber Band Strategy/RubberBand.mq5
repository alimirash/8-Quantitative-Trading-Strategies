//+------------------------------------------------------------------+
//|                                                   RubberBand.mq5 |
//|                                        Copyright 2024, AliMirash |
//|                                                                  |
//+------------------------------------------------------------------+
#property copyright "Copyright 2024, AliMirash"
#property version   "1.00"

#include <Trade/Trade.mqh>
CTrade trade;

double ATR = 0;
int interval = 5;

double highest = 0;
double lowest = 0;

double prev_high_point = 0;
double high_point = 0;

input double Lot = 0.5;//LotSize
input double Stl = 0.0015;//Stop Loss
input double RR = 2; //R/R

input double NumberOfCalculation = 50;
input double multiplyATR = 2.5;

//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit()
  {
//---

//---
   return(INIT_SUCCEEDED);
  }
//+------------------------------------------------------------------+
//| Expert deinitialization function                                 |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
//---

  }
//+------------------------------------------------------------------+
//| Expert tick function                                             |
//+------------------------------------------------------------------+
void OnTick()
  {
//---
// ATR = iATR(Symbol() , PERIOD_CURRENT , interval);
   int rates = iBars(Symbol(), PERIOD_CURRENT);
   if(rates == NumberOfCalculation)
     {
      Initial_ATR();
     }
   else
      if(rates > NumberOfCalculation)
        {
         if(iClose(Symbol(),PERIOD_CURRENT,0) > ATR * multiplyATR +iHigh(Symbol(),PERIOD_CURRENT,1))
           {
            double price =iClose(Symbol(),PERIOD_CURRENT,0);
            Print("---- Sell // ATR = ", ATR, "Price = ", price, "High = ",iHigh(Symbol(),PERIOD_CURRENT,1));

            double StopLoss = price * (1 + Stl);
            double TakeProfit = price * (1- (RR * Stl));
            trade.Sell(Lot,Symbol(),price,StopLoss,TakeProfit,"Sell On Position");
           }
         if(iClose(Symbol(),PERIOD_CURRENT,0) < iLow(Symbol(),PERIOD_CURRENT,1) - ATR * multiplyATR)
           {
            double price =iClose(Symbol(),PERIOD_CURRENT,0);
            Print("---- Buy // ATR = ", ATR, "Price = ", price, "High = ",iHigh(Symbol(),PERIOD_CURRENT,1));

            double StopLoss = price * (1 - Stl);
            double TakeProfit = price * (1 + (RR * Stl));
            trade.Buy(Lot,Symbol(),price, StopLoss,TakeProfit,"Sell On Position");
           }
         Calculate_ATR();
        }

  }
//+------------------------------------------------------------------+

//Calculate a 5-day average of the (High minus Low - (H-L)). That is the "ATR".
void Initial_ATR()
  {
   double sum = 0 ;
   for(int i=0; i<interval; i++)
     {
      double high = iHigh(Symbol(), PERIOD_CURRENT, i);
      double low = iLow(Symbol(), PERIOD_CURRENT,i);
      UpdateHL(high, low);
      sum += high - low;
     }
   ATR = sum / interval;
  }
//+------------------------------------------------------------------+
void Calculate_ATR()
  {
   double high = iHigh(Symbol(), PERIOD_CURRENT, 0);
   double low = iLow(Symbol(), PERIOD_CURRENT,0);
   UpdateHL(high, low);
   ATR = (((interval - 1) * ATR) + (high - low)) / interval;
  }
//+------------------------------------------------------------------+
void UpdateHL(double high, double low)
  {
   if(highest < high)
     {
      highest = high;
     }
   if(lowest > low)
     {
      lowest = low;
     }
  }
//+------------------------------------------------------------------+
