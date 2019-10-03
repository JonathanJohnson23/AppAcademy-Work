import { signup, login, logout } from '../util/session_api_util'

export const RECEIVE_CURRENT_USER = 'RECEIVE_CURRENT_USER'
export const LOGOUT_CURRENT_USER = 'LOGOUT_CURRENT_USER'
export const RECEIVE_SESSION_ERRORS = 'RECEIVE_SESSION_ERRORS'

const receiveCurrentUser = user => ({
    type: RECEIVE_CURRENT_USER,
    user,
});

const logoutCurrentUser = () => ({
    type: LOGOUT_CURRENT_USER,
});

const receiveSessionErrors = (...arg) => ({
    type: RECEIVE_SESSION_ERRORS,
    ...arg,
});

// export const login = user => dispatch => {
//     return (dispatch) => {
//         return ApiUtil.login(user).then(response => {
//             dispatch(login(response))
//         });
//     };
// };

// export const login = user => {
    
// }

export const createNewUser = formUser => dispatch => signup(formUser)
    .then(user => dispatch(receiveCurrentUser(user)));

export const signin = formUser => dispatch => login(formUser)
    .then(user => dispatch(receiveCurrentUser(user)));

export const signout = () => dispatch => logout()
    .then(() => dispatch(logoutCurrentUser()));

// export const errors = errorArray => dispatch => errors(errorArray)
//     .then(error => dispatch(receiveSessionErrors()));

window.createNewUser = createNewUser;
window.signin = signin;
window.signout = signout;
