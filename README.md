# Aplicativo Movie Finder

Movie Finder é um aplicativo Flutter que permite aos usuários buscar filmes, visualizar detalhes e gerenciar seus filmes favoritos. Este README fornece uma visão geral da estrutura do projeto, componentes principais e instruções para configurar e executar o aplicativo.

## Índice

- [Recursos](#recursos)
- [Estrutura do Projeto](#estrutura-do-projeto)
- [Configuração e Instalação](#configuração-e-instalação)
- [Uso](#uso)
- [Dependências](#dependências)

## Recursos

- Busca de filmes por nome.
- Visualização de informações detalhadas sobre cada filme.
- Adição ou remoção de filmes da lista de favoritos.
- Persistência de filmes favoritos usando preferências compartilhadas.

## Estrutura do Projeto

```plaintext
lib/
├── exceptions/
│   └── http_exception.dart
├── models/
│   └── movie.dart
├── providers/
│   └── movie_provider.dart
├── screens/
│   ├── favorites_screen.dart
│   ├── home_screen.dart
│   └── movie_details_screen.dart
├── services/
│   └── api_service.dart
├── utils/
│   └── constants.dart
├── widgets/
│   ├── alert_dialog.dart
│   └── movie_tile.dart
└── main.dart
```

### Descrição das Pastas e Arquivos

#### exceptions/

Contém a classe de exceção personalizada para tratamento de erros específicos da aplicação.

- **http_exception.dart**: Define a classe `HttpException` que representa erros HTTP.

#### models/

Contém os modelos de dados utilizados pela aplicação.

- **movie.dart**: Define a classe `Movie` que representa um filme, incluindo métodos para serialização e desserialização de JSON.

#### providers/

Contém os providers que gerenciam o estado do aplicativo utilizando o padrão Provider.

- **movie_provider.dart**: Define a classe `MovieProvider` que gerencia a lista de filmes e favoritos, e fornece métodos para buscar filmes e alternar favoritos.

#### screens/

Contém as telas principais do aplicativo.

- **favorites_screen.dart**: Tela que exibe a lista de filmes favoritos salvos pelo usuário.
- **home_screen.dart**: Tela principal onde os usuários podem buscar filmes e visualizar resultados.
- **movie_details_screen.dart**: Tela que exibe os detalhes de um filme selecionado.

#### services/

Contém serviços responsáveis pela comunicação com APIs externas.

- **api_service.dart**: Define a classe `ApiService` que faz requisições HTTP para buscar filmes e detalhes dos filmes, além de gerenciar o cache de filmes.

#### utils/

Contém utilitários e constantes usadas em toda a aplicação.

- **constants.dart**: Define constantes, como URLs de APIs e chaves de API utilizadas nas requisições.

#### widgets/

Contém widgets reutilizáveis que são utilizados em várias partes do aplicativo.

- **alert_dialog.dart**: Define um widget para exibir diálogos de alerta personalizados.
- **movie_tile.dart**: Define um widget para exibir informações resumidas de um filme em forma de lista.

#### main.dart

O ponto de entrada principal do aplicativo, onde a aplicação é inicializada e configurada.

- **main.dart**: Configura o aplicativo Flutter, inicializa o provider e define as rotas principais do aplicativo.

## Configuração e Instalação

1. **Clone o repositório:**

   ```bash
   git clone https://github.com/seu-usuario/movie-finder.git
   ```

2. **Navegue até o diretório do projeto:**
   ```bash
   cd movie-finder
   ```
3. **Instale as dependências:**
   ```bash
   flutter pub get
   ```
4. **Configure as chaves de API:**

- Abra o arquivo

```bash
 lib/utils/constants.dart
```

adicione suas chaves de API para apiUrl, 'apiKey', 'tmdbApiUrl', 'tmdbApiKey', e 'tmdbAuthHeader'.

5. **Execute o aplicativo:**

```bash
 flutter run
```

## Uso

- Execute

```bash
flutter run
```
## Dependências

As dependências necessárias para este projeto incluem:

- `flutter_screenutil`
- `provider`
- `http`
- `shared_preferences`

Para instalar essas dependências, adicione-as ao seu arquivo `pubspec.yaml` e execute `flutter pub get`.

### Exemplo de `pubspec.yaml`:

```yaml
dependencies:
  flutter:
    sdk: flutter
  flutter_screenutil: ^5.0.0
  provider: ^6.0.0
  http: ^0.14.0
  shared_preferences: ^2.0.0
  ```
