import React, { Component } from 'react';
import { Provider } from 'react-redux';
import { Router, Route, browserHistory, IndexRoute } from 'react-router';
import { syncHistoryWithStore } from 'react-router-redux';
import configureStore from '../store/store';
import * as _ from 'lodash';

import App from '../containers/App';

export default class Root extends Component {
  constructor(props) {
    super(props);
    this.props = props;
    this.store = configureStore();
    this.history = syncHistoryWithStore(browserHistory, this.store);
  }

  render() {
    return (
      <Provider store={this.store}>
        <Router history={this.history}>
          <Route path="/" component={App} />
        </Router>
      </Provider>
    );
  }
}
