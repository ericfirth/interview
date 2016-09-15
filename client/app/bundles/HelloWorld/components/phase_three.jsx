import React, { PropTypes } from 'react';
import Trophy from './trophy';

export default class PhaseThree extends React.Component {
  constructor(props, context) {
    super(props, context);
  }
// approximation of the old component since the props have been changed.
  render() {
    const columns = ["hi", "bye"]
    const score = { hi: 1, bye: "hello" }
    return (
      <tr>
        {
          columns.map((column, index) => <td>{score[column]}</td>)
        }
      </tr>
    );
  }
}
