import React from 'react';

export default ({currency, rate}) => (
  <li style={ {color: rate >= 1 ? "green" : "red" } }>{currency}: {rate}</li>
);