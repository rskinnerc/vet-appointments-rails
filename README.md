![](https://img.shields.io/badge/Microverse-blueviolet)

# Vet-Appointments App

This is an app in which you can reserve an appointment with a Veterinarian, create a Doctor, delete a Doctor and show all your appointments. This app was created separating the Fron-End and the Back-End in two repositories. This is the repository of the back-end API and you can find the Front-End repository [here](https://github.com/rskinnerc/vet-appointments-react) and the documentation of the API [here](https://vets-appointment.herokuapp.com/api-docs/index.html)

![image](https://user-images.githubusercontent.com/93448210/193123569-d8713d5d-2046-4736-9b50-07504efefa3b.png)

## KanBan Board
 - Link to the [Kanban Board](https://github.com/users/rskinnerc/projects/9).
 ![image](https://user-images.githubusercontent.com/26911718/190231668-b696de99-c1d8-47bc-b5ff-72ec1a25a420.png)

 
 - This group was compossed by 4 people: 
    - [Ronald Skinner](https://github.com/rskinnerc)
    - [Juan Francisco Rosario Suli](https://github.com/jrosario19)
    - [Maximiliano Diaz](https://github.com/mistermaxis)
    - [Alejandro Neira](https://github.com/AlejandroNeira98)

 
## Built With

- Ruby
- Rails
- Rspec
- Rswag

## Getting Started

To get a local copy up and running follow these simple example steps.

### Prerequisites

- You should have ruby installed in your machine, you can follow the steps given by the [official documentation](https://www.ruby-lang.org/en/documentation/installation/).

- You should have a postgres user with superuser permissions. you can refer to the official [postgres documentation](https://www.postgresql.org/docs/current/role-attributes.html#:~:text=To%20create%20a%20new%20database,that%20is%20already%20a%20superuser.&text=A%20role%20must%20be%20explicitly,use%20CREATE%20ROLE%20name%20CREATEDB%20.) to create or update a role.

### Setup

First, you must clone this repository locally running this command:

```
git clone git@github.com:rskinnerc/vet-appointments-rails.git
```

and navigate to the cloned directory:

```
cd vet-appointments-rails
```

### Install

Once inside the project directory, you should install all project dependencies:

- Install bundler:

```
gem install bundler
```

- Install project dependencies

```
bundle install
```
- Set up database configuration in config/database.yml and create it
  
```
rails db:create
```

- Run Database Migrations
  
```
rails db:migrate
```
### Usage

You can get the app running locally by opening a local server:

```
bin/rails server
```

### Run tests

If you're on a linux-based system, you could run the executable file to run all specs:

```
bin/rspec
```

Windows users have to specify ruby in this case:

```
ruby bin/rspec
```

## Authors

👤 **Ronald Skinner**

- GitHub: [@rskinnerc](https://github.com/rskinnerc)
- Twitter: [@XSkinner](https://twitter.com/XSkinner)
- LinkedIn: [Ronald Skinner](https://www.linkedin.com/in/rskinnerc)

👤 **Juan Francisco Rosario Suli**

- GitHub: [@jrosario19](https://github.com/jrosario19)
- Twitter: [@jrosario19](https://twitter.com/jrosario19)
- LinkedIn: [Juan Fco. Rosario](https://linkedin.com/in/juan-francisco-rosario-suli-44595051)

👤 **Maximiliano Diaz**

- GitHub: [@mistermaxis](https://github.com/mistermaxis)
- LinkedIn: [Maximiliano Diaz](https://www.linkedin.com/in/mistermaxis/)

👤 **Alejandro Neira**
- GitHub: [@AlejandroNeira98](https://github.com/AlejandroNeira98)
- Twitter: [@JANP_19](https://twitter.com/JANP_19)
- LinkedIn: [LinkedIn](https://www.linkedin.com/in/alejandro-neira-pachon/) 


## 🤝 Contributing

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](../../issues/).

## Show your support

Give a ⭐️ if you like this project!

## 📝 License

This project is [MIT](./MIT.md) licensed.
