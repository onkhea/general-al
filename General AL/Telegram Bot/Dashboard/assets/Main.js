
// function LoadForm(Name,value)
// {
// const data = [
//   { title: Name, icon: 'mdi mdi-account-circle', value: value },
//   { title: 'Revenue', icon: 'mdi mdi-cash', value: '$250,000' },
//   { title: 'Customers', icon: 'mdi mdi-account-group', value: 120 },
//   { title: 'Sales', icon: 'mdi mdi-chart-bar', value: '$500,000' },
//   // Add more data objects as needed
// ];

// // Get the dashboard container
// const dashboardContainer = document.getElementById('dashboardContainer');

// // Loop through the data and create dashboard elements
// data.forEach(item => {
//   // Create elements
//   const dashboard = document.createElement('div');
//   const title = document.createElement('h2');
//   const icon = document.createElement('i');
//   const value = document.createElement('p');
//   const button = document.createElement('button');


//   // Set content and attributes
//   title.textContent = item.title;
//   icon.className = item.icon;
//   value.textContent = item.value;
//   button.textContent = 'View Details';

//   // Append elements to the dashboard
//   dashboard.appendChild(icon);
//   dashboard.appendChild(title);
//   dashboard.appendChild(value);
//   dashboard.appendChild(button);

//   // Set styles and classes
//   dashboard.className = 'dashboard';
//   button.className = 'dashboard-button';

//   // Add click event to the button
//   button.addEventListener('click', () => {
//       // Redirect to the new page, replace '#' with the actual page URL
//       Microsoft.Dynamics.NAV.InvokeExtensibilityMethod("Onclick",[Name]);
//   });

//   // Append the dashboard to the container
//   dashboardContainer.appendChild(dashboard);
// });
// }
// document.addEventListener('DOMContentLoaded', () => {
//   load();
//   LoadForm(Name, value);
// });
// function load() {
//   const main = document.getElementById("controlAddIn");
//   const div = document.createElement('div');
//   div.id = 'dashboardContainer';
//   div.className = 'dashboard-container';
//   document.body.appendChild(div);
//   main.appendChild(div);
// }
function LoadForm(Name, value,icon, clickFunction) {
  const data = [
    { title: Name, icon: icon, value: value },
    // { title: 'Revenue', icon: 'mdi mdi-cash', value: '$250,000' },
    // { title: 'Customers', icon: 'mdi mdi-account-group', value: 120 },
    // { title: 'Sales', icon: 'mdi mdi-chart-bar', value: '$500,000' },
    // Add more data objects as needed
  ];

  // Get the dashboard container
  const dashboardContainer = document.getElementById('dashboardContainer');

  // Loop through the data and create dashboard elements
  data.forEach(item => {
    // Create elements
    const dashboard = document.createElement('div');
    const title = document.createElement('h2');
    const icon = document.createElement('i');
    const value = document.createElement('p');
    const button = document.createElement('button');

    // Set content and attributes
    title.textContent = item.title;
    icon.className = item.icon;
    value.textContent = item.value;
    button.textContent = 'View Details';

    // Append elements to the dashboard
    dashboard.appendChild(icon);
    dashboard.appendChild(title);
    dashboard.appendChild(value);
    dashboard.appendChild(button);

    // Set styles and classes
    dashboard.className = 'dashboard';
    button.className = 'dashboard-button';

    // Add click event to the button
    button.addEventListener('click', () => {
      // Execute the specified function
      window[clickFunction]();
    });

    // Append the dashboard to the container
    dashboardContainer.appendChild(dashboard);
  });
}

// Define your AL Business Central functions here
function handleSaleClick() {
  // Handle the click for Users
  Microsoft.Dynamics.NAV.InvokeExtensibilityMethod("Onclick", ['Sales']);
}

function handlePurchaseClick() {
  // Handle the click for Revenue
  Microsoft.Dynamics.NAV.InvokeExtensibilityMethod("Onclick", ['Purchase']);
}

function handleCustomersClick() {
  // Handle the click for Customers
  Microsoft.Dynamics.NAV.InvokeExtensibilityMethod("Onclick", ['Customers']);
}

function handleVedorsClick() {
  // Handle the click for Sales
  Microsoft.Dynamics.NAV.InvokeExtensibilityMethod("Onclick", ['Vedors']);
}

document.addEventListener('DOMContentLoaded', () => {
  load();
  Sales(Name, value,icon, clickFunction);
  Vendor(Name, value,icon, clickFunction);
  Purchase(Name, value,icon, clickFunction);
  Customers(Name, value,icon, clickFunction);
});
// LoadForm('Users', 150, 'handleUsersClick');
// LoadForm('Revenue', '$250,000', 'handleRevenueClick');
// LoadForm('Customers', 120, 'handleCustomersClick');
// LoadForm('Sales', '$500,000', 'handleSalesClick');
function Sales(Name, value,icon, clickFunction)
{
  icon= 'mdi mdi-account-circle'
  clickFunction = 'handleSaleClick';
  LoadForm(Name, value,icon, clickFunction) ;
}
function Purchase(Name, value,icon, clickFunction)
{
  icon ='mdi mdi-cash',
  clickFunction = 'handlePurchaseClick';
  LoadForm(Name, value,icon, clickFunction) ;
}
function Customers(Name, value,icon, clickFunction)
{
  icon='mdi mdi-account-group'
  clickFunction = 'handleCustomersClick';
  LoadForm(Name, value,icon, clickFunction) ;
}
function Vendor(Name, value,icon, clickFunction)
{
  icon= 'mdi mdi-chart-bar'
  clickFunction = 'handleVedorsClick';
  LoadForm(Name, value,icon, clickFunction) ;
}
function load() {
  const main = document.getElementById("controlAddIn");
  const div = document.createElement('div');
  div.id = 'dashboardContainer';
  div.className = 'dashboard-container';
  main.appendChild(div);
}