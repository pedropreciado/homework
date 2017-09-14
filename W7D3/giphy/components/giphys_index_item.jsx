import React from "react";

function GiphysIndexItem({ giphy }) {
  console.log(giphy);

  return (
    <li>
      <img src={giphy.images.fixed_height.url} />
    </li>
  );
}

export default GiphysIndexItem;
