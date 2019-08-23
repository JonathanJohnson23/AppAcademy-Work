import React from 'react';
import ReactDOM from 'react-dom';
import Store from "./store/store"
import configureStore from './store/store';
import Root from "./frontend/components/root"
const store = configureStore()

window.store = store


document.addEventListener("DOMContentLoaded", () => {
   const root = document.getElementById('root');
   ReactDOM.render(<Root store={store} />, root);
   
});


// Ours 