import React, { PropTypes, Component } from 'react';
import PhaseOne from './phase_one';
import PhaseTwo from './phase_two';
import PhaseThree from './phase_three';


export default class PhaseChanger extends Component {
  constructor(props) {
    super(props);
    this.nextPhase = this.nextPhase.bind(this);
    this.previousPhase = this.previousPhase.bind(this);
    this.previousPhaseButton = this.previousPhaseButton.bind(this);
    this.nextPhaseButton = this.nextPhaseButton.bind(this);
    this.currentPhase = this.currentPhase.bind(this);

    this.state = {
      phase: 1,
    };
  }
  nextPhase() {
    this.setState({ phase: this.state.phase + 1 });
  }
  previousPhase() {
    this.setState({ phase: this.state.phase - 1 });
  }
  nextPhaseButton() {
    if (this.state.phase < 3) {
      return <a onClick={this.nextPhase}>on to phase {this.state.phase + 1}</a>;
    }
  }
  previousPhaseButton() {
    if (this.state.phase > 1) {
      return <a onClick={this.previousPhase}>back to phase {this.state.phase - 1}</a>;
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
