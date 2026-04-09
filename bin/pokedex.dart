import 'package:pokedex/pokedex.dart';

void main() {
  // =============================================
  // -- Questão 1 -- Cadastro básico de Pokémon
  // =============================================

  print('=== QUESTÃO 1 - Cadastro básico ===');
  print('');

  Pokemon pikachu = Pokemon(
    numero: 25,
    nome: 'Pikachu',
    tipo: 'Elétrico',
    nivel: 5,
    hpAtual: 15,
    hpMaximo: 15,
    capturado: true,
  );
  pikachu.exibirFicha();

  Pokemon squirtle = Pokemon(
    numero: 7,
    nome: 'Squirtle',
    tipo: 'Água',
    nivel: 5,
    hpAtual: 20,
    hpMaximo: 20,
    capturado: false,
  );
  squirtle.exibirFicha();

  Pokemon charmander = Pokemon(
    numero: 4,
    nome: 'Charmander',
    tipo: 'Fogo',
    nivel: 5,
    hpAtual: 15,
    hpMaximo: 15,
    capturado: false,
  );
  charmander.exibirFicha();

  // =============================================
  // -- Questão 2 -- Encapsulamento e validação
  // =============================================

  print('=== QUESTÃO 2 - Encapsulamento ===');
  print('');

  squirtle.receberDano(4);
  charmander.receberDano(8);

  squirtle.subirNivel(1);
  charmander.subirNivel(1);

  squirtle.curar(4);
  charmander.curar(4);

  squirtle.exibirFicha();
  charmander.exibirFicha();

  // =============================================
  // -- Questão 3 -- Evolução
  // =============================================

  print('=== QUESTÃO 3 - Evolução ===');
  print('');

  Pokemon caterpie = Pokemon(
    numero: 10,
    nome: 'Caterpie',
    tipo: 'Inseto',
    nivel: 7,
    hpAtual: 14,
    hpMaximo: 14,
    capturado: true,
    proximaEvolucao: 'Metapod',
    nivelEvolucao: 7,
  );
  caterpie.exibirFicha();

  Pokemon weedle = Pokemon(
    numero: 13,
    nome: 'Weedle',
    tipo: 'Inseto',
    nivel: 3,
    hpAtual: 10,
    hpMaximo: 10,
    capturado: true,
    proximaEvolucao: 'Kakuna',
    nivelEvolucao: 7,
  );
  weedle.exibirFicha();

  caterpie.evoluir(); // Deve evoluir (nivel 7 >= 7)
  weedle.evoluir(); // Não deve evoluir (nivel 3 < 7)

  // =============================================
  // -- Questão 4 -- Pokédex
  // =============================================

  print('=== QUESTÃO 4 - Pokédex ===');
  print('');

  Pokemon ditto = Pokemon(
    numero: 25,
    nome: 'Pikachu?',
    tipo: 'Elétrico?',
    nivel: 5,
    hpAtual: 15,
    hpMaximo: 15,
    capturado: false,
  );

  Pokedex rotomdex = Pokedex();

  // Adicionando Pokémons
  rotomdex.adicionarPokemon(pikachu);
  rotomdex.adicionarPokemon(ditto); // Tentativa de adicionar com mesmo número
  rotomdex.adicionarPokemon(weedle);
  rotomdex.adicionarPokemon(charmander);
  rotomdex.adicionarPokemon(squirtle);
  rotomdex.adicionarPokemon(caterpie);

  // Removendo e buscando
  rotomdex.removerPokemonPorNumero(13);
  rotomdex.removerPokemonPorNumero(13); // Tentativa de remover inexistente

  rotomdex.buscarPorNumero(25)?.exibirFicha();
  rotomdex.buscarPorNumero(13); // Retorna null

  rotomdex.adicionarPokemon(weedle); // Weedle adicionado novamente

  rotomdex.listarTodos();

  // =============================================
  // -- Questão 5 -- Filtros
  // =============================================

  print('=== QUESTÃO 5 - Filtros ===');
  print('');

  rotomdex.listarCapturados();
  rotomdex.listarPorTipo('Fogo');
  rotomdex.listarAcimaDoNivel(5);

  rotomdex.listarQuePodemEvoluir(); // Nenhum pode evoluir ainda

  weedle.subirNivel(4); // Upando o nível do Weedle

  rotomdex.listarQuePodemEvoluir();

  // =============================================
  // -- Questão 6 -- Herança
  // =============================================

  print('=== QUESTÃO 6 - Herança ===');
  print('');

  PokemonFogo magmar = PokemonFogo(
    numero: 126,
    nome: 'Magmar',
    tipo: 'Fogo',
    nivel: 30,
    hpAtual: 210,
    hpMaximo: 210,
    capturado: false,
  );

  PokemonAgua psyduck = PokemonAgua(
    numero: 53,
    nome: 'Psyduck',
    tipo: 'Água',
    nivel: 18,
    hpAtual: 92,
    hpMaximo: 92,
    capturado: false,
    proximaEvolucao: 'Golduck',
    nivelEvolucao: 33,
  );

  PokemonEletrico magnemite = PokemonEletrico(
    numero: 81,
    nome: 'Magnemite',
    tipo: 'Elétrico',
    nivel: 25,
    hpAtual: 195,
    hpMaximo: 195,
    capturado: false,
    proximaEvolucao: 'Magneton',
    nivelEvolucao: 30,
  );

  PokemonAgua magikarp = PokemonAgua(
    numero: 129,
    nome: 'Magikarp',
    tipo: 'Água',
    nivel: 15,
    hpAtual: 80,
    hpMaximo: 80,
    capturado: false,
    proximaEvolucao: 'Gyarados',
    nivelEvolucao: 20,
  );

  PokemonEletrico electabuzz = PokemonEletrico(
    numero: 125,
    nome: 'Electabuzz',
    tipo: 'Elétrico',
    nivel: 30,
    hpAtual: 210,
    hpMaximo: 210,
    capturado: false,
  );

  magmar.exibirFicha();
  psyduck.exibirFicha();
  magnemite.exibirFicha();

  // =============================================
  // -- Questão 7 -- Habilidades
  // =============================================

  print('=== QUESTÃO 7 - Habilidades ===');
  print('');

  LancaChamas ember = LancaChamas('Ember', 3);
  LancaChamas firefang = LancaChamas('Fire Fang', 5);
  LancaChamas fireblast = LancaChamas('Fire Blast', 8);
  ChoqueDoTrovao electroball = ChoqueDoTrovao('Electro Ball', 4);
  ChoqueDoTrovao choquedotrovao = ChoqueDoTrovao('Choque Do Trovão', 5);
  ChoqueDoTrovao thunderpunch = ChoqueDoTrovao('Thunder Punch', 5);
  JatoDAgua bubbles = JatoDAgua('Bubbles', 3);
  JatoDAgua splash = JatoDAgua('Splash', 2);
  JatoDAgua aquatail = JatoDAgua('Aqua Tail', 3);
  JatoDAgua hydropump = JatoDAgua('Hydro Pump', 8);

  // =============================================
  // -- Questão 8 -- Batalha
  // =============================================

  print('=== QUESTÃO 8 - Batalha ===');
  print('');

  // Batalha Magnemite vs Magmar
  print('--- Magnemite vs Magmar ---');
  turno(magnemite, magmar, electroball);
  turno(magmar, magnemite, ember);

  turno(magnemite, magmar, electroball);
  turno(magmar, magnemite, fireblast);

  magnemite.curar(98);
  turno(magmar, magnemite, firefang);

  turno(magnemite, magmar, electroball);

  magmar.curar(MAXHEAL);
  magnemite.curar(MAXHEAL);

  // Batalha Psyduck vs Magikarp
  print('--- Psyduck vs Magikarp ---');
  turno(psyduck, magikarp, bubbles);
  turno(magikarp, psyduck, splash);
  turno(psyduck, magikarp, aquatail);
  psyduck.curar(MAXHEAL);
  magikarp.curar(MAXHEAL);

  // Batalha Electabuzz vs Magikarp
  print('--- Electabuzz vs Magikarp ---');
  turno(electabuzz, magikarp, choquedotrovao);

  magikarp.subirNivel(40);
  magikarp.evoluir();
  turno(magikarp, electabuzz, hydropump);

  turno(electabuzz, magikarp, thunderpunch);
  turno(magikarp, electabuzz, hydropump);
  electabuzz.curar(MAXHEAL);
  magikarp.curar(MAXHEAL);

  // =============================================
  // -- Questão 9 -- Interface RegistravelNaPokedex
  // =============================================

  print('=== QUESTÃO 9 - Interface RegistravelNaPokedex ===');
  print('');

  // Demonstrando uso da interface
  squirtle.marcarComoVisto();
  squirtle.marcarComoCapturado();
  squirtle.favoritar();
  print('Squirtle - Visto: ${squirtle.visto}, Capturado: ${squirtle.capturado}, Favorito: ${squirtle.favorito}');
  squirtle.desfavoritar();
  print('Squirtle - Favorito após desfavoritar: ${squirtle.favorito}');
  print('');

  magmar.marcarComoVisto();
  print('Magmar - Visto: ${magmar.visto}, Capturado: ${magmar.capturado}');
  print('');

  // =============================================
  // -- Questão 10 -- Funções anônimas
  // =============================================

  print('=== QUESTÃO 10 - Funções anônimas ===');
  print('');

  // Adicionando os pokémons de batalha na Pokédex
  rotomdex.adicionarPokemon(magmar);
  rotomdex.adicionarPokemon(psyduck);
  rotomdex.adicionarPokemon(magnemite);
  rotomdex.adicionarPokemon(magikarp);
  rotomdex.adicionarPokemon(electabuzz);

  // Filtro com função anônima: pokémons com HP acima de 100
  print('Pokémons com HP máximo acima de 100:');
  List<Pokemon> fortes = rotomdex.filtrar((p) => p.hpMaximo > 100);
  for (var p in fortes) {
    print('  - ${p.nome} (HP: ${p.hpMaximo})');
  }
  print('');

  // Filtro com função anônima: pokémons de tipo Água
  print('Pokémons de tipo Água (filtro anônimo):');
  List<Pokemon> aguaPokemons = rotomdex.filtrar((p) => p.tipo == 'Água');
  for (var p in aguaPokemons) {
    print('  - ${p.nome}');
  }
  print('');

  // Ordenar por nível
  print('Pokémons ordenados por nível:');
  List<Pokemon> porNivel = rotomdex.ordenarPorNivel();
  for (var p in porNivel) {
    print('  - ${p.nome} (Nível: ${p.nivel})');
  }
  print('');

  // Ordenar por nome
  print('Pokémons ordenados por nome:');
  List<Pokemon> porNome = rotomdex.ordenarPorNome();
  for (var p in porNome) {
    print('  - ${p.nome}');
  }
  print('');

  // Ordenar por HP
  print('Pokémons ordenados por HP (decrescente):');
  List<Pokemon> porHp = rotomdex.ordenarPorHp();
  for (var p in porHp) {
    print('  - ${p.nome} (HP: ${p.hpAtual})');
  }
  print('');

  // Aplicar ação para todos com função anônima
  print('Marcando todos os pokémons como vistos:');
  rotomdex.aplicarParaTodos((p) => p.marcarComoVisto());
  print('');

  // =============================================
  // -- Questão 11 -- Estatísticas
  // =============================================

  print('=== QUESTÃO 11 - Estatísticas ===');
  print('');

  print('Total de Pokémons na Pokédex: ${rotomdex.totalPokemons()}');

  Map<String, int> tipos = rotomdex.quantidadePorTipo();
  print('Quantidade por tipo:');
  tipos.forEach((tipo, qtd) {
    print('  - $tipo: $qtd');
  });

  print('Média de nível: ${rotomdex.mediaDeNivel().toStringAsFixed(1)}');
  print('Percentual capturados: ${rotomdex.percentualCapturados().toStringAsFixed(1)}%');
  print('');

  // =============================================
  // -- Questão 12 -- Desafio final
  // =============================================

  print('=== QUESTÃO 12 - Simulação completa ===');
  print('');

  // Criando uma nova Pokédex do zero para a simulação final
  Pokedex pokedexFinal = Pokedex();

  // 1. Cadastrando pokémons de diferentes tipos
  PokemonFogo charizard = PokemonFogo(
    numero: 6,
    nome: 'Charizard',
    tipo: 'Fogo',
    nivel: 36,
    hpAtual: 250,
    hpMaximo: 250,
    capturado: true,
  );

  PokemonAgua blastoise = PokemonAgua(
    numero: 9,
    nome: 'Blastoise',
    tipo: 'Água',
    nivel: 36,
    hpAtual: 260,
    hpMaximo: 260,
    capturado: true,
  );

  PokemonEletrico raichu = PokemonEletrico(
    numero: 26,
    nome: 'Raichu',
    tipo: 'Elétrico',
    nivel: 30,
    hpAtual: 220,
    hpMaximo: 220,
    capturado: false,
    proximaEvolucao: null,
    nivelEvolucao: null,
  );

  Pokemon bulbasaur = Pokemon(
    numero: 1,
    nome: 'Bulbasaur',
    tipo: 'Planta',
    nivel: 5,
    hpAtual: 45,
    hpMaximo: 45,
    capturado: true,
    proximaEvolucao: 'Ivysaur',
    nivelEvolucao: 16,
  );

  // 2. Registrando na Pokédex
  pokedexFinal.adicionarPokemon(charizard);
  pokedexFinal.adicionarPokemon(blastoise);
  pokedexFinal.adicionarPokemon(raichu);
  pokedexFinal.adicionarPokemon(bulbasaur);

  // 3. Interface RegistravelNaPokedex
  charizard.marcarComoVisto();
  charizard.favoritar();
  blastoise.marcarComoCapturado();
  raichu.marcarComoVisto();
  print('');

  // 4. Listando e filtrando
  pokedexFinal.listarTodos();
  pokedexFinal.listarCapturados();
  pokedexFinal.listarPorTipo('Fogo');

  // 5. Funções anônimas - filtros
  print('Pokémons com nível acima de 30 (filtro anônimo):');
  List<Pokemon> nivel30 = pokedexFinal.filtrar((p) => p.nivel > 30);
  for (var p in nivel30) {
    print('  - ${p.nome} (Nível: ${p.nivel})');
  }
  print('');

  // 6. Estatísticas
  print('--- Estatísticas da Pokédex Final ---');
  print('Total: ${pokedexFinal.totalPokemons()}');
  print('Média de nível: ${pokedexFinal.mediaDeNivel().toStringAsFixed(1)}');
  print('Percentual capturados: ${pokedexFinal.percentualCapturados().toStringAsFixed(1)}%');
  Map<String, int> tiposFinal = pokedexFinal.quantidadePorTipo();
  print('Por tipo:');
  tiposFinal.forEach((tipo, qtd) {
    print('  - $tipo: $qtd');
  });
  print('');

  // 7. Batalha final: Charizard vs Blastoise
  print('--- BATALHA FINAL: Charizard vs Blastoise ---');
  print('');

  LancaChamas flamethrower = LancaChamas('Flamethrower', 5);
  JatoDAgua surfar = JatoDAgua('Surf', 4);

  turno(charizard, blastoise, flamethrower);
  turno(blastoise, charizard, surfar);
  turno(charizard, blastoise, flamethrower);
  turno(blastoise, charizard, surfar);

  // 8. Evolução
  print('--- Evolução ---');
  bulbasaur.subirNivel(11); // Vai para nível 16
  bulbasaur.evoluir(); // Deve evoluir para Ivysaur

  // 9. Estatísticas finais
  print('--- Estatísticas finais após batalha e evolução ---');
  print('Total: ${pokedexFinal.totalPokemons()}');
  print('Média de nível: ${pokedexFinal.mediaDeNivel().toStringAsFixed(1)}');
  print('');

  print('=== SIMULAÇÃO CONCLUÍDA ===');
}
