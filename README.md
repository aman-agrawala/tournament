The following code is for a program that will implement Swiss Pairings for an even number of players in a single tournament. Eventually this code will be expanded to include multiple tournaments and an odd number of players as well.

In order to get this code up and running, it is expected that you are familiar with python and have it installed on your computer. Please see https://www.python.org/ for more information on installing and setting up python by yourself. Furthermore, it is advised to install vagrant on your own machine to get all additional programs quickly intsalled. Please see this link for more details on this process: https://www.udacity.com/wiki/ud197/install-vagrant. 

Steps to get code up and running after installing the required programs:

1. Open up terminal/Git Bash and cd to you vagrant folder.

2. Type `vagrant up` and, after the virtual machine is turned on, type `vagrant ssh` to login

3. Type `cd /vagrant` to go to common directory and then cd into your tournament folder.

4. Next you need to initialize the database. To do so, type `psql` into the terminal/Git Bash window.

	4a. Then type `create DATABASE tournament`.

	4b. Now open up the tournament.sql file in a plaintext editor like Sublime or notepad. Then copy everything from the editor and paste it into your terminal/Git Bash and hit enter. This sets up the database for you.

5. Now you can adjust your tournament however you desire. Create your own .py file and use the functions provided in tournament.py to adjust your database. Be sure to include the following line at the top of your .py file: `from tournament import *`. 

The following is a quick reference guide to useful functions within in the tournament.py file.

1. def deleteMatches(): 
	Remove all the match records from the database.

2. def deletePlayers(): 
	Remove all the player records from the database.

3. def countPlayers(): 
	Returns the number of players currently registered.

4. def registerPlayer(name):
    Adds a player to the tournament database.

    The database assigns a unique serial id number for the player.  (This
    should be handled by your SQL database schema, not in your Python code.)

    Args:
      name: the player's full name (need not be unique).

5. def playerStandings():
    Returns a list of the players and their win records, sorted by wins.

    The first entry in the list should be the player in first place,
    or a player tied for first place if there is currently a tie.

    Returns:
      A list of tuples, each of which contains (id, name, wins, matches):
        id: the player's unique id (assigned by the database)
        name: the player's full name (as registered)
        wins: the number of matches the player has won
        matches: the number of matches the player has played

6. def reportMatch(winner, loser):
    Records the outcome of a single match between two players.

    Args:
      winner:  the id number of the player who won
      loser:  the id number of the player who lost
    

7. def swissPairings():
    """Returns a list of pairs of players for the next round of a match.

    Assuming that there are an even number of players registered, each player
    appears exactly once in the pairings.  Each player is paired with another
    player with an equal or nearly-equal win record, that is, a player adjacent
    to him or her in the standings.

    Returns:
      A list of tuples, each of which contains (id1, name1, id2, name2)
        id1: the first player's unique id
        name1: the first player's name
        id2: the second player's unique id
        name2: the second player's name
    """
