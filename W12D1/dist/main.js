/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};
/******/
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/
/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId]) {
/******/ 			return installedModules[moduleId].exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			i: moduleId,
/******/ 			l: false,
/******/ 			exports: {}
/******/ 		};
/******/
/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);
/******/
/******/ 		// Flag the module as loaded
/******/ 		module.l = true;
/******/
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/
/******/
/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;
/******/
/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;
/******/
/******/ 	// define getter function for harmony exports
/******/ 	__webpack_require__.d = function(exports, name, getter) {
/******/ 		if(!__webpack_require__.o(exports, name)) {
/******/ 			Object.defineProperty(exports, name, { enumerable: true, get: getter });
/******/ 		}
/******/ 	};
/******/
/******/ 	// define __esModule on exports
/******/ 	__webpack_require__.r = function(exports) {
/******/ 		if(typeof Symbol !== 'undefined' && Symbol.toStringTag) {
/******/ 			Object.defineProperty(exports, Symbol.toStringTag, { value: 'Module' });
/******/ 		}
/******/ 		Object.defineProperty(exports, '__esModule', { value: true });
/******/ 	};
/******/
/******/ 	// create a fake namespace object
/******/ 	// mode & 1: value is a module id, require it
/******/ 	// mode & 2: merge all properties of value into the ns
/******/ 	// mode & 4: return value when already ns object
/******/ 	// mode & 8|1: behave like require
/******/ 	__webpack_require__.t = function(value, mode) {
/******/ 		if(mode & 1) value = __webpack_require__(value);
/******/ 		if(mode & 8) return value;
/******/ 		if((mode & 4) && typeof value === 'object' && value && value.__esModule) return value;
/******/ 		var ns = Object.create(null);
/******/ 		__webpack_require__.r(ns);
/******/ 		Object.defineProperty(ns, 'default', { enumerable: true, value: value });
/******/ 		if(mode & 2 && typeof value != 'string') for(var key in value) __webpack_require__.d(ns, key, function(key) { return value[key]; }.bind(null, key));
/******/ 		return ns;
/******/ 	};
/******/
/******/ 	// getDefaultExport function for compatibility with non-harmony modules
/******/ 	__webpack_require__.n = function(module) {
/******/ 		var getter = module && module.__esModule ?
/******/ 			function getDefault() { return module['default']; } :
/******/ 			function getModuleExports() { return module; };
/******/ 		__webpack_require__.d(getter, 'a', getter);
/******/ 		return getter;
/******/ 	};
/******/
/******/ 	// Object.prototype.hasOwnProperty.call
/******/ 	__webpack_require__.o = function(object, property) { return Object.prototype.hasOwnProperty.call(object, property); };
/******/
/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "";
/******/
/******/
/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(__webpack_require__.s = "./src/index.js");
/******/ })
/************************************************************************/
/******/ ({

/***/ "./src/asteroid.js":
/*!*************************!*\
  !*** ./src/asteroid.js ***!
  \*************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("const MovingObject = __webpack_require__(/*! ./moving_object.js */ \"./src/moving_object.js\");\nconst Util = __webpack_require__(/*! ./utils.js */ \"./src/utils.js\");\nfunction Asteroid(pos) {\n   this.pos = pos;\n   this.vel = Util.randomVec(10);\n   \n   const GLOBAL = {\n      COLOR: '#f5e050',\n      RADIUS: 15\n   };\n   MovingObject.call(this, pos, this.vel, GLOBAL.RADIUS, GLOBAL.COLOR);\n}\n\nUtil.inherits(Asteroid, MovingObject); \n\nmodule.exports = Asteroid;\n\n\n//# sourceURL=webpack:///./src/asteroid.js?");

/***/ }),

/***/ "./src/game.js":
/*!*********************!*\
  !*** ./src/game.js ***!
  \*********************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("const Asteroid = __webpack_require__(/*! ./asteroid.js */ \"./src/asteroid.js\");\n\nconst CRAP = {\n    DIM_X: 1000,\n    DIM_Y: 600,\n    NUM_ASTEROIDS: 20\n};\nfunction Game() {\n    this.asteroids = [];\n    this.addAsteroids();\n}\n\nGame.prototype.addAsteroids = function () {\n    while (this.asteroids.length < CRAP.NUM_ASTEROIDS) {\n        const pos = this.randomPosition();\n        const asteroid = new Asteroid(pos);\n        this.asteroids.push(asteroid);\n    }\n}\n\nGame.prototype.randomPosition = function () {\n    var randomX = Math.random() * CRAP.DIM_X;\n    var randomY = Math.random() * CRAP.DIM_Y;\n    return [randomX, randomY];\n}\n\nGame.prototype.draw = function (ctx) {\n    ctx.clearRect(0, 0, CRAP.DIM_X, CRAP.DIM_Y);\n    ctx.fillStyle = \"#FFFFFF\";\n    ctx.fillRect(0, 0, CRAP.DIM_X, CRAP.DIM_Y);\n    this.asteroids.forEach(function(ele){\n        ele.draw(ctx);\n    })\n}\n\nGame.prototype.moveObjects = function () {\n\n    this.asteroids.forEach(function(ele){\n        ele.move();\n        ele.pos[0] = this.wrap(ele.pos[0], CRAP.DIM_X);\n        ele.pos[1] = this.wrap(ele.pos[1], CRAP.DIM_Y); \n    }.bind(this));\n    \n}\n\n// Game.prototype.wrap = function (pos) {\n//     this.asteroids.forEach(function (ass) {\n//         if (ass.pos[0] > CRAP.DIM_X) {\n//             ass.pos[0] = (ass.pos[0] % CRAP.DIM_X);         \n//         } else if(ass.pos[1] > CRAP.DIM_Y){\n//             ass.pos[1] = (ass.pos[1] % CRAP.DIM_Y);\n//         } else if (ass.pos[0] < 0 ){\n//             ass.pos[0] = CRAP.DIM_X - (ass.pos[0] % CRAP.DIM_X);\n//         } else if (ass.pos[1] < 0) {\n//             ass.pos[1] = CRAP.DIM_Y - (ass.pos[1] % CRAP.DIM_Y);\n//         }\n//     });\n// }\nGame.prototype.wrap = function (pos, max) {\n    if (pos > max){\n        return (pos % max);\n    } else if (pos < 0){\n        return max - (pos % max);\n    } else {\n        return pos;\n    }\n\n}\n\n\nmodule.exports = Game;\n\n\n\n//# sourceURL=webpack:///./src/game.js?");

/***/ }),

/***/ "./src/game_view.js":
/*!**************************!*\
  !*** ./src/game_view.js ***!
  \**************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("const game = __webpack_require__(/*! ./game.js */ \"./src/game.js\");\n\nfunction GameView(ctx, game) {\n    this.ctx = ctx;\n    this.game = game;\n}\n\n\nGameView.prototype.start = function (){\n    setInterval(function(){\n        this.game.moveObjects();\n        this.game.draw(this.ctx);\n    }.bind(this), 20);\n   \n}\n\nmodule.exports = GameView;\n\n//# sourceURL=webpack:///./src/game_view.js?");

/***/ }),

/***/ "./src/index.js":
/*!**********************!*\
  !*** ./src/index.js ***!
  \**********************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("const MovingObject = __webpack_require__(/*! ./moving_object.js */ \"./src/moving_object.js\");\nconst Asteroid = __webpack_require__(/*! ./asteroid.js */ \"./src/asteroid.js\");\nconst Game = __webpack_require__(/*! ./game.js */ \"./src/game.js\");\nconst GameView = __webpack_require__(/*! ./game_view.js */ \"./src/game_view.js\");\n\nwindow.MovingObject = MovingObject;\nwindow.Asteroid = Asteroid;\nwindow.Game = Game;\n\ndocument.addEventListener(\"DOMContentLoaded\", function () {\n   const canvas = document.getElementById(\"game-canvas\");\n   const ctx = canvas.getContext(\"2d\");\n   const game = new Game();\n   const gameView = new GameView(ctx, game);\n   gameView.start();\n});\n\n//# sourceURL=webpack:///./src/index.js?");

/***/ }),

/***/ "./src/moving_object.js":
/*!******************************!*\
  !*** ./src/moving_object.js ***!
  \******************************/
/*! no static exports found */
/***/ (function(module, exports) {

eval("function MovingObject(pos, vel, radius, color) {\n    this.pos = pos;\n    this.vel = vel;\n    this.radius = radius;        //(everything in the game is a circle).\n    this.color = color;\n}\n\nMovingObject.prototype.draw = function (ctx) {\n    \n    ctx.beginPath();\n    ctx.arc(this.pos[0], this.pos[1], this.radius, 0, 2*Math.PI, true );\n    ctx.strokeSTyle = this.color;\n    ctx.lineWidth = 5;\n    ctx.stroke();\n    ctx.fillStyle = this.color;\n    ctx.fill();\n}\n\nMovingObject.prototype.move = function () {\n    this.pos[0] += this.vel[0];\n    this.pos[1] += this.vel[1];\n}\n\nmodule.exports = MovingObject;\n\n//# sourceURL=webpack:///./src/moving_object.js?");

/***/ }),

/***/ "./src/utils.js":
/*!**********************!*\
  !*** ./src/utils.js ***!
  \**********************/
/*! no static exports found */
/***/ (function(module, exports) {

eval("const Util = {\n    inherits(childClass, parentClass) {\n        childClass.prototype = Object.create(parentClass.prototype);\n        childClass.prototype.constructor = childClass;\n    },\n    randomVec(length) {\n        const deg = 2 * Math.PI * Math.random();\n        return Util.scale([Math.sin(deg), Math.cos(deg)], length);\n    },\n    scale(vec, m) {\n        return [vec[0] * m, vec[1] * m];\n    }\n    \n}\nmodule.exports = Util;\n\n//# sourceURL=webpack:///./src/utils.js?");

/***/ })

/******/ });