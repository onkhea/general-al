/// <summary>
/// ControlAddIn MainForm.
/// </summary>
controladdin MainForm
{
    Scripts = 'Dashboard/assets/Main.js';
    StartupScript = 'Dashboard/assets/start.js';
    StyleSheets = 'Dashboard/assets/Real.css',
    'https://cdn.jsdelivr.net/npm/@mdi/font/css/materialdesignicons.min.css';

    RequestedHeight = 500;
    MaximumHeight = 1000;
    MaximumWidth = 1000;
    RequestedWidth = 500;
    MinimumWidth = 200;
    MinimumHeight = 200;
    HorizontalShrink = true;
    HorizontalStretch = true;
    VerticalShrink = true;
    VerticalStretch = true;


    /// <summary>
    /// ControlAddInReady.
    /// </summary>
    event ControlAddInReady();
    /// <summary>
    /// Onclick.
    /// </summary>
    /// <param name="Name">text.</param>
    event Onclick(Name: text);
    procedure load();
    procedure LoadForm(Sale: Text; values: Decimal; Click: Text);
    procedure Sales(Sale: Text; values: Decimal; Click: Text)
    procedure Vendor(Sale: Text; values: Decimal; Click: Text)
    procedure Purchase(Sale: Text; values: Decimal; Click: Text)
    procedure Customers(Sale: Text; values: Decimal; Click: Text)
}