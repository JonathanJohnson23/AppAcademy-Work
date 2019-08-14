const View = require('./ttt-view.js'); // require appropriate file
const Game = require('./game.js'); // require appropriate file

  $( () => {
    // Your code here
    const theGame = new Game()
    const rootEle = $('.ttt');
    new View(theGame, rootEle)
  });
