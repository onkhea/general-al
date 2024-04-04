// page 50650 "Telegram Setup"
// {
//     PageType = Card;
//     SourceTable = "Telegram Setup";
//     // ApplicationArea = All;
//     //UsageCategory = Administration;
//     InsertAllowed = true;

//     layout
//     {
//         area(content)
//         {
//             group(General)
//             {
//                 field("Primary Key"; Rec."Primary Key")
//                 {
//                     ApplicationArea = all;
//                 }
//                 field("Telegram Chat ID"; Rec."Telegram Chat ID")
//                 {
//                     ApplicationArea = all;
//                 }
//                 field("Token"; Rec.Token)
//                 {
//                     ApplicationArea = All;
//                 }
//             }

//             part(Users; "Telegram Users")
//             {
//                 ApplicationArea = All;

//             }
//         }
//     }

//     actions
//     {
//         area(Processing)
//         {
//             action(GetUpdates)
//             {
//                 ApplicationArea = Basic, Suite;
//                 Promoted = true;
//                 PromotedCategory = Process;
//                 PromotedOnly = true;
//                 Image = Refresh;
//                 Caption = 'Refresh User';
//                 ToolTip = 'If you are registering a user, you must first go to the Telegram Bot and type the /Subscribe command';
//                 trigger OnAction();
//                 var
//                     Telegram: Codeunit Telegrams;
//                 begin
//                     // if rec.Find('-') then
//                     //     repeat
//                     Telegram.GetUpdates(Rec."Primary Key", rec."Telegram Chat ID", Rec.Token);
//                     //   until Rec.Next() = 0;
//                     //  TEst();
//                 end;
//             }
//         }
//     }
//     procedure TEst(): Integer
//     var
//         TelegramSetup: Record "Telegram Users";
//     begin
//         TelegramSetup.Reset();
//         Rec."Telegram Chat ID" := TelegramSetup."Telegram Chat ID";
//         rec.Modify();
//         exit;
//     end;

//     trigger OnOpenPage()
//     var
//         Telegram: Codeunit Telegrams;
//     begin
//         //  Rec.InsertIfNotExists;
//     end;
// }