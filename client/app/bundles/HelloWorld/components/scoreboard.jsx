import React, { PropTypes } from 'react';
import _ from 'lodash';
// Simple example of a React "dumb" component
export default class ScoreBoard extends React.Component {
  constructor(props, context) {
    super(props, context);
  }

  render() {
    return (
      <div className="scoreboard container">
        <div className="row">
          <a className="col-md-3" href="#">Link 1</a>
          <a className="col-md-3" href="#">Link 2</a>
          <a className="col-md-3" href="#">Link 3</a>
          <a className="col-md-3" href="#">Link 4</a>
        </div>
        <table className="table table-striped">
          <thead>
            <tr>
              <th>Player</th>
              <th>Game</th>
              <th>Score</th>
            </tr>
          </thead>
        </table>
      </div>
    );
  }
}

ScoreBoard.propTypes = {
  scores: PropTypes.array.isRequired,
};
