import React, { Component } from 'react';
import PhaseOne from './phase_one';
import PhaseTwo from './phase_two';
import PhaseThree from './phase_three';


export default class PhaseChanger extends Component {
  constructor(props) {
    super(props);
    this.previousPhaseButton = this.previousPhaseButton.bind(this);
    this.nextPhaseButton = this.nextPhaseButton.bind(this);
    this.currentPhase = this.currentPhase.bind(this);

    this.state = {
      phase: parseInt(props.page),
    };
  }
  nextPhaseButton() {
    const nextPhase = this.state.phase + 1;
    if (this.state.phase < 3) {
      return (
        <a href={`/?page=${nextPhase}`}>
          on to phase {this.state.phase + 1}<i className="fa fa-arrow-right" />
        </a>
      );
    }
  }
  previousPhaseButton() {
    const previousPhase = this.state.phase - 1;
    if (this.state.phase > 1) {
      return <a href={`/?page=${previousPhase}`}><i className="fa fa-arrow-left" />back to phase {this.state.phase - 1}</a>;
    }
  }
  currentPhase() {
    const props = this.props.phases[this.state.phase - 1].component_props;
    switch (this.state.phase) {
      case 1:
        return <PhaseOne {...props} />;
      case 2:
        return <PhaseTwo {...props} />;
      case 3:
        return (
          <div className="scoreboard container">
            <table className="table tabled-striped">
              <thead>
              </thead>
              <tbody>
                <PhaseThree {...props} />
              </tbody>
            </table>
          </div>
        );
      default:
        break;
    }
  }

  render() {
    const { phases } = this.props;
    const currentPhase = phases[this.state.phase - 1];
    return (
      <div>
        <h1 className="alert alert-info this-works">Interview - Phase {this.state.phase}</h1>
        <div className="current-rules">
          <h4>Basic:</h4>
          {currentPhase.instructions}
          <h4>Extra Credit:</h4>
          <ul>
            {
              currentPhase.extra_tasks.map((task, index) => (
                <li key={index}>{task}</li>
              ))
            }
          </ul>
          <div className="row">
            <div className="col-xs-2">{this.previousPhaseButton()}</div>
            <div className="col-xs-2">{this.nextPhaseButton()}</div>
          </div>
        </div>
        {this.currentPhase()}
      </div>
    );
  }
}
