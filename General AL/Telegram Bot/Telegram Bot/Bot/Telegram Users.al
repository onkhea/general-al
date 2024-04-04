// table 50651 "Telegram Users"
// {
//     fields
//     {
//         field(50653; Id; Integer)
//         {
//             Editable = false;
//         }

//         field(50650; "Telegram Chat ID"; Integer)
//         {
//             Editable = false;
//         }
//         field(50651; "Telegram User ID"; Text[70])
//         {
//             Editable = false;
//         }
//         field(50652; "Approval User ID"; Code[50])
//         {
//             TableRelation = "User Setup";
//         }
//         field(2; Token; Text[100])
//         {
//             Editable = false;
//         }
//     }

//     keys
//     {
//         key(Key1; "Id")
//         {
//             Clustered = true;
//         }
//     }
// }