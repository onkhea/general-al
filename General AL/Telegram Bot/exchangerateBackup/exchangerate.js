// var currencys, bids, asks, officialExchangeRate, date;

// async function fetchData(dates) {
//   try {
//     const response = await fetch(`https://172.20.10.3/OData/ExchangeRateService?date=${dates}`);
//     if (!response.ok) {
//       throw new Error(`HTTP error! Status: ${response.status}`);
//     }
//     const data = await response.json();
//     console.log('Data from server:', data);

//     // Iterate over all currencies
//     officialExchangeRate = data.officialExchangeRate;
//     date = data.date;
//     for (const currencyData of data.value) {
//       const { currencys = currency, bids = bid, asks = ask } = currencyData;

//         // Display the data in the result-container div
//         const resultContainer = document.getElementById('result-container');
//         const currencyElement = document.createElement('div');
//         currencyElement.innerHTML = `
//           <p>Exchange rate NBC bank</p>
//           <p>Currency: ${currencys}</p>
//           <p>Bid: ${bids}</p>
//           <p>Ask: ${asks}</p>
//         `;
//         resultContainer.appendChild(currencyElement);
//       // Invoke AL method for each currency
//       console.log('Invoking AL method with data:', [currencys, bids, asks, officialExchangeRate, date]);
//       Microsoft.Dynamics.NAV.InvokeExtensibilityMethod("SaveRequested", [currencys, bids, asks, officialExchangeRate, date]);
//     }
//   } catch (error) {
//     console.error('Error fetching data:', error);
//   }
// }

// // Call the fetchData function when the page loads
// document.addEventListener('DOMContentLoaded', () => {
//   load();
//   fetchData();
// });

// function load() {
//   const main = document.getElementById("controlAddIn");
//   const div = document.createElement('div');
//   div.id = 'result-container';
//   document.body.appendChild(div);
//   main.appendChild(div);
// }
async function fetchData() {
  try {
    const response = await fetch('https://172.20.10.3/OData/ExchangeRateService');
    if (!response.ok) {
      throw new Error(`HTTP error! Status: ${response.status}`);
    }
    const data = await response.json();
    console.log('Data from server:', data);

    // Iterate over all currencies
    for (const currencyData of data.value) {
      const { currency, bid, ask } = currencyData;

      // Display the data in the result-container div
      // const resultContainer = document.getElementById('result-container');
      // const currencyElement = document.createElement('div');
      // currencyElement.innerHTML = `
      //   <p>Currency: ${currency}</p>
      //   <p>Bid: ${bid}</p>
      //   <p>Ask: ${ask}</p>
      // `;
      // resultContainer.appendChild(currencyElement);

      // Invoke AL method for each currency
      Microsoft.Dynamics.NAV.InvokeExtensibilityMethod("SaveRequested", [currency, bid, ask]);
    }
  } catch (error) {
    console.error('Error fetching data:', error);
  }
}

// Call the fetchData function when the page loads
document.addEventListener('DOMContentLoaded', () => {
});

function load() {
  const main = document.getElementById("controlAddIn");
  const div = document.createElement('div');
  div.id = 'result-container';
  document.body.appendChild(div);
  main.appendChild(div);
}
