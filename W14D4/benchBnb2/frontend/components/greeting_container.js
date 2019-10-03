import React from "react";
import {connect} from "react-redux"
import {createNewUser, signin, signout} from "../actions/session_actions"
import Greeting from "./greeting"


const mapStateToProps = (state) =>({
    user: state.entities.users[state.session.id]
})

const mapDispatchToProps = (dispatch) =>({
    // createNewUser: () => dispatch(createNewUser()),
    // signin: () => dispatch(signin()),
    signout: () => dispatch(signout())
})

export default connect(mapStateToProps, mapDispatchToProps)(Greeting)


// const mapStateToProps = (state) => ({
//     chirps: Object.keys(state.entities.chirps).map(key => state.entities.chirps[key])
// });
// const mapDispatchToProps = (dispatch) => ({
//     fetchChirps: () => dispatch(fetchChirps()),
//     likeChirp: id => dispatch(likeChirp(id)),
//     unLikeChirp: id => dispatch(unLikeChirp(id))
// });

// export default connect(mapStateToProps, mapDispatchToProps)(ChirpIndex);
