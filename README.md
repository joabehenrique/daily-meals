# 🚀 Daily Meals

![GitHub repo size](https://img.shields.io/github/repo-size/joabehenrique/daily-meals?style=flat)
![GitHub language count](https://img.shields.io/github/languages/count/joabehenrique/daily-meals?style=flat)
![GitHub forks](https://img.shields.io/github/forks/joabehenrique/daily-meals?style=flat)
![Bitbucket open issues](https://img.shields.io/bitbucket/issues/joabehenrique/daily-meals?style=flat)
![Bitbucket open pull requests](https://img.shields.io/bitbucket/pr-raw/joabehenrique/daily-meals?style=flat)

> Project was developed on top of a challenge made on the elixir trail in rocketseat.

## 💻 Requirements

Before you begin, make sure you have met the following requirements:

- You need the latest version of `Elixir/Phoenix` and `PostgreSQL` on your machine.

If you need installation instructions, [click here](https://hexdocs.pm/phoenix/installation.html).

## 🚀 Installing Daily Meals

To install Daily Meals, follow these steps:

1º Clone the repository.
```
>  git clone https://github.com/joabehenrique/daily-meals.git
```
2º Open the project in your vscode and run the command
```
> mix deps.get
```

3º Configure your postgresql in your profile
```
> config / dev & test
```
4º Just run project
```
> mix phx.server
```
## ☕ Using Daily Meals

To use Daily Meals, follow these steps:

```
Project was developed on top of a challenge made on 
the elixir trail in rocketseat.

In it you can create a new daily meal, remove, 
update, fetch meals or a specific one.
```
Getting all meals
```
(GET) api/v1/meals
```
Getting a meal
```
(GET) api/v1/meals/{id}
```
Deleting a meal
```
(DELETE) api/v1/meals/{id}
```
Creating a meal
```
(POST) api/v1/meals

{
  "description": "Pizza 1/2 Calabresa",
  "date": "2022-03-21 13:14:22",
  "calories": 236
}
```
Changing a meal
```
(PUT) api/v1/meals/{id}

{
  "description": "Pizza 1/2 4 Queijos",
  "calories": 102
}
```
Getting all users
```
(GET) api/v1/users
```
Getting a user
```
(GET) api/v1/users/{id}
```
Deleting a user
```
(DELETE) api/v1/users/{id}
```
Creating a user
```
(POST) api/v1/users

{
  "name": "Joabe Henrique",
  "email": "henriquecidoz@hotmail.com",
  "cpf": "12345678990"
}
```
Changing a user
```
(PUT) api/v1/users/{id}

{
  "name": "Joabe Carvalho",
  "email": "henriqueciido@hotmail.com",
}
```


## 📫 Contributing to Daily Meals

To contribute to Daily Meals, follow these steps:

1. Fork this repository.
2. Create a branch: `git checkout -b <nome_branch>`.
3. Make your changes and commit them: `git commit -m '<commit_message>'`
4. Send to the original branch: `git push origin Daily Meals / <local>`
5. Create the pull request.

Alternatively, see the GitHub documentation at [how to create a pull request](https://help.github.com/en/github/collaborating-with-issues-and-pull-requests/creating-a-pull-request)..

## 🤝 Author and Contributors

We thank the following people who contributed to this project:

<table>
  <tr>
    <td align="center">
      <a href="https://github.com/joabehenrique">
        <img src="https://avatars3.githubusercontent.com/u/64988299" width="100px" style="border-radius: 90px" alt="Foto do Joabe Henrique no GitHub"/><br>
        <sub>
          <b>Joabe Henrique [Author]</b>
        </sub>
      </a>
    </td>
  </tr>
</table>

## 😄 Be one of the contributors<br>

Do you want to be part of this project? Click [here](https://github.com/joabehenrique/daily-meals/blob/master/CONTRIBUTING.md) and read how to contribute.

## 📝 License

This project is under license. See the [license](https://github.com/joabehenrique/daily-meals/blob/master/LICENSE.md) file for more details.
