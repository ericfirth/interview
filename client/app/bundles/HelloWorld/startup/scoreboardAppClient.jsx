import React from 'react';
import PhaseChanger from '../components/phase_changer';

export default ({ phases }) => (
  <div className="phase">
    <PhaseChanger phases={phases} />
  </div>
);
