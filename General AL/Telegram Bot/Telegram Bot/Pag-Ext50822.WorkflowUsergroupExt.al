pageextension 50822 "Workflow User groupExt" extends "Workflow User Group"
{
    layout
    {
        addafter(Description)
        {
            field("Table ID";Rec."Table ID")
            {
                ApplicationArea = all;
            }
            field (Token;Rec.Token)
            {
                ApplicationArea =all;
            }
        }
    }
    actions
    {
        addfirst(Processing)
        {
            action(GetUpdates)
            {
                ApplicationArea = Basic, Suite;
                Promoted = true;
                PromotedCategory = Process;
                PromotedOnly = true;
                Image = Refresh;
                Caption = 'Refresh User';
                ToolTip = 'If you are registering a user, you must first go to the Telegram Bot and type the /Subscribe command';
                trigger OnAction();
                var
                    Telegram: Codeunit "Telegrams";
                begin
                    Telegram.GetUpdates(Rec.Code, rec."Telegram Chat ID", Rec.Token);
                end;
            }
        }
    }

    local procedure InsertCode(): Code[100]
    begin

    end;

    trigger OnOpenPage()
    var
        Telegram: Codeunit "Telegrams";
    begin
       
        //    Rec.InsertIfNotExists;
    end;
}
