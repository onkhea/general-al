// page 50825 "Telegram Page"
// {
//     ApplicationArea = all;
//     UsageCategory = Administration;
//     SourceTable = "Telegram Setup";
//     PageType = List;
//     CardPageId = "Telegram Setup";
//     RefreshOnActivate = true;
//     Editable = false;
//     layout
//     {
//         area(Content)
//         {
//             repeater(Api)
//             {
//                 field("Primary Key"; Rec."Primary Key")
//                 {
//                     ApplicationArea = all;
//                     Editable = false;
//                 }
//                 field("Telegram Chat ID"; Rec."Telegram Chat ID")
//                 {
//                     ApplicationArea = all;

//                 }
//                 field(Token; Rec.Token)
//                 {
//                     ApplicationArea = all;
//                     Editable = false;
//                 }
//             }
//         }
//     }

// }
// table 50650 "Telegram Setup"
// {
//     fields
//     {
//         field(1; "Primary Key"; Code[10])
//         {
//         }
//         field(2; Token; Text[100])
//         {
//         }
//         field(3; "Telegram Chat ID"; Integer)
//         {
//         }
        
//     }

//     keys
//     {
//         key(Key1; "Primary Key")
//         {
//             Clustered = true;
//         }
//     }

//     procedure InsertIfNotExists()
//     var
//         Set: Record "Telegram Users";
//     begin
//         // if not Get() then begin
//         //     Init();
//         //     Insert(true);
//         // end;
//     end;

// }