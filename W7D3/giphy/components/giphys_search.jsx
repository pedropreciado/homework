import React from 'react';

import GiphysIndex from './giphys_index';

class GiphysSearch extends React.Component {
  constructor(props) {
    super(props);

    this.state = {
      searchTerm: "pug"
    }
    console.log(this.props);
    this.handleSubmit = this.handleSubmit.bind(this);
    this.handleChange = this.handleChange.bind(this);
  }

  componentDidMount() {
    this.props.fetchSearchGiphys("pug");
  }

  handleChange(event) {
    event.preventDefault();
    let searchTerm = event.target.value;
    this.setState({searchTerm});
  }

  handleSubmit(event) {
    event.preventDefault();
    let searchTerm = this.state.searchTerm;
    this.props.fetchSearchGiphys(searchTerm);
  }

  render() {
    let {giphys} = this.props;

    return (
      <div>
        <form onSubmit={this.handleSubmit}>
          <input value={this.state.searchTerm} onChange={this.handleChange} />
            <button>get giphys.</button>
        </form>
        <GiphysIndex giphys={giphys} />
      </div>
    )
  }
}

export default GiphysSearch;
