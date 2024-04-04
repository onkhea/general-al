tableextension 50821 "Workflow group member Ext" extends "Workflow User Group Member"
{
    fields
    {
        field(50649; Id; Integer)
        {

        }
        field(50650; "Telegram Chat ID"; Integer)
        {
            Editable = false;
        }
        field(50651; "Telegram User ID"; Text[70])
        {
            Editable = false;
        }
        field(50652; "Approval User ID"; Code[50])
        {
            TableRelation = "User Setup";
        }
        field(50653; Token; Text[100])
        {
            Editable = false;
        }
        modify("Workflow User Group Code")
        {
           // BlankZero = false;
            TableRelation = "Workflow User Group";

        }
    }
    keys
    {
        key(Key3; Id)
        {
        }
    }
}
