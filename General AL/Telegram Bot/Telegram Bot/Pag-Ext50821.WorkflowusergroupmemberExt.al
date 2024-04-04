pageextension 50821 "Workflow user group memberExt" extends "Workflow User Group Members"
{
    layout
    {


        addafter("User Name")
        {
            
            field("Workflow User Group Code"; Rec."Workflow User Group Code")
            {
                ApplicationArea = all;
            }
            field("Telegram Chat ID"; Rec."Telegram Chat ID")
            {
                ApplicationArea = all;
            }
            field("Telegram User ID"; Rec."Telegram User ID")
            {
                Caption = 'Telegram User';
                ApplicationArea = All;
                Editable = false;
            }
            field("Approval User ID"; Rec."Approval User ID")
            {
                ApplicationArea = All;
            }
            field(Token; Rec.Token)
            {
                ApplicationArea = all;
                Visible = true;
            }
            
        }
    }

}
