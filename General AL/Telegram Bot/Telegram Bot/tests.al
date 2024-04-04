page 50044 Test 
{
    ApplicationArea =all;
    UsageCategory =Administration;
    PageType = Card;
    Caption = 'Test';
    layout
    {
        area(Content)
        {
            field(Url;Url)
            {
                Visible =true;
                ApplicationArea =all;

            }
            usercontrol(control;"Microsoft.Dynamics.Nav.Client.WebPageViewer")
            {
                ApplicationArea =all;
                Visible =true;
                trigger ControlAddInReady(callbackUrl: Text)
                begin
                    
                end;
            }
        }
    }
    actions {
        area(Processing)
        {
            action(Ok)
            {
                Image = Placeholder;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig =true;
                PromotedOnly =true;
                trigger OnAction()
                begin
                    CurrPage.control.SetContent('<a href='+Url+'>OK</a>');
                end;
            }
        }
    }
    var 
    Url : text ;
}