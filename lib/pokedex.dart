// Essa constante serve pra curar o pokémon até HP máximo
// A checagem é feita na função de curar, então não ultrapassa o valor
const int MAXHEAL = 10000;

class Pokemon implements RegistravelNaPokedex {
  int _numero = 0;
  String _nome = '';
  String _tipo = '';
  int _nivel = 0;
  int _hpAtual = 0;
  int _hpMaximo = 0;
  bool capturado = false;

  String? proximaEvolucao;
  int? nivelEvolucao;

  // Energia base definida como 25
  int energia = 25;

  // Atributos da interface RegistravelNaPokedex
  bool visto = false;
  bool favorito = false;

  // Construtor

  Pokemon({
    required int numero,
    required String nome,
    required String tipo,
    required int nivel,
    required int hpAtual,
    required int hpMaximo,
    required this.capturado,
    this.proximaEvolucao,
    this.nivelEvolucao,
  }) : _numero = numero,
       _nome = nome,
       _tipo = tipo,
       _nivel = nivel,
       _hpAtual = hpAtual,
       _hpMaximo = hpMaximo;

  // Getters / Setters

  set numero(int valor) {
    if (valor > 0) {
      _numero = valor;
    } else {
      print('Número inválido! Não pode ser negativo .');
    }
  }

  int get numero => _numero;

  set nome(String valor) {
    if (valor.isEmpty) {
      print('Nome inválido! Não pode estar vazio .');
      return;
    } else {
      _nome = valor;
    }
  }

  String get nome => _nome;

  set tipo(String valor) {
    if (valor.isEmpty) {
      print('Tipo inválido! Não pode estar vazio .');
      return;
    } else {
      _tipo = valor;
    }
  }

  String get tipo => _tipo;

  set nivel(int valor) {
    if (valor < 1) {
      valor = 1;
    } else if (valor > 100) {
      valor = 100;
    }
    _nivel = valor;
  }

  int get nivel => _nivel;

  set hpAtual(int valor) {
    if (valor > hpMaximo) {
      valor = hpMaximo;
    } else if (valor < 0) {
      valor = 0;
    }
    _hpAtual = valor;
  }

  int get hpAtual => _hpAtual;

  set hpMaximo(int valor) {
    if (valor < 1) {
      valor = 1;
    }
    _hpMaximo = valor;
  }

  int get hpMaximo => _hpMaximo;

  // Método para exibir as informações do pokémon
  void exibirFicha() {
    print('Número : $_numero');
    print('Nome : $_nome');
    print('Tipo : $_tipo');
    print('Nivel : $_nivel');
    print('HP atual : $_hpAtual');
    print('HP máximo : $_hpMaximo');
    if (capturado == false) {
      print('Capturado : Não');
    } else {
      print('Capturado : Sim');
    }
    print('');
  }

  // Método para subir de nível
  void subirNivel(int quantidade) {
    if (quantidade <= 0) {
      print('Quantidade de níveis inválida !');
    } else {
      if (_nivel == 100) {
        print('$_nome já está no nível máximo. Não pode subir de nível .');
        print('');
      } else {
        _nivel = _nivel + quantidade;
        if (_nivel > 100) {
          _nivel = 100;
        }
        print('$_nome agora está no nível $_nivel !');
        if (_nivel == 100) {
          print('$_nome alcançou o nível máximo !');
        }
        print('');
        // Aumentar HP junto com o nível
        //_hpMaximo = _hpMaximo + 1
      }
    }
  }

  // Método para dar dano
  void receberDano(int dano) {
    if (dano >= 0) {
      int hp = _hpAtual;
      hp = hp - dano;
      if (hp < 0) {
        hp = 0;
      }
      _hpAtual = hp;
      print(
        'O pókemon $_nome recebeu $dano de dano! Seu HP atual é $_hpAtual .',
      );
      //print('');
    }
  }

  // Método para curar
  void curar(int valor) {
    if (valor >= 0) {
      if (_hpAtual == _hpMaximo) {
        print('HP já está no máximo!');
        print('');
      } else {
        int hp = _hpAtual;
        hp = hp + valor;
        if (hp > _hpMaximo) {
          hp = _hpMaximo;
        }
        _hpAtual = hp;
        print('$_nome foi curado! Seu HP atual é $_hpAtual.');
        print('');
      }
    }
  }

  // Método para evoluir
  void evoluir() {
    if (proximaEvolucao != null && nivelEvolucao != null) {
      if (_nivel >= nivelEvolucao!) {
        print('$_nome Evoluiu para $proximaEvolucao !');
        print('');
        _nome = proximaEvolucao!;
        proximaEvolucao = '';
        _hpMaximo = _hpMaximo + 20;
        _hpAtual = _hpMaximo;
        proximaEvolucao = null;
        nivelEvolucao = null;
      } else {
        print('O pokémon $_nome ainda não pode evoluir !');
        print('');
      }
    } else {
      print('O pokémon $_nome não tem evolução !');
      print('');
    }
  }

  int calcularAtaqueBase() {
    return nivel *
        1; // Insere algo para não retornar nulo, serve como base para os pokemon que não forem instâncias das subclasses
  }

  // Implementação da interface RegistravelNaPokedex

  @override
  void marcarComoVisto() {
    visto = true;
    print('$_nome foi marcado como visto!');
  }

  @override
  void marcarComoCapturado() {
    capturado = true;
    visto = true;
    print('$_nome foi marcado como capturado!');
  }

  @override
  void favoritar() {
    favorito = true;
    print('$_nome foi favoritado!');
  }

  @override
  void desfavoritar() {
    favorito = false;
    print('$_nome foi desfavoritado!');
  }
}

// Subclasses de Pokémon

class PokemonFogo extends Pokemon {
  PokemonFogo({
    required int numero,
    required String nome,
    required String tipo,
    required int nivel,
    required int hpAtual,
    required int hpMaximo,
    required bool capturado,
    String? proximaEvolucao,
    int? nivelEvolucao,
  }) : super(
         numero: numero,
         nome: nome,
         tipo: tipo,
         nivel: nivel,
         hpAtual: hpAtual,
         hpMaximo: hpMaximo,
         capturado: capturado,
         proximaEvolucao: proximaEvolucao,
         nivelEvolucao: nivelEvolucao,
       );

  @override
  void exibirFicha() {
    print('Número : $_numero');
    print('Nome : $_nome');
    print('Tipo : $_tipo');
    print('Nivel : $_nivel');
    print('HP atual : $_hpAtual');
    print('HP máximo : $_hpMaximo');
    if (capturado == false) {
      print('Capturado : Não');
    } else {
      print('Capturado : Sim');
    }
    print('Categoria: Pokemon da categoria Fogo');
    print('');
  }

  @override
  int calcularAtaqueBase() {
    return nivel * 3;
  }
}

class PokemonAgua extends Pokemon {
  PokemonAgua({
    required int numero,
    required String nome,
    required String tipo,
    required int nivel,
    required int hpAtual,
    required int hpMaximo,
    required bool capturado,
    String? proximaEvolucao,
    int? nivelEvolucao,
  }) : super(
         numero: numero,
         nome: nome,
         tipo: tipo,
         nivel: nivel,
         hpAtual: hpAtual,
         hpMaximo: hpMaximo,
         capturado: capturado,
         proximaEvolucao: proximaEvolucao,
         nivelEvolucao: nivelEvolucao,
       );

  @override
  void exibirFicha() {
    print('Número : $_numero');
    print('Nome : $_nome');
    print('Tipo : $_tipo');
    print('Nivel : $_nivel');
    print('HP atual : $_hpAtual');
    print('HP máximo : $_hpMaximo');
    if (capturado == false) {
      print('Capturado : Não');
    } else {
      print('Capturado : Sim');
    }
    print('Categoria: Pokemon da categoria Água');
    print('');
  }

  @override
  int calcularAtaqueBase() {
    return nivel * 2 + 10;
  }
}

class PokemonEletrico extends Pokemon {
  PokemonEletrico({
    required int numero,
    required String nome,
    required String tipo,
    required int nivel,
    required int hpAtual,
    required int hpMaximo,
    required bool capturado,
    String? proximaEvolucao,
    int? nivelEvolucao,
  }) : super(
         numero: numero,
         nome: nome,
         tipo: tipo,
         nivel: nivel,
         hpAtual: hpAtual,
         hpMaximo: hpMaximo,
         capturado: capturado,
         proximaEvolucao: proximaEvolucao,
         nivelEvolucao: nivelEvolucao,
       );

  @override
  void exibirFicha() {
    print('Número : $_numero');
    print('Nome : $_nome');
    print('Tipo : $_tipo');
    print('Nivel : $_nivel');
    print('HP atual : $_hpAtual');
    print('HP máximo : $_hpMaximo');
    if (capturado == false) {
      print('Capturado : Não');
    } else {
      print('Capturado : Sim');
    }
    print('Categoria: Pokemon da categoria Elétrico');
    print('');
  }

  @override
  int calcularAtaqueBase() {
    return nivel * 2 + 15;
  }
}

// Classes para as Habilidades
abstract class Habilidade {
  String nome = '';
  int custoEnergia = 0;

  Habilidade(this.nome, this.custoEnergia);
  void usar(Pokemon usuario, Pokemon alvo);
}

class ChoqueDoTrovao extends Habilidade {
  ChoqueDoTrovao(String nome, int custoEnergia) : super(nome, custoEnergia);

  @override
  void usar(Pokemon usuario, Pokemon alvo) {
    // Caso tenha energia
    if (usuario.energia >= custoEnergia) {
      print('${usuario.nome} Usou $nome !');

      // Cálculo do dano e aplicação do ataque
      int dano = (usuario.calcularAtaqueBase()) + 5; // Calcula o dano
      alvo.receberDano(dano); // Diminui vida do alvo
      usuario.energia =
          usuario.energia - custoEnergia; // Diminui energia do usuário

      print('');
    } else {
      // Caso não tenha energia suficiente
      print('${usuario.nome} Não tem energia suficiente para usar $nome !');
      print('');
    }
  }
}

class JatoDAgua extends Habilidade {
  JatoDAgua(String nome, int custoEnergia) : super(nome, custoEnergia);

  @override
  void usar(Pokemon usuario, Pokemon alvo) {
    // Caso tenha energia
    if (usuario.energia >= custoEnergia) {
      print('${usuario.nome} Usou $nome !');

      // Cálculo do dano e aplicação do ataque
      int dano = (usuario.calcularAtaqueBase()) + 3; // Calcula o dano
      alvo.receberDano(dano); // Diminui vida do alvo
      usuario.energia =
          usuario.energia - custoEnergia; // Diminui energia do usuário

      print('');
    } else {
      // Caso não tenha energia suficiente
      print('${usuario.nome} Não tem energia suficiente para usar $nome !');
      print('');
    }
  }
}

class LancaChamas extends Habilidade {
  LancaChamas(String nome, int custoEnergia) : super(nome, custoEnergia);

  @override
  void usar(Pokemon usuario, Pokemon alvo) {
    // Caso tenha energia
    if (usuario.energia >= custoEnergia) {
      print('${usuario.nome} Usou $nome !');

      // Cálculo do dano e aplicação do ataque
      int dano = (usuario.calcularAtaqueBase()) + 7; // Calcula o dano
      alvo.receberDano(dano); // Diminui vida do alvo
      usuario.energia =
          usuario.energia - custoEnergia; // Diminui energia do usuário

      print('');
    } else {
      // Caso não tenha energia suficiente
      print('${usuario.nome} Não tem energia suficiente para usar $nome !');
      print('');
    }
  }
}

// Função para batalha
void turno(Pokemon atacante, Pokemon defensor, Habilidade habilidade) {
  habilidade.usar(atacante, defensor);
  if (defensor.hpAtual == 0) {
    print('${defensor.nome} Está fora de combate !');
    print('');
  }
}

// Classe para a Pokédex
class Pokedex {
  // Coleção de Pokemóns "pokedex"
  List<Pokemon> pokedex = [];

  // Método para adicionar Pokémons a Pokédex
  void adicionarPokemon(Pokemon p) {
    if (pokedex.any((entrada) => entrada.numero == p.numero)) {
      print(
        'Pokémon com número ${p._numero} já adicionado a Pokédex ! Não é possível adicioná-lo novamente .',
      );
      print('');
    } else {
      pokedex.add(p);
      print('Pokémon ${p.nome} adicionado a Pokédex !');
      print('');
    }
  }

  // Método para remover um Pokémon por número
  void removerPokemonPorNumero(int numero) {
    int i;

    if ((i = pokedex.indexWhere((entrada) => entrada.numero == numero)) != -1) {
      print('Pokémon ${pokedex[i].nome} removido da Pokédex !');
      print('');
      pokedex.removeAt(i);
    } else {
      print(
        'Pokémon com número $numero não encontrado na Pokédex ! Não foi possível remover .',
      );
      print('');
    }
  }

  // Método para buscar um Pokémon por número
  // Retorna o objeto ou null. No main ele é combinado com o exibirFicha
  Pokemon? buscarPorNumero(int numero) {
    print('Buscando por Pokémon número $numero...');
    final res = pokedex.where((entrada) => entrada.numero == numero);

    if (res.isNotEmpty) {
      print('Pokémon ${res.first.nome} #$numero encontrado !');
      print('');
    } else {
      print('Pokémon #$numero não encontrado !');
      print('');
    }

    return res.isEmpty ? null : res.first;
  }

  // Método para listar todos Pokémons que estão na Pokédex
  void listarTodos() {
    print('Listando todas as entradas da Pokédex...');
    print('');
    for (var pokemon in pokedex) {
      pokemon.exibirFicha();
      //print('N° ${pokemon.numero} | ${pokemon.nome}'); // Para mostrar o número e o nome apenas
    }
    print('');
  }

  // Método para listar Pokémon capturados que estão registrados na Pokédex
  void listarCapturados() {
    print('Listando Pokémon capturados registrados na Pokédex...');
    print('');

    for (var pokemon in pokedex) {
      if (pokemon.capturado == true) {
        pokemon.exibirFicha();
      }
    }
    print('');
  }

  // Método para listar os Pokémon que estão registrados na Pokédex por tipo
  void listarPorTipo(String tipo) {
    print('Listando Pokémons registrados na Pokédex pelo tipo $tipo...');
    print('');

    for (var pokemon in pokedex) {
      if (pokemon.tipo == tipo) {
        pokemon.exibirFicha();
      }
    }
    print('');
  }

  // Método para listar os Pokémon que estão registrados na Pokédex acima de um nível
  void listarAcimaDoNivel(int nivelMinimo) {
    print(
      'Listando Pokémons registrados na Pokédex que estão acima do nível $nivelMinimo...',
    );
    print('');

    for (var pokemon in pokedex) {
      if (pokemon.nivel > nivelMinimo) {
        pokemon.exibirFicha();
      }
    }
    print('');
  }

  // Método para listar os Pokémon que estão registrados na Pokédex que podem evoluir
  void listarQuePodemEvoluir() {
    print('Listando Pokémons registrados na Pokédex que podem evoluir...');
    print('');

    for (var pokemon in pokedex) {
      if (pokemon.proximaEvolucao != null && pokemon.nivelEvolucao != null) {
        if (pokemon.nivel >= pokemon.nivelEvolucao!) {
          pokemon.exibirFicha();
        }
      }
    }
    print('');
  }

  // -- Questão 10 -- Funções anônimas

  // Filtro genérico usando função anônima
  List<Pokemon> filtrar(bool Function(Pokemon) condicao) {
    return pokedex.where((pokemon) => condicao(pokemon)).toList();
  }

  // Ordenar por nível (crescente)
  List<Pokemon> ordenarPorNivel() {
    List<Pokemon> ordenados = List.from(pokedex);
    ordenados.sort((a, b) => a.nivel.compareTo(b.nivel));
    return ordenados;
  }

  // Ordenar por nome (alfabética)
  List<Pokemon> ordenarPorNome() {
    List<Pokemon> ordenados = List.from(pokedex);
    ordenados.sort((a, b) => a.nome.compareTo(b.nome));
    return ordenados;
  }

  // Ordenar por HP atual (decrescente)
  List<Pokemon> ordenarPorHp() {
    List<Pokemon> ordenados = List.from(pokedex);
    ordenados.sort((a, b) => b.hpAtual.compareTo(a.hpAtual));
    return ordenados;
  }

  // Aplicar uma ação a todos os pokémons usando forEach com função anônima
  void aplicarParaTodos(void Function(Pokemon) acao) {
    pokedex.forEach((pokemon) => acao(pokemon));
  }

  // -- Questão 11 -- Estatísticas

  int totalPokemons() {
    return pokedex.length;
  }

  Map<String, int> quantidadePorTipo() {
    Map<String, int> contagem = {};
    pokedex.forEach((pokemon) {
      contagem[pokemon.tipo] = (contagem[pokemon.tipo] ?? 0) + 1;
    });
    return contagem;
  }

  double mediaDeNivel() {
    if (pokedex.isEmpty) return 0;
    int somaTotal = pokedex.fold(0, (soma, pokemon) => soma + pokemon.nivel);
    return somaTotal / pokedex.length;
  }

  double percentualCapturados() {
    if (pokedex.isEmpty) return 0;
    int capturados =
        pokedex.where((pokemon) => pokemon.capturado).toList().length;
    return (capturados / pokedex.length) * 100;
  }
}

abstract class RegistravelNaPokedex {
  void marcarComoVisto();
  void marcarComoCapturado();
  void favoritar();
  void desfavoritar();
}

