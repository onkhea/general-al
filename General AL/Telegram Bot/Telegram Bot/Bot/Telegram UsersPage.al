// page 50651 "Telegram Users"
// {
//     ApplicationArea = all;
//     UsageCategory = Administration;
//     SourceTable = "Telegram Users";
//     PageType = ListPart;
//     InsertAllowed = false;
//     DeleteAllowed = true;

//     layout
//     {
//         area(content)
//         {
//             repeater(Control)
//             {
//                 field(Id;Rec.Id)
//                 {
//                     ApplicationArea =all;
//                 }
//                 field("Telegram Chat ID"; Rec."Telegram Chat ID")
//                 {
//                     ApplicationArea = all;
//                 }
//                 field("Telegram User ID"; Rec."Telegram User ID")
//                 {
//                     Caption = 'Telegram User';
//                     ApplicationArea = All;
//                     Editable = false;
//                 }
//                 field("Approval User ID"; Rec."Approval User ID")
//                 {
//                     ApplicationArea = All;
//                 }
//                 field(Token;Rec.Token)
//                 {
//                     ApplicationArea =all;
//                     Visible = true;
//                 }
//             }
//         }
//     }
//     trigger OnOpenPage()
//     var

//         TelegramSetup: Record "Telegram Setup";
//     begin
      
//         // Rec.InsertIfNotExists;
//     end;
// }

