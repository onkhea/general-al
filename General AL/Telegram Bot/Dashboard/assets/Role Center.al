

/// <summary>
/// Page Teams Role Center (ID 60123).
/// </summary>
page 60123 "Teams Role Center"
{
    Caption = 'Business Manager';
    PageType = RoleCenter;
    layout
    {
        area(RoleCenter)
        {
            part(Control; Control)
            {
                Visible = true;
                ApplicationArea = All;
                Caption = 'Dashbord';
            }
        }
    }
}