import React from "react";
import { connect } from "react-redux";
import SessionForm from "./session_form";
import {signin} from "../../actions/session_actions";

const mapStateToProps = (state, ownProps) => ({
    errors: state.errors.session,
    formtype: 'Log DAT SHIT BACK'
});
//errors(array) - list of errors from the state
//formType(string): 'login' or 'signup', for each respective container
// user: state.entities.users[state.session.id]


const mapDispatchToProps = (dispatch, ownProps) => ({
    processForm: theDude => dispatch(signin(theDude))
});

//processForm(function): dispatching action creators login or signup, again depending on the container

export default connect(mapStateToProps, mapDispatchToProps)(SessionForm);