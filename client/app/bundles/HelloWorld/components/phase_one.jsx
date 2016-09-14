import React, { PropTypes } from 'react';

export default class PhaseOne extends React.Component {
  constructor(props, context) {
    super(props, context);
  }

  render() {
    return (
      <div className="scoreboard container">
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
