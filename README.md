#Social Gaming Network

The purpose of this project is to provide gamers with a platform where they can see the games that their friends are playing and see what their friends think about the games they are playing. This app gives players the ability to create, update, and read their own reviews of games. It also allows players to see the games that their friends are playing and the reviews that their friends have written.

#Motivation

This project was assigned by Flatiron School. This project was motivated by finding a way to bond with their friends over games, get opinions on games from people they know, and get ideas for what games they may want to play next. Ultimately, this program allows people to discover new games while enhancing a gamer's social network.

#Installation

To use this program, go to your terminal and enter the following.

ruby bin/run.rb
bundle install
rake db:migrate 
rake db:seed

#How to Use this Program

To begin the program, go to your terminal and type ruby bin/run.rb. The program will prompt you to either make a new username by entering "new" then choosing a username or to enter "login" then enter your username. Once you have logged in, the program will take you to the main menu. From here, you will be given the options to create a new game, create a new review for a game, see all of the reviews you have made, find a review you wrote for a particular game, delete all of your reviews, add a new friend, see all of your friends, and exit the program.

When creating a new game, you will be prompted to enter the game’s name, genre, and the platforms on which it is available. Once you have created your game, you will be returned to the main menu.

When creating a new review for a game, the program will prompt you for the game you would like to review, your thoughts on the game, and a rating between 1 and 10 for the game. When your review has been created, you will be given the option to either see all of your reviews or return to the main menu.

When finding a review for a particular game, the program will prompt you to enter the name of the game for which you want to see a review. It will show you the review for the game and then give you options to update the review, delete the review, or return to the main menu.

When adding a new friend, the program will prompt you to enter the username of your friend. If a user with this username exists, they will be added to your friends.
 