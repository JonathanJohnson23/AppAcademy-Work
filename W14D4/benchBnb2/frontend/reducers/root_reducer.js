import { combineReducers } from 'redux'
import entitiesReducer from './entities_reducer'
import sessionReducer from './sessions_reducer'
import errorsReducer from './errors_reducers'



const rootReducer = combineReducers({
    session: sessionReducer,
   entities: entitiesReducer,
   errors: errorsReducer
 });

export default rootReducer;
