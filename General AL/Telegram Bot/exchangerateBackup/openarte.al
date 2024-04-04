// /// <summary>
// /// PageExtension currency (ID 67890) extends Record Currency Exchange Rates.
// /// </summary>
// pageextension 67890 currency extends "Currency Exchange Rates"
// {
//     layout
//     {

//         addafter("Starting Date")
//         {
//             field(TypeCurrency; Rec.TypeCurrency)
//             {
//                 ApplicationArea = all;
//                 Visible = true;
//             }
//             field(CurrncyName; rEC.CurrncyName)
//             {
//                 ApplicationArea = Suite;
//                 Caption = 'Exchange Rate Date';
//                 Editable = false;
//                 ToolTip = 'Specifies the date of the exchange rate in the Exchange Rate field. You can update the rate by choosing the Update Exchange Rates button.';

//                 trigger OnDrillDown()
//                 begin
//                     DrillDownActionOnPage;
//                 end;
//             }
//             field(Date; Rec.Date)
//             {
//                 ApplicationArea = all;
//                 Visible = true;
//             }
//         }
//         addlast(content)
//         {
//             usercontrol(exchange; exchangerate)
//             {
//                 ApplicationArea = all;
//                 Visible = true;
//                 trigger ControlAddInReady()
//                 begin
//                     CurrPage.exchange.load();
//                 end;
//                 // get data from add-in
//                 trigger SaveRequested(currencys: text; bids: Decimal; asks: Decimal)
//                 var
//                     CurrencyEx: Record CurrencyEx;
//                 begin
//                     CurrencyEx.DeleteAll();
//                     repeat
//                         CurrencyEx.Init();
//                         CurrencyEx."Currency Code" := CurrencyEx.Count() + 1;
//                         CurrencyEx."Starting Date" := Today;
//                         CurrencyEx.CurrncyName := currencys;
//                         CurrencyEx."Exchange Rate Amount" := bids;
//                         CurrencyEx."Adjustment Exch. Rate Amount" := asks;
//                         CurrencyEx.Insert();
//                         CurrencyEx.Modify();
//                     until Rec.Next() = 0;
//                 end;
//             }

//         }
//     }
//     actions
//     {
//         addfirst(processing)
//         {
//             action(GetAPI)
//             {
//                 Caption = 'get API';
//                 ApplicationArea = all;
//                 Promoted = true;
//                 PromotedCategory = Process;
//                 PromotedIsBig = true;
//                 PromotedOnly = true;
//                 trigger OnAction()
//                 begin
//                     Page.Run(50561);
//                     // currency := Getenum(Rec.TypeCurrency);
//                     //CurrPage.exchange.fetchData(Rec.Date);
//                     // currency := Getenum(Rec.TypeCurrency);
//                     // Message(currency);
//                 end;

//             }
//         }
//     }
//     var
//         currency: text;
//         bid: Decimal;
//         ask: Decimal;
//         officialExchangeRate: Decimal;
//         dated: text;

//     local procedure DrillDownActionOnPage()
//     var
//         CurrExchRate: Record "CurrencyEx";
//     begin
//         CurrExchRate.SetRange(CurrncyName, Rec.CurrncyName);
//         PAGE.RunModal(0, CurrExchRate);
//         CurrPage.Update(false);
//     end;
//     /// <summary>
//     /// Getenum.
//     /// </summary>
//     /// <param name="ValueEnum">Enum TypeCurrency.</param>
//     /// <returns>Return value of type Text.</returns>
//     procedure Getenum(ValueEnum: Enum TypeCurrency): Text
//     var
//         Index: Integer;
//         ValueName: text;
//     begin
//         Index := ValueEnum.Ordinals().IndexOf(ValueEnum.AsInteger());
//         ValueEnum.Names().Get(Index, ValueName);
//         exit(ValueName);

//     end;
// }
// tableextension 50078 currency extends "Currency Exchange Rate"
// {
//     fields
//     {
//         field(293; CurrncyName; text[100])
//         {
//             trigger OnLookup()
//             begin

//             end;
//         }
//         field(290; TypeCurrency; Enum TypeCurrency)
//         {

//         }
//         field(291; Date; Text[100])
//         {

//         }
//     }
// }
// enum 69845 TypeCurrency
// {
//     Extensible = true;
//     AssignmentCompatibility = true;

//     value(0; " ") { Caption = ' '; }
//     value(1; "officialExchangeRate") { Caption = 'officialExchangeRate'; }
//     value(2; "European Euro") { Caption = 'European Euro'; }
//     value(3; "China Yuan") { Caption = 'China Yuan'; }
//     value(4; "Canadian Dollar") { Caption = 'Canadian Dollar'; }
//     value(5; "Australian Dollar") { Caption = 'Australian Dollar'; }
// }
// table 56798 CurrencyEx
// {

//     fields
//     {
//         field(112; CurrncyName; text[100])
//         {

//         }

//         field(291; Date; Text[100])
//         {

//         }
//         field(1; "Currency Code"; Integer)
//         {

//         }
//         field(2; "Starting Date"; Date)
//         {
//             Caption = 'Starting Date';
//         }
//         field(3; "Exchange Rate Amount"; Decimal)
//         {
//             Caption = 'Exchange Rate Amount';
//         }
//         field(4; "Adjustment Exch. Rate Amount"; Decimal)
//         {

//         }
//         field(5; "Relational Currency Code"; Code[10])
//         {

//         }
//         field(6; "Relational Exch. Rate Amount"; Decimal)
//         {

//         }
//         field(7; "Fix Exchange Rate Amount"; Option)
//         {
//             Caption = 'Fix Exchange Rate Amount';
//             OptionCaption = 'Currency,Relational Currency,Both';
//             OptionMembers = Currency,"Relational Currency",Both;
//         }
//     }
// }