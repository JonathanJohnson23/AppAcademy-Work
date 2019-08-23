import {createStore} from 'redux';
import rootReducer from "../reducers/root_reducer";

function configureStore() {
   const store = createStore(rootReducer);
   return store
}

export default configureStore;