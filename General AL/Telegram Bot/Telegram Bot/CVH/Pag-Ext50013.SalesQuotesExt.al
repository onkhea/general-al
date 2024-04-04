pageextension 50713 "Sales Quotes Ext" extends "Sales Quotes"
{
    layout 
    {
        addafter("Location Code")
        {
            field("Salesperson Codes";Rec."Salesperson Code")
            {
                ApplicationArea =all;
            }
        }
    }
}
