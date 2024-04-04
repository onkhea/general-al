pageextension 59711 "Item Ext:" extends "Item List"
{
    PromotedActionCategories = 'Change Company,New,Process,Report,Item,History,Prices & Discounts,Request Approval,Periodic Activities,Inventory,Attributes';
    layout
    {

    }
    actions
    {
        addfirst(processing)
        {
            group(Company)
            {
                Caption = 'Company';
                action(SelectedCompany)
                {
                    ApplicationArea = all;
                    Caption = 'Company Name';
                    Image = Change;
                    Promoted = true;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    ToolTip = 'Specifies the name of the company that is used for the report.';

                    trigger OnAction()
                    var
                        Company: Record Company;
                    begin
                         Company.ChangeCompany();
                    end;

                }
                 action(SelectedCompanys)
                {
                    ApplicationArea = all;
                    Caption = 'Company Names';
                    Image = Change;
                    Promoted = true;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    ToolTip = 'Specifies the name of the company that is used for the report.';

                    trigger OnAction()
                    var
                        Company: Record Company;
                    begin
                        Company.ChangeCompany();
                    end;

                }
            }
        }
    }
}
