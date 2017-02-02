import React from 'react';
import PhaseChanger from '../components/phase_changer';

export default ({ phases, page }) => (
  <div className="phase">
    <PhaseChanger page={page} phases={phases} />
  </div>
);
