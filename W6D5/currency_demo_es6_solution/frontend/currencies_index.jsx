import React from 'react';
import Currency from './currency';

export default ({ rates }) => {
  const currencies = Object.keys(rates);
  return (
    <div>
      <h2>Currencies go here:</h2>
      <ul>
        {
          currencies.map(currency => (
            <Currency key={currency + "li"} currency={currency} rate={rates[currency]} />
          ))
        }
      </ul>
    </div>
  );
}
