const Asteroid = require("./asteroid.js");

const CRAP = {
    DIM_X: 1000,
    DIM_Y: 600,
    NUM_ASTEROIDS: 20
};
function Game() {
    this.asteroids = [];
    this.addAsteroids();
}

Game.prototype.addAsteroids = function () {
    while (this.asteroids.length < CRAP.NUM_ASTEROIDS) {
        const pos = this.randomPosition();
        const asteroid = new Asteroid(pos);
        this.asteroids.push(asteroid);
    }
}

Game.prototype.randomPosition = function () {
    var randomX = Math.random() * CRAP.DIM_X;
    var randomY = Math.random() * CRAP.DIM_Y;
    return [randomX, randomY];
}

Game.prototype.draw = function (ctx) {
    ctx.clearRect(0, 0, CRAP.DIM_X, CRAP.DIM_Y);
    ctx.fillStyle = "#FFFFFF";
    ctx.fillRect(0, 0, CRAP.DIM_X, CRAP.DIM_Y);
    this.asteroids.forEach(function(ele){
        ele.draw(ctx);
    })
}

Game.prototype.moveObjects = function () {

    this.asteroids.forEach(function(ele){
        ele.move();
        ele.pos[0] = this.wrap(ele.pos[0], CRAP.DIM_X);
        ele.pos[1] = this.wrap(ele.pos[1], CRAP.DIM_Y); 
    }.bind(this));
    
}

// Game.prototype.wrap = function (pos) {
//     this.asteroids.forEach(function (ass) {
//         if (ass.pos[0] > CRAP.DIM_X) {
//             ass.pos[0] = (ass.pos[0] % CRAP.DIM_X);         
//         } else if(ass.pos[1] > CRAP.DIM_Y){
//             ass.pos[1] = (ass.pos[1] % CRAP.DIM_Y);
//         } else if (ass.pos[0] < 0 ){
//             ass.pos[0] = CRAP.DIM_X - (ass.pos[0] % CRAP.DIM_X);
//         } else if (ass.pos[1] < 0) {
//             ass.pos[1] = CRAP.DIM_Y - (ass.pos[1] % CRAP.DIM_Y);
//         }
//     });
// }
Game.prototype.wrap = function (pos, max) {
    if (pos > max){
        return (pos % max);
    } else if (pos < 0){
        return max - (pos % max);
    } else {
        return pos;
    }

}


module.exports = Game;

