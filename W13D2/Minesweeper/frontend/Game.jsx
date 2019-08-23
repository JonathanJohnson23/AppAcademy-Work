import React from 'react';
import Board from './Board';
import * as Minesweeper from './minesweeper';

class Game extends React.Component {
    constructor(props) {
        super(props);
        this.state = { board: new Minesweeper.Board(9, 10) };
        this.updateGame = this.updateGame.bind(this);     
        this.restartGame = this.restartGame.bind(this);
    }

    restartGame(){
        this.setState({ board: new Minesweeper.Board(9, 10) });
    }

    updateGame(tileInstance, boolean){
        if(boolean){
            tileInstance.toggleFlag();
        } else{
            tileInstance.explore();
        }
        this.setState({ board: this.state.board });
    }
   
    render(){
            if(this.state.board.won()){
            return (
                <div className="modal"> 
                    <div className="modal-box">
                        <p>You won!</p>
                        <button onClick={this.restartGame}>Play Again</button>
                    </div>
                    <Board board={this.state.board} updateGame={this.updateGame} />
                </div>
            )   
            } else if (this.state.board.lost()){
                return (
                    <div className="modal"> 
                        <div className="modal-box">
                            <p>You LOSE!</p>
                            <button onClick={this.restartGame}>PLAY AGAIN</button>
                        </div>
                            <Board board={this.state.board} updateGame={this.updateGame} />
                    </div>
                )   
        }
            return (
                <Board board={this.state.board} updateGame={this.updateGame}/>
            );
    }
   
}

export default Game;