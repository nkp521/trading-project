import { Controller } from "@hotwired/stimulus"

export function fetchApiKey() {
  return fetch("https://stonks-backend-usmw.onrender.com/key")
    .then(res => res.json())
    .then(data => data.apiKey)
    .catch(err => console.error(err));
}

const fetchNews = (ticker) => {
  fetchApiKey()
  .then(apiKey => {
    const from = "2025-09-01";
    const to = new Date().toJSON().slice(0, 10);
    const url = `https://finnhub.io/api/v1/company-news?symbol=${ticker}&from=${from}&to=${to}&token=${apiKey}`;

    fetch(url)
      .then(res => res.json())
      .then(data => displayNews(data))
      .catch(err => console.error(err));
  }).catch(err => console.error(err));
};

function displayNews(data) {
  const top10 = data.slice(0, 10)
  console.log(top10)
}

export default class extends Controller {
  static targets = ["input"]

  search() {
    const ticker = this.inputTarget.value.trim().toUpperCase()

    this.load(ticker)
  }

  load(ticker) {
    fetchNews(ticker)
  }
}
