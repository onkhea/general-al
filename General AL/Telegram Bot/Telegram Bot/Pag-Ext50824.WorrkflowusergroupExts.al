pageextension 50824 "Worrkflow user group Exts" extends "Workflow User Groups"
{
    layout
    {
        addafter(Description)
        {
            field(Token;Rec.Token)
            {
                ApplicationArea = all;
            }
            
        }
    }
}
