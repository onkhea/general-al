// /// <summary>
// /// Page Exchange Rate Page (ID 50100).
// /// </summary>
// page 50100 "Exchange Rate Page"
// {
//     PageType = Card;
//     ApplicationArea = All;
//     UsageCategory = Administration;

//     layout
//     {
//         area(Content)
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
//                 trigger SaveRequested(currencys: text; bids: Decimal; asks: Decimal; officialExchangeRates: Decimal; dates: text)
//                 begin
//                     currency := currencys;
//                     bid := bids;
//                     ask := asks;
//                     officialExchangeRate := officialExchangeRates;
//                     dated := dates;
//                 end;
//             }
//             field(dates; dated)
//             {
//                 Caption = 'date';
//                 ApplicationArea = all;
//                 Visible = true;
//             }
//             field(officialExchangeRate; officialExchangeRate)
//             {
//                 ApplicationArea = all;
//                 Visible = true;
//             }
//             field(currencyEn; TypeCurrency)
//             {
//                 ApplicationArea = all;
//                 Visible = true;
//             }
//             field(bid; bid)
//             {
//                 ApplicationArea = all;
//                 Visible = true;
//             }
//             field(ask; ask)
//             {
//                 ApplicationArea = all;
//                 Visible = true;
//             }
//         }

//     }

//     actions
//     {
//         area(Creation)
//         {
//             // reload api
//             action(NewAction)
//             {
//                 ApplicationArea = All;
//                 Image = New;
//                 Caption = 'Refresh Exchange Rate';
//                 Promoted = true;
//                 PromotedCategory = Process;
//                 trigger OnAction()
//                 begin
//                     currency := Getenum(TypeCurrency);
//                     CurrPage.exchange.fetchData(currency, dated);
//                 end;

//             }
//         }
//     }
//     procedure Getenum(ValueEnum: Enum TypeCurrency): Text
//     var
//         Index: Integer;
//         ValueName: text;
//     begin
//         Index := ValueEnum.Ordinals().IndexOf(ValueEnum.AsInteger());
//         ValueEnum.Names().Get(Index, ValueName);
//         exit(ValueName);

//     end;

//     var
//         HttpClient: HttpClient;
//         HttpRequestMessage: HttpRequestMessage;
//         HttpResponseMessage: HttpResponseMessage;
//         ResponseText: Text;
//         ApiUrl: Text;
//         currency: text;
//         bid: Decimal;
//         ask: Decimal;
//         officialExchangeRate: Decimal;
//         dated: text;
//         TypeCurrency: Enum TypeCurrency;
// }

// // enum 69845 TypeCurrency
// // {
// //     Extensible = true;
// //     AssignmentCompatibility = true;

// //     value(0; " ") { Caption = ' '; }
// //     value(1; "officialExchangeRate") { Caption = 'officialExchangeRate'; }
// //     value(2; "European Euro") { Caption = 'European Euro'; }
// //     value(3; "China Yuan") { Caption = 'China Yuan'; }
// //     value(4; "Canadian Dollar") { Caption = 'Canadian Dollar'; }
// //     value(5; "Australian Dollar") { Caption = 'Australian Dollar'; }
// // }
