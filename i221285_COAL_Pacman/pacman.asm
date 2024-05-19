INCLUDE Irvine32.inc
includelib Winmm.lib

PlaySound PROTO,
pszSound: PTR BYTE,
hmod:DWORD,
fdwSound:DWORD

BUFFER_SIZE = 5000

.data

ground BYTE "-----------------------------------------------------------------------------------------------------------------------",0
ground1 BYTE "|",0ah,0
ground2 BYTE "|",0
wallh BYTE "-",0

menu0 BYTE "     _____         _____         _____        ______  _______         _____  _____   ______   ",0
menu1 BYTE " ___|\    \    ___|\    \    ___|\    \      |      \/       \    ___|\    \|\    \ |\     \  ",0
menu2 BYTE "|    |\    \  /    /\    \  /    /\    \    /          /\     \  /    /\    \\\    \| \     \ ",0
menu3 BYTE "|    | |    ||    |  |    ||    |  |    |  /     /\   / /\     ||    |  |    |\|    \  \     |",0
menu4 BYTE "|    |/____/||    |__|    ||    |  |____| /     /\ \_/ / /    /||    |__|    | |     \  |    |",0
menu5 BYTE "|    ||    |||    .--.    ||    |   ____ |     |  \|_|/ /    / ||    .--.    | |      \ |    |",0
menu6 BYTE "|    ||____|/|    |  |    ||    |  |    ||     |       |    |  ||    |  |    | |    |\ \|    |",0
menu7 BYTE "|____|       |____|  |____||\ ___\/    /||\____\       |____|  /|____|  |____| |____||\_____/|",0
menu8 BYTE "|    |       |    |  |    || |   /____/ || |    |      |    | / |    |  |    | |    |/ \|   ||",0
menu9 BYTE "|____|       |____|  |____| \|___|    | / \|____|      |____|/  |____|  |____| |____|   |___|/",0
menu10 BYTE "  \(           \(      )/     \( |____|/     \(          )/       \(      )/     \(       )/  ",0


gamemenu0 BYTE "_________                                 ______  ___                      ",0
gamemenu1 BYTE "__  ____/______ ________ ___ _____        ___   |/  /_____ _______ ____  __",0
gamemenu2 BYTE "_  / __  _  __ `/__  __ `__ \_  _ \       __  /|_/ / _  _ \__  __ \_  / / /",0
gamemenu3 BYTE "/ /_/ /  / /_/ / _  / / / / //  __/       _  /  / /  /  __/_  / / // /_/ / ",0
gamemenu4 BYTE "\____/   \__,_/  /_/ /_/ /_/ \___/        /_/  /_/   \___/ /_/ /_/ \__,_/  ",0

instructionsmenu0 BYTE "________                _____                        _____ _____                        ",0
instructionsmenu1 BYTE "____  _/_______ __________  /_____________  ___________  /____(_)______ _______ ________",0
instructionsmenu2 BYTE "___  /  __  __ \__  ___/_  __/__  ___/_  / / /_  ___/_  __/__  / _  __ \__  __ \__  ___/",0
instructionsmenu3 BYTE "__/ /   _  / / /_(__  ) / /_  _  /    / /_/ / / /__  / /_  _  /  / /_/ /_  / / /_(__  ) ",0
instructionsmenu4 BYTE "/___/   /_/ /_/ /____/  \__/  /_/     \__,_/  \___/  \__/  /_/   \____/ /_/ /_/ /____/  ",0

pausemenu0 BYTE "_________                                 ________                               _________",0
pausemenu1 BYTE "__  ____/______ ________ ___ _____        ___  __ \______ _____  _______________ ______  /",0
pausemenu2 BYTE "_  / __  _  __ `/__  __ `__ \_  _ \       __  /_/ /_  __ `/_  / / /__  ___/_  _ \_  __  / ",0
pausemenu3 BYTE "/ /_/ /  / /_/ / _  / / / / //  __/       _  ____/ / /_/ / / /_/ / _(__  ) /  __// /_/ /  ",0
pausemenu4 BYTE "\____/   \__,_/  /_/ /_/ /_/ \___/        /_/      \__,_/  \__,_/  /____/  \___/ \__,_/   ",0


lifelostmenu0 BYTE "  ________________________________   ______ ___________________________",0
lifelostmenu1 BYTE "___  /____  _/__  ____/__  ____/   ___  / __  __ \_  ___/__  __/__  /  ",0
lifelostmenu2 BYTE "__  /  __  / __  /_   __  __/      __  /  _  / / /____ \__  /  __  /   ",0
lifelostmenu3 BYTE "_  /____/ /  _  __/   _  /___      _  /___/ /_/ /____/ /_  /    /_/    ",0
lifelostmenu4 BYTE "/_____/___/  /_/      /_____/      /_____/\____/ /____/ /_/    (_)     ",0

gameovermenu0 BYTE "_____________________  ____________   __________    ________________________",0
gameovermenu1 BYTE "__  ____/__    |__   |/  /__  ____/   __  __ \_ |  / /__  ____/__  __ \__  /",0
gameovermenu2 BYTE "_  / __ __  /| |_  /|_/ /__  __/      _  / / /_ | / /__  __/  __  /_/ /_  / ",0
gameovermenu3 BYTE "/ /_/ / _  ___ |  /  / / _  /___      / /_/ /__ |/ / _  /___  _  _, _/ /_/  ",0
gameovermenu4 BYTE "\____/  /_/  |_/_/  /_/  /_____/      \____/ _____/  /_____/  /_/ |_| (_)   ",0

box0 BYTE "+------------------------+",0
box1 BYTE "|                        |",0

playerxy BYTE 3600 dup(0)
index DWORD 0

 ;File Handling
filename BYTE "Highscore.txt",0
buffer byte BUFFER_SIZE dup(?)
fileHandler Handle ?
String_of_Names BYTE 1000 dup(?)
SizeTemp DWORD ?
NameTemp byte 30 dup(?)

temp byte ?
temp2 dword ?

strScore BYTE "Your score is: ",0
livesprompt BYTE "Remaining Lives: ",0
levelprompt BYTE "Current Level: ",0
askname BYTE "Enter your Name:  ",0
printgreetings BYTE "Welcome to PACMAN!         (Press X to exit)",0
startprompt BYTE "Start (Press S)",0
instructionsprompt BYTE "Instructions (Press I)",0
exitprompt BYTE "Exit (Press X)",0
continueprompt BYTE "Continue (Press C)",0
enterinput BYTE "Enter Input:  ",0
playagainprompt BYTE "Play Again? (Press C)",0
yournameprompt BYTE "Your Name: ",0
scoreprompt BYTE "Score: ",0

;total score for level 1 = 762

instructions BYTE "1) Objective:", 10, 13, "Navigate Pac-Man through the maze, consume all the pellets, and avoid ghosts to achieve the highest score possible.", 10, 13, 10, 13
             BYTE "2) Controls:", 10, 13, "Use the WASD keys (Up, Down, Left, Right) to move Pac-Man in the corresponding directions.", 10, 13, 10, 13
             BYTE "3) Game Elements:", 10, 13, "Pellets: Eat all the small pellets scattered throughout the maze to advance to the next level.", 10, 13, "Power Pellets: Consume power pellets to temporarily turn the tables on ghosts.", 10, 13, "Fruits: Periodically, fruits appear for bonus points. Eat them before they disappear.", 10, 13, 10, 13
             BYTE "4) Scoring:", 10, 13, "Eating small pellets: 10 points each.", 10, 13, "Eating power pellets: 50 points each.", 10, 13, 10, 13
             BYTE "5) Ghosts:", 10, 13, "Ghosts roam the maze with different behaviors.", 10, 13, 10, 13
             BYTE "6) Lives:", 10, 13, "You start with three lives. 3 collisions and you are dead", 10, 13, 10, 13
             BYTE "7) Levels:", 10, 13, "Each level increases in difficulty, with faster ghosts and more challenging mazes.", 10, 13, 10, 13
             BYTE "              Have Fun!", 10, 13, 0

lifelosingprompt1 BYTE "      Looks like someone is struggling to play such a simple game!",0
lifelosingprompt2 BYTE "                   Yikes, I feel bad for you :( ",0
lifelosingprompt3 BYTE "Mom, it seems that I'm still better than some people out there for sure",0
lifelosingprompt4 BYTE "                    Game Tip: Try pressing X",0

score DWORD 0
level DWORD 1
lives BYTE 3
collision BYTE 0
teleport BYTE 0
random BYTE 0
steps BYTE 0
namesize BYTE 0

isname BYTE 30 dup(?)
iscontinued BYTE 0

xPos BYTE 19
yPos BYTE 22

txPos BYTE 0
tyPos BYTE 0

x2Pos BYTE 59
y2Pos BYTE 12

xCoinPos BYTE ?
yCoinPos BYTE ?

inputChar BYTE ?

;Music
pacmanmusic1 BYTE "C:\Users\hp\Desktop\i221285_COAL_Pacman\i221285_COAL_Pacman\pacman_beginning.wav",0
pacmanmusic2 BYTE "C:\Users\hp\Desktop\i221285_COAL_Pacman\i221285_COAL_Pacman\next_menu.wav",0
pacmanmusic3 BYTE "C:\Users\hp\Desktop\i221285_COAL_Pacman\i221285_COAL_Pacman\invalid-selection.wav",0
pacmanmusic4 BYTE "C:\Users\hp\Desktop\i221285_COAL_Pacman\i221285_COAL_Pacman\Mission Failed We'll Get Em Next Time.wav",0

;array for sequence of random numbers
random_ghost BYTE 100 dup(?)
idx BYTE 0

;array for level 1 maze walls
walls1v BYTE 16,10,12, 15,10,12, 14,10,12, 38,10,12, 37,10,12, 36,10,12, 78,10,12, 77,10,12, 76,10,12, 102,10,12, 101,10,12, 100,10,12
walls1h BYTE 6,5,18, 36,5,18, 66,5,18, 96,5,18, 6,25,18, 36,25,18, 66,25,18, 96,25,18
is_walls_temp BYTE 0
sizes BYTE 0

;array for level 2 maze walls (x,y,length)
walls2v BYTE 14,2,4, 102,2,4,  18,11,8, 98,11,8, 24,21,6, 90,21,6
walls2h BYTE 1,11,35, 83,11,35, 25,21,65, 26,5,62

;array for level 3 maze walls (x,y,length)
walls3v BYTE 14,22,7, 102,22,7, 14,3,6, 102,3,6,  32,8,10, 84,8,10,  24,21,6, 90,21,6
walls3h BYTE 1,11,20, 98,11,20, 1,19,20, 98,19,20, 10,5,9, 98,5,9, 25,21,65, 32,7,15, 70,7,15

.code

main PROC
   
    mov edx , offset fileName 
    call openInputFile 
    mov FileHandler , eax 

    mov eax , FileHandler 
    mov edx , offset String_of_Names 
    mov ecx ,  1000 
    call ReadFromFile
    mov SizeTemp , eax 

    mov eax , FileHandler
    call CloseFile 


    comment $
    
    ;For sound
    INVOKE PlaySound, OFFSET pacmanmusic1, NULL, 0h

    $
   
    start_over:
    mov eax,0
    mov al, xPos
    mov ah, yPos
    push eax
    mov ebx,0
    mov bl, x2Pos
    mov bh, y2Pos
    push ebx


    call clrscr
    call menu
    call clrscr

    call gamemenu
    INVOKE PlaySound, OFFSET pacmanmusic2, NULL, 0h
    call clrscr

    pop ebx
    mov y2Pos, bh
    mov x2Pos, bl
    pop eax
    mov xPos, al
    mov yPos, ah

    update:
    ;spawn all the coins first
    call DrawAllCoins

    gamecontinue:
    call clrscr
    call DrawPausedCoins

    cmp level, 1
    je is_1

    cmp level,2
    je is_2

    call DrawWalls3
    jmp go_ahead

    is_1:
    call DrawWalls1
    jmp go_ahead
    
    is_2:
    call DrawWalls2

    go_ahead:

    ; draw ground at (0,29):
    mov eax,brown(white * 16)
    call SetTextColor
    mov dl,0
    mov dh,29
    call Gotoxy
    mov edx,OFFSET ground
    call WriteString

    ;top border
    mov dl,0
    mov dh,1
    call Gotoxy
    mov edx,OFFSET ground
    call WriteString
    
    ;left border
    mov ecx,27
    mov dh,2
    l1:
    mov dl,0
    call Gotoxy
    mov eax,15
    call Delay
    mov edx,OFFSET ground1
    call WriteString
    loop l1

    ;right border
    mov ecx,27
    mov dh,2
    mov temp,dh
    l2:
        mov dh,temp
        mov dl,118
        call Gotoxy
        mov eax,15
        call Delay
        mov edx,OFFSET ground2
        call WriteString
        inc temp
        loop l2
   
    call CentreBox
    call DrawPlayer
    call DrawGhost

    comment $
    call CreateRandomCoin
    call DrawCoin

    call Randomize
    ; gravity logic:
    gravity:
    cmp yPos,27
    jg onGround

    ; make player fall:
    call UpdatePlayer
    inc yPos
    call DrawPlayer
    mov eax,80
    call Delay
    ;jmp gravity
    onGround:
    $

    mov esi, offset playerxy

    gameLoop:
        
        mov collision, 0
        mov teleport, 0

        cmp level,1
        je check_end_score_limit
        jne try_next2

        check_end_score_limit:
        cmp score,40
        jl dont_increase_level
        jge is_increased

        try_next2:
        cmp level,2
        je check_end_score_limit2
        jne try_next3

        check_end_score_limit2:
        cmp score,40
        jl dont_increase_level
        jge is_increased

        try_next3:
        cmp level,3
        je check_end_score_limit3
        jne dont_increase_level

        check_end_score_limit3:
        cmp score,40
        jl dont_increase_level
        jge call_end_screen

        call_end_screen:
        inc level
        mov eax,white (black * 16)
        call SetTextColor
        call lifelostmenu
        call ResetValues
        jmp start_over

        is_increased:
        inc level
        call ResetValues 
        call clrscr
        jmp update


        dont_increase_level:

        comment $
        ; getting points:
        mov bl,xPos
        cmp bl,xCoinPos
        jne notCollecting
        mov bl,yPos
        cmp bl,yCoinPos
        jne notCollecting
        ; player is intersecting coin:
        add score,10
        call CreateRandomCoin
        call DrawCoin
        notCollecting:
        $

        ;draw lives
        mov dl,80
        mov dh,0
        call Gotoxy
        mov eax,blue(black * 16)
        call SetTextColor
        mov edx,OFFSET livesprompt
        call WriteString
        mov eax,red(white * 16)
        call SetTextColor
        mov al,lives
        call WriteInt

        mov eax,white (black * 16)
        call SetTextColor

        ; draw score:
        mov dl,0
        mov dh,0
        call Gotoxy
        mov edx,OFFSET strScore
        call WriteString
        mov eax,score
        call WriteInt
        
        ; draw level:
        mov dl,45
        mov dh,0
        call Gotoxy
        mov edx,OFFSET levelprompt
        call WriteString
        mov eax,level
        call WriteInt

        ;For cursor to not blink like crazy
        mov eax,30         ;delay between input and the updation on console
        call Delay

        ;comment $

        ;move Ghost
        mov eax,60         ;delay between input and the updation on console
        call Delay
        call CheckGhostCollision

        ;check if ghost hits pacman
        mov al, xPos
        cmp al,x2Pos
        je check1
        jne nohit
        
        check1:
            mov al, yPos
            cmp al,y2Pos
            jne nohit
            dec lives
            call lifelostmenu
            cmp lives,0
            je start_over_reset
            jne gamecontinue
            
            start_over_reset:
            call ResetValues
            jmp start_over
            
        nohit:
     
        mov collision, 0

        ; get user key input
        call ReadKey         ; look for keyboard input
        jz loop_again          ; no key pressed yet
        mov inputChar,al

        ; exit game if user types 'x':
        cmp inputChar,"x"
        je exitGame

        cmp inputChar,"p"
        je gamepaused

        cmp inputChar,"w"
        je moveUp

        cmp inputChar,"s"
        je moveDown

        cmp inputChar,"a"
        je moveLeft

        cmp inputChar,"d"
        je moveRight
        jne loop_again

        gamepaused:
        mov al, xPos
        mov bl, yPos
        push eax
        push ebx
        ;pusha
        dec lives
        ;call lifelostmenu
        call pausemenu
        ;popa
        pop ebx
        mov yPos, bl
        pop eax
        mov xPos, al
        
        jmp gamecontinue

        mov ecx,0

        moveUp:
        ;allow player to jump:
        ;mov ecx,1
        ;jumpLoop:
           
            ;collision logic
            cmp yPos, 2
            je loop_again            

            dec yPos
            mov al, xPos
            mov txPos, al
            mov al, yPos
            mov tyPos, al
            call HorizontalCollision
            inc yPos
            cmp collision,1
            je loop_again

            dec yPos
            dec yPos
            mov cl, xPos
            mov ch, yPos
            call CentreBoxCollision
            inc yPos
            inc yPos

            cmp collision,1
            je loop_again

            call UpdatePlayer
            dec yPos
            dec yPos
            ;push ecx
            call DrawPlayer
            ;pop ecx
            ;mov eax,70         ;delay between input and the updation on console
            ;call Delay
        ;loop jumpLoop
        jmp loop_again

        moveDown:

        ;collision logic
        cmp yPos, 28
        je loop_again 

        inc yPos
        mov al, xPos
        mov txPos, al
        mov al, yPos
        mov tyPos, al
        call HorizontalCollision
        dec yPos
        cmp collision,1
        je loop_again


        inc yPos
        inc yPos
        mov cl, xPos
        mov ch, yPos
        call CentreBoxCollision
        dec yPos
        dec yPos

        cmp collision,1
        je loop_again

        call UpdatePlayer
        inc yPos
        inc yPos
        call DrawPlayer
        jmp loop_again

        moveLeft:

        cmp level,3
        jne tele_not_allowed
        
        ;Teleportation
        call Teleportfunl
        cmp teleport,1
        je is_teleported

        tele_not_allowed:
        ;collision logic
        cmp xPos, 1
        je loop_again

        dec xPos
        mov al, xPos
        mov txPos, al
        mov al, yPos
        mov tyPos, al
        call VerticalCollision
        inc xPos
        cmp collision,1
        je loop_again


        dec xPos
        dec xPos
        mov cl, xPos
        mov ch, yPos
        call CentreBoxCollision
        inc xPos
        inc xPos

        cmp collision,1
        je loop_again

        call UpdatePlayer
        dec xPos
        dec xPos
        call DrawPlayer

        is_teleported:
        mov teleport,0
        jmp loop_again

        moveRight:

        cmp level,3
        jne tele_not_allowed2

        ;Teleportation
        call Teleportfunr
        cmp teleport,1
        je is_teleported

        tele_not_allowed2:

        ;collision logic
        cmp xPos, 117
        je loop_again

        inc xPos
        mov al, xPos
        mov txPos, al
        mov al, yPos
        mov tyPos, al
        call VerticalCollision
        dec xPos
        cmp collision,1
        je loop_again

        inc xPos
        inc xPos
        mov cl, xPos
        mov ch, yPos
        call CentreBoxCollision
        dec xPos
        dec xPos

        cmp collision,1
        je loop_again

        call UpdatePlayer
        inc xPos
        inc xPos
        call DrawPlayer
        jmp loop_again

    loop_again:
    inc steps
    cmp steps,20
    jne gameLoop

    mov steps,0
    jmp gameLoop

    exitGame:

    call gameend

    exit
main ENDP

menu PROC

    mov eax,yellow(black * 16)
    call SetTextColor

    mov dl,15
    mov dh,5
    call Gotoxy
    mov eax,50
    call Delay
    mov edx,OFFSET menu0
    call WriteString

    mov dl,15
    mov dh,6
    call Gotoxy
    mov eax,50
    call Delay
    mov edx,OFFSET menu1
    call WriteString

    mov dl,15
    mov dh,7
    call Gotoxy
    mov eax,50
    call Delay
    mov edx,OFFSET menu2
    call WriteString

    mov dl,15
    mov dh,8
    call Gotoxy
    mov eax,50
    call Delay
    mov edx,OFFSET menu3
    call WriteString

    mov dl,15
    mov dh,9
    call Gotoxy
    mov eax,50
    call Delay
    mov edx,OFFSET menu4
    call WriteString

    mov dl,15
    mov dh,10
    call Gotoxy
    mov eax,50
    call Delay
    mov edx,OFFSET menu5
    call WriteString

    
    mov dl,15
    mov dh,11
    call Gotoxy
    mov eax,50
    call Delay
    mov edx,OFFSET menu6
    call WriteString

    
    mov dl,15
    mov dh,12
    call Gotoxy
    mov eax,50
    call Delay
    mov edx,OFFSET menu7
    call WriteString

    
    mov dl,15
    mov dh,13
    call Gotoxy
    mov eax,50
    call Delay
    mov edx,OFFSET menu8
    call WriteString

    mov dl,15
    mov dh,14
    call Gotoxy
    mov eax,50
    call Delay
    mov edx,OFFSET menu9
    call WriteString

    mov dl,15
    mov dh,15
    call Gotoxy
    mov eax,50
    call Delay
    mov edx,OFFSET menu10
    call WriteString
    
   call crlf
   call crlf
   call crlf

   ;file handling procedure
   mov dl,30
   mov dh,17
   call Gotoxy
   mov edx,OFFSET askname
   call WriteString

   mov eax,white(black * 16)
   call SetTextColor

   mov dl,55
   mov dh,17
   call Gotoxy
   mov edx, offset isname
   mov ecx, 30
   call ReadString 
   mov namesize, al
    
   ;For sound
   ;INVOKE PlaySound, OFFSET pacmanmusic1, NULL, 0h

   mov dl,30
   mov dh,21
   call Gotoxy
   mov edx,OFFSET printgreetings
   call WriteString

   again:
   call ReadChar
   mov inputChar,al
   
   cmp inputChar,"x"
   je exit1

   cmp inputChar,0Dh
   je returned

   jne is_again
   
   is_again:
   INVOKE PlaySound, OFFSET pacmanmusic3, NULL, 11h
   jmp again
   
   returned:
   INVOKE PlaySound, OFFSET pacmanmusic2, NULL, 11h
   ret
   exit1:
       call gameend
       exit

menu ENDP

gamemenu PROC
    
    call clrscr

    mov eax,magenta(black * 16)
    call SetTextColor

    mov txPos, 25
    mov tyPos, 5
    mov ecx,OFFSET gamemenu0
    call PrintTitle 
    
    inc tyPos
    mov ecx,OFFSET gamemenu1
    call PrintTitle 

    inc tyPos
    mov ecx,OFFSET gamemenu2
    call PrintTitle 

    inc tyPos
    mov ecx,OFFSET gamemenu3
    call PrintTitle 

    inc tyPos
    mov ecx,OFFSET gamemenu4
    call PrintTitle 
    
    ;print boxes
   mov eax,white(black * 16)
   call SetTextColor

    mov txPos, 20
    mov tyPos, 13
    call PrintBox

    mov txPos, 52
    mov tyPos, 13
    call PrintBox

    mov txPos, 82
    mov tyPos, 13
    call PrintBox


    ;print text in boxes
    mov dl,24
    mov dh,15
    call Gotoxy
    mov edx,OFFSET startprompt
    call WriteString

    mov dl,54
    mov dh,15
    call Gotoxy
    mov edx,OFFSET instructionsprompt
    call WriteString

    mov dl,87
    mov dh,15
    call Gotoxy
    mov edx,OFFSET exitprompt
    call WriteString

    ;selection?
   mov dl,28
   mov dh,22
   call Gotoxy
   mov edx,OFFSET enterinput
   call WriteString

   again:
   mov eax,0
   ;wait for input
   call ReadChar
   mov inputChar,al
   
   cmp inputChar,"x"
   je exit1

   cmp inputChar,"i"
   je instructionsmenulabel

   cmp inputChar,"s"
   je returnedback
   jne is_again

   instructionsmenulabel:
   call instructionsmenu

   mov eax,white(black * 16)
   call SetTextColor

   call gamemenu

   returnedback:
        ret
   exit1:
         call gameend
         exit

   is_again:
   INVOKE PlaySound, OFFSET pacmanmusic3, NULL, 11h
   jmp again

gamemenu ENDP

instructionsmenu PROC
    
    INVOKE PlaySound, OFFSET pacmanmusic2, NULL, 11h
    call clrscr

    mov eax,magenta(black * 16)
    call SetTextColor

    mov txPos, 21
    mov tyPos, 3
    mov ecx,OFFSET instructionsmenu0
    call PrintTitle 
    
    inc tyPos
    mov ecx,OFFSET instructionsmenu1
    call PrintTitle 

    inc tyPos
    mov ecx,OFFSET instructionsmenu2
    call PrintTitle 

    inc tyPos
    mov ecx,OFFSET instructionsmenu3
    call PrintTitle 

    inc tyPos
    mov ecx,OFFSET instructionsmenu4
    call PrintTitle 

    mov eax,blue(black * 16)
    call SetTextColor
    mov txPos, 1
    add tyPos, 5
    mov ecx,OFFSET instructions
    call PrintTitle 

    call crlf
    call crlf

    mov eax,red(yellow * 16)
    call SetTextColor
    
    mov edx,OFFSET exitprompt
    call WriteString

   is_again:
   call ReadChar 
    
   mov inputChar,al

   cmp inputChar,"x"
   je backgamemenu
   jne is_here

   backgamemenu:
   INVOKE PlaySound, OFFSET pacmanmusic2, NULL, 11h
   ret

   is_here:
   INVOKE PlaySound, OFFSET pacmanmusic3, NULL, 11h
   jmp is_again

instructionsmenu ENDP

pausemenu PROC
    
    INVOKE PlaySound, OFFSET pacmanmusic2, NULL, 11h
    call clrscr

    mov eax,magenta(black * 16)
    call SetTextColor

    mov txPos, 21
    mov tyPos, 3
    mov ecx,OFFSET pausemenu0
    call PrintTitle 
    
    inc tyPos
    mov ecx,OFFSET pausemenu1
    call PrintTitle 

    inc tyPos
    mov ecx,OFFSET pausemenu2
    call PrintTitle 

    inc tyPos
    mov ecx,OFFSET pausemenu3
    call PrintTitle 

    inc tyPos
    mov ecx,OFFSET pausemenu4
    call PrintTitle 

    ;print boxes
    mov eax,white(black * 16)
    call SetTextColor

    mov txPos, 20
    mov tyPos, 13
    call PrintBox

    mov txPos, 52
    mov tyPos, 13
    call PrintBox

    mov txPos, 82
    mov tyPos, 13
    call PrintBox


    ;print text in boxes
    mov dl,24
    mov dh,15
    call Gotoxy
    mov edx,OFFSET continueprompt
    call WriteString

    mov dl,54
    mov dh,15
    call Gotoxy
    mov edx,OFFSET instructionsprompt
    call WriteString

    mov dl,87
    mov dh,15
    call Gotoxy
    mov edx,OFFSET exitprompt
    call WriteString

   is_again:
   ;selection?
   mov dl,28
   mov dh,22
   call Gotoxy
   mov edx,OFFSET enterinput
   call WriteString

   again:
   mov eax,0
   ;wait for input
   call ReadChar
   mov inputChar,al

   cmp inputChar,"x"
   je exit1

   cmp inputChar,"i"
   je instructionsmenulabel

   cmp inputChar,"c"
   je returnedback
   jne is_againn

   instructionsmenulabel:
   pusha
   call instructionsmenu
   popa
   
   mov eax,white(black * 16)
   call SetTextColor
   jmp exit1

   jne is_againn

   returnedback:
   INVOKE PlaySound, OFFSET pacmanmusic2, NULL, 11h
       ret
   exit1:
       ret

    is_againn:
        INVOKE PlaySound, OFFSET pacmanmusic3, NULL, 11h
    jmp again

pausemenu ENDP

lifelostmenu PROC

    INVOKE PlaySound, OFFSET pacmanmusic4, NULL, 11h
    call clrscr

    mov eax,magenta(black * 16)
    call SetTextColor

    mov txPos, 21
    mov tyPos, 3

    cmp lives,0
    je gameoverprompt
    
    cmp level,4
    je gameoverprompt

    mov ecx,OFFSET lifelostmenu0
    call PrintTitle 
    
    inc tyPos
    mov ecx,OFFSET lifelostmenu1
    call PrintTitle 

    inc tyPos
    mov ecx,OFFSET lifelostmenu2
    call PrintTitle 

    inc tyPos
    mov ecx,OFFSET lifelostmenu3
    call PrintTitle 

    inc tyPos
    mov ecx,OFFSET lifelostmenu4
    call PrintTitle 

    jmp is_out

    gameoverprompt:
    call gameend
    

    is_out:

    mov eax,blue(black * 16)
    call SetTextColor
    mov txPos, 24
    mov tyPos, 12

    mov eax,4
    call RandomRange
    cmp eax,0
    je is_0

    cmp eax,1
    je is_1

    cmp eax,2
    je is_2

    cmp eax,3
    je is_3

    is_0:
    mov ecx,OFFSET lifelosingprompt1
    call PrintTitle
    jmp is_exit

    is_1:
    mov ecx,OFFSET lifelosingprompt2
    call PrintTitle
    jmp is_exit

    is_2:
    mov ecx,OFFSET lifelosingprompt3
    call PrintTitle
    jmp is_exit

    is_3:
    mov ecx,OFFSET lifelosingprompt4
    call PrintTitle
    jmp is_exit

    is_exit:
    ;print boxes
    mov eax,white(black * 16)
    call SetTextColor

    mov txPos, 20
    mov tyPos, 18
    call PrintBox

    mov txPos, 67
    mov tyPos, 18
    call PrintBox


    ;print text in boxes
    mov dl,23
    mov dh,20
    call Gotoxy
    mov edx,OFFSET continueprompt
    call WriteString

    mov dl,72
    mov dh,20
    call Gotoxy
    mov edx,OFFSET exitprompt
    call WriteString

   ;selection?
   mov dl,30
   mov dh,25
   call Gotoxy
   mov edx,OFFSET enterinput
   call WriteString

   again:
   mov eax,0
   ;wait for input
   call ReadChar
   mov inputChar,al
   
   cmp inputChar,"x"
   je exit1

   cmp inputChar,"c"
   je returnedback

   jne is_again

   returnedback:
       INVOKE PlaySound, OFFSET pacmanmusic2, NULL, 11h
       ret
   exit1:
       exit

    is_again:
     INVOKE PlaySound, OFFSET pacmanmusic3, NULL, 11h
    jmp again
 
lifelostmenu ENDP


gameend PROC

mov esi , offset String_of_Names 
add esi , SizeTemp 

mov bl , 0ah 
mov [esi] , bl 
add esi , 1 
inc SizeTemp 


mov edi, 0
mov ecx,30
movzx ecx,namesize

salman: 
mov bl , isname[edi]
mov [esi] , bl 

inc esi 
inc edi 
inc SizeTemp 

loop salman

mov bl," "
mov [esi],bl
inc esi
inc SizeTemp 
mov [esi],bl
inc esi
inc SizeTemp 
mov eax,score
mov bl,100
div bl
OR al,30h
mov [esi],al
inc esi
inc SizeTemp 
movzx eax,ah
mov bl,10
div bl
OR al,30h
mov [esi],al
inc esi
inc SizeTemp 
OR ah,30h
mov [esi],ah
inc esi
inc SizeTemp 
mov  edx, OFFSET FileName
call CreateOutputFile
mov  FileHandler, EAX

mov  eax, fileHandler
mov  edx, OFFSET String_of_Names
mov  ecx, SizeTemp
call WriteToFile


mov  eax, fileHandler
call CloseFile


    INVOKE PlaySound, OFFSET pacmanmusic4, NULL, 11h
    call clrscr

    mov eax,magenta(black * 16)
    call SetTextColor

    mov txPos, 21
    mov tyPos, 3

    mov ecx,OFFSET gameovermenu0
    call PrintTitle 
    
    inc tyPos
    mov ecx,OFFSET gameovermenu1
    call PrintTitle 

    inc tyPos
    mov ecx,OFFSET gameovermenu2
    call PrintTitle 

    inc tyPos
    mov ecx,OFFSET gameovermenu3
    call PrintTitle 

    inc tyPos
    mov ecx,OFFSET gameovermenu4
    call PrintTitle 

    mov eax,blue(black * 16)
    call SetTextColor
    mov txPos, 24
    mov tyPos, 12

    cmp lives,0
    je print_details

    mov eax,4
    call RandomRange
    cmp eax,0
    je is_0

    cmp eax,1
    je is_1

    cmp eax,2
    je is_2

    cmp eax,3
    je is_3

    is_0:
    mov ecx,OFFSET lifelosingprompt1
    call PrintTitle
    jmp is_exit

    is_1:
    mov ecx,OFFSET lifelosingprompt2
    call PrintTitle
    jmp is_exit

    is_2:
    mov ecx,OFFSET lifelosingprompt3
    call PrintTitle
    jmp is_exit

    is_3:
    mov ecx,OFFSET lifelosingprompt4
    call PrintTitle
    jmp is_exit
    
    print_details:
    mov ecx,OFFSET yournameprompt
    call PrintTitle

    add txPos, 20
    mov ecx,OFFSET isname
    call PrintTitle
    sub txPos, 20

    add tyPos, 2
    mov ecx,OFFSET scoreprompt
    call PrintTitle

    add txPos, 20
    mov dl, txPos
    mov dh, tyPos
    call Gotoxy
    mov eax,score
    call writeint

    is_exit:
    ;print boxes
    mov eax,white(black * 16)
    call SetTextColor

    mov txPos, 20
    mov tyPos, 18
    call PrintBox

    mov txPos, 67
    mov tyPos, 18
    call PrintBox


    ;print text in boxes
    mov dl,23
    mov dh,20
    call Gotoxy
    cmp lives,0
    je prompt_again
    mov edx,OFFSET continueprompt
    jmp bahir
    prompt_again:
    mov edx,OFFSET playagainprompt
    bahir:
    call WriteString

    mov dl,72
    mov dh,20
    call Gotoxy
    mov edx,OFFSET exitprompt
    call WriteString

   ;selection?
   mov dl,30
   mov dh,25
   call Gotoxy
   mov edx,OFFSET enterinput
   call WriteString

   again:
   mov eax,0
   ;wait for input
   call ReadChar
   mov inputChar,al
   
   cmp inputChar,"x"
   je exit1

   cmp inputChar,"c"
   je returnedback

   jne is_again

   returnedback:
       INVOKE PlaySound, OFFSET pacmanmusic2, NULL, 11h
       ret
   exit1:
       exit

    is_again:
     INVOKE PlaySound, OFFSET pacmanmusic3, NULL, 11h
    jmp again


ret
gameend ENDP














PrintBox PROC
    mov eax,white(black * 16)
    call SetTextColor
    mov dl,txPos
    mov dh,tyPos
    call Gotoxy
    mov eax,5
    call Delay
    mov edx,OFFSET box0
    call WriteString

    mov ecx,4
    loopbox:
        inc tyPos
        mov dl,txPos
        mov dh,tyPos
        call Gotoxy
        mov eax,5
        call Delay
        mov edx,OFFSET box1
        call WriteString
    loop loopbox
    
    mov dl,txPos
    mov dh,tyPos
    call Gotoxy
    mov eax,5
    call Delay
    mov edx,OFFSET box0
    call WriteString

    ret
PrintBox ENDP

PrintTitle PROC

    mov dl,txPos
    mov dh,tyPos
    call Gotoxy
    mov eax,40
    call Delay
    mov edx, ecx
    call WriteString

    ret
PrintTitle ENDP

DrawPlayer PROC
    ; draw player at (xPos, yPos):
    mov eax, yellow(green*16)
    call SetTextColor

    mov esi, offset playerxy

    mov ecx, 0  ; Initialize loop counter
    mov ebx, 0  ; Initialize array index

l1:
    ; Check if current x-coordinate matches xPos
    mov al, [esi + ebx ]
    cmp al, xPos
    je check1
    jne check0

check1:
    ; Check if corresponding y-coordinate matches yPos
    mov al, [esi + ebx + 1]
    cmp al, yPos
    je exit3
    jne check0

exit3:
    ; Player coordinates already in the array, exit
    jmp draw

check0:
    ; Check if current entry is zero (end of array)
    cmp byte ptr [esi + ebx ], 0
    je exit0

    ; Move to the next entry in the array
    add ebx, 2  ; Each player coordinates takes 2 bytes

    ; Check if we have reached the end of the array
    cmp ebx, ecx
    jne l1

    ; If we reached here, the player coordinates are not in the array
    jmp exit2

exit0:
    ; Store xPos in the array
    mov al, [xPos]
    mov [esi + ebx ], al
    ; Store yPos in the array
    mov al, [yPos]
    mov [esi + ebx + 1], al

    ; Increment array index and counter and score
    add ecx, 2  ; Increment array counter by 2 (two coordinates)
    inc ebx

    cmp level,1
    je is_skipped

    cmp xPos,5
    je c1
    cmp xPos,91
    je c1

    jne c2

    c1:
        cmp yPos, 6
        je is_increased

    c2:
    cmp xPos,91
    je c3
    cmp xPos, 5
    je c3
    jne is_skipped

    c3:
        cmp yPos, 26
        je is_increased
        jne is_skipped

    is_increased:
    add score, 20
    jmp draw

    is_skipped:
    inc score

    draw:
    ; Draw player
    mov dl, xPos
    mov dh, yPos
    call Gotoxy
    mov al, "P"
    call WriteChar

    ret

exit2:
    ; The array is full, exit
    mov ecx,0
    ret

DrawPlayer ENDP

DrawGhost PROC
    ; draw ghost at (x2Pos,y2Pos):
    mov eax,blue(magenta*16)
    call SetTextColor
    mov dl,x2Pos
    mov dh,y2Pos
    call Gotoxy
    mov al,"G"
    call WriteChar
    mov eax,white(black * 16)
    call SetTextColor
    ret
DrawGhost ENDP

UpdatePlayer PROC
    mov dl,xPos
    mov dh,yPos
    call Gotoxy
    mov al," "
    call WriteChar
    ret
UpdatePlayer ENDP

UpdateGhost PROC

    mov eax, yellow(black*16)
    call SetTextColor

    mov dl, x2Pos
    mov dh, y2Pos
    call Gotoxy

    ; Check if (x2Pos, y2Pos) is found in playerxy array
    mov ebx, 0 ; (index in playerxy array)
    mov ecx, 1800 ; pairs in playerxy array (3600 / 2)
    xor edx, edx ; Clear edx (flag for not found)

    check_loop:
        mov al, [playerxy + ebx] ; Load x-coordinate from playerxy array
        cmp al, x2Pos ; Compare x-coordinate
        jne not_found
        mov al, [playerxy + ebx + 1] ; Load y-coordinate from playerxy array
        cmp al, y2Pos ; Compare y-coordinate
        jne not_found

        ; If (x2Pos, y2Pos) is found, set flag and exit loop
        mov edx, 1
        jmp exit_loop

    not_found:
        add ebx, 2 ; Move to the next pair in playerxy array
        loop check_loop ; Repeat 

    exit_loop:
    ; If (x2Pos, y2Pos) is found, print a space; otherwise, print a dot
    cmp edx, 1
    je is_space
    jmp to_print

    is_space:
    mov eax, black(black*16)
    call SetTextColor
    mov al, " " ; Set character to space

    to_print:
    mov al, "."
    call WriteChar
    ret
UpdateGhost ENDP

DrawCoin PROC
    mov eax,yellow (red * 16)
    call SetTextColor
    mov dl,xCoinPos
    mov dh,yCoinPos
    call Gotoxy
    mov al,"."
    call WriteChar
    ret
DrawCoin ENDP

CreateRandomCoin PROC
    mov eax,100
    inc eax
    call RandomRange
    mov xCoinPos,al
    mov eax,20
    add eax,2
    call RandomRange
    mov yCoinPos, al
    ret
CreateRandomCoin ENDP

DrawAllCoins PROC

    mov eax,yellow (black * 16)
    call SetTextColor
    
    mov ecx, 118
    outerLoop:
     
        mov ebx, ecx
        mov ecx, 28
        
        innerLoop:
            mov al,"."
            mov dl,bl
            mov dh,cl
            dec dl
            
            ;these checks are to not print coins in the centre
            cmp dh, 20
            jle check1
            jge exitx

            check1:
                cmp dh, 11
                jge check2
                jle exitx

                check2:
                    cmp dl,66
                    jle check3
                    jge exitx

                    check3:
                        cmp dl, 50
                        jge space
                        jle exitx

                        space:
                        mov al, " "
                        mov collision, 1

            exitx:

            call Gotoxy
            call WriteChar
            dec ecx
            loop innerLoop
            mov ecx, ebx
            dec ecx
    loop outerLoop
    
    cmp level,1
    je is_skipped

    mov eax,red (yellow * 16)
    call SetTextColor

    mov al,"0"
    mov dl,5
    mov dh,6
    call Gotoxy
    call WriteChar

    mov dl,91
    mov dh,6
    call Gotoxy
    call WriteChar

    mov dl,5
    mov dh,26
    call Gotoxy
    call WriteChar

    mov dl,91
    mov dh,26
    call Gotoxy
    call WriteChar


    is_skipped:

    mov eax,yellow (black * 16)
    call SetTextColor

    ret
DrawAllCoins ENDP

DrawPausedCoins PROC

    mov eax,yellow (black * 16)
    call SetTextColor
    
    mov ecx, 118
    outerLoop:
     
        mov ebx, ecx
        mov ecx, 28
        
        innerLoop:
            mov al,"."
            mov dl,bl
            mov dh,cl
            dec dl
            
            ;these checks are to not print coins in the centre
            cmp dh, 20
            jle check1
            jge exitx

            check1:
                cmp dh, 11
                jge check2
                jle exitx

                check2:
                    cmp dl,66
                    jle check3
                    jge exitx

                    check3:
                        cmp dl, 50
                        jge space
                        jle exitx

                        space:
                        mov al, " "
                        mov collision, 1

            exitx:

            call Gotoxy
            call WriteChar
            dec ecx
            loop innerLoop
            mov ecx, ebx
            dec ecx

    loop outerLoop
    
    cmp level,1
    je is_skipped

    mov eax,red (yellow * 16)
    call SetTextColor

    mov al,"0"
    mov dl,5
    mov dh,6
    call Gotoxy
    call WriteChar

    mov dl,91
    mov dh,6
    call Gotoxy
    call WriteChar

    mov dl,5
    mov dh,26
    call Gotoxy
    call WriteChar

    mov dl,101
    mov dh,26
    call Gotoxy
    call WriteChar


    is_skipped:

    mov eax,yellow (black * 16)
    call SetTextColor


    mov esi, offset playerxy

    mov ecx, 0  ; Initialize loop counter
    mov ebx, 0  ; Initialize array index

    l1:
    ; Check if current x-coordinate matches xPos
    mov dl, [esi + ebx ]
    mov dh, [esi + ebx + 1]
    call Gotoxy
    mov al, " "
    call WriteChar

    je exit0

    check0:
    ; Check if current entry is zero (end of array)
    cmp byte ptr [esi + ebx ], 0
    je exit0

    ; Move to the next entry in the array
    add ebx, 2  ; Each player coordinates takes 2 bytes

    ; Check if we have reached the end of the array
    cmp ebx, ecx
    jne l1


    exit0:
    ret
DrawPausedCoins ENDP

DrawWalls1 PROC
mov eax,brown (white * 16)
    mov eax,brown (white * 16)
    call SetTextColor

    ;vertical walls1v
    mov esi, offset walls1v     

    mov ebx, 0          ; Clear ebx
    mov ecx, 0          ; Clear ecx
    mov ax, lengthof walls1v
    mov dx, 0           ; Clear dx
    mov cx, 3           ; Divisor
    div cx              ; Divide dx:ax by cx
    mov ecx, eax          ; Move the quotient to cx


    majorloopv:
    ;load x-cordinates from walls1v array (each is vertical wall of length 12) 
    mov dh, [esi+1]
    mov ebx, ecx        ;temp ebx
    mov cl,[esi+2]     ;length of wall
    mov is_walls_temp, dh
    l1:
        mov dl,[esi]
        mov dh,is_walls_temp
        call Gotoxy
        inc dh
        mov is_walls_temp, dh
        mov edx,OFFSET ground1
        call WriteString
        loop l1
        mov ecx, ebx
        inc esi
        inc esi
        inc esi
    loop majorloopv
    

    ;horizontal walls1h

    mov esi, offset walls1h
    mov ebx, 0          ; Clear ebx
    mov ecx, 0          ; Clear ecx
    mov ax, lengthof walls1h
    mov edx, 0           ; Clear dx
    mov cx, 3           ; Divisor
    div cx              ; Divide dx:ax by cx
    mov ecx, eax          ; Move the quotient to cx

    majorlooph:
    ;load y-cordinates from walls1h array (each is vertical wall of length 18) 
    mov dl, [esi]
    mov ebx, ecx             ;temp ebx
    mov cl,[esi+2]          ;length of wall
    mov is_walls_temp, dl
    l2:
        mov dh,[esi+1]
        mov dl,is_walls_temp
        call Gotoxy
        inc dl
        mov is_walls_temp, dl
        mov edx,OFFSET wallh
        call WriteString
        loop l2
        mov ecx, ebx
        inc esi
        inc esi
        inc esi
        cmp ecx, 0
        je bahir
    loop majorlooph
    bahir:

    ret
DrawWalls1 ENDP

DrawWalls2 PROC
    mov eax,brown (white * 16)
    call SetTextColor

    ;vertical walls2v
    mov esi, offset walls2v     

    mov ebx, 0          ; Clear ebx
    mov ecx, 0          ; Clear ecx
    mov ax, lengthof walls2v
    mov dx, 0           ; Clear dx
    mov cx, 3           ; Divisor
    div cx              ; Divide dx:ax by cx
    mov ecx, eax          ; Move the quotient to cx


    majorloopv:
    ;load x-cordinates from walls2v array (each is vertical wall of length 12) 
    mov dh, [esi+1]
    mov ebx, ecx        ;temp ebx
    mov cl,[esi+2]     ;length of wall
    mov is_walls_temp, dh
    l1:
        mov dl,[esi]
        mov dh,is_walls_temp
        call Gotoxy
        inc dh
        mov is_walls_temp, dh
        mov edx,OFFSET ground1
        call WriteString
        loop l1
        mov ecx, ebx
        inc esi
        inc esi
        inc esi
    loop majorloopv
    

    ;horizontal walls2h

    mov esi, offset walls2h
    mov ebx, 0          ; Clear ebx
    mov ecx, 0          ; Clear ecx
    mov ax, lengthof walls2h
    mov edx, 0           ; Clear dx
    mov cx, 3           ; Divisor
    div cx              ; Divide dx:ax by cx
    mov ecx, eax          ; Move the quotient to cx

    majorlooph:
    ;load y-cordinates from walls1h array (each is vertical wall of length 18) 
    mov dl, [esi]
    mov ebx, ecx             ;temp ebx
    mov cl,[esi+2]          ;length of wall
    mov is_walls_temp, dl
    l2:
        mov dh,[esi+1]
        mov dl,is_walls_temp
        call Gotoxy
        inc dl
        mov is_walls_temp, dl
        mov edx,OFFSET wallh
        call WriteString
        loop l2
        mov ecx, ebx
        inc esi
        inc esi
        inc esi
        cmp ecx, 0
        je bahir
    loop majorlooph
    bahir:

    ret
DrawWalls2 ENDP

DrawWalls3 PROC
    mov eax,brown (white * 16)
    call SetTextColor

    ;vertical walls3v
    mov esi, offset walls3v     

    mov ebx, 0          ; Clear ebx
    mov ecx, 0          ; Clear ecx
    mov ax, lengthof walls3v
    mov dx, 0           ; Clear dx
    mov cx, 3           ; Divisor
    div cx              ; Divide dx:ax by cx
    mov ecx, eax          ; Move the quotient to cx


    majorloopv:
    ;load x-cordinates from walls3v array (each is vertical wall of length 12) 
    mov dh, [esi+1]
    mov ebx, ecx        ;temp ebx
    mov cl,[esi+2]     ;length of wall
    mov is_walls_temp, dh
    l1:
        mov dl,[esi]
        mov dh,is_walls_temp
        call Gotoxy
        inc dh
        mov is_walls_temp, dh
        mov edx,OFFSET ground1
        call WriteString
        loop l1
        mov ecx, ebx
        inc esi
        inc esi
        inc esi
    loop majorloopv
    

    ;horizontal walls3h

    mov esi, offset walls3h
    mov ebx, 0          ; Clear ebx
    mov ecx, 0          ; Clear ecx
    mov ax, lengthof walls3h
    mov edx, 0           ; Clear dx
    mov cx, 3           ; Divisor
    div cx              ; Divide dx:ax by cx
    mov ecx, eax          ; Move the quotient to cx

    majorlooph:
    ;load y-cordinates from walls1h array (each is vertical wall of length 18) 
    mov dl, [esi]
    mov ebx, ecx             ;temp ebx
    mov cl,[esi+2]          ;length of wall
    mov is_walls_temp, dl
    l2:
        mov dh,[esi+1]
        mov dl,is_walls_temp
        call Gotoxy
        inc dl
        mov is_walls_temp, dl
        mov edx,OFFSET wallh
        call WriteString
        loop l2
        mov ecx, ebx
        inc esi
        inc esi
        inc esi
        cmp ecx, 0
        je bahir
    loop majorlooph
    bahir:

    ret
DrawWalls3 ENDP

HorizontalCollision PROC
    
    cmp level,1
    jne level2_check

    mov edi, offset walls1h
    mov sizes, lengthof walls1h
    jmp started

    level2_check:
    cmp level,2
    jne level3_check

    mov edi, offset walls2h
    mov sizes, lengthof walls2h
    jmp started

    level3_check:

    mov edi, offset walls3h
    mov sizes, lengthof walls3h
 
    started:
    mov eax, 0
    mov ebx, 0

    mov al, sizes
    mov bl, 3
    div bl

    mov ecx, 0
    mov cl, al

    mov ebx, 0
    mov eax, 0
    mov dl, 0

    check:

    mov bl, [edi]
    inc edi
    mov bh, [edi]
    inc edi
    mov ah, [edi]
    inc edi
    add ah, bl

    cmp tyPos, bh 
    jne exit1
        cmp txPos, bl
        jnae exit1
        cmp txPos, ah
        jnbe exit1

        mov collision, 1
        jmp bahir
    exit1:
    comment $
    cmp yGPos, bh 
    jne exit2
        cmp xGPos, bl
        jnae exit2
        cmp xGPos, ah
        jnbe exit2

        mov dl, 1
    $
    exit2:
    mov collision,0
    loop check
    bahir:

ret
HorizontalCollision ENDP

VerticalCollision PROC

    cmp level,1
    jne level2_check

    mov edi, offset walls1v
    mov sizes, lengthof walls1v
    jmp started

    level2_check:
    cmp level,2
    jne level3_check

    mov edi, offset walls2v
    mov sizes, lengthof walls2v
    jmp started

    level3_check:

    mov edi, offset walls3v
    mov sizes, lengthof walls3v
 
    started:

    mov eax, 0
    mov ebx, 0

    mov al, sizes
    mov bl, 3
    div bl

    mov ecx, 0
    mov cl, al

    mov ebx, 0
    mov eax, 0
    mov dl, 0

    check:
        mov bl, [edi]
        inc edi
        mov bh, [edi]
        inc edi
        mov ah, [edi]
        inc edi
        add ah, bh
       
        cmp txPos, bl 
        jne exit1
           cmp tyPos, bh
           jnae exit1
           cmp tyPos, ah
           jnbe exit1

           mov collision, 1
           jmp bahir
    exit1:
    comment $
        cmp xGPos, bl 
        jne exit2
           cmp yGPos, bh
           jnae exit2
           cmp yGPos, ah
           jnbe exit2

           mov dl, 1
    $
    exit2:
    mov collision,0
    loop check
    bahir:
    
ret
VerticalCollision ENDP

CheckGhostCollisionBoundary PROC

    ; Check for boundary collisions
    cmp x2Pos, 1
    je leftCollision

    cmp y2Pos, 28
    je downCollision

    cmp x2Pos, 117
    je rightCollision

    cmp y2Pos, 2
    je upCollision

    jmp exitCheck


leftCollision:
    call UpdateGhost
    inc x2Pos
    inc x2Pos
    call DrawGhost
    mov random,3
    add steps,8
    mov collision,1
    jmp exitCheck2

upCollision:
    call UpdateGhost
    inc y2Pos
    inc y2Pos
    call DrawGhost
    mov random,1
    add steps,10
    mov collision,1
    jmp exitCheck2

rightCollision:
    call UpdateGhost
    dec x2Pos
    dec x2Pos
    call DrawGhost
    mov random,2
    add steps,4
    mov collision,1
    jmp exitCheck2

downCollision:
    call UpdateGhost
    dec y2Pos
    dec y2Pos
    call DrawGhost
    call UpdateGhost
    dec x2Pos
    dec x2Pos
    call DrawGhost
    mov random,0
    add steps,14
    mov collision,1
    jmp exitCheck2

exitCheck2:
    ret
exitCheck:
    mov collision,0
    ret

CheckGhostCollisionBoundary ENDP

CheckGhostCollision PROC

    call CheckGhostCollisionBoundary
    cmp collision,1
    je exitCheck3

    mov ecx,0
    mov cl, x2Pos
    mov ch, yPos
    call CentreBoxCollision
    cmp collision,1
    je exitCheck3

exitCheck:
    
comment $
    cmp collision,1
    je reset_steps

    reset_steps:
    mov steps,0
    jmp is_random
    $
    cmp steps,20
    jle is_continued

    is_random:
    mov eax,4
    call Randomize
    call RandomRange 
    mov random, al

    is_continued:

    cmp random,0
    je upmove

    cmp random,1
    je downmove

    cmp random, 2
    je leftmove

    cmp random,3
    je rightmove

    upmove:
    call UpdateGhost
    dec y2Pos
    mov al, x2Pos
    mov txPos, al
    mov al, y2Pos
    mov tyPos, al
    call HorizontalCollision
    inc y2Pos
    cmp collision, 1
    je is_random
    dec y2Pos
    dec y2Pos
    jmp exitCheck2
    
    downmove:
    call UpdateGhost
    inc y2Pos
    mov al, x2Pos
    mov txPos, al
    mov al, y2Pos
    mov tyPos, al
    call HorizontalCollision
    dec y2Pos
    cmp collision, 1
    je is_random
    inc y2Pos
    inc y2Pos
    jmp exitCheck2

    leftmove:
    call UpdateGhost
    dec x2Pos
    mov al, x2Pos
    mov txPos, al
    mov al, y2Pos
    mov tyPos, al
    call VerticalCollision
    inc x2Pos
    cmp collision, 1
    je is_random
    dec x2Pos
    dec x2Pos
    jmp exitCheck2

    rightmove:
    call UpdateGhost
    inc x2Pos
    mov al, x2Pos
    mov txPos, al
    mov al, y2Pos
    mov tyPos, al
    call VerticalCollision
    dec x2Pos
    cmp collision, 1
    je is_random
    inc x2Pos
    inc x2Pos

exitCheck2:
    call DrawGhost
    mov collision,0
    ret
exitCheck3:
    mov collision,0
    ret

CheckGhostCollision ENDP


CentreBox PROC

    mov eax,white (blue * 16)
    call SetTextColor

    ;vertical walls1v
    mov ecx, 2
    mov temp, 50            ;distance from each other

    majorloopv:
    ;load x-cordinates from walls1v array (each is vertical wall of length 12) 
    mov dh, 12
    mov ebx, ecx        ;temp ebx
    mov ecx,8          ;length of wall
    mov is_walls_temp, dh
    l1:
        mov dl,byte ptr[temp]
        mov dh,is_walls_temp
        call Gotoxy
        inc dh
        mov is_walls_temp, dh
        mov edx,OFFSET ground1
        mov eax,15
        call Delay
        call WriteString
        loop l1

        mov ecx, ebx
        add temp, 16
    loop majorloopv

    ;horizontal walls1h

    mov temp, 11             ;distance from each other

    mov esi, offset walls1h
    mov ecx, 2  

        majorlooph:
        ;load y-cordinates from walls1h array (each is vertical wall of length 18) 
        mov dl,50
        mov ebx, ecx        ;temp ebx
        mov ecx,17          ;length of wall
        mov is_walls_temp, dl
        l2:
            mov dh, byte ptr[temp]
            mov dl,is_walls_temp
            call Gotoxy
            inc dl
            mov is_walls_temp, dl
            mov edx,OFFSET wallh
            mov eax,15
            call Delay
            call WriteString
            loop l2

            mov ecx, ebx
            add temp, 9
        loop majorlooph


    ret
CentreBox ENDP

CentreBoxCollision PROC
    
    mov edx,0
    mov dh,ch
    mov dl,cl

    cmp dh, 20
    jle check1
    jg exitx

    check1:
        cmp dh, 11
        jge check2
        jl exitx

        check2:
            cmp dl,65
            jle check3
            jg exitx

            check3:
                cmp dl, 50
                jge is_collision
                mov collision, 0
                jl exitx

                is_collision:
                mov collision, 1

    exitx:

    ret
CentreBoxCollision ENDP

Teleportfunl PROC
    
    ; (1,19), (98,11)

    mov edx,0
    mov dh,yPos
    mov dl,xPos

    cmp dh, 19
    jle check1
    jg exitx

    check1:
        cmp dh, 11
        jge check2
        jl exitx

        check2:
            cmp dl,1
            jle is_teleported
            jg exitx

            is_teleported:
                call UpdatePlayer
                add xPos, 116
                call DrawPlayer
                mov teleport, 1

    exitx:
    ret
Teleportfunl ENDP

Teleportfunr PROC
    
    mov edx,0
    mov dh,yPos
    mov dl,xPos

    cmp dh, 19
    jle check1
    jg exitx

    check1:
        cmp dh, 11
        jge check2
        jl exitx

        check2:
            cmp dl,117
            jge is_teleported
            jl exitx

            is_teleported:
                call UpdatePlayer
                mov xPos, 1
                call DrawPlayer
                mov teleport, 1

    exitx:
    ret
Teleportfunr ENDP

ResetValues PROC

    cmp lives,0
    je full_reset

    cmp level,4
    je full_reset
    
    cmp level,2
    je reset_l2

    cmp level,3
    je reset_l3

    full_reset:
        
        mov eax, 0
        mov ecx,20
        mov esi,offset isname
        pl:
        mov [esi], al
        inc esi
        loop pl

        mov ecx, 3600
        mov esi, offset playerxy
        mov ebx,0
        rest_loop:
            mov al, [esi]
            cmp al, 0
            je is_here
            mov [esi], bl
            inc esi
        loop rest_loop

        is_here:

        mov xPos, 19
        mov yPos, 22
        mov txPos, 0
        mov tyPos, 0
        mov x2Pos, 59
        mov y2Pos, 12
        mov score, 0
        mov lives, 3
        mov level, 1
        mov collision, 0
        mov teleport, 0
        mov random, 0
        mov steps, 0


    jmp exitx

    reset_l2:
    
        mov ecx, 3600
        mov esi, offset playerxy
        mov ebx,0
        rest_loop2:
            mov al, [esi]
            cmp al, 0
            je is_here2
            mov [esi], bl
            inc esi
        loop rest_loop2

        is_here2:

        mov xPos, 19
        mov yPos, 22
        mov txPos, 0
        mov tyPos, 0
        mov x2Pos, 59
        mov y2Pos, 12
        mov score, 0
        mov level, 2
        mov collision, 0
        mov teleport, 0
        mov random, 0
        mov steps, 0

    jmp exitx

    reset_l3:
        
        mov ecx, 3600
        mov esi, offset playerxy
        mov ebx,0
        rest_loop3:
            mov al, [esi]
            cmp al, 0
            je is_here3
            mov [esi], bl
            inc esi
        loop rest_loop3

        is_here3:

        mov xPos, 19
        mov yPos, 22
        mov txPos, 0
        mov tyPos, 0
        mov x2Pos, 59
        mov y2Pos, 12
        mov score, 0
        mov level, 3
        mov collision, 0
        mov teleport, 0
        mov random, 0
        mov steps, 0

    jmp exitx

    exitx:

ret
ResetValues ENDP

END main

        