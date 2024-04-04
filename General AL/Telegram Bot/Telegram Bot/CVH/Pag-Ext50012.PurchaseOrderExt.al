pageextension 50712 "Purchase Order Ext" extends "Purchase Order List"
{
      layout 
    {
        addafter ("Location Code")
        {
            field("Purchaser Codes";Rec."Purchaser Code")
            {
                ApplicationArea =all;
            }
        }
    }
}
