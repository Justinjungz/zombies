#Andrew Puglionesi
#aop4@pitt.edu
.data
start_time: .word 0 #the time recorded at the beginning of every 500-ms interval

#zombie_array format: x, y, direction, quadrant xmin, quadrant ymin, quadrant xmax, quadrant ymax
	#(direction numbers: O - up, 1 - left, 2 - right, 3 - down)
zombie1_array: .byte 41, 26, 0, 32, 0, 63, 31
zombie2_array: .byte 25, 26, 0, 0, 0, 31, 31
zombie3_array: .byte 25, 33, 3, 0, 32, 31, 63
zombie4_array: .byte 41, 33, 3, 32, 32, 63, 63
zombie_directions: .byte 0, 1, 2, 3
direction_distances: .word 0, 0, 0
maze:	.ascii
	# 0123456701234567012345670123456701234567012345670123456701234567
	 "  xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",    # 0
	 "       xx      xx      xx      xx      xx      xx      xx      x",    # 1
	 "x xxxx xx xxxx xx xxxx xx xxxx xx xxxx xx xxxx xx xxxx xx xxxx x",    # 2
	 "x x  x xx x  x xx x  x xx x  x xx x  x xx x  x xx x  x xx x  x x",    # 3
	 "x x  x xx x  x xx x  x xx x  x xx x  x xx x  x xx x  x xx x  x x",    # 4
	 "x xxxx xx xxxx xx xxxx xx xxxx xx xxxx xx xxxx xx xxxx xx xxxx x",    # 5
	 "x                                                              x",    # 6
	 "x xxxxxxx xxxxxxx xxxxxxx xxxxxxx xxxxxxx xxxxxxx xxxxxxx xxxxxx",    # 7
	 "x xxxxxxx xxxxxxx xxxxxxx xxxxxxx xxxxxxx xxxxxxx xxxxxxx xxxxxx",    # 8
	 "x      xx      xx      xx      xx      xx      xx      xx      x",    # 9
	 "x xxxx xx xxxx xx xxxx xx xxxx xx xxxx xx xxxx xx xxxx xx xxxx x",    # 10
	 "x x  x xx x  x xx x  x xx x  x xx x  x xx x  x xx x  x xx x  x x",    # 11
	 "x x  x xx x  x xx x  x xx x  x xx x  x xx x  x xx x  x xx x  x x",    # 12
	 "x xxxx xx xxxx xx xxxx xx xxxx xx xxxx xx xxxx xx xxxx xx xxxx x",    # 13
	 "x                                                              x",    # 14
	 "x xxxxxxx xxxxxxx xxxxxxx xxxxxxx xxxxxxx xxxxxxx xxxxxxx xxxxxx",    # 15
	 "x xxxxxxx xxxxxxx xxxxxxx xxxxxxx xxxxxxx xxxxxxx xxxxxxx xxxxxx",    # 16
	 "x      xx      xx      xx      xx      xx      xx      xx      x",    # 17
	 "x xxxx xx xxxx xx xxxx xx xxxx xx xxxx xx xxxx xx xxxx xx xxxx x",    # 18
	 "x x  x xx x  x xx x  x xx x  x xx x  x xx x  x xx x  x xx x  x x",    # 19
	 "x x  x xx x  x xx x  x xx x  x xx x  x xx x  x xx x  x xx x  x x",    # 20
	 "x xxxx xx xxxx xx xxxx xx xxxx xx xxxx xx xxxx xx xxxx xx xxxx x",    # 21
	 "x                                                              x",    # 22
	 "x xxxxxxx xxxxxxx xxxxxxx xxxxxxx xxxxxxx xxxxxxx xxxxxxx xxxxxx",    # 23
	 "x xxxxxxx xxxxxxx xxxxxxx xxxxxxx xxxxxxx xxxxxxx xxxxxxx xxxxxx",    # 24
	 "x      xx      xx      xx      xx      xx      xx      xx      x",    # 25
	 "x xxxx xx xxxx xx xxxx xx xxxx xx xxxx xx xxxx xx xxxx xx xxxx x",    # 26
	 "x x  x xx x  x xx x  x xx x  x xx x  x xx x  x xx x  x xx x  x x",    # 27
	 "x x  x xx x  x xx x  x xx x  x xx x  x xx x  x xx x  x xx x  x x",    # 28
	 "x xxxx xx xxxx xx xxxx xx xxxx xx xxxx xx xxxx xx xxxx xx xxxx x",    # 29
	 "x                                                              x",    # 30
	 "x xxxxxxx xxxxxxx xxxxxxx xxxxxxx xxxxxxx xxxxxxx xxxxxxx xxxxxx",    # 31
	 "x xxxxxxx xxxxxxx xxxxxxx xxxxxxx xxxxxxx xxxxxxx xxxxxxx xxxxxx",    # 32
	 "x      xx      xx      xx      xx      xx      xx      xx      x",    # 33
	 "x xxxx xx xxxx xx xxxx xx xxxx xx xxxx xx xxxx xx xxxx xx xxxx x",    # 34
	 "x x  x xx x  x xx x  x xx x  x xx x  x xx x  x xx x  x xx x  x x",    # 35
	 "x x  x xx x  x xx x  x xx x  x xx x  x xx x  x xx x  x xx x  x x",    # 36
	 "x xxxx xx xxxx xx xxxx xx xxxx xx xxxx xx xxxx xx xxxx xx xxxx x",    # 37
	 "x                                                              x",    # 38
	 "x xxxxxxx xxxxxxx xxxxxxx xxxxxxx xxxxxxx xxxxxxx xxxxxxx xxxxxx",    # 39
	 "x xxxxxxx xxxxxxx xxxxxxx xxxxxxx xxxxxxx xxxxxxx xxxxxxx xxxxxx",    # 40
	 "x      xx      xx      xx      xx      xx      xx      xx      x",    # 41
	 "x xxxx xx xxxx xx xxxx xx xxxx xx xxxx xx xxxx xx xxxx xx xxxx x",    # 42
	 "x x  x xx x  x xx x  x xx x  x xx x  x xx x  x xx x  x xx x  x x",    # 43
	 "x x  x xx x  x xx x  x xx x  x xx x  x xx x  x xx x  x xx x  x x",    # 44
	 "x xxxx xx xxxx xx xxxx xx xxxx xx xxxx xx xxxx xx xxxx xx xxxx x",    # 45
	 "x                                                              x",    # 46
	 "x xxxxxxx xxxxxxx xxxxxxx xxxxxxx xxxxxxx xxxxxxx xxxxxxx xxxxxx",    # 47
	 "x xxxxxxx xxxxxxx xxxxxxx xxxxxxx xxxxxxx xxxxxxx xxxxxxx xxxxxx",    # 48
	 "x      xx      xx      xx      xx      xx      xx      xx      x",    # 49
	 "x xxxx xx xxxx xx xxxx xx xxxx xx xxxx xx xxxx xx xxxx xx xxxx x",    # 50
	 "x x  x xx x  x xx x  x xx x  x xx x  x xx x  x xx x  x xx x  x x",    # 51
	 "x x  x xx x  x xx x  x xx x  x xx x  x xx x  x xx x  x xx x  x x",    # 52
	 "x xxxx xx xxxx xx xxxx xx xxxx xx xxxx xx xxxx xx xxxx xx xxxx x",    # 53
	 "x                                                              x",    # 54
	 "x xxxxxxx xxxxxxx xxxxxxx xxxxxxx xxxxxxx xxxxxxx xxxxxxx xxxxxx",    # 55
	 "x xxxxxxx xxxxxxx xxxxxxx xxxxxxx xxxxxxx xxxxxxx xxxxxxx xxxxxx",    # 56
	 "x      xx      xx      xx      xx      xx      xx      xx      x",    # 57
	 "x xxxx xx xxxx xx xxxx xx xxxx xx xxxx xx xxxx xx xxxx xx xxxx x",    # 58
	 "x x  x xx x  x xx x  x xx x  x xx x  x xx x  x xx x  x xx x  x x",    # 59
	 "x x  x xx x  x xx x  x xx x  x xx x  x xx x  x xx x  x xx x  x x",    # 60
	 "x xxxx xx xxxx xx xxxx xx xxxx xx xxxx xx xxxx xx xxxx xx xxxx x",    # 61
	 "x                                                               ",    # 62
	 "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx  "     # 63
gmovr_msg: .asciiz "Sorry--you have been eaten."
win_msg1: .asciiz "Congratulations! You won! Your score is "
win_msg2: .asciiz " moves."

.text

li $s0, 0   #initialize player's x to 0
li $s1, 0   #intitalize player's y to 0
li $s2, 0   #initialize player's score to 0 (this is just done for clarity).
move $a0, $s1
move $a1, $s2
li $a2, 3   #green
jal SetLED  #Create player at (0,0)
jal DrawMaze #Draw the entire maze (yellow LEDs)
jal DrawZombies #draw the 4 zombies in their initial positions
wait_for_b: #wait for the 'b' key to be pressed before starting the game. The board and characters
	#are drawn before this.
	la	$v0,0xffff0000		# address for reading key press status
	lw	$t0,0($v0)		# read the key press status
	andi	$t0,$t0,1
	beq	$t0,$0,wait_for_b	#if a key wasn't pressed, read key press status again
	la $v0, 0xffff0004
	lw $t0,0($v0)		# read key value
	li $t1, 66
	bne $t0, $t1, wait_for_b #if the 'b' key was not pressed, keep reading the key value

li $v0, 30 #stores lower 32 bits of system time in milliseconds to $a0
syscall
la $t0, start_time
sw $a0, 0($t0) #store initial time in start_time's address

polling_loop:
	la	$v0,0xffff0000		# address for reading key press status
	lw	$t0,0($v0)		# read the key press status
	andi	$t0,$t0,1
	bne	$t0,$0,move_player	# key was pressed, so move the player and, if move is
					#successful, also move the enemy
	li $v0, 30	#key was not pressed, so see if 500 ms have elapsed since last 500-ms
			#cycle. If that's the case, move the enemies.
	syscall #stores lower 32 bits of system time in milliseconds to $a0
	la $t0, start_time
	lw $t0, 0($t0) #t0 = initial time
	sub $t0, $a0, $t0 #t0 = time elapsed since start_time
	li $t1, 500
	blt $t0, $t1, polling_loop #if 500 ms haven't passed, restart the loop
	jal MoveEnemies 	   #if 500 ms have passed, move the enemies automatically,
	li $v0, 30		   #then reset the starting time
	syscall
	la $t0, start_time #reset initial time.
	sw $a0, 0($t0) #t0 = initial time
	j polling_loop
move_player: #this is merely part of the polling loop. The MovePlayer procedure actually moves
	     #the player based on the argument it's called with from this code.
	la $v0, 0xffff0004
	lw $t0,0($v0)		# read key *value*
	left_key:
		addi $v0,$t0,-226	# check for left key press
		bne $v0,$0,right_key	# wasn't left key, so try right key
		li $a0, 1
		jal MovePlayer		#the move player function will move the player left
		j polling_loop
	right_key:
		addi $v0,$t0,-227	# check for right key press
		bne $v0,$0,down_key	# wasn't right key, so check for down
		li $a0, 2
		jal MovePlayer		#the move player function will move the player right
		j polling_loop
	down_key:
		addi $v0, $t0, -225
		bne $v0,$0,up_key
		li $a0, 3
		jal MovePlayer		#the move player function will move the player down
		j polling_loop
	up_key:
		addi $v0, $t0, -224
		bne $v0,$0,polling_loop	# invalid keypress--ignore it
		li $a0, 4
		jal MovePlayer		#the move player function will move the player up
		j polling_loop
#calls MoveZombie for each zombie, each time using that zombie's designated zombie array
MoveEnemies:
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	la $a0, zombie1_array
	jal MoveZombie
	la $a0, zombie2_array
	jal MoveZombie
	la $a0, zombie3_array
	jal MoveZombie
	la $a0, zombie4_array
	jal MoveZombie
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	jr $ra

#moves a zombie based on its surroundings and current direction and the player's location.
#Argument: $a0 is the zombie's array (e.g., zombie3_array)
MoveZombie:
	addi $sp, $sp, -12
	sw $ra, 0($sp)
	sw $s3, 4($sp)
	sw $s4, 8($sp)
	#Since some move will be made through this procedure call, let's turn off the LED
	#at the zombie's current position.
	move $s3, $a0
	move $s4, $a1
	lbu $a0, 0($s3) #a0 = zombie x
	lbu $a1, 1($s3) #a1 = zombie y
	li $a2, 0
	jal SetLED
	move $a0, $s3
	move $a1, $s4
	
	la $t0, zombie_directions #restore the zombie_directions array to [0,1,2,3]
	sb $0, 0($t0)		#to facilitate random movement choice
	li $t1, 1
	sb $t1, 1($t0)
	li $t1, 2
	sb $t1, 2($t0)
	li $t1, 3
	sb $t1, 3($t0)
	
	lbu $t1, 2($a0) #t1 = current direction of zombie--retrieved from zombie_array argument
	#get the reverse direction:
	nor $t2, $t1, $0 #invert the bits in $t1, store result in $t2
	li $t3, 0xFFFFFFFC #in binary, 1111...1100
	xor $t2, $t2, $t3 #t2 is now the reverse direction given that 0 is up, 1 is left, 2 is
			  #right, and 3 is down. (xor just removes leading 1's in the complement.)
	#swap the reverse direction ($t2) and the last element of the array, which is 3
	sb $t2, 3($t0) #last element = reverse direction
	add $t2, $t2, $t0 #t2 = reverse direction's index
	li $t1, 3
	sb $t1, 0($t2) #store 3 (the old last element) in reverse direction's index
	
	la $s3, zombie_directions
	jal PlayerInQuadrant
	bne $v0, $0, chase_player #if PlayerInQuadrant returns 1, the zombie chases the player
				#Otherwise, the zombie does random motion
	jal PermuteDirections #randomly arranges first 3 elements of direction array	
random_motion_loop:
	lbu $a1, 0($s3) #try the nth direction of zombie_directions
	jal CheckMove
	bne $v0, $0, done_move #if v0 == 1, actually move the zombie
	addi $s3, $s3, 1 #try the next direction
	j random_motion_loop
chase_player:
        #SAVE ZOMBIE X, Y, AND DIRECTION IN CHECKMOVE (did it)
        jal SortDirections
cploop:
        lbu $a1, 0($s3) #try the nth direction of zombie_directions
	jal CheckMove
	bne $v0, $0, done_move #if v0 == 1, actually move the zombie
	addi $s3, $s3, 1
        j cploop
done_move:
	move $s4, $a0
	li $a2, 1 #red color
	lbu $a0, 0($s4) #a0 = zombie x
	lbu $a1, 1($s4) #a1 = zombie y
	jal SetLED 	#draws zombie at new position
	move $a0, $s4
	lbu $t0, 0($a0) #load zombie x from array argument
	lbu $t1, 1($a0) #load zombie y from array argument
	bne $t0, $s0, exit #if player x != zombie x, exit
	bne $t1, $s1, exit #if player y != zombie y, exit
	#player pos same as zombie pos, so game is over
	jal GameOver
exit:
	lw $s4, 8($sp)
	lw $s3, 4($sp)
	lw $ra, 0($sp)
	addi $sp, $sp, 12
	jr $ra

#Takes a zombie array argument ($a0) and determines whether the player is in the same quadrant
#as the zombie based on the zombie array quadrant x and y minima and maxima and the player's x 
#and y ($s0 and $s1). If so, 1 is stored in $v0. Else, 0 is stored in $v0.
PlayerInQuadrant:
	li $v0, 0
	lbu $t0, 3($a0) #t0 = quadrant xmin
	lbu $t1, 4($a0) #t1 = quadrant ymin
	lbu $t2, 5($a0) #t2 = quadrant xmax
	lbu $t3, 6($a0) #t3 = quadrant ymax
	#branches keep 0 in $v0 if the player is outside the quadrant
	blt $s0, $t0, end
	blt $s1, $t1, end
	bgt $s0, $t2, end
	bgt $s1, $t3, end
	#only pass this point if xmax >= playerx >= xmin, ymax >= playery >= ymin
	li $v0, 1	#player is inside quadrant, so return 1
end:
	jr $ra

#Checks whether a zombie's move is valid. If the new position leads to collision with a wall
#or the zombie leaving its quadrant, 0 is returned in $v0. 1 is returned for a successful move.
#Arguments: $a0 is the zombie_array, and $a1 is the direction to attempt.
CheckMove:
	addi $sp, $sp, -16
	sw $a0, 0($sp)
	sw $a1, 4($sp)
	sw $ra, 8($sp)
	sw $s3, 12($sp)
	
	lbu $t0, 0($a0) #t0 = zombie x
	lbu $t1, 1($a0) #t1 = zombie y
	move $t2, $a1 #$t2 = direction number
#switch on the direction of movement (argument $a1)
case_up:	
	bne $t2, $0, case_left
	addi $t1, $t1, -1 #decrement y-coordinate since proposed move is up
	j break
case_left:
	li $t3, 1
	bne $t2, $t3, case_right
	addi $t0, $t0, -1 #decrement x since proposed move is left
	j break
case_right:	
	li $t3, 2
	bne $t2, $t3, case_down
	addi $t0, $t0, 1 #increment x since proposed move is right
	j break
case_down:
	addi $t1, $t1, 1 #increment y since proposed move is down
break:
	move $s3, $a0
	move $a0, $t0 #get LED color at new (x,y) coordinate
	move $a1, $t1
	jal GetLED
	move $t0, $a0 #recover proposed zombie x
	move $t1, $a1 #recover proposed zombie y
	move $a0, $s3 #recover array
	li $t2, 2
	bne $v0, $t2, checkquadrant #if LED isn't yellow, check whether zombie's leaving quadrant
	li $v0, 0		    #if LED is yellow, return 0 - ivalid move
	j end_check
checkquadrant:
	li $v0, 0
	lbu $t2, 3($a0) #t0 = quadrant xmin
	lbu $t3, 4($a0) #t1 = quadrant ymin
	lbu $t4, 5($a0) #t2 = quadrant xmax
	lbu $t5, 6($a0) #t3 = quadrant ymax
	#see if new (x,y) position is outside quadrant	
	blt $t0, $t2, end_check
	bgt $t0, $t4, end_check
	blt $t1, $t3, end_check
	bgt $t1, $t5, end_check
	li $v0, 1 #if the move doesn't move the zombie out of its quadrant, then the move is 
		  #valid... so return 1. Then:
	sb $t0, 0($a0) #store new zombie x in array since move is valid
	sb $t1, 1($a0) #store new zombie y in array since move is valid
	lw $t2, 4($sp) #recover the successful direction from the stack
	sb $t2, 2($a0) #store that direction in the zombie array's direction slot
end_check:
	lw $s3, 12($sp)
	lw $ra, 8($sp)
	lw $a1, 4($sp)
	lw $a0, 0($sp)
	addi $sp, $sp, 16
	jr $ra

#Sorts the first three elements of the zombie_direction array according to the distance of the
#zombie from the player in the event that a given direction is taken. Directions are sorted
#in order of shortest distance to longest distance. (Really, distances for each direction are
#calculated, stored in an array, and sorted in parallel with the original array.)
#Arguments: $a0 is the moving zombie's array.
SortDirections:
	addi $sp, $sp, -20
	sw $s3, 0($sp)
	sw $s4, 4($sp)
	sw $s5, 8($sp)
	sw $s6, 12($sp)
	sw $s7, 16($sp)
	la $t0, zombie_directions
	la $t1, direction_distances
	li $t4, 0 #i = 0
getdistances:
	lbu $t2, 0($a0) #t2 = zombie x
	lbu $t3, 1($a0) #t3 = zombie y
	add $t5, $t0, $t4 #get next direction's index
	lbu $t6, 0($t5) #get next direction
try_up:	
	bne $t6, $0, try_left
	addi $t3, $t3, -1
	j continue
try_left:
	li $t7, 1
	bne $t6, $t7, try_right
	addi $t2, $t2, -1
	j continue
try_right:
	li $t7, 2
	bne $t6, $t7, try_down
	addi $t2, $t2, 1
	j continue
try_down:
	addi $t3, $t3, 1
	j continue
continue:
	sub $t2, $t2, $s0 #t2 =  proposed zombie x - player x
	sub $t3, $t3, $s1 #t3 = proposed zombie y - player y
	mul $t2, $t2, $t2 #t2 = square(t2) ... (x1-x2)^2
	mul $t3, $t3, $t3 #t3 = square(t3) ... (y1-y2)^2
	add $t2, $t2, $t3 #t2 = (x1-x2)^2 + (y1-y2)^2 = squared distance between x and y
	sll $t4, $t4, 2
	add $t5, $t1, $t4 #get next index of direction_distances
	srl $t4, $t4, 2
	sw $t2, 0($t5)	  #store squared distance there
	addi $t4, $t4, 1
	li $t9, 3
	beq $t4, $t9, breakloop #don't consider the last (reverse) direction's distance--that
				#direction isn't sorted, and so there isn't space for it in
				#direction_distances. Its direction will stay at the end.
	j getdistances

breakloop:
	li $t4, 0 #counter i = 0 for "outer" for loop of algorithm
	li $t5, 1 #counter j = 1 for "inner" for loop of algorithm
	#sorting algorithm (sorts two arrays in parallel; see readme for pseudocode):
sortloop:
	li $s3, 2
	beq $t4, $s3, endsort #once i == 2, we'll have already sorted the first three directions
				#by distance
	sll $t5, $t5, 2
	sll $t4, $t4, 2
	add $t6, $t1, $t5 #t6 = address for direction_distances[j]
	add $t7, $t1, $t4 #t7 = address for direction_distances[i]
	srl $t5, $t5, 2
	srl $t4, $t4, 2
	lw $t8, 0($t6) #t8 = direction_distances[j]
	lw $t9, 0($t7) #t9 = direction_distances[i]
	bgt $t8, $t9, notless
			#if direction_distances[j] <= direction_distances[i], swap them
	sw $t8, 0($t7)  #swap direction_distances[j] and direction_distances[i]
	sw $t9, 0($t6)  #then, swap the corresponding directions in actual array of directions:
	add $s4, $t0, $t5 #s4 = address for zombie_directions[j]
	add $s5, $t0, $t4 #s5 = address for zombie_directions[i]
	lbu $s6, 0($s4)    #swap zombie_directions[j] and zombie_directions[i]
	lbu $s7, 0($s5)	   #s7 = zombie_directions[i]
	sb $s6, 0($s5)	   #zombie_directions[i] = zombie_directions[j]
	sb $s7, 0($s4)	   #zombie_directions[j] = zombie_directions[i]
notless: #search the next item
	addi $t5, $t5, 1 # j += 1
	li $s3, 3
	bne $t5, $s3, sortloop #if j = 3, change i and j for a new iteration of the outer loop.
	addi $t4, $t4, 1 # i = i + 1
	addi $t5, $t4, 1 #j = i + 1
	j sortloop
endsort:
	lw $s7, 16($sp)
	lw $s6, 12($sp)
	lw $s5, 8($sp)
	lw $s4, 4($sp)
	lw $s3, 0($sp)
	addi $sp, $sp, 20
	jr $ra
	#index = 0
	#while index < 3: 
		#switch on direction.
		#get updated coordinates
		#square and add differences
		#store result in direction_distances
		#increment index
	

#MovePlayer moves the player according to the value in $a0. If there's a wall present, it does
#nothing.
#$a0: 1 - move left, 2 - move right, 3 - move down, 4 - move up
MovePlayer:
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	move $t4, $s0 #temporarily save player's coordinates
	move $t5, $s1
	left:
		bne $a0, 1, right
		addi $t4, $s0, -1 #$t0 holds new x coordinate
		j check_pos
	right:
		bne $a0, 2, down
		addi $t4, $s0, 1 #$t0 holds new x coordinate
		j check_pos
	down:
		bne $a0, 3, up
		addi $t5, $s1, 1 #$t1 holds new y coordinate
		j check_pos
	up:
		addi $t5, $s1, -1 #$t1 holds new y coordinate
	check_pos:
		move $a0, $t4 #copy potentially new x-coordinate in order to check color
		move $a1, $t5 #copy potentially new y-coordinate in order to check color
		jal GetLED
		beq $v0, $0, move #LED at new position is off, so move the player
		li $t0, 1
		beq $t0, $v0, GameOver #player hit (red) enemy
		j mp_exit #the new position is a yellow LED (a wall) if it's not red or blank,
			  #so nothing is done
	move:
		move $a0, $s0 #store previous x, y coordinates
		move $a1, $s1
		li $a2, 0
		jal SetLED    #Reset the player's previous LED to being blank since player's moving
		move $a0, $t4 #set x, y, and color (green - 3) for new LED position
		move $a1, $t5
		li $a2, 3
		jal SetLED    #draw player at new position
		move $s0, $t4 #save new x and y coordinates permanently
		move $s1, $t5
		addi $s2, $s2, 1 #increment score permanently
		jal MoveEnemies  #since a move was successfully made, the enemies are moved.
		li $t0, 63
		bne $s1, $t0, mp_exit #check to see if s0 and s1 both equal 63. If not, branch
		bne $s0, $t0, mp_exit
		j UserWins
	mp_exit:
		lw $ra, 0($sp)
		addi $sp, $sp, 4
		jr $ra

#DrawMaze reads the values in the string array maze and sets the LEDs corresponding
#to 'x' characters to be yellow.
DrawMaze:
	addi $sp, $sp, -16
	sw $ra, 0($sp)
	sw $s0, 4($sp)
	sw $s1, 8($sp)
	sw $s2, 12($sp)
	
	li $t2, 64
	la $t0, maze
	li $a1, 0 #a1 is the value of the row (see maze string declaration) and so y coordinate
	li $a0, 0 #a0 represents the current column for the string of row t1 and so x coordinate
	li $a2, 2 #a2 is the color used to draw an LED, here yellow
drawmazeloop:
	beq $a1, $t2, drawend #every row drawn?
	bne $a0, $t2, xlessthan64 #reached end of row if we don't brach here
	addi $a0, $a0, -64 #reset the x coordinate at end of a row (64 - 64 = 0)
xlessthan64:	
	lbu $t1, 0($t0) #load current character
	bne $t1, 120, increment #if the character isn't x, don't set the LED to yellow
	move $s0, $t0
	move $s1, $t1
	move $s2, $t2
	jal SetLED #setLED trashes the $t0-2 registers, so I save and restore them
	move $t0, $s0
	move $t1, $s1
	move $t2, $s2
increment:
	addi $a0, $a0, 1 #increment x
	addi $t0, $t0, 1 #get ready to read next byte
	bne $a0, $t2, drawmazeloop
	addi $a1, $a1, 1 #if x == 64, increment the y coordinate
	j drawmazeloop
drawend:
	lw $s2, 12($sp)
	lw $s1, 8($sp)
	lw $s0, 4($sp)
	lw $ra, 0($sp)
	addi $sp, $sp, 16
	jr $ra

#Draws the 4 zombies in their initial positions
DrawZombies:
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	li $a2, 1
	la $t0, zombie1_array
	lbu $a0, 0($t0)
	lbu $a1, 1($t0)
	jal SetLED
	la $t0, zombie2_array
	lbu $a0, 0($t0)
	lbu $a1, 1($t0)
	jal SetLED
	la $t0, zombie3_array
	lbu $a0, 0($t0)
	lbu $a1, 1($t0)
	jal SetLED
	la $t0, zombie4_array
	lbu $a0, 0($t0)
	lbu $a1, 1($t0)
	jal SetLED
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	jr $ra
	
#The first three elements of the zombie_directions array be randomly permuted when this is called.
PermuteDirections:
	addi $sp, $sp, -4
	sw $a0, 0($sp)
	la $t0, zombie_directions
	li $a1, 3 #i = 3, set upper bound... generates a random number in [0, 2]
	li $a0, 1  #set seed
	li $v0, 42 #get random index
	syscall
	lbu $t1, 2($t0) #get third element's value
	add $t2, $t0, $a0 #get random index address ($a0 is the value syscall returned)
	lbu $t3, 0($t2) #get random index value
	sb $t3, 2($t0) #swap elements
	sb $t1, 0($t2)
	
	li $a1, 2 # i = 2, set upper bound... generates a random number in [0, 1]
	li $a0, 1  #set seed
	li $v0, 42 #get random index
	syscall #a0 = random index
	lbu $t1, 1($t0) #t1 = second element's value
	add $t2, $t0, $a0 #t2 = random index address
	lbu $t3, 0($t2) #t3 =  random index value
	sb $t3, 1($t0) #swap elements
	sb $t1, 0($t2)
	lw $a0, 0($sp)
	addi $sp, $sp, 4
	jr $ra
	
SetLED:
#arguments: $a0 is x, $a1 is y, $a2 is color
# byte offset into display = y * 16 bytes + (x / 4)
	sll $t0,$a1,4 # y * 16 bytes
	srl $t1,$a0,2 # x / 4
	add $t0,$t0,$t1 # byte offset into display
	li $t2,0xffff0008 # base address of LED display
	add $t0,$t2,$t0 # address of byte with the LED
	# now, compute led position in the byte and the mask for it
	andi $t1,$a0,0x3 # remainder is led position in byte
	neg $t1,$t1 # negate position for subtraction
	addi $t1,$t1,3 # bit positions in reverse order
	sll $t1,$t1,1 # led is 2 bits
	# compute two masks: one to clear field, one to set new color
	li $t2,3
	sllv $t2,$t2,$t1
	not $t2,$t2 # bit mask for clearing current color
	sllv $t1,$a2,$t1 # bit mask for setting color
	# get current LED value, set the new field, store it back to LED
	lbu $t3,0($t0) # read current LED value
	and $t3,$t3,$t2 # clear the field for the color
	or $t3,$t3,$t1 # set color field
	sb $t3,0($t0) # update display
	jr $ra
	
	
	# int GetLED(int x, int y)
	#   returns the value of the LED at position (x,y)
	#
	#  arguments: $a0 holds x, $a1 holds y
	#  trashes:   $t0-$t2
	#  returns:   $v0 holds the value of the LED (0, 1, 2 or 3)

GetLED:
	# byte offset into display = y * 16 bytes + (x / 4)
	sll  $t0,$a1,4      # y * 16 bytes
	srl  $t1,$a0,2      # x / 4
	add  $t0,$t0,$t1    # byte offset into display
	la   $t2,0xffff0008
	add  $t0,$t2,$t0    # address of byte with the LED
	# now, compute bit position in the byte and the mask for it
	andi $t1,$a0,0x3    # remainder is bit position in byte
	neg  $t1,$t1        # negate position for subtraction
	addi $t1,$t1,3      # bit positions in reverse order
    	sll  $t1,$t1,1      # led is 2 bits
	# load LED value, get the desired bit in the loaded byte
	lbu  $t2,0($t0)
	srlv $t2,$t2,$t1    # shift LED value to lsb position
	andi $v0,$t2,0x3    # mask off any remaining upper bits
	jr   $ra
	
GameOver:
	li $v0, 4
	la $a0, gmovr_msg
	syscall
	li $v0, 10
	syscall
UserWins:
	li $v0, 4
	la $a0, win_msg1
	syscall
	li $v0, 1
	move $a0, $s2
	syscall
	li $v0, 4
	la $a0, win_msg2
	syscall
	li $v0, 10
	syscall
