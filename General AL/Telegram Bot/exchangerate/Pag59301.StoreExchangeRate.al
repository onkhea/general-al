/// <summary>
/// Page ExchangeRate (ID 59301).
/// </summary>
page 59301 ExchangeRate
{
    ApplicationArea=all;
    Caption = 'Currency Exchanges';
    UsageCategory = Administration;
    PageType = List;
    SourceTable = "Currency Exchanges";

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Currency Code"; Rec."Currency Code")
                {
                    ApplicationArea = All;
            
                }
                field(CurrncyName; Rec.CurrncyName)
                {
                    ApplicationArea = All;
               
                }
                field("Exchange Rate Amount"; Rec.bid)
                {
                    ApplicationArea = All;
                
                }
                field("Starting Date"; Rec."Select Date")
                {
                    ApplicationArea = All;
                  
                }
                field("Adjustment Exch. Rate Amount"; Rec.ask)
                {
                    ApplicationArea = All;
                  
                } 

            }
        }
    }

}
