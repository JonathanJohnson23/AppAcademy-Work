const MovingObject = require("./moving_object.js");
const Asteroid = require("./asteroid.js");
const Game = require("./game.js");
const GameView = require("./game_view.js");

window.MovingObject = MovingObject;
window.Asteroid = Asteroid;
window.Game = Game;

document.addEventListener("DOMContentLoaded", function () {
   const canvas = document.getElementById("game-canvas");
   const ctx = canvas.getContext("2d");
   const game = new Game();
   const gameView = new GameView(ctx, game);
   gameView.start();
});