// /// <summary>
// /// ControlAddIn exchangerate.
// /// </summary>
// controladdin exchangerate
// {
//     Scripts = 'exchangerate/exchangerate.js';
//     StartupScript = 'exchangerate/startup.js';
//     /// <summary>
//     /// ControlAddInReady.
//     /// </summary>
//     event ControlAddInReady();
//     /// <summary>
//     /// SaveRequested.
//     /// </summary>
//     /// <param name="currency">Text.</param>
//     /// <param name="bid">Decimal.</param>
//     /// <param name="ask">Decimal.</param>

//     event SaveRequested(currency: Text; bid: Decimal; ask: Decimal);
//     procedure load();
//     procedure Onclick();
//     procedure RequestSave();
//     procedure fetchData(dated: Text);
// }