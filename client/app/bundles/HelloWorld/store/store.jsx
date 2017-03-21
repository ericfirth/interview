import { createStore, compose } from 'redux';
import rootReducer from '../reducers';
import middleware from '../middleware';

const applyMiddlewareToStore = compose(
  middleware,
  window.devToolsExtension ? window.devToolsExtension() : f => f
)(createStore);

export default function configureStore(initialState) {
  return applyMiddlewareToStore(rootReducer, initialState);
}
