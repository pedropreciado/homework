import React from 'react';

import CurrenciesIndex from './currencies_index';

class Widget extends React.Component {
  constructor() {
    super();

    this.state = {
      baseCurrency: "",
      rates: {}
    };
  }

  setBaseCurrency(currency) {
    return (e) => {
      e.preventDefault();
      this.setState({ baseCurrency: currency }, this.fetchRates);
    };
  }

  fetchRates() {
    $.ajax({
      method: "GET",
      url: `http://api.fixer.io/latest?base=${this.state.baseCurrency}`
    })
    .then(response => this.setState({ rates: response.rates }));
  }

  render() {
    const currencies = ["CNY", "GBP", "JPY", "CAD", "EUR", "USD"];
    console.log(this.state);
    return (
      <div>
        <h1>My Great Currency App</h1>
        {
          currencies.map(currency => (
            <button key={currency + "btn"} onClick={ this.setBaseCurrency(currency) } >{ currency }</button>
          ))
        }
        <CurrenciesIndex rates={this.state.rates} />
      </div>
    )
  }
}

export default Widget;
