Andrew Puglionesi
aop4@pitt.edu
KNOWN ISSUES: All known issues were repaired during the process of writing this help file. The 
sorting algorithm used is not a textbook algorithm and turns out to be about as efficient as 
bubble sort, but since it sorts only three values, this doesn't affect the game much.

This is my implementation of Zombies.
The file aop4-zombies.asm contains the game.
The game will not start until the user presses the 'b' key or the center button in the GUI inter-
face. The user can move the player with the 'a,' 's,' 'd,' and 'w' keys or the GUI's arrows.
Procedures are spelled in "camel case" (e.g., DrawMaze), while simpler instruction labels are
completely lowercase (e.g., sortloop, exit) to distinguish the two.
$s0 holds the player's x coordinate. $s1 holds the player's y coordinate.$s2 holds the player's
total number of moves (score). Other saved registers are used as needed but have no special
purpose.
zombie1_array, zombie2_array, and so on hold a zombie's x coordinate, y coordinate, direction, the
minimum x and y coordinates of its quadrant, and the maximum x and y coordinates of its quadrant,
in that order. The numbering of the arrays corresponds to the numbering of the quadrants, which 
is specified below.
The zombie_directions array is used to hold integers representing the four potential directions 
of movement for a given zombie before it moves. (O - up, 1 - left, 2 - right, 3 - down)
It is reset to [0, 1, 2, 3] for each zombie. Then
the last element is swapped with the reverse direction of the zombie's movement. If the zombie is 
not in the same quadrant as the player, the first three elements are then randomly permuted. If
the zombie is in the same quadrant, the first three directions are sorted according to the
distance of the zombie from the player in the event each direction is taken. In either case, the
array elements of zombie_directions are then iterated through sequentially (from first to last),
and each direction is tested to see whether it's a valid movement (if so, then it's made). This 
ensures the reverse direction is always taken as a last resort.
The direction_distances array is used to hold three elements. Each represents the distance of
a zombie from the player in the event that the zombie moves in a direction. The distances are 
calculated and added to the array in the order the corresponding directions appear in the 
directions array. This makes it possible to sort the zombie_directions array in parallel with the
direction_distances array, thus sorting the directions in ascending order of future distance from 
the player given that a direction is taken. The last element of zombie_directions represents the 
reverse direction. Since it's always given the lowest precedence, its distance is not even 
calculated--just those of the first three elements of zombie_directions. For each collective 
zombie movement, the contents of this array are re-calculated for the zombie in the player's
quadrant.
Since it is the only array that needs to hold values larger than 01000000 (64), which can't be
contained in a byte, direction_distances contains three words. The other arrays hold bytes to
reduce computational complexity and increase ease of programming.


Quadrants are named as
	2		1
	



	3       	4
as in algebraic graphs. Each quadrant holds a single zombie.

The maze and characters will be drawn, but the characters won't be mobile, until the user presses
the 'b' key. A polling loop is used to achieve this.

The DrawMaze procedure reads the values in the string array "maze" and sets the LEDs corresponding
to "x" characters to be yellow. This is done using a loop and x and y coordinate positions that
are incremented as the string array is iterated through (y+=1 for each new string, x+=1 for each 
new character, the loop ends when y = 64, and x is reset to 0 once it's 64. For the record,
y is technically incremented based on the condition that the counter for x has reached 64.).

The DrawZombies procedure is used to draw the zombies in their initial positions. Initial (x,y)
coordinates are simply loaded from the constants initially stored in the zombie arrays' first
and second elements. They are then set as arguments for SetLED, which is called after loading the
address and coordinates of each zombie array.

The polling_loop loop, which runs throughout the entire life of the program, checks the address 
0xffff0000. If there is a 1 in the least significant bit, indicating a key has been pressed, it
sets $a0 depending on the value in 0xffff0004 (i.e., depending on the key pressed). Then 
MovePlayer is called with a jal instruction and moves the player in the direction indicated by $a0.
MovePlayer calls MoveEnemies when movement succeeds, so the zombies move with the player. If the 
value at 0xffff0004 doesn't correspond to an appropriate key, MovePlayer isn't called. In either 
case (for a valid key press, after return from MovePlayer),the polling loop is eventually jumped
to. The key value for a pressed key is read under the "move_player" label, not to be confused with
the MovePlayer procedure. A series of branch statements evocative of if-else if statements is used
to determine if the key pressed was 'a,' 'w,' 's,' or 'd.' If it was any of them, MovePlayer is
called with an argument used to represent the direction in which to move the player 
(see MovePlayer). (If it wasn't, we jump to polling_loop.) Then the polling_loop label is jumped 
to.
polling_loop also handles the passage of time. Before it, the variable start_time is loaded 
with the system time as obtained through syscall with service ID 30. Since the zombies move every 
time the player moves, the loop only checks to see if 500 ms have passed since start_time when a 
key has not just been pressed. This is done by loading the current time and calculating
	time elapsed = current time - start time
If this value is less than 500, polling_loop is simply repeated. If it's greater than or equal to
500, the method MoveEnemies is called and moves every zombie, and then start_time is set to the
current time.
Thus, the polling_loop controls the timing of events in the game--when the player moves and when
the zombies move.

MovePlayer moves the player depending on the value in $a0 as set in the polling loop. Value-
direction pairs are {(1 - move left), (2 - move right), (3 - move down), (4 - move up)}. 
MoveEnemy is called from MovePlayer each time the player makes a successful move.
The MovePlayer procedure does not save the player's x and y coordinates ($s0, $s1) to the stack. 
This is intentional behavior: when the player successfully moves, these values are changed 
permanently.
A series of branch statements evocative of an if-else if pattern is used to determine the 
direction of the movement from the direction argument. Then, a temporary variable is altered
accordingly to serve as an altered x or y coordinate. It is taken with the unaltered coordinate,
and, under the check_pos label, the new position is tested to see if it's valid. If the LED at the
new position is off (GetLED returns 0), the old x and y coordinates (in $s regs) of the player are
used to turn the current position's LED off. $s0 and $s1 are then given the new coordinates' values 
(which were stored in temporary variables), and SetLED is called with the new coordinates to draw 
the player at the new position. The score is incremented, and MoveEnemies is called. Finally, if 
the x and y coordinates are both 63, the player has reached (63,63) and so the procedure UserWins 
is jumped to. 
If GetLED returned 1 (for red), however, GameOver is jumped to, as the game must end.
If it returned some other value, by process of elimination the LED must be yellow, so MovePlayer
literally does nothing permanent, returning to its callee silently (a wall prevented movement).

MoveEnemies is called by MovePlayer each time the player moves and, regardless of whether the
player has made a move, each 500 ms from the polling loop. It is guaranteed to move every single 
zombie, but precisely how those zombies move doesn't depend on this procedure. MoveEnemies simply 
loads the address of a zombie's array into $a0 and calls the MoveZombie procedure with that 
argument. This is done for each zombie.

MoveZombie, called by MoveEnemies, moves a zombie based on its surroundings, its current direction,
and the player's location. The zombie's identity (quadrant) is based on the zombie array argument 
passed in (zombie1_array, zombie2_array, etc.). First the LED at the zombie's (x, y) coordinate
is turned off with SetLED. Then the zombie_directions array is reset to [0,1,2,3]. The zombie's
current direction, as set during the previous movement, is used to find the reverse direction.
Direction codes in binary are (00 - up, 01 - left, 10 - right, 11 - down). Therefore, the reverse
direction's code is obtained by inverting the final two bits of the loaded direction. To do this,
bits are inverted using nor, where the other operand is a string of zeroes; then all but the last
two bits are made to be 0's by xor with a register containing 11111111111...00. (Since the leading
bits of the inverted value are 1's, this gives leading 0's and so returns the reverse direction.)
The last element (3) of the zombie_direction array is swapped with the reverse direction in order
to de-prioritize the reverse direction as much as possible (as explained above).
Next a call to PlayerInQuadrant is used to determine whether the player is in the same quadrant
as the zombie in question. If it returns a 1 (they're in the same quadrant), a label called 
chase_player is jumped to; its code calls SortDirections to sort the zombie_directions array items
based on the distance each direction would cause the zombie to be from the player (see above; the
called methods are described below). If PlayerInQuadrant returns a 0, the first 3 elements of
the zombie_directions array are instead randomly permuted. In either case, each direction is
tested in the order it now occurs in the array to see if it would work, using the CheckMove 
procedure. Once CheckMove returns a 1, indicating the direction yields a valid move for the zombie,
the done_move label is jumped to. Under it, since CheckMove updates the zombie array with the new
x and y coordinates, the new coordinates are loaded and used to redraw the zombie.
Finally, once the move has been made, branches are set up so that if and only if the player's
coordinates are the same as the zombie's, GameOver is called (the zombie moved onto the player).

PermuteDirections randomly shuffles the first three elements of the zombie_directions array. It's
called by MoveZombie for zombies not in the player's quadrant (that move randomly). Using service
ID 42, it generates a random integer n in the range [0, 2] and swaps zombie_directions[2] with 
zombie_directions[n]. Next a number m in [0, 1] is generated and zombie_directions[m] is swapped
with zombie_directions[1]. There are 6 possible permutations of the first three directions, each
of which is equally likely to occur using this algorithm: p(E) = 1/6. (This is the product of
the probability of the first random number having a given value, 1/3, and the second having a
given value, 1/2, since the numbers are generated independently and each combination gives a unique
permutation.)

SortDirections fills the direction_distances array with values. This array is described above. 
The items in direction_distances initially correspond directly to the items in zombie_directions.
That is, the 0th represents the 0th direction, the 1st the 1st direction, and the 2nd the 2nd
direction in the zombie_directions array after it's manipulated in MoveZombie. direction_distances
is filled via a loop that begins at the getdistances label and ends at the continue label.
A counter is used to iterate through the zombie_directions array and, simultaneously, through
the SortDirections array. Temporary stand-ins for the zombie's x and y variable are incremented
or decremented depending on the value of the direction loaded during the iteration. Then the squared
distance between the new (x,y) coordinate and the player's (x,y) coordinate is inserted into the
direction_distances array at its address + 4*counter, it being an array of words. That quantity is
(Xz - Xp)^2 + (Yz - Yp)^2
where X and Y are x and y coordinates and subscripts denote whether they belong to the zombie or the
player. This is done for the first 3 directions in zombie_directions.
Next, direction_distances is sorted in ascending order using an implementation of an unknown sorting
algorithm; along side this process, every swap made in direction_distances is simultaneously made
in zombie_directions so that the first three directions are sorted in ascending order by the distance 
they yield. Pseudocode:
for (int i = 0; i<2; i++)
{
	for (int j = i+1; j < 3; j++)
	{
		if (direction_distances[j] <= direction_distances[i]) {
			swap direction_distances[i] and direction_distances[j];
			swap zombie_directions[i] and zombie_directions[j];
		}
	}
}
This is not a textbook sorting algorithm--I actually meant to implement selection sort but did this by
mistake. It can be verified that this always works, though is occasionally less efficient, for arrays 
with three values.

PlayerInQuadrant loads its return register with 0. It loads a zombie array argument and uses a
series of branches to see whether the zombie is in the player's quadrant. If the player's x or y
are below the x/y minimum or above the x/y maximum in the zombie's array, the end of the procedure
is jumped to. If no jump is made (they're within the zombie's minima and maxima), the return value
is set to 1 since the characters are in the same quadrant.

CheckMove is called by MoveZombie to test the validity of a zombie's moving in a given direction.
If the move would be valid, it returns 1. If not, it returns 0.
The direction is one argument, the zombie's array the other. Similarly to what occurs in
MovePlayer, the zombie's x and y coordinates are loaded into temporary variables, which are
incremented or decremented depending on the direction argument. This is done with a series of
"if-else if" style branches. The proposed coordinates are set as arguments for a GetLED call;
if this returns 2 (the new location would be yellow), then the return register is loaded with 0 and
the procedure exited. Otherwise, a label called checkquadrant is jumped to. Its code loads the
return register with 0 by default, loads the zombie's x and y minima and maxima from the zombie's
array, and, using literally the exact same algorithm as in PlayerInQuadrant, tests to see whether
the new position's values are below the minima or above the maxima. If one is, the procedure is
immediately exited (returning 0). If neither coordinate is outside the bounds of the quadrant, 
though, the return register is given the value 1, and the new x and y coordinates and successful
direction are stored in the zombie's array.

