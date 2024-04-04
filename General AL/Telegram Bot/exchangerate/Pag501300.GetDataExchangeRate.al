
/// <summary>
/// Page Exchange Rate (ID 50130).
/// </summary>
page 50130 "Exchange Rate"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Currency Exchange";
    RefreshOnActivate = true;
    layout
    {

        area(Content)
        {
            group("Select Dates")
            {
                field("Select Date"; SelectDate)
                {
                    Caption = 'Select Date';
                    ApplicationArea = all;
                    Visible = true;
                }
            }

            repeater(Exchanges)
            {

                field(CurrncyName; Rec.CurrncyName)
                {
                    Visible = true;
                    ApplicationArea = all;
                    Editable = false;
                }
                field("Currency Code"; Rec."Currency Code")
                {
                    Visible = true;
                    ApplicationArea = all;
                    Editable = false;
                }
                field("bid"; Rec.bid)
                {
                    ApplicationArea = all;
                    Visible = true;
                    Caption = 'bid';
                    Editable = false;
                }
                field("ask"; Rec.ask)
                {
                    Visible = true;
                    ApplicationArea = all;
                    Caption = 'ask';
                    Editable = false;
                }
                field("Exchange Rate on"; Rec."Select Date")
                {
                    Caption = 'Exchange Rate on';
                    Visible = true;
                    ApplicationArea = all;
                    Editable = false;
                }
            }
            usercontrol(exchange; exchangerate)
            {
                ApplicationArea = all;
                Visible = true;
                trigger ControlAddInReady()
                begin
                    CurrPage.exchange.load();
                end;
                // get data from add-in
                trigger SaveRequested(currencys: text; CurrencyCode: Text; bids: Decimal; asks: Decimal)
                begin
                    Rec.Init();
                    Rec."Currency Code" := CurrencyCode;
                    Rec.CurrncyName := currencys;
                    Rec.bid := bids;
                    Rec.ask := asks;
                    Rec."Select Date" := SelectDate;
                    Rec.Insert();
                    CurrPage.Activate(true);
                end;

                trigger GetData(currency: Text; bid: Decimal)
                begin
                    Rec.Init();
                    Rec."Currency Code" := 'USD/KHR';
                    Rec.CurrncyName := currency;
                    Rec.bid := bid;
                    Rec."Select Date" := SelectDate;
                    Rec.Insert();
                end;
            }
        }

    }

    actions
    {
        area(Creation)
        {
            // reload api
            action(NewAction)
            {
                ApplicationArea = All;
                Image = Add;
                Caption = 'Save Exchange Rate';
                Promoted = true;
                PromotedCategory = Process;
                trigger OnAction()
                begin
                    DrillDownActionOnPage();
                end;

            }

            action(GetAPI)
            {
                Caption = 'Get API';
                ApplicationArea = all;
                Promoted = true;
                Image = GetSourceDoc;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;
                trigger OnAction()
                var
                    Exchange: Record "Currency Exchange";
                    Date: Text;
                    Dates: Text;
                begin
                    Date := FORMAT(SelectDate, 10, '<Day,2>,<Month,2>,<Year4>');
                    Dates := '' + COPYSTR(Date, 7, 10) + '-' + COPYSTR(Date, 4, 2) + '-' + COPYSTR(Date, 1, 2);
                    Rec.Find('-');
                    if Rec.Find('-') then
                        Rec.DeleteAll();
                    if not Rec.Find() then
                        CurrPage.exchange.fetchData(Dates);

                end;

            }
        }
    }
    trigger OnAfterGetRecord()
    begin
        CurrPage.Activate();
    end;


    local procedure DrillDownActionOnPage()
    var
        CurrExchRate: Record "Currency Exchanges";
    begin
        CurrExchRate.Reset();
        if Rec.FindSet() then
            repeat
                CurrExchRate.Init();
                CurrExchRate."No." := CurrExchRate.Count() + 1;
                CurrExchRate."Currency Code" := Rec."Currency Code";
                CurrExchRate.CurrncyName := Rec.CurrncyName;
                CurrExchRate.ask := Rec.ask;
                CurrExchRate.bid := Rec.bid;
                CurrExchRate."Select Date" := Rec."Select Date";
                CurrExchRate.Insert();
            until Rec.Next() = 0;
    end;

    var
        SelectDate: Date;
}

table 58370 "Currency Exchanges"
{
    Caption = 'Currency Exchange Rate';
    fields
    {
        field(1; "No."; Integer)
        {
            Editable = false;
        }
        field(293; CurrncyName; text[40])
        {
            Caption = 'Currncy Name';
            Editable = false;
        }
        field(2; "Currency Code"; Text[20])
        {
            Caption = 'Currency Code';
            Editable = false;
        }
        field(42; "Select Date"; Date)
        {
            Editable = false;
            Caption = 'Select Date';
        }
        field(3; bid; Decimal)
        {
            Editable = false;
        }
        field(4; ask; Decimal)
        {
            Editable = false;
        }
    }

    keys
    {
        key(Key1; "No.")
        {
            Clustered = true;
        }
    }
}
table 58330 "Currency Exchange"
{
    TableType = Temporary;
    Caption = 'Currency Exchange Rate';
    fields
    {
        field(293; CurrncyName; text[40])
        {
            Caption = 'Currncy Name';
        }
        field(1; "Currency Code"; Text[20])
        {
            Caption = 'Currency Code';
        }
        field(2; "Select Date"; Date)
        {
            Caption = 'Select Date';
        }
        field(3; bid; Decimal)
        {

        }
        field(4; ask; Decimal)
        {

        }

    }

    keys
    {
        key(Key1; "Currency Code")
        {
            Clustered = true;
        }
    }
}