import React from "react";
import ReactDOM from "react-dom";
import PropTypes from "prop-types";
import ShortenedUrlForm from "../shortened_url_form";

class ShortenedUrlContainer extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      original_url: this.props.link,
      short_url: ""
    };
  }
  parentProjectSubmit: function(formData, onSuccess, onError){

    $.ajax({
      url: "/link",
      dataType: 'json',
      type: 'POST',
      data: formData,

      success: function(p) {

        this.setState({projects: projects});

        onSuccess();

      }.bind(this),

      error: function(response, status, err) {

        onError(response.responseJSON)

      }


    });
  },
  render() {
    return (
      <div>
        <h2>Create a Short Link</h2>
        <ShortenedUrlForm />;
      </div>
    );
  }
}

export default ShortenedUrlContainer;
