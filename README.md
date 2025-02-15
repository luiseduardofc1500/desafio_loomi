Segue abaixo um exemplo de README simples para o seu projeto:

---

# Loomi Challenge - Flutter Project

Este projeto é uma aplicação Flutter desenvolvida com base no desafio proposto pela Loomi. O objetivo da aplicação é funcionar como um "streaming" de vídeos, permitindo que o usuário visualize filmes em cartaz, realize comentários e gerencie seu perfil.

## Sumário

- [Recursos](#recursos)
- [Tecnologias Utilizadas](#tecnologias-utilizadas)
- [Instalação e Configuração](#instalação-e-configuração)
- [Execução do Projeto](#execução-do-projeto)
- [Extras e Considerações](#extras-e-considerações)

## Recursos

- **Autenticação:**  
  - Login e cadastro utilizando Firebase Auth.  
  - Login social (Google).

- **Onboarding:**  
  - Atualização de foto de perfil e nome do usuário.

- **Tela Principal (Home):**  
  - Exibição de filmes disponíveis para assistir.  
  - Funcionalidades de like, compartilhamento e acesso ao perfil.

- **Player de Vídeo:**  
  - Reprodução de vídeos com suporte a legendas em diferentes idiomas.

- **Comentários:**  
  - Possibilidade de visualizar comentarios.

- **Perfil do Usuário:**  
  - Gerenciamento de dados da conta (trocar senha, apagar conta, editar dados e acessar dados da assinatura).

## Tecnologias Utilizadas

- **Flutter:** Framework principal para desenvolvimento do aplicativo.
- **Firebase:**  
  - Firebase Auth (para autenticação).  
  - Firestore (para armazenamento dos comentários).
- **Pacotes e Bibliotecas:**  
  - `shared_preferences`
  - `json_serializable`
  - `dio`
  - `mobx`
  - `image_picker`
  - `palette_generator`
  - `video_player`

## Instalação e Configuração

1. **Clone o repositório:**
   ```bash
   git clone https://github.com/seu-usuario/nome-do-repositorio.git
   cd nome-do-repositorio
   ```

2. **Instale as dependências:**
   ```bash
   flutter pub get
   ```

3. **Configuração do Firebase:**
   - Adicione o arquivo `google-services.json` (para Android) na pasta `android/app`.
   - Adicione o arquivo `GoogleService-Info.plist` (para iOS) na pasta `ios/Runner`.
   - Certifique-se de que o Bundle ID está configurado como `com.app.untold`.

## Execução do Projeto

Após concluir a instalação e configuração:

```bash
flutter run
```


## Extras e Considerações

- **Gerenciamento de Estado:**  
  O projeto utiliza uma biblioteca para gerenciamento de estado (MobX) e segue boas práticas de componentização e Clean Code.

- **Comunicação:**  
  Durante o desenvolvimento, foram realizados updates diários e o gerenciamento das atividades foi realizado em plataforma de gestão (incluindo tarefas, estimativas e tempo realizado).


