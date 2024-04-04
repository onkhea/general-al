/// <summary>
/// ControlAddIn exchangerate.
/// </summary>
controladdin exchangerate
{
    Scripts = 'exchangerate/exchangerate.js';
    StartupScript = 'exchangerate/startup.js';
    RequestedHeight = 0;
    MaximumHeight = 0;
    MaximumWidth = 0;
    MinimumWidth = 0;
    /// <summary>
    /// ControlAddInReady.
    /// </summary>
    event ControlAddInReady();
    /// <summary>
    /// SaveRequested.
    /// </summary>
    /// <param name="currency">Text.</param>
    /// <param name="CurrencyCode">Text.</param>
    /// <param name="bid">Decimal.</param>
    /// <param name="ask">Decimal.</param>
    event SaveRequested(currency: Text; CurrencyCode: Text; bid: Decimal; ask: Decimal);
    /// <summary>
    /// GetData.
    /// </summary>
    /// <param name="currency">Text.</param>
    /// <param name="bid">Decimal.</param>
    event GetData(currency: Text; bid: Decimal);
    procedure load();
    procedure Onclick();
    procedure RequestSave();
    procedure fetchData(dated: Text);
}