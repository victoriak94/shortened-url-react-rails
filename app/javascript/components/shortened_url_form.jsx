import React from "react";

class ShortenedUrlForm extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      original_url: ""
    };
    this.handleUrlChange = this.handleUrlChange.bind(this);
  }

  handleUrlChange(e) {
    this.setState({ original_url: e.target.value });
  }

  render() {
    return (
      <div>
        <label>Enter URL</label>
        <input
          type="text"
          name="shortened_url[original_url]"
          value={this.state.original_url}
          onChange={this.handleUrlChange}
        />

        <input type="submit" value="Create URL" />
      </div>
    );
  }
}

export default ShortenedUrlForm;
