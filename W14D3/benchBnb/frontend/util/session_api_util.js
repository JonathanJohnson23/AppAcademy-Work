export const signup = user => {
    return (
        $.ajax({
            method: 'POST',
            url: '/api/user',
            data: { user }
            // success(data) {
            //     console.log("Success!!")
            //     console.log(data);
            // },
            // error() {
            //     console.log("This was a mistake...");
            // }
        })
    );
};

export const login = user => {
   return (
       $.ajax({
           method: 'POST',
           url: '/api/session',
           data: { user }
       })
   );
};

export const logout = () => {
   return (
       $.ajax({
           method: 'DELETE',
           url: '/api/session'
       })
   );
};


window.signup = signup;
window.login = login;
window.logout = logout;
