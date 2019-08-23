import React from 'react';
import Minesweeper from './minesweeper';

class Tile extends React.Component {
    constructor(props) {
        super(props); //=> props = {tile, updateGame}
        this.handleClick = this.handleClick.bind(this);
    }

    handleClick(event){
        event.preventDefault();
        this.props.updateGame(this.props.tile, event.altKey)
    }
    
    render() {
        let icon = " ";
        let tileInfo = "waitingToBeEXPLORED";
        if (this.props.tile.explored) {
            if(this.props.tile.bombed){
                icon = "💣";
                tileInfo = "BOMBED";
            } else {
                icon = this.props.tile.adjacentBombCount();
                icon = icon === 0 ? "" : icon;
                tileInfo = "EXPLORED";
            }
        } else if (this.props.tile.flagged){
            icon = "🏳️‍🌈";
            tileInfo = "FLAGGED"
        }
        return (
            <div className={`tile ${tileInfo}`} onClick={this.handleClick}>{icon}</div>
        );
    }
}

export default Tile;

