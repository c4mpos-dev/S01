# 🖥️ Paradigma Orientado a Objetos - JavaScript

### 🔑 Características principais:
- Declaração de **classes** com `class NomeDaClasse` e o `constructor`.
- **Encapsulamento** com propriedades privadas (`#propriedade`).
- **Herança** usando `extends NomeDaClasseBase` e `super()`.
- **Polimorfismo** com sobrescrita de métodos.
- **Composição** (objeto *cria* sua dependência) e **Agregação** (objeto *recebe* sua dependência).
- **Getters/Setters** para acesso controlado.
- **Coleções** como `Map` e `Set` para gerenciar objetos.

## 📋 Exercícios

### 1️⃣ Exercício 1 – Batalha Pokémon
**Descrição:**
Simular uma batalha Pokémon. A classe `Pokemon` define características básicas e um ataque genérico. As subclasses `PokemonFogo` e `PokemonAgua` possuem ataques polimórficos, cada um com sua lógica única. A vida (`#vida`) deve ser protegida de alterações externas.

#### 🧱 Estrutura:
- **Classe base `Pokemon`**
  - Atributos encapsulados `#vida`, `nome`, `tipo`.
  - Método `getVida()` para ler a vida.
  - Método `receberDano(dano)` para modificar a vida internamente.
  - Método `atacar(alvo)` genérico.

- **Classe `PokemonFogo` (herda `Pokemon`)**
  - Atributo adicional `bonusAtaque`.
  - Sobrescreve `atacar(alvo)` para incluir o bônus no dano.

- **Classe `PokemonAgua` (herda `Pokemon`)**
  - Atributo adicional `curaBase`.
  - Sobrescreve `atacar(alvo)` para atacar o alvo e se curar.

Na Simulação:
- Cria `Charizard` (Fogo) e `Blastoise` (Água).
- Simula um turno de ataque para cada, demonstrando o polimorfismo.
- Tenta alterar `charizard.#vida = 999` diretamente, provando que o encapsulamento funciona.

👾 **Conceito aplicado:** Encapsulamento (#privado), Herança (extends), Polimorfismo (sobrescrita de método) e Getters.

---

### 2️⃣ Exercício 2 – Esquadrão de Exploração
**Descrição:**
Modelar um `Esquadrão` do Capitão Levi. O `Esquadrão` *agrega* vários `Soldados`. Cada `Soldado` *compõe* (possui) seu próprio `ODM_Gear`. O Esquadrão e o Soldado devem implementar o "contrato" `IExplorador` (método `explorarTerritorio`).

#### 🧱 Estrutura:
- **Classe `ODM_Gear` (Componente)**
  - Atributo privado `#gasRestante`.
  - Método `usarGas(quantidade)` que valida e gasta o gás.

- **Classe `Soldado` (Composição)**
  - Atributo privado `#gear`; o `Soldado` *cria* sua instância de `ODM_Gear`.
  - Implementa `explorarTerritorio()`, que delega a chamada para `this.#gear.usarGas()`.
  - Método `verificarEquipamento()` que chama `this.#gear.getGas()`.

- **Classe `Esquadrao` (Agregação)**
  - Atributo `membros` (Array); o `Esquadrão` *recebe* instâncias de `Soldados` prontas.
  - Implementa `explorarTerritorio()` que itera sobre os membros e chama o `explorarTerritorio` de cada um.

Na Simulação:
- Cria os soldados `Levi`, `Mikasa` e `Eren`.
- Cria o `Esquadrao` *agregando* os soldados.
- Chama `esquadraoLevi.explorarTerritorio()`, demonstrando a cadeia de chamadas (Esquadrão -> Soldado -> ODM_Gear).

🎖️ **Conceito aplicado:** Composição (Soldado *possui* Gear), Agregação (Esquadrão *usa* Soldados), Polimorfismo e Encapsulamento.

---

### 3️⃣ Exercício 3 – O Diário de Gravity Falls
**Descrição:**
O `Protagonista` (Dipper) usa um `Diario` secreto. A `CabanaMisterio` *agrega* `Personagens` (funcionários). O Diário deve validar o acesso usando uma chave secreta.

#### 🧱 Estrutura:
- **Classe `Diario`**
  - Atributos privados `#autorSecreto` e `enigmas` (um `Map`).
  - Método `adicionarEnigma(num, enigma)`.
  - Método `decodificar(chave, num)` que valida se `chave === this.#autorSecreto` antes de retornar o enigma do `Map`.

- **Classe `Personagem` (Base)**
  - Atributos `nome` e `idade`.

- **Classe `Protagonista` (herda `Personagem`)**
  - Atributo privado `#diario`; o `Protagonista` *cria* sua instância de `Diario` (Composição).

- **Classe `CabanaMisterio` (Agregação)**
  - Atributo privado `#funcionarios` (Array).
  - Método `adicionarFuncionario(personagem)` que *agrega* um `Personagem`.
  - Método `listarFuncionarios()` que retorna a coleção.

Na Simulação:
- Cria `Dipper` (Protagonista), `Soos` e `Wendy` (Personagens).
- A `Cabana` agrega `Soos` e `Wendy`.
- O `Diario` é acessado via `dipper.getDiario()`.
- Testamos `decodificar()` com a chave errada (falha) e a chave correta (sucesso).

🌲 **Conceito aplicado:** Herança, Composição, Agregação, Encapsulamento (#privado) e uso de `Map` para coleções.

---

### 4️⃣ Exercício 4 – Associação Hunter
**Descrição:**
A Associação Hunter rastreia Hunters. O `Batalhao` deve usar um `Set` para garantir que não haja Hunters duplicados. Apenas Hunters "Rastreáveis" (que implementam o método `rastrearLocal`) devem responder à varredura.

#### 🧱 Estrutura:
- **Classe base `Hunter`**
  - Atributos `nome`, `idade`, `localizacao`.

- **Classe `Especialista` (herda `Hunter`)**
  - Não possui o método `rastrearLocal`.

- **Classe `Manipulador` (herda `Hunter`)**
  - *Implementa* o método `rastrearLocal(lat, long)` que atualiza sua própria `localizacao`.

- **Classe `Batalhao`**
  - Atributo privado `#hunters` (um `Set`).
  - Método `adicionarHunter(hunter)` que usa `this.#hunters.add()`.
  - Método `iniciarRastreamento(lat, long)` que itera o `Set` e usa `typeof hunter.rastrearLocal === 'function'` para checar quem pode rastrear (Duck Typing).

Na Simulação:
- Cria `Hisoka` (Manipulador) e `Kurapika` (Especialista).
- Adiciona ambos ao `Batalhao`.
- Tenta adicionar `Hisoka` uma segunda vez (o `Set` impede a duplicata).
- Chama `iniciarRastreamento()`: `Hisoka` responde e atualiza sua localização; `Kurapika` é ignorado por não ter o método.

🃏 **Conceito aplicado:** Herança, Polimorfismo, Coleções (`Set`), e verificação de contrato/interface (Duck Typing com `typeof`).