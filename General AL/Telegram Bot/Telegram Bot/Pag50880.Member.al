page 50880 Member
{
    ApplicationArea = All;
    Caption = 'Member';
    PageType = List;
    SourceTable = "Workflow User Group Member";
    UsageCategory = Administration;
    
    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Approval User ID"; Rec."Approval User ID")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Approval User ID field.';
                }
                field("Sequence No."; Rec."Sequence No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the order of approvers when an approval workflow involves more than one approver.';
                }
                field(SystemCreatedAt; Rec.SystemCreatedAt)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the SystemCreatedAt field.';
                }
                field(SystemCreatedBy; Rec.SystemCreatedBy)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the SystemCreatedBy field.';
                }
                field(SystemId; Rec.SystemId)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the SystemId field.';
                }
                field(SystemModifiedAt; Rec.SystemModifiedAt)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the SystemModifiedAt field.';
                }
                field(SystemModifiedBy; Rec.SystemModifiedBy)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the SystemModifiedBy field.';
                }
                field("Telegram Chat ID"; Rec."Telegram Chat ID")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Telegram Chat ID field.';
                }
                field("Telegram User ID"; Rec."Telegram User ID")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Telegram User ID field.';
                }
                field(Token; Rec.Token)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Token field.';
                }
                field("User Name"; Rec."User Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the name of the workflow user.';
                }
                field("Workflow User Group Code"; Rec."Workflow User Group Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Workflow User Group Code field.';
                }
            }
        }
    }
}
