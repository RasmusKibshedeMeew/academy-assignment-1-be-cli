import { EntityManager } from 'typeorm';
import { Pokemon } from '../../entity/Pokemon';
import { PopulateScriptExecutor } from '../util/types';
import { supabase } from '../../supabase';

export const execute: PopulateScriptExecutor = async (manager: EntityManager) => {

    function description(type: string) {
        return 'This is a ' + type + ' type'
    }

    const pokemon = new Pokemon();
    pokemon.name = 'Blastoise';
    pokemon.description = description('water');
    await manager.save(pokemon);

    const pokemon2 = new Pokemon();
    pokemon2.name = 'Charizard';
    pokemon2.description = description('fire');
    await manager.save(pokemon2);

    const pokemon3 = new Pokemon();
    pokemon3.name = 'Pichu';
    pokemon3.description = description('electric');
    await manager.save(pokemon3);

    const pokemon4 = new Pokemon();
    pokemon4.name = 'Venusaur';
    pokemon4.description = description('grass');
    await manager.save(pokemon4);
};