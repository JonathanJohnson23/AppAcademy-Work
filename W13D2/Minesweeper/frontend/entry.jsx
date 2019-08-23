import React from 'react';
import ReactDOM from 'react-dom';
import Game from './Game'
import Tile from './Tile'
import Board from './Board'

document.addEventListener("DOMContentLoaded", () => {
  const root = document.getElementById("root");
  ReactDOM.render(
  <div>
    <Game/>
  </div>
  , root);
});
