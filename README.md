[API documentation](https://filoruxonline.github.io/plutopoly-bot-doc)
# Plutopoly Bot
*This is an early version that hasn't been fully tested. Many things are subject to change*
## Template
All game data can be changed and listened to via a REST API (from Google FireStore).\
This is a template that handles all of that for you. It has an easy to use API that is not hard to learn.
You can start in your brower via [repl.it](#replit).
# Prerequisites
## Basic programming
You need to know variables and data types, functions, ... The basics will do. If you already know a language you have a great headstart.
## Dart
This project uses the programming language Dart. I recommend going through [the dart language tour](https://dart.dev/guides/language/language-tour) to learn the syntax. 
The most import things are:
1. Everything is an object, even functions
2. Dart is strongly typed (You should define the type when creating a variable) [generics](https://dart.dev/guides/language/language-tour#generics)
2. Lists, maps, ... 
3. Functions: (named) parameters
4. Lexical scope (encapsulation) *not as hard as it sounds*
5. Basic operations, flow
6. Classes: methods, fields and static will do for simple projects\n*This project has a lot of static methods*

You don't have to know everything by hearth to get started. You can always check to page.

## Repl.it
If you know the above, the easiest way to get started is using [repl.it](repl.it).
Create an account and go to new repl. Select import from github and paste this url: `https://github.com/filoruxonline/plutopoly-bot`
> If you have a top right screen where you have to select a language and configure the run button. You have to select dart and type as run command
> dart lib/main.dart

Select the lib/main.dart file and follow the comments there.
## Walkthrough
*coming*
## API Documentation
You can find the documentation for the api [here](https://filoruxonline.github.io/plutopoly-bot-doc).
main_data has the [GameData](https://filoruxonline.github.io/plutopoly-bot-doc/engine_data_main/GameData-class.html) class. This is the type of Game.data.

Let's say you want to change the price to build a house so you look in the [GameData](https://filoruxonline.github.io/plutopoly-bot-doc/engine_data_main/GameData-class.html) class.
There you find a property called gmap (stands for game map), you want to change the map so you click on it.
*more documentation is coming*
You see that it is a List of type Tile, so you click on Tile to get more information about the class.
You see a property called housePrice. This you can change so you like so:
```
  //in data in map change the fourth tile's houseprice to 200
  Game.data.gmap[3].housePrice = 200;
```
Repl doesn't have code-intelligence for dart so you have to make sure you typed everything exactly the same!
If you want to raise all house prices by 10% you do:
```
  for(Tile property in Game.data.gmap) {
    //same as: housePrice = housePrice * 1.1
    property.housePrice *= 1.1;
  }
```
But you will get an Exception!
This is because not all tiles have a housePrice, like the prison tile. Dart doesn't know what null \*1.1 is so it throws an Exception.
You have to check that housePrice != null befor changing it like so:
```
  for(Tile property in Game.data.gmap) {
    // after continue it will stop execution and go to the next property
    if(property.housePrice==null) continue;
    property.housePrice *= 1.1;
  }
```
And your done! Bonus: dart gives lists a forEach method so you could also type:
```
  Game.data.gmap.forEach((Tile property) {
    if(property.housePrice==null) return;
    property.housePrice *= 1.1;
  });
```
the '() {}' parameter in the forEach is a anonymous function you pass as an argument. You can't use continue as functions don't have that but functions stop when hitting a return statement so you can use that instead.
I prefer this method but it is your choice.
## Examples
*coming*
## IDE
If you want to up your game, I would recommend downloading [VS Code](https://code.visualstudio.com/) to use instead of repl.it.
1. Install [dart](https://dart.dev/tools/sdk/archive). Make sure it has been added to PATH. (You can acces the dart command in the commandline)
2. Install [VS Code](https://code.visualstudio.com/)
3. Add the dart extension (just search in extensions dart)
4. Download this project as a zip and extract it in a folder. Open this folder in VS Code
5. To run the program open the commandline (by dragging up) and type: dart main.dart

VS code is just my preference, there are many others you could use.

