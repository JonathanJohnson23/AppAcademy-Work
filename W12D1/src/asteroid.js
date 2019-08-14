const MovingObject = require("./moving_object.js");
const Util = require("./utils.js");
function Asteroid(pos) {
   this.pos = pos;
   this.vel = Util.randomVec(10);
   
   const GLOBAL = {
      COLOR: '#f5e050',
      RADIUS: 15
   };
   MovingObject.call(this, pos, this.vel, GLOBAL.RADIUS, GLOBAL.COLOR);
}

Util.inherits(Asteroid, MovingObject); 

module.exports = Asteroid;
