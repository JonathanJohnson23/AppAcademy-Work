import React from 'react';
import Tile from './Tile';
import * as Minesweeper from './minesweeper';   //=> tile board

class Board extends React.Component {
   constructor(props){
        super(props);  //=> props = { board, updateGame}
   }

   render(){
       return (
        <div className="board">
            {this.props.board.grid.map((row, i) => {
                return (
                    <div key={i} className="row">
                        {row.map((ele, j) => {
                            return (
                               <div className="styleMe">
                              <Tile
                                    tile={ele}
                                    updateGame={this.props.updateGame}
                                    key={j}
                              />
                              </div>
                            )
                        })}
                    </div>
                )
            })}
        </div>
       );
   }

}



export default Board;