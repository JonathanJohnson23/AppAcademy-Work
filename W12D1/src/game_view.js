const game = require("./game.js");

function GameView(ctx, game) {
    this.ctx = ctx;
    this.game = game;
}


GameView.prototype.start = function (){
    setInterval(function(){
        this.game.moveObjects();
        this.game.draw(this.ctx);
    }.bind(this), 20);
   
}

module.exports = GameView;