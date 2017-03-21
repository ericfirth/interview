import React, { PropTypes } from 'react';
import Trophy from './trophy';

export default class PhaseThree extends React.Component {
  constructor(props, context) {
    super(props, context);
  }
// approximation of the old component since the props have been changed.
  render() {
    return (
      <div className="scoreboard container">
        <h2 className="text-center">🔥🔥🔥 LEGENDS OF GAMEZ 🔥🔥🔥</h2>
        <table className="table">
          <thead>
            <tr>
              <th>Player</th>
              <th>Score</th>
              <th>Games</th>
            </tr>
          </thead>
          <tbody>
            { /* Code would go here */ }
          </tbody>
        </table>
      </div>
    );
  }
}
