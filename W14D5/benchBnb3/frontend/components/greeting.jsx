import React from 'react'
import { Link } from 'react-router-dom'

export default ({ user, signout }) => {
    const display = user ? (
        <div>
            <h1>Welcome, {user.username}</h1>
            <button onClick={signout}>Logout</button>
        </div>
    ) : (
       <div>
         <Link className="btn" to="/signup" >Signup</Link>
         <Link className="btn" to="/login" >Login</Link>
      </div>
    )

    return (
      <div> 
         {display}    
      </div>
    )
} 

