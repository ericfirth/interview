import React from 'react';

export default class PhaseTwo extends React.Component {
  constructor(props, context) {
    super(props, context);
  }

  render() {
    return (
      <div className="scoreboard container">
        <h1>HEADER</h1>
        <table className="table table-striped">
          <thead>
            <tr>
              <th>Player</th>
              <th>Game</th>
              <th>Score</th>
            </tr>
          </thead>
          <tbody>
            {
              this.props.scores.map(function (score, index) {
                return (
                  <tr key={index}>
                    <td>{score.player}</td>
                    <td>{score.gamez}</td>
                    <td>{score.score}</td>
                  </tr>
                );
              })
            }
          </tbody>
        </table>
      </div>
    );
  }
}
