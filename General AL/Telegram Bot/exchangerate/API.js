const express = require('express');
const puppeteer = require('puppeteer');// Use puppeteer-core
const cheerio = require('cheerio');
const cors = require('cors');

const app = express();
app.use(cors());

app.get('/OData/ExchangeRateService', async (req, res) => {
  try {
    const dateFilter = req.query.date || '2024-01-26';

    const browser = await puppeteer.launch({
      headless: 'new',
      executablePath: 'C:\\Program Files\\Google\\Chrome\\Application\\chrome.exe',
    });
    

    const page = await browser.newPage();

    await page.goto('https://www.nbc.gov.kh/english/economic_research/exchange_rate.php');
    await page.waitForTimeout(2000);

    await page.$eval('#datepicker', (datepicker, dateFilter) => {
      datepicker.value = dateFilter;
    }, dateFilter);

    await page.click('input[name="view"]');
    await page.waitForTimeout(2000);

    const content = await page.content();
    const $ = cheerio.load(content);

    const exchangeRates = [];

    $('table.tbl-responsive tr').each((index, element) => {
      if (index > 0) {
        const columns = $(element).find('td');
        const currency = columns.eq(0).text().trim();
        const Symbol = columns.eq(1).text().trim();
        const bid = columns.eq(3).text().trim();
        const ask = columns.eq(4).text().trim();

        exchangeRates.push({ currency,Symbol,bid, ask });
      }
    });

    const officialExchangeRateRow = $('td:contains("Official Exchange Rate")');
    const officialExchangeRateText = officialExchangeRateRow.text();
    const officialExchangeRateMatch = officialExchangeRateText.match(/(\d+)/);
    const officialExchangeRate = officialExchangeRateMatch ? parseInt(officialExchangeRateMatch[1]) : null;

    await browser.close();

    const response = {
      ok: true,
      value: exchangeRates,
      officialExchangeRate,
      date: dateFilter,
    };

    res.json(response);
  } catch (error) {

    console.error('Error:', error);

    if (error instanceof puppeteer.errors.TimeoutError) {
      res.status(500).json({ error: 'Timeout Error' });
    } else {
      res.status(500).json({ error: 'Internal Server Error' });
    }
  }
});

app.listen(process.env.PORT, () => {
  console.log("listening");
});