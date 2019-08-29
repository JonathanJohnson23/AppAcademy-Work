import React from 'react';
import PokemonIndexItem from "./pokemon_index_item"

class PokemonIndex extends React.Component{
   constructor(props){
      super(props)
      this.state = {};
     
   }

  componentDidMount(){
    this.props.requestAllPokemon()
  }
  
   render(){
      return (
         <div>
            <ul>
               {this.props.pokemon.map(poke => <PokemonIndexItem key={poke.id} pokemon={poke} /> )}
            </ul>
         </div>
      )
   }
}

export default PokemonIndex
