import React from 'react';
import { Link } from "react-router-dom";

const PokemonIndexItem = ({ pokemon }) => (
   <li>
      <h4>{pokemon.id}</h4>
      <img src={pokemon.image_url} />
      <h4>{pokemon.name}</h4>
   </li>
)

export default PokemonIndexItem