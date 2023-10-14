# Adote Miauau
Este projeto é uma aplicação web desenvolvida para o Projeto Integrado do curso de Pós-Graduação em Engenharia de Software da Puc Minas.

O Adote Miauau é um site voltado para publicação de animais para doação, divulgar animais encontrados ou que foram perdidos. O principal objetivo é ajudar ONGs e protetores a encontrarem um lar para os animais, em especial gatos e cães.

## Como acessar
É possível acessar a aplicação em https://adote-miauau-front-end-rhebecaabreu.vercel.app/ ou https://www.adotemiauau.com.br/

### API 

A API está disponível na URL: https://api.adotemiauau.com.br/api/

#### Endpoints 
- `POST` /users  - Criar usuários - necessário passar os atributos no body
```json
 {
  title: "",
  description: "",
  category_id: 1,
  images: [],
  pet: {
    kind: "cat",
    sex: "female",
    age: "0 a 6 meses",
    vaccinated: "yes",
    castrated: "yes",
    vermifugated: "yes",
    coat_color: "branca",
    status: "",
    size: "small",
  },
  address: {
    state: "",
    city: "",
    cep: "",
    number: "",
    street: "",
    complement: "",
  },
```

-  `POST` /users/sign_in - Realizar login - necessário passar `email` e `password`
- `GET` /categories - Pegar lista de categorias
-  `GET` /publications - Pegar lista de publicações - é possível aplicar os filtros: `kind=${kindFilter}&category=${selectedCategory}`

## Tecnologias
- Ruby on Rails
- Ruby
- MySQL
- Digital Ocean - hospedagem

### Como rodar localmente 
- Fazer o setup local do framework - é possível seguir [esse](https://gorails.com/setup/ubuntu/22.04) tutorial 
- Clonar o repositório
- Rodar `bundle install` para instalar as dependencias do projeto
- Rodar `rails s` para rodar
O projeto ficará acessível em http://localhost:3000

Se estiver rodando com o front-end, lembre de levantar a API primeiro e depois o front-end na porta 3001. 
