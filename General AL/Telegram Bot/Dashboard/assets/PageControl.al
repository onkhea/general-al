/// <summary>
/// Page Control (ID 50323).
/// </summary>
page 50323 "Control"
{
    PageType = CardPart;
    ApplicationArea = all;
    UsageCategory = Administration;


    layout
    {
        area(Content)
        {
            usercontrol(MainForm; MainForm)
            {
                ApplicationArea = All;
                trigger ControlAddInReady()
                begin
                    CurrPage.MainForm.load();
                    Sales();
                    Purchase();
                    Customers();
                    Vedors();
                end;

                trigger Onclick(Name: Text)
                begin
                    case Name of
                        'Sales':
                            Page.Run(48);
                        'Purchase':
                            Page.Run(53);
                        'Customers':
                            Page.Run(22);
                        'Vedors':
                            Page.Run(27);
                    end;
                end;
            }
        }
    }
    /// <summary>
    /// Sales.
    /// </summary>
    procedure Sales()
    var
        SaleName: Text;
        Value: Text;
        SelectedSalesLines: Record "Sales Line";
        TotalAmount: Decimal;
        TotalQuantity: Decimal;
        LinesCount: Integer;
        LinesAverage: Decimal;
    begin
        SelectedSalesLines.Reset();
        LinesCount := 0;
        LinesAverage := 0;
        TotalAmount := 0;
        TotalQuantity := 0;
        CurrPage.SetSelectionFilter(SelectedSalesLines);
        if SelectedSalesLines.FindSet() then
            repeat
                LinesCount += 1;
                TotalAmount += SelectedSalesLines.Amount;
                TotalQuantity += SelectedSalesLines.Quantity;
            until SelectedSalesLines.Next() = 0;
        if LinesCount > 0 then begin
            LinesAverage := TotalAmount / LinesCount;
        end;
        // Format the decimal with commas
        SaleName := SelectedSalesLines.TableCaption();
        CurrPage.MainForm.Sales(SaleName, TotalAmount, '');
    end;
    /// <summary>
    /// Purchase.
    /// </summary>

    procedure Vedors()
    var
        Vendor: Text;
        Value: Text;
        Vendors: Record Vendor;
        TotalAmount: Decimal;
        TotalQuantity: Decimal;
        LinesCount: Integer;
        LinesAverage: Decimal;
    begin
        Vendors.Reset();
        LinesCount := 0;
        LinesAverage := 0;
        TotalAmount := 0;
        TotalQuantity := 0;
        CurrPage.SetSelectionFilter(Vendors);
        if Vendors.FindSet() then
            repeat
                LinesCount += 1;
                TotalAmount += Vendors.Count();
            //TotalQuantity += Vendors.Quantity;
            until Vendors.Next() = 0;
        if LinesCount > 0 then begin
            LinesAverage := TotalAmount / LinesCount;
        end;
        Vendor := Vendors.TableCaption();
        CurrPage.MainForm.Vendor(Vendor, TotalAmount, '');
    end;
    /// <summary>
    /// Cutomers.
    /// </summary>
    procedure Customers()
    var

        Customer: Text;
        Value: Text;
        Customers: Record Customer;
        TotalAmount: Decimal;
        TotalQuantity: Decimal;
        LinesCount: Integer;
        LinesAverage: Decimal;
    begin
        Customers.Reset();
        LinesCount := 0;
        LinesAverage := 0;
        TotalAmount := 0;
        TotalQuantity := 0;
        CurrPage.SetSelectionFilter(Customers);
        if Customers.FindSet() then
            repeat
                LinesCount += 1;
                TotalAmount += Customers.Count();
            // TotalQuantity += Customers.Quantity;
            until Customers.Next() = 0;
        if LinesCount > 0 then begin
            LinesAverage := TotalAmount / LinesCount;
        end;
        Customer := Customers.TableCaption();
        CurrPage.MainForm.Customers(Customer, TotalAmount, '');
    end;

    /// <summary>
    /// Vedors.
    /// </summary>
    procedure Purchase()
    var
        Purchaname: Text;
        Value: Text;
        Purchase: Record "Purchase Line";
        TotalAmount: Decimal;
        TotalQuantity: Decimal;
        LinesCount: Integer;
        LinesAverage: Decimal;
    begin
        Purchase.Reset();
        LinesCount := 0;
        LinesAverage := 0;
        TotalAmount := 0;
        TotalQuantity := 0;
        CurrPage.SetSelectionFilter(Purchase);
        if Purchase.FindSet() then
            repeat
                LinesCount += 1;
                TotalAmount += Purchase.Amount;
                TotalQuantity += Purchase.Quantity;
            until Purchase.Next() = 0;
        if LinesCount > 0 then begin
            LinesAverage := TotalAmount / LinesCount;
        end;
        Purchaname := Purchase.TableCaption();
        CurrPage.MainForm.Purchase(Purchaname, TotalAmount, '');
    end;
}