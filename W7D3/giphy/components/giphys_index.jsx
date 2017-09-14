import React from 'react';

import GiphysIndexItem  from './giphys_index_item';

function GiphysIndex({ giphys }) {
  console.log(giphys);

  return (
    <ul>
      { giphys.map(giphy => <GiphysIndexItem giphy={giphy} />) }
    </ul>
  )
}

export default GiphysIndex;
