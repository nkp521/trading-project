import { Controller } from "@hotwired/stimulus"

export function fetchApiKey() {
  return fetch("https://stonks-backend-usmw.onrender.com/key")
    .then(res => res.json())
    .then(data => data.apiKey)
    .catch(err => console.error(err));
}

export default class extends Controller {
  static targets = ["input", "newsContainer"]

  search() {
    const ticker = this.inputTarget.value.trim().toUpperCase()
    this.load(ticker)
  }

  load(ticker) {
    this.fetchNews(ticker)
  }

  fetchNews(ticker) {
    fetchApiKey()
    .then(apiKey => {
      const from = "2025-09-01";
      const to = new Date().toJSON().slice(0, 10);
      const url = `https://finnhub.io/api/v1/company-news?symbol=${ticker}&from=${from}&to=${to}&token=${apiKey}`;

      fetch(url)
        .then(res => res.json())
        .then(data => this.displayNews(data))
        .catch(err => console.error(err));
    }).catch(err => console.error(err));
  }

  displayNews(data) {
    const top10 = data.slice(0, 10)
    
    let html = '<div>'
    if (top10.length > 0) {
      top10.forEach(article => {
        html += `
          <div>
            <h3>${article.headline}</h3>
            <h5>${article.summary}</h5>
            <p>Source: ${article.source}</p>
          </div>
        `
      })
    } else {
      html += '<p>No articles available</p>'
    }
    html += '</div>'
    
    this.newsContainerTarget.innerHTML = html
  }
}
