
import React from 'react';

export default class PhaseOne extends React.Component {
  constructor(props, context) {
    super(props, context);
    this.state = {
      activePlayer: 'all',
    };
    this.sortedVisibleScores = this.sortedVisibleScores.bind(this);
    this.setActivePlayer = this.setActivePlayer.bind(this);
    this.filterFunction = this.filterFunction.bind(this);
  }
  sortedVisibleScores() {
    return this.props.scores.filter(this.filterFunction).sort(this.comparatorFunction);
  }
  filterFunction(score) {
    return this.state.activePlayer === 'all' || this.state.activePlayer === score.Player;
  }
  comparatorFunction(a, b) {
    return b.skore - a.skore;
  }
  setActivePlayer(player) {
    this.setState({ activePlayer: player });
  }
  allPlayersLink() {
    if (this.state.activePlayer !== 'all') {
      return <a onClick={() => this.setActivePlayer('all')}>All Players</a>;
    }
  }

  render() {
    const scores = this.sortedVisibleScores();
    return (
      <div className="scoreboard container">
        {this.allPlayersLink()}
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
              scores.map(function (score, index) {
                const setActivePlayer = this.setActivePlayer;
                return (
                  <tr key={index}>
                    <td>
                      <a
                        onClick={() => setActivePlayer(score.Player)}
                      >
                        {score.Player}
                      </a>
                    </td>
                    <td>{score.gamez}</td>
                    <td>{score.skore}</td>
                  </tr>
                );
              }, this)
            }
          </tbody>
        </table>
      </div>
    );
  }
}
