pageextension 50711 "Sales Order Ext" extends "Sales Order List"
{
    layout 
    {
        addafter ("Location Code")
        {
            field("Salesperson Codes";Rec."Salesperson Code")
            {
                ApplicationArea =all;
            }
        }
    }
}
