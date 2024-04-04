reportextension 50711 "Inventory Valuation(CVH)" extends "Inventory Valuation"
{
    RDLCLayout = './InventoryReport/InventoryValuation.rdl';
    dataset
    {
    }
}
reportextension 50712 "Inventory Posting - Test(CVH)" extends "Inventory Posting - Test"
{
    RDLCLayout = './InventoryReport/InventoryPostingTest.rdl';
    dataset
    {
        add("Item Journal Batch")
        {
            column(CompanyCantion; COMPANYPROPERTY.DisplayName())
            {

            }
            column (Cation;Cation)
            {
                
            }
        }
    }
    var
     Cation: Label 'ពេជ្រត្រូវផ្ទេរចូលស្តុកបងហុងវិញ';
}
