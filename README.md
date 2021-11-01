<!-- PROJECT LOGO -->
<br />
<p align="center">
    <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT9rN4MOyirUYQ1LA_6tsQ-XT9qEwrZd6yl4HQ5qBBSW2ezaPeTbzXV42PsT7FunbW-1IM&usqp=CAU">

  <h3 align="center">- yellow_tag_special -</h3>

  <p align="center">
    Yellow Tag Special! Remember those days you'd use a treadmill as checkout counter belt and pretend to work at the grocery store? No? But if yes... and you're feeling reminiscent, you can go wild 'printing' receipts. So slap on that nametag and get to receipt printing. (This app stores item, discount, and receipt data - serving information to views.)
    <br />
    ·
    ·


<!-- TABLE OF CONTENTS -->
<details open="open">
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
      <ul>
        <li><a href="#built-with">Built With</a></li>
      </ul>
    </li>
    <li>
      <a href="#getting-started">Getting Started</a>
    </li>
    <li><a href="#roadmap">Roadmap</a></li>
  </ol>
</details>



<!-- ABOUT THE PROJECT -->
## About The Project



### Built With

* [Ruby on Rails | v5.2.6](https://rubyonrails.org/)


<!-- GETTING STARTED -->
## Getting Started

Visit [Local Host 3000](http://localhost:3000), following with steps below.

1. Fork and clone this repo
2. If you will be testing, run the following command in terminal to install RSPec:
  ```sh
  rails g rspec:install
  ```
   And add the following to the top of the ```/spec/rails-helper.rb``` file
  ```sh
  require 'simplecov'
  SimpleCov.start
  ```
  As well as the following shoulda-matchers configuration at the end of the ```/spec/rails-helper.rb``` file
  ```sh
  Shoulda::Matchers.configure do |config|
    config.integrate do |with|
       with.test_framework :rspec
       with.library :rails
    end
  end
  ```
3. From the command line:
  ```sh
  bundle update
  ```
  ```sh
  bundle install
  ```
4. Setup database/seed
  ```sh
  rails db:(drop,create,migrate,seed)
  ```
5. Spin up your rails server and skip on over to ```localhost:3000/receipts```
  ```sh
  rails s
  ```

<!-- ROADMAP -->
## Roadmap
Code refactor, feature buildout, and more robust testing WIP.


