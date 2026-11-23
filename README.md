# StageUp

StageUp é um aplicativo Flutter para descobrir shows e salvar seus eventos favoritos. Por enquanto, o catálogo usa dados de demonstração.

## Funcionalidades

- **Início** — veja os próximos shows do catálogo.
- **Explorar** — busque por nome ou local, filtre por categoria e encontre shows em alta ou próximos de você.
- **Favoritos** — salve seus shows favoritos e consulte a lista mesmo depois de fechar o app.
- **Perfil** — acesse a tela de visitante e volte ao catálogo pelo botão **Explorar shows**.

O login e a área de ingressos estão em desenvolvimento.

## Tecnologias

- **Flutter e Dart** — desenvolvimento do aplicativo.
- **Flutter Modular** — navegação e injeção de dependências.
- **MobX** — gerenciamento de estado.
- **SharedPreferences** — armazenamento local dos favoritos.
- **Geolocator** — acesso à localização para mostrar shows próximos.

## Como executar

Você precisa ter o Git e o Flutter instalados, além de um emulador aberto ou um dispositivo conectado. Use `flutter doctor` para conferir a configuração do ambiente.

```bash
git clone https://github.com/apgrassi/StageUp.git
cd StageUp
flutter pub get
flutter run
```

Para ver a seção de shows próximos, permita o acesso à localização quando o app solicitar.

## Estrutura do projeto

- `lib/core/` — tema, navegação entre abas e serviço de localização.
- `lib/modules/` — módulos de Início, Explorar, Favoritos, Perfil e Ingressos.
- `lib/modules/home/presenter/mocks/` — catálogo de demonstração com os dados dos shows.
- `assets/fonts/` — arquivos da fonte Inter usada no app.

## Próximos passos

- Adicionar imagens aos cards dos shows.
- Implementar o login e exibir os dados da conta no Perfil.
- Desenvolver a tela Meus ingressos.