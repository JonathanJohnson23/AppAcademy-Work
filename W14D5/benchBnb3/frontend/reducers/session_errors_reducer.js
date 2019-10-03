import { RECEIVE_CURRENT_USER, LOGOUT_CURRENT_USER, RECEIVE_SESSION_ERRORS } from '../actions/session_actions';


export default (state = [], action) => {
    Object.freeze(state);
    switch (action.type) {
        case RECEIVE_CURRENT_USER:
            const id = action.user.id
            return Object.assign({}, { id });
        case RECEIVE_SESSION_ERRORS:
            return state.entities.errors = action.errors;
        default:
            return state;
    }
};
