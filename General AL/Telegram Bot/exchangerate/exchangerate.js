var currencys, bids, asks;

async function fetchData(dates) {
  try {
    const response = await fetch(`https://172.20.10.3/OData/ExchangeRateService?date=${dates}`);
    if (!response.ok) {
      throw new Error(`HTTP error! Status: ${response.status}`);
    }
    const data = await response.json();
    console.log('Data from server:', data);

    // Iterate over all currencies
    currencys = "Usd";
    bids = data.officialExchangeRate;
    Microsoft.Dynamics.NAV.InvokeExtensibilityMethod("GetData", [currencys, bids]);
    for (const currencyData of data.value) {
      const { currency,Symbol, bid, ask } = currencyData;
      // Invoke AL method for each currency
      Microsoft.Dynamics.NAV.InvokeExtensibilityMethod("SaveRequested", [currency,Symbol, bid, ask]);
    }
  } catch (error) {
    console.error('Error fetching data:', error);
  }
}



