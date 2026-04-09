import 'package:pokedex/pokedex.dart';
import 'package:test/test.dart';
// =============================================
// Esses testes foram gerados por IA, não foi feito por nos Alunos,
// a ideia era testar e pegar erros toscos no código
// =============================================

void main() {
  // =============================================
  // Questão 1 - Cadastro básico de Pokémon
  // =============================================
  group('Questão 1 - Cadastro básico de Pokémon', () {
    test('Deve criar um Pokémon com todos os atributos', () {
      Pokemon p = Pokemon(
        numero: 25,
        nome: 'Pikachu',
        tipo: 'Elétrico',
        nivel: 5,
        hpAtual: 15,
        hpMaximo: 15,
        capturado: true,
      );

      expect(p.numero, 25);
      expect(p.nome, 'Pikachu');
      expect(p.tipo, 'Elétrico');
      expect(p.nivel, 5);
      expect(p.hpAtual, 15);
      expect(p.hpMaximo, 15);
      expect(p.capturado, true);
    });

    test('Deve criar um Pokémon não capturado', () {
      Pokemon p = Pokemon(
        numero: 4,
        nome: 'Charmander',
        tipo: 'Fogo',
        nivel: 5,
        hpAtual: 15,
        hpMaximo: 15,
        capturado: false,
      );

      expect(p.capturado, false);
    });
  });

  // =============================================
  // Questão 2 - Encapsulamento e validação
  // =============================================
  group('Questão 2 - Encapsulamento e validação', () {
    late Pokemon pokemon;

    setUp(() {
      pokemon = Pokemon(
        numero: 1,
        nome: 'Bulbasaur',
        tipo: 'Planta',
        nivel: 10,
        hpAtual: 50,
        hpMaximo: 50,
        capturado: true,
      );
    });

    group('subirNivel', () {
      test('Deve subir de nível corretamente', () {
        pokemon.subirNivel(5);
        expect(pokemon.nivel, 15);
      });

      test('Não deve ultrapassar o nível 100', () {
        pokemon.subirNivel(95);
        expect(pokemon.nivel, 100);
      });

      test('Não deve subir com quantidade inválida (<= 0)', () {
        pokemon.subirNivel(0);
        expect(pokemon.nivel, 10);

        pokemon.subirNivel(-5);
        expect(pokemon.nivel, 10);
      });

      test('Não deve subir se já está no nível 100', () {
        pokemon.subirNivel(90);
        expect(pokemon.nivel, 100);

        pokemon.subirNivel(1);
        expect(pokemon.nivel, 100);
      });
    });

    group('receberDano', () {
      test('Deve reduzir HP corretamente', () {
        pokemon.receberDano(10);
        expect(pokemon.hpAtual, 40);
      });

      test('HP não deve ficar negativo', () {
        pokemon.receberDano(100);
        expect(pokemon.hpAtual, 0);
      });

      test('Deve aceitar dano zero', () {
        pokemon.receberDano(0);
        expect(pokemon.hpAtual, 50);
      });
    });

    group('curar', () {
      test('Deve curar corretamente', () {
        pokemon.receberDano(20);
        pokemon.curar(10);
        expect(pokemon.hpAtual, 40);
      });

      test('Não deve ultrapassar HP máximo', () {
        pokemon.receberDano(10);
        pokemon.curar(MAXHEAL);
        expect(pokemon.hpAtual, 50);
      });

      test('Não deve curar se HP já está no máximo', () {
        pokemon.curar(10);
        expect(pokemon.hpAtual, 50);
      });
    });

    group('Setters com validação', () {
      test('Número não deve aceitar valor negativo ou zero', () {
        pokemon.numero = -1;
        expect(pokemon.numero, 1); // Mantém o valor original

        pokemon.numero = 0;
        expect(pokemon.numero, 1);
      });

      test('Nível não deve ser menor que 1', () {
        pokemon.nivel = 0;
        expect(pokemon.nivel, 1);
      });

      test('Nível não deve ultrapassar 100', () {
        pokemon.nivel = 150;
        expect(pokemon.nivel, 100);
      });

      test('HP máximo não deve ser menor que 1', () {
        pokemon.hpMaximo = 0;
        expect(pokemon.hpMaximo, 1);
      });
    });
  });

  // =============================================
  // Questão 3 - Evolução
  // =============================================
  group('Questão 3 - Evolução', () {
    test('Deve evoluir quando nível é suficiente', () {
      Pokemon p = Pokemon(
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

      p.evoluir();

      expect(p.nome, 'Metapod');
      expect(p.proximaEvolucao, isNull);
      expect(p.nivelEvolucao, isNull);
      expect(p.hpMaximo, 34); // 14 + 20
      expect(p.hpAtual, 34); // Cura ao evoluir
    });

    test('Não deve evoluir quando nível é insuficiente', () {
      Pokemon p = Pokemon(
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

      p.evoluir();

      expect(p.nome, 'Weedle');
      expect(p.proximaEvolucao, 'Kakuna');
    });

    test('Não deve evoluir se não tem evolução', () {
      Pokemon p = Pokemon(
        numero: 25,
        nome: 'Pikachu',
        tipo: 'Elétrico',
        nivel: 50,
        hpAtual: 35,
        hpMaximo: 35,
        capturado: true,
      );

      p.evoluir();

      expect(p.nome, 'Pikachu');
    });
  });

  // =============================================
  // Questão 4 - Pokédex
  // =============================================
  group('Questão 4 - Pokédex', () {
    late Pokedex pokedex;
    late Pokemon pikachu;
    late Pokemon squirtle;

    setUp(() {
      pokedex = Pokedex();
      pikachu = Pokemon(
        numero: 25,
        nome: 'Pikachu',
        tipo: 'Elétrico',
        nivel: 5,
        hpAtual: 15,
        hpMaximo: 15,
        capturado: true,
      );
      squirtle = Pokemon(
        numero: 7,
        nome: 'Squirtle',
        tipo: 'Água',
        nivel: 5,
        hpAtual: 20,
        hpMaximo: 20,
        capturado: false,
      );
    });

    test('Deve adicionar Pokémon na Pokédex', () {
      pokedex.adicionarPokemon(pikachu);
      expect(pokedex.pokedex.length, 1);
    });

    test('Não deve adicionar Pokémon com número duplicado', () {
      pokedex.adicionarPokemon(pikachu);
      Pokemon duplicado = Pokemon(
        numero: 25,
        nome: 'Outro',
        tipo: 'Normal',
        nivel: 1,
        hpAtual: 10,
        hpMaximo: 10,
        capturado: false,
      );
      pokedex.adicionarPokemon(duplicado);
      expect(pokedex.pokedex.length, 1);
    });

    test('Deve remover Pokémon por número', () {
      pokedex.adicionarPokemon(pikachu);
      pokedex.adicionarPokemon(squirtle);
      pokedex.removerPokemonPorNumero(25);
      expect(pokedex.pokedex.length, 1);
      expect(pokedex.pokedex.first.nome, 'Squirtle');
    });

    test('Não deve dar erro ao remover Pokémon inexistente', () {
      pokedex.adicionarPokemon(pikachu);
      pokedex.removerPokemonPorNumero(999);
      expect(pokedex.pokedex.length, 1);
    });

    test('Deve buscar Pokémon por número', () {
      pokedex.adicionarPokemon(pikachu);
      pokedex.adicionarPokemon(squirtle);

      Pokemon? resultado = pokedex.buscarPorNumero(25);
      expect(resultado, isNotNull);
      expect(resultado!.nome, 'Pikachu');
    });

    test('Deve retornar null ao buscar Pokémon inexistente', () {
      pokedex.adicionarPokemon(pikachu);

      Pokemon? resultado = pokedex.buscarPorNumero(999);
      expect(resultado, isNull);
    });

    test('listarTodos deve conter todos os Pokémons', () {
      pokedex.adicionarPokemon(pikachu);
      pokedex.adicionarPokemon(squirtle);
      expect(pokedex.pokedex.length, 2);
    });
  });

  // =============================================
  // Questão 5 - Filtros
  // =============================================
  group('Questão 5 - Filtros', () {
    late Pokedex pokedex;

    setUp(() {
      pokedex = Pokedex();
      pokedex.adicionarPokemon(
        Pokemon(
          numero: 25,
          nome: 'Pikachu',
          tipo: 'Elétrico',
          nivel: 10,
          hpAtual: 15,
          hpMaximo: 15,
          capturado: true,
        ),
      );
      pokedex.adicionarPokemon(
        Pokemon(
          numero: 4,
          nome: 'Charmander',
          tipo: 'Fogo',
          nivel: 5,
          hpAtual: 15,
          hpMaximo: 15,
          capturado: false,
        ),
      );
      pokedex.adicionarPokemon(
        Pokemon(
          numero: 7,
          nome: 'Squirtle',
          tipo: 'Água',
          nivel: 20,
          hpAtual: 20,
          hpMaximo: 20,
          capturado: true,
          proximaEvolucao: 'Wartortle',
          nivelEvolucao: 16,
        ),
      );
    });

    test('listarCapturados deve filtrar apenas capturados', () {
      List<Pokemon> capturados = pokedex.pokedex
          .where((p) => p.capturado)
          .toList();
      expect(capturados.length, 2);
      expect(capturados.any((p) => p.nome == 'Pikachu'), true);
      expect(capturados.any((p) => p.nome == 'Squirtle'), true);
    });

    test('listarPorTipo deve filtrar por tipo correto', () {
      List<Pokemon> fogo = pokedex.pokedex
          .where((p) => p.tipo == 'Fogo')
          .toList();
      expect(fogo.length, 1);
      expect(fogo.first.nome, 'Charmander');
    });

    test('listarAcimaDoNivel deve filtrar por nível', () {
      List<Pokemon> acima = pokedex.pokedex.where((p) => p.nivel > 5).toList();
      expect(acima.length, 2);
    });

    test('listarQuePodemEvoluir deve filtrar corretamente', () {
      List<Pokemon> podeEvoluir = pokedex.pokedex
          .where(
            (p) =>
                p.proximaEvolucao != null &&
                p.nivelEvolucao != null &&
                p.nivel >= p.nivelEvolucao!,
          )
          .toList();
      expect(podeEvoluir.length, 1);
      expect(podeEvoluir.first.nome, 'Squirtle');
    });
  });

  // =============================================
  // Questão 6 - Herança
  // =============================================
  group('Questão 6 - Herança', () {
    test('PokemonFogo deve ter ataque base nivel * 3', () {
      PokemonFogo fogo = PokemonFogo(
        numero: 4,
        nome: 'Charmander',
        tipo: 'Fogo',
        nivel: 10,
        hpAtual: 30,
        hpMaximo: 30,
        capturado: true,
      );
      expect(fogo.calcularAtaqueBase(), 30); // 10 * 3
    });

    test('PokemonAgua deve ter ataque base nivel * 2 + 10', () {
      PokemonAgua agua = PokemonAgua(
        numero: 7,
        nome: 'Squirtle',
        tipo: 'Água',
        nivel: 10,
        hpAtual: 30,
        hpMaximo: 30,
        capturado: false,
      );
      expect(agua.calcularAtaqueBase(), 30); // 10 * 2 + 10
    });

    test('PokemonEletrico deve ter ataque base nivel * 2 + 15', () {
      PokemonEletrico eletrico = PokemonEletrico(
        numero: 25,
        nome: 'Pikachu',
        tipo: 'Elétrico',
        nivel: 10,
        hpAtual: 30,
        hpMaximo: 30,
        capturado: true,
      );
      expect(eletrico.calcularAtaqueBase(), 35); // 10 * 2 + 15
    });

    test('Pokemon base deve ter ataque base nivel * 1', () {
      Pokemon p = Pokemon(
        numero: 132,
        nome: 'Ditto',
        tipo: 'Normal',
        nivel: 10,
        hpAtual: 30,
        hpMaximo: 30,
        capturado: false,
      );
      expect(p.calcularAtaqueBase(), 10); // 10 * 1
    });

    test('Subclasses devem ser instâncias de Pokemon', () {
      PokemonFogo fogo = PokemonFogo(
        numero: 4,
        nome: 'Charmander',
        tipo: 'Fogo',
        nivel: 5,
        hpAtual: 15,
        hpMaximo: 15,
        capturado: true,
      );
      expect(fogo, isA<Pokemon>());
    });
  });

  // =============================================
  // Questão 7 - Habilidades
  // =============================================
  group('Questão 7 - Habilidades', () {
    late PokemonEletrico atacante;
    late PokemonFogo defensor;

    setUp(() {
      atacante = PokemonEletrico(
        numero: 25,
        nome: 'Pikachu',
        tipo: 'Elétrico',
        nivel: 10,
        hpAtual: 50,
        hpMaximo: 50,
        capturado: true,
      );
      defensor = PokemonFogo(
        numero: 4,
        nome: 'Charmander',
        tipo: 'Fogo',
        nivel: 10,
        hpAtual: 50,
        hpMaximo: 50,
        capturado: false,
      );
    });

    test('ChoqueDoTrovao deve causar dano e gastar energia', () {
      ChoqueDoTrovao ataque = ChoqueDoTrovao('Choque Do Trovão', 5);

      int hpAntes = defensor.hpAtual;
      int energiaAntes = atacante.energia;

      ataque.usar(atacante, defensor);

      expect(defensor.hpAtual, lessThan(hpAntes));
      expect(atacante.energia, energiaAntes - 5);
    });

    test('JatoDAgua deve causar dano e gastar energia', () {
      PokemonAgua agua = PokemonAgua(
        numero: 7,
        nome: 'Squirtle',
        tipo: 'Água',
        nivel: 10,
        hpAtual: 50,
        hpMaximo: 50,
        capturado: true,
      );
      JatoDAgua ataque = JatoDAgua('Jato DÁgua', 3);

      int hpAntes = defensor.hpAtual;

      ataque.usar(agua, defensor);

      expect(defensor.hpAtual, lessThan(hpAntes));
    });

    test('LancaChamas deve causar dano e gastar energia', () {
      LancaChamas ataque = LancaChamas('Lança Chamas', 5);

      int hpAntes = atacante.hpAtual;

      ataque.usar(defensor, atacante);

      expect(atacante.hpAtual, lessThan(hpAntes));
    });

    test('Não deve usar habilidade sem energia suficiente', () {
      ChoqueDoTrovao ataque = ChoqueDoTrovao('Choque Do Trovão', 30);

      int hpAntes = defensor.hpAtual;

      ataque.usar(atacante, defensor);

      expect(defensor.hpAtual, hpAntes); // HP não mudou
    });

    test('Habilidade deve calcular dano correto', () {
      // PokemonEletrico nivel 10: ataque base = 10 * 2 + 15 = 35
      // ChoqueDoTrovao: dano = ataqueBase + 5 = 40
      ChoqueDoTrovao ataque = ChoqueDoTrovao('Teste', 5);
      ataque.usar(atacante, defensor);
      expect(defensor.hpAtual, 50 - 40); // 10
    });
  });

  // =============================================
  // Questão 8 - Batalha
  // =============================================
  group('Questão 8 - Batalha com polimorfismo', () {
    test('turno deve aplicar dano ao defensor', () {
      PokemonFogo atacante = PokemonFogo(
        numero: 6,
        nome: 'Charizard',
        tipo: 'Fogo',
        nivel: 20,
        hpAtual: 100,
        hpMaximo: 100,
        capturado: true,
      );
      PokemonAgua defensor = PokemonAgua(
        numero: 9,
        nome: 'Blastoise',
        tipo: 'Água',
        nivel: 20,
        hpAtual: 100,
        hpMaximo: 100,
        capturado: true,
      );
      LancaChamas ataque = LancaChamas('Lança Chamas', 5);

      int hpAntes = defensor.hpAtual;
      turno(atacante, defensor, ataque);

      expect(defensor.hpAtual, lessThan(hpAntes));
    });

    test('Polimorfismo: diferentes pokémons causam dano diferente', () {
      PokemonFogo fogo = PokemonFogo(
        numero: 4,
        nome: 'Charmander',
        tipo: 'Fogo',
        nivel: 10,
        hpAtual: 100,
        hpMaximo: 100,
        capturado: true,
      );
      PokemonAgua agua = PokemonAgua(
        numero: 7,
        nome: 'Squirtle',
        tipo: 'Água',
        nivel: 10,
        hpAtual: 100,
        hpMaximo: 100,
        capturado: true,
      );

      // Ambos usam um ataque genérico com mesmo custo
      LancaChamas ataqueF = LancaChamas('Ember', 3);
      JatoDAgua ataqueA = JatoDAgua('Bubbles', 3);

      // Alvos iguais
      Pokemon alvo1 = Pokemon(
        numero: 132,
        nome: 'Ditto1',
        tipo: 'Normal',
        nivel: 5,
        hpAtual: 200,
        hpMaximo: 200,
        capturado: false,
      );
      Pokemon alvo2 = Pokemon(
        numero: 133,
        nome: 'Ditto2',
        tipo: 'Normal',
        nivel: 5,
        hpAtual: 200,
        hpMaximo: 200,
        capturado: false,
      );

      ataqueF.usar(fogo, alvo1); // Fogo nivel 10: 10*3 + 7 = 37
      ataqueA.usar(agua, alvo2); // Agua nivel 10: 10*2+10 + 3 = 33

      // Fogo causa mais dano que Água com mesmo nível
      expect(alvo1.hpAtual, 200 - 37); // 163
      expect(alvo2.hpAtual, 200 - 33); // 167
    });
  });

  // =============================================
  // Questão 9 - Interface RegistravelNaPokedex
  // =============================================
  group('Questão 9 - Interface RegistravelNaPokedex', () {
    late Pokemon pokemon;

    setUp(() {
      pokemon = Pokemon(
        numero: 25,
        nome: 'Pikachu',
        tipo: 'Elétrico',
        nivel: 5,
        hpAtual: 15,
        hpMaximo: 15,
        capturado: false,
      );
    });

    test('Pokemon deve implementar RegistravelNaPokedex', () {
      expect(pokemon, isA<RegistravelNaPokedex>());
    });

    test('marcarComoVisto deve marcar como visto', () {
      expect(pokemon.visto, false);
      pokemon.marcarComoVisto();
      expect(pokemon.visto, true);
    });

    test('marcarComoCapturado deve marcar como capturado e visto', () {
      expect(pokemon.capturado, false);
      expect(pokemon.visto, false);

      pokemon.marcarComoCapturado();

      expect(pokemon.capturado, true);
      expect(pokemon.visto, true);
    });

    test('favoritar deve marcar como favorito', () {
      expect(pokemon.favorito, false);
      pokemon.favoritar();
      expect(pokemon.favorito, true);
    });

    test('desfavoritar deve desmarcar como favorito', () {
      pokemon.favoritar();
      expect(pokemon.favorito, true);

      pokemon.desfavoritar();
      expect(pokemon.favorito, false);
    });

    test('Subclasses também devem implementar a interface', () {
      PokemonFogo fogo = PokemonFogo(
        numero: 4,
        nome: 'Charmander',
        tipo: 'Fogo',
        nivel: 5,
        hpAtual: 15,
        hpMaximo: 15,
        capturado: false,
      );
      expect(fogo, isA<RegistravelNaPokedex>());

      fogo.marcarComoCapturado();
      expect(fogo.capturado, true);
      expect(fogo.visto, true);
    });
  });

  // =============================================
  // Questão 10 - Funções anônimas
  // =============================================
  group('Questão 10 - Funções anônimas', () {
    late Pokedex pokedex;

    setUp(() {
      pokedex = Pokedex();
      pokedex.adicionarPokemon(
        Pokemon(
          numero: 25,
          nome: 'Pikachu',
          tipo: 'Elétrico',
          nivel: 20,
          hpAtual: 35,
          hpMaximo: 35,
          capturado: true,
        ),
      );
      pokedex.adicionarPokemon(
        Pokemon(
          numero: 4,
          nome: 'Charmander',
          tipo: 'Fogo',
          nivel: 5,
          hpAtual: 15,
          hpMaximo: 15,
          capturado: false,
        ),
      );
      pokedex.adicionarPokemon(
        Pokemon(
          numero: 7,
          nome: 'Squirtle',
          tipo: 'Água',
          nivel: 10,
          hpAtual: 20,
          hpMaximo: 20,
          capturado: true,
        ),
      );
    });

    test('filtrar deve usar função anônima corretamente', () {
      List<Pokemon> capturados = pokedex.filtrar((p) => p.capturado);
      expect(capturados.length, 2);

      List<Pokemon> fogo = pokedex.filtrar((p) => p.tipo == 'Fogo');
      expect(fogo.length, 1);
      expect(fogo.first.nome, 'Charmander');

      List<Pokemon> nivelAlto = pokedex.filtrar((p) => p.nivel > 10);
      expect(nivelAlto.length, 1);
      expect(nivelAlto.first.nome, 'Pikachu');
    });

    test('ordenarPorNivel deve ordenar em ordem crescente', () {
      List<Pokemon> ordenados = pokedex.ordenarPorNivel();
      expect(ordenados[0].nome, 'Charmander'); // nivel 5
      expect(ordenados[1].nome, 'Squirtle'); // nivel 10
      expect(ordenados[2].nome, 'Pikachu'); // nivel 20
    });

    test('ordenarPorNome deve ordenar alfabeticamente', () {
      List<Pokemon> ordenados = pokedex.ordenarPorNome();
      expect(ordenados[0].nome, 'Charmander');
      expect(ordenados[1].nome, 'Pikachu');
      expect(ordenados[2].nome, 'Squirtle');
    });

    test('ordenarPorHp deve ordenar por HP decrescente', () {
      List<Pokemon> ordenados = pokedex.ordenarPorHp();
      expect(ordenados[0].nome, 'Pikachu'); // hp 35
      expect(ordenados[1].nome, 'Squirtle'); // hp 20
      expect(ordenados[2].nome, 'Charmander'); // hp 15
    });

    test('aplicarParaTodos deve executar ação em todos', () {
      pokedex.aplicarParaTodos((p) => p.marcarComoVisto());
      for (var p in pokedex.pokedex) {
        expect(p.visto, true);
      }
    });

    test('filtrar não deve modificar a lista original', () {
      pokedex.filtrar((p) => p.capturado);
      expect(pokedex.pokedex.length, 3);
    });

    test('ordenar não deve modificar a lista original', () {
      List<Pokemon> ordenados = pokedex.ordenarPorNivel();
      // A lista original mantém a ordem de inserção
      expect(pokedex.pokedex[0].nome, 'Pikachu');
      expect(ordenados[0].nome, 'Charmander');
    });
  });

  // =============================================
  // Questão 11 - Estatísticas
  // =============================================
  group('Questão 11 - Estatísticas', () {
    late Pokedex pokedex;

    setUp(() {
      pokedex = Pokedex();
      pokedex.adicionarPokemon(
        Pokemon(
          numero: 25,
          nome: 'Pikachu',
          tipo: 'Elétrico',
          nivel: 20,
          hpAtual: 35,
          hpMaximo: 35,
          capturado: true,
        ),
      );
      pokedex.adicionarPokemon(
        Pokemon(
          numero: 4,
          nome: 'Charmander',
          tipo: 'Fogo',
          nivel: 10,
          hpAtual: 15,
          hpMaximo: 15,
          capturado: false,
        ),
      );
      pokedex.adicionarPokemon(
        Pokemon(
          numero: 7,
          nome: 'Squirtle',
          tipo: 'Água',
          nivel: 15,
          hpAtual: 20,
          hpMaximo: 20,
          capturado: true,
        ),
      );
      pokedex.adicionarPokemon(
        Pokemon(
          numero: 6,
          nome: 'Charizard',
          tipo: 'Fogo',
          nivel: 35,
          hpAtual: 78,
          hpMaximo: 78,
          capturado: false,
        ),
      );
    });

    test('totalPokemons deve retornar a quantidade total', () {
      expect(pokedex.totalPokemons(), 4);
    });

    test('quantidadePorTipo deve retornar contagem correta', () {
      Map<String, int> tipos = pokedex.quantidadePorTipo();
      expect(tipos['Elétrico'], 1);
      expect(tipos['Fogo'], 2);
      expect(tipos['Água'], 1);
    });

    test('mediaDeNivel deve calcular a média corretamente', () {
      // (20 + 10 + 15 + 35) / 4 = 20.0
      expect(pokedex.mediaDeNivel(), 20.0);
    });

    test('percentualCapturados deve calcular corretamente', () {
      // 2 capturados de 4 = 50%
      expect(pokedex.percentualCapturados(), 50.0);
    });

    test('Estatísticas com Pokédex vazia', () {
      Pokedex vazia = Pokedex();
      expect(vazia.totalPokemons(), 0);
      expect(vazia.mediaDeNivel(), 0);
      expect(vazia.percentualCapturados(), 0);
      expect(vazia.quantidadePorTipo(), isEmpty);
    });
  });

  // =============================================
  // Questão 12 - Integração / Desafio final
  // =============================================
  group('Questão 12 - Simulação integrada', () {
    test('Fluxo completo: cadastro, batalha, evolução, estatísticas', () {
      // 1. Criar pokémons de diferentes tipos
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

      // 2. Adicionar na Pokédex
      Pokedex pokedex = Pokedex();
      pokedex.adicionarPokemon(charizard);
      pokedex.adicionarPokemon(blastoise);
      pokedex.adicionarPokemon(bulbasaur);

      expect(pokedex.totalPokemons(), 3);

      // 3. Interface RegistravelNaPokedex
      charizard.marcarComoVisto();
      charizard.favoritar();
      expect(charizard.visto, true);
      expect(charizard.favorito, true);

      // 4. Batalha
      LancaChamas flamethrower = LancaChamas('Flamethrower', 5);
      JatoDAgua surfar = JatoDAgua('Surf', 4);

      int hpBlastoiseAntes = blastoise.hpAtual;
      turno(charizard, blastoise, flamethrower);
      expect(blastoise.hpAtual, lessThan(hpBlastoiseAntes));

      int hpCharizardAntes = charizard.hpAtual;
      turno(blastoise, charizard, surfar);
      expect(charizard.hpAtual, lessThan(hpCharizardAntes));

      // 5. Evolução
      bulbasaur.subirNivel(11); // Nível 16
      expect(bulbasaur.nivel, 16);
      bulbasaur.evoluir();
      expect(bulbasaur.nome, 'Ivysaur');

      // 6. Filtros com funções anônimas
      List<Pokemon> fortes = pokedex.filtrar((p) => p.nivel > 30);
      expect(fortes.length, 2); // Charizard e Blastoise

      // 7. Estatísticas
      expect(pokedex.percentualCapturados(), 100.0);
      expect(pokedex.mediaDeNivel(), closeTo(29.3, 0.1)); // (36+36+16)/3

      Map<String, int> tipos = pokedex.quantidadePorTipo();
      expect(tipos['Fogo'], 1);
      expect(tipos['Água'], 1);
      expect(tipos['Planta'], 1);
    });
  });
}
