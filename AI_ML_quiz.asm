.MODEL SMALL
.STACK 100H
.DATA
    
    eQues    DB 'AI stands for Artificial Intelligence? (y/n)$'
             DB 56 DUP(0)   
             DB 'Machine Learning is a subset of AI? (y/n)$'
             DB 60 DUP(0)   
             DB 'Python is commonly used in AI development? (y/n)$'
             DB 55 DUP(0)   
             DB 'Neural networks mimic human brain structure? (y/n)$'
             DB 52 DUP(0)   
             DB 'Deep learning uses multiple hidden layers? (y/n)$'
             DB 55 DUP(0)   
             DB 101 DUP('$') 
             DB 101 DUP('$')
             DB 101 DUP('$') 
             DB 101 DUP('$') 
             DB 101 DUP('$') 
    
    
    eAns     DB 'y$'
             DB 19 DUP(0)    
             DB 'y$'
             DB 19 DUP(0)
             DB 'y$'
             DB 19 DUP(0)
             DB 'y$'
             DB 19 DUP(0)
             DB 'y$'
             DB 19 DUP(0)
             DB 21 DUP('$') 
             DB 21 DUP('$')  
             DB 21 DUP('$')  
             DB 21 DUP('$')  
             DB 21 DUP('$')  
    
    
    mQues    DB 'Which algorithm is used for optimization? (a)Gradient (b)Bubble (c)Quick (d)Merge$'
             DB 19 DUP(0)
             DB 'What is the derivative of x^2? (a)2x (b)x (c)x^3 (d)1$'
             DB 47 DUP(0)
             DB 'Which learning uses labeled data? (a)Supervised (b)Unsupervised (c)Semi (d)None$'
             DB 18 DUP(0)
             DB 'K-means is what type of algorithm? (a)Classification (b)Clustering (c)Regression (d)Sort$'
             DB 7 DUP(0)
             DB 'What activation function is common? (a)Sigmoid (b)Linear (c)Quadratic (d)Cubic$'
             DB 15 DUP(0)
             DB 101 DUP('$') 
             DB 101 DUP('$') 
             DB 101 DUP('$') 
             DB 101 DUP('$') 
             DB 101 DUP('$') 
    
    
    mAns     DB 'a$'
             DB 19 DUP(0)
             DB 'a$'
             DB 19 DUP(0)
             DB 'a$'
             DB 19 DUP(0)
             DB 'b$'
             DB 19 DUP(0)
             DB 'a$'
             DB 19 DUP(0)
             DB 21 DUP('$')  
             DB 21 DUP('$')  
             DB 21 DUP('$')  
             DB 21 DUP('$')  
             DB 21 DUP('$')  
    
    
    hQues    DB 'Name the rule used in backpropagation for derivatives?$'
             DB 47 DUP(0)
             DB 'What architecture revolutionized NLP with attention mechanism?$'
             DB 38 DUP(0)
             DB 'Name the activation function: max(0,x)?$'
             DB 62 DUP(0)
             DB 'What type of network has memory cells to handle sequences?$'
             DB 43 DUP(0)
             DB 'Name the technique to prevent overfitting by randomly zeroing neurons?$'
             DB 33 DUP(0)
             DB 101 DUP('$') 
             DB 101 DUP('$') 
             DB 101 DUP('$') 
             DB 101 DUP('$') 
             DB 101 DUP('$') 
    
    
    hAns     DB 'chain$'
             DB 15 DUP(0)
             DB 'transformer$'
             DB 9 DUP(0)
             DB 'relu$'
             DB 16 DUP(0)
             DB 'lstm$'
             DB 16 DUP(0)
             DB 'dropout$'
             DB 13 DUP(0)
             DB 21 DUP('$')  
             DB 21 DUP('$')  
             DB 21 DUP('$')  
             DB 21 DUP('$')  
             DB 21 DUP('$')  
    
    QUESTION_SIZE EQU 101    
    ANSWER_SIZE EQU 21       
    MAX_PER_LEVEL EQU 10     
    
    
    easy_count DB 5
    moderate_count DB 5
    hard_count DB 5
    
    
    current_level DB 0       
    current_index DB 0       
    
    lives DB 3
    max_lives DB 3
    score DW 0
    easy_score DB 1
    moderate_score DB 2
    hard_score DB 3
    questions_answered DB 0
    correct_answers DB 0
    
    
    password DB "admin1234567"
    passmsg DB 0DH,0AH,"Enter Password (12 chars): $"
    adminmsg DB 0DH,0AH,"=== Admin Mode Activated ===$"
    usermsg DB 0DH,0AH,"=== Welcome to AI/ML Quiz ===$"
    
    
    mainmenu DB 0DH,0AH,"Admin Menu: 1-CRUD 2-Start Quiz 3-Settings 4-Exit: $"
    crudmsg DB 0DH,0AH,"CRUD: 1-Create 2-Read 3-Update 4-Delete 5-List 6-Back: $"
    levelmsg DB 0DH,0AH,"Select Level: 1-Easy 2-Moderate 3-Hard: $"
    qnummsg DB 0DH,0AH,"Question number in this level (1-10): $"
    
   
    inputqmsg DB 0DH,0AH,"Enter Question: $"
    inputamsg DB 0DH,0AH,"Enter Answer: $"
    
    
    settingsmsg DB 0DH,0AH,"Settings: 1-Lives 2-Scoring 3-Back: $"
    livesmsg DB 0DH,0AH,"Enter number of lives (1-9): $"
    scoremsg DB 0DH,0AH,"Enter score for level (1-9): $"
    
    
    showqmsg DB 0DH,0AH,"Question: $"
    showamsg DB 0DH,0AH,"Answer: $"
    successmsg DB 0DH,0AH,"Operation completed!$"
    errormsg DB 0DH,0AH,"Invalid selection!$"
    
   
    quizmsg DB 0DH,0AH,"=== QUIZ MODE ===$"
    quizquestionmsg DB 0DH,0AH,0DH,0AH,"Question #$"
    answerinputmsg DB 0DH,0AH,"Your answer: $"
    correctmsg DB 0DH,0AH,"*** CORRECT! ***$"
    wrongmsg DB 0DH,0AH,"XXX WRONG! XXX$"
    livesremainingmsg DB 0DH,0AH,"Lives remaining: $"
    scoremsg2 DB 0DH,0AH,"Current Score: $"
    gameovermsg DB 0DH,0AH,0DH,0AH,"=== GAME OVER ===$"
    finalscoremsg DB 0DH,0AH,"Final Score: $"
    questionsattemptedmsg DB 0DH,0AH,"Questions Attempted: $"
    correctcountmsg DB 0DH,0AH,"Correct Answers: $"
    percentagemsg DB 0DH,0AH,"Success Rate: $"
    percentagesign DB "%$"
    quizcompletemsg DB 0DH,0AH,0DH,0AH,"=== QUIZ COMPLETED! ===$"
    continuemsg DB 0DH,0AH,"Press any key to continue...$"
    
   
    usermenu DB 0DH,0AH,"1-Start Quiz 2-Exit: $"
    
    
    easylabelmsg DB 0DH,0AH,"=== EASY LEVEL ===$"
    moderatelabelmsg DB 0DH,0AH,"=== MODERATE LEVEL ===$"
    hardlabelmsg DB 0DH,0AH,"=== HARD LEVEL ===$"
    
  
    inputpass DB 15 DUP(0)   
    useranswer DB 21 DUP(0)  
    choice DB 0
    newline DB 0DH,0AH,'$'
    
.CODE
MAIN PROC
MOV AX,@DATA
MOV DS,AX


LEA DX,passmsg
MOV AH,9
INT 21H


LEA SI,inputpass
MOV CX,15
CLEAR_INPUT:
    MOV BYTE PTR [SI],0
    INC SI
    LOOP CLEAR_INPUT


LEA SI,inputpass
MOV CX,12
PASS_LOOP:
    MOV AH,1
    INT 21H
    MOV [SI],AL
    INC SI
    LOOP PASS_LOOP
MOV BYTE PTR [SI],0 


LEA SI,inputpass


CMP BYTE PTR [SI+0],'a'
JNE USER_MODE
CMP BYTE PTR [SI+1],'d'  
JNE USER_MODE
CMP BYTE PTR [SI+2],'m'
JNE USER_MODE
CMP BYTE PTR [SI+3],'i'
JNE USER_MODE
CMP BYTE PTR [SI+4],'n'
JNE USER_MODE
CMP BYTE PTR [SI+5],'1'
JNE USER_MODE
CMP BYTE PTR [SI+6],'2'
JNE USER_MODE
CMP BYTE PTR [SI+7],'3'
JNE USER_MODE
CMP BYTE PTR [SI+8],'4'
JNE USER_MODE
CMP BYTE PTR [SI+9],'5'
JNE USER_MODE
CMP BYTE PTR [SI+10],'6'
JNE USER_MODE
CMP BYTE PTR [SI+11],'7'
JNE USER_MODE


LEA DX,adminmsg
MOV AH,9
INT 21H
JMP ADMIN_MENU

USER_MODE:
LEA DX,usermsg
MOV AH,9
INT 21H

USER_MENU_LOOP:
LEA DX,usermenu
MOV AH,9
INT 21H
MOV AH,1
INT 21H

CMP AL,'1'
JE START_QUIZ
CMP AL,'2'
JE EXIT
JMP USER_MENU_LOOP

ADMIN_MENU:
LEA DX,mainmenu
MOV AH,9
INT 21H
MOV AH,1
INT 21H
MOV choice,AL

CMP AL,'1'
JE CRUD_OPERATIONS
CMP AL,'2'
JE START_QUIZ
CMP AL,'3'
JE SETTINGS_MENU
CMP AL,'4'
JE EXIT
JMP ADMIN_MENU

SETTINGS_MENU:
LEA DX,settingsmsg
MOV AH,9
INT 21H
MOV AH,1
INT 21H

CMP AL,'1'
JE CHANGE_LIVES
CMP AL,'2'
JE CHANGE_SCORING
CMP AL,'3'
JE ADMIN_MENU
JMP SETTINGS_MENU

CHANGE_LIVES:
LEA DX,livesmsg
MOV AH,9
INT 21H
MOV AH,1
INT 21H
SUB AL,'0'
MOV max_lives,AL
MOV lives,AL
LEA DX,successmsg
MOV AH,9
INT 21H
JMP SETTINGS_MENU

CHANGE_SCORING:
LEA DX,levelmsg
MOV AH,9
INT 21H
MOV AH,1
INT 21H
MOV BL,AL

LEA DX,scoremsg
MOV AH,9
INT 21H
MOV AH,1
INT 21H
SUB AL,'0'

CMP BL,'1'
JE SET_EASY_SCORE
CMP BL,'2'
JE SET_MOD_SCORE
CMP BL,'3'
JE SET_HARD_SCORE
JMP SETTINGS_MENU

SET_EASY_SCORE:
MOV easy_score,AL
JMP SCORE_UPDATED

SET_MOD_SCORE:
MOV moderate_score,AL
JMP SCORE_UPDATED

SET_HARD_SCORE:
MOV hard_score,AL

SCORE_UPDATED:
LEA DX,successmsg
MOV AH,9
INT 21H
JMP SETTINGS_MENU

CRUD_OPERATIONS:
LEA DX,crudmsg
MOV AH,9
INT 21H
MOV AH,1
INT 21H
MOV BL,AL        

CMP AL,'6'
JE ADMIN_MENU


LEA DX,levelmsg
MOV AH,9
INT 21H
MOV AH,1
INT 21H
SUB AL,'0'       
MOV current_level,AL

CMP BL,'1'
JE CREATE_QUESTION
CMP BL,'2'  
JE READ_QUESTION
CMP BL,'3'
JE UPDATE_QUESTION
CMP BL,'4'
JE DELETE_QUESTION
CMP BL,'5'
JE LIST_LEVEL
JMP ADMIN_MENU

CREATE_QUESTION:
CALL GET_NEXT_AVAILABLE_INDEX
CMP AL,255      
JE LEVEL_FULL

MOV current_index,AL


CALL GET_QUESTION_ADDRESS
PUSH SI
LEA DX,inputqmsg
MOV AH,9
INT 21H
POP SI
CALL INPUT_STRING

 
CALL GET_ANSWER_ADDRESS
PUSH SI
LEA DX,inputamsg
MOV AH,9
INT 21H
POP SI
CALL INPUT_STRING


CALL INCREMENT_LEVEL_COUNT

LEA DX,successmsg
MOV AH,9
INT 21H
JMP ADMIN_MENU

LEVEL_FULL:
LEA DX,errormsg
MOV AH,9
INT 21H
JMP ADMIN_MENU

READ_QUESTION:
LEA DX,qnummsg
MOV AH,9
INT 21H
CALL INPUT_INDEX
CMP AL,255
JE INVALID_INDEX


CALL GET_QUESTION_ADDRESS
CMP BYTE PTR [SI],'$'
JE EMPTY_SLOT

LEA DX,showqmsg
MOV AH,9
INT 21H
MOV DX,SI
MOV AH,9
INT 21H


CALL GET_ANSWER_ADDRESS
LEA DX,showamsg
MOV AH,9
INT 21H
MOV DX,SI
MOV AH,9
INT 21H
JMP ADMIN_MENU

UPDATE_QUESTION:
LEA DX,qnummsg
MOV AH,9
INT 21H
CALL INPUT_INDEX
CMP AL,255
JE INVALID_INDEX


CALL GET_QUESTION_ADDRESS
CMP BYTE PTR [SI],'$'
JE EMPTY_SLOT


PUSH SI
LEA DX,inputqmsg
MOV AH,9
INT 21H
POP SI
CALL INPUT_STRING


CALL GET_ANSWER_ADDRESS
PUSH SI  
LEA DX,inputamsg
MOV AH,9
INT 21H
POP SI
CALL INPUT_STRING

LEA DX,successmsg
MOV AH,9
INT 21H
JMP ADMIN_MENU

DELETE_QUESTION:
LEA DX,qnummsg
MOV AH,9
INT 21H
CALL INPUT_INDEX
CMP AL,255
JE INVALID_INDEX


CALL GET_QUESTION_ADDRESS
CMP BYTE PTR [SI],'$'
JE EMPTY_SLOT


MOV BYTE PTR [SI],'$'


CALL GET_ANSWER_ADDRESS
MOV BYTE PTR [SI],'$'


CALL DECREMENT_LEVEL_COUNT

LEA DX,successmsg
MOV AH,9
INT 21H
JMP ADMIN_MENU

LIST_LEVEL:
CALL DISPLAY_LEVEL_HEADER
MOV current_index,0

LIST_LOOP:
    MOV AL,current_index
    CMP AL,MAX_PER_LEVEL
    JAE LIST_DONE

    CALL GET_QUESTION_ADDRESS
    CMP BYTE PTR [SI],'$'
    JE SKIP_EMPTY

   
    MOV AL,current_index
    ADD AL,'1'
    MOV DL,AL
    MOV AH,2
    INT 21H
    MOV DL,'.'
    MOV AH,2
    INT 21H
    MOV DL,' '
    MOV AH,2
    INT 21H
    MOV DX,SI
    MOV AH,9
    INT 21H

    LEA DX,newline
    MOV AH,9
    INT 21H

SKIP_EMPTY:
    INC current_index
    JMP LIST_LOOP

LIST_DONE:
JMP ADMIN_MENU

INVALID_INDEX:
EMPTY_SLOT:
LEA DX,errormsg
MOV AH,9
INT 21H
JMP ADMIN_MENU


START_QUIZ:

MOV AL,max_lives
MOV lives,AL
MOV score,0
MOV questions_answered,0
MOV correct_answers,0

LEA DX,quizmsg
MOV AH,9
INT 21H


MOV current_level,1
MOV current_index,0

QUIZ_LOOP:

CMP lives,0
JE GAME_OVER


MOV AL,current_index
CALL GET_LEVEL_COUNT
CMP current_index,BL
JAE NEXT_LEVEL


QUIZ_FIND_QUESTION:
    CALL GET_QUESTION_ADDRESS
    CMP BYTE PTR [SI],'$'
    JNE QUIZ_QUESTION_FOUND
    
    
    INC current_index
    MOV AL,current_index
    CALL GET_LEVEL_COUNT
    CMP current_index,BL
    JAE NEXT_LEVEL
    JMP QUIZ_FIND_QUESTION

QUIZ_QUESTION_FOUND:

LEA DX,quizquestionmsg
MOV AH,9
INT 21H
MOV AL,questions_answered
INC AL
CALL DISPLAY_NUMBER


LEA DX,newline
MOV AH,9
INT 21H
MOV DX,SI
MOV AH,9
INT 21H


LEA DX,answerinputmsg
MOV AH,9
INT 21H

LEA SI,useranswer
MOV CX,21
CLEAR_LOOP:
    MOV BYTE PTR [SI],0
    INC SI
    LOOP CLEAR_LOOP


LEA SI,useranswer
CALL INPUT_STRING  


LEA DX,newline
MOV AH,9
INT 21H
MOV DL,'U'
MOV AH,2
INT 21H
MOV DL,':'
MOV AH,2
INT 21H
LEA DX,useranswer
MOV AH,9
INT 21H


CALL GET_ANSWER_ADDRESS
LEA DX,newline
MOV AH,9
INT 21H
MOV DL,'C'
MOV AH,2
INT 21H
MOV DL,':'
MOV AH,2
INT 21H
MOV DX,SI
MOV AH,9
INT 21H
LEA DX,newline
MOV AH,9
INT 21H




MOV DI,SI
LEA SI,useranswer
CALL COMPARE_STRINGS
JE CORRECT_ANSWER



WRONG_ANSWER:
LEA DX,wrongmsg
MOV AH,9
INT 21H
DEC lives


LEA DX,newline
MOV AH,9
INT 21H
MOV DL,'C'
MOV AH,2
INT 21H
MOV DL,'o'
MOV AH,2
INT 21H
MOV DL,'r'
MOV AH,2
INT 21H
MOV DL,'r'
MOV AH,2
INT 21H
MOV DL,'e'
MOV AH,2
INT 21H
MOV DL,'c'
MOV AH,2
INT 21H
MOV DL,'t'
MOV AH,2
INT 21H
MOV DL,' '
MOV AH,2
INT 21H
MOV DL,'a'
MOV AH,2
INT 21H
MOV DL,'n'
MOV AH,2
INT 21H
MOV DL,'s'
MOV AH,2
INT 21H
MOV DL,'w'
MOV AH,2
INT 21H
MOV DL,'e'
MOV AH,2
INT 21H
MOV DL,'r'
MOV AH,2
INT 21H
MOV DL,':'
MOV AH,2
INT 21H
MOV DL,' '
MOV AH,2
INT 21H

CALL GET_ANSWER_ADDRESS
MOV DX,SI
MOV AH,9
INT 21H


LEA DX,livesremainingmsg
MOV AH,9
INT 21H
MOV AL,lives
CALL DISPLAY_NUMBER

JMP CONTINUE_QUIZ

CORRECT_ANSWER:
LEA DX,correctmsg
MOV AH,9
INT 21H
INC correct_answers


MOV AL,current_level
CMP AL,1
JE ADD_EASY_SCORE
CMP AL,2
JE ADD_MOD_SCORE


MOV AL,hard_score
JMP ADD_TO_SCORE

ADD_EASY_SCORE:
MOV AL,easy_score
JMP ADD_TO_SCORE

ADD_MOD_SCORE:
MOV AL,moderate_score

ADD_TO_SCORE:
MOV AH,0
ADD score,AX


LEA DX,scoremsg2
MOV AH,9
INT 21H
MOV AX,score
CALL DISPLAY_WORD

CONTINUE_QUIZ:
INC questions_answered
INC current_index
JMP QUIZ_LOOP

NEXT_LEVEL:

INC current_level
CMP current_level,4
JAE QUIZ_COMPLETE
MOV current_index,0


CALL DISPLAY_LEVEL_HEADER
JMP QUIZ_LOOP

GAME_OVER:
LEA DX,gameovermsg
MOV AH,9
INT 21H
JMP DISPLAY_RESULTS

QUIZ_COMPLETE:
LEA DX,quizcompletemsg
MOV AH,9
INT 21H

DISPLAY_RESULTS:

LEA DX,finalscoremsg
MOV AH,9
INT 21H
MOV AX,score
CALL DISPLAY_WORD


LEA DX,questionsattemptedmsg
MOV AH,9
INT 21H
MOV AL,questions_answered
CALL DISPLAY_NUMBER


LEA DX,correctcountmsg
MOV AH,9
INT 21H
MOV AL,correct_answers
CALL DISPLAY_NUMBER


LEA DX,percentagemsg
MOV AH,9
INT 21H
MOV AL,correct_answers
MOV AH,0
MOV BX,100
MUL BX
MOV BL,questions_answered
CMP BL,0
JE SKIP_PERCENTAGE
DIV BL
CALL DISPLAY_NUMBER
LEA DX,percentagesign
MOV AH,9
INT 21H

SKIP_PERCENTAGE:
LEA DX,continuemsg
MOV AH,9
INT 21H
MOV AH,1
INT 21H


MOV AL,choice
CMP AL,'1'
JE ADMIN_MENU
JMP USER_MENU_LOOP




GET_QUESTION_ADDRESS PROC
    PUSH AX
    PUSH BX
    
    MOV AL,current_level
    CMP AL,1
    JE GET_EASY_Q
    CMP AL,2
    JE GET_MODERATE_Q
    
    
    MOV AL,current_index
    MOV AH,0
    MOV BX,QUESTION_SIZE
    MUL BX
    LEA SI,hQues
    ADD SI,AX
    JMP GET_Q_DONE
    
GET_EASY_Q:
    MOV AL,current_index
    MOV AH,0
    MOV BX,QUESTION_SIZE
    MUL BX
    LEA SI,eQues
    ADD SI,AX
    JMP GET_Q_DONE
    
GET_MODERATE_Q:
    MOV AL,current_index
    MOV AH,0
    MOV BX,QUESTION_SIZE
    MUL BX
    LEA SI,mQues
    ADD SI,AX
    
GET_Q_DONE:
    POP BX
    POP AX
    RET
GET_QUESTION_ADDRESS ENDP


GET_ANSWER_ADDRESS PROC
    PUSH AX
    PUSH BX
    
    MOV AL,current_level
    CMP AL,1
    JE GET_EASY_A
    CMP AL,2
    JE GET_MODERATE_A
    
    
    MOV AL,current_index
    MOV AH,0
    MOV BX,ANSWER_SIZE
    MUL BX
    LEA SI,hAns
    ADD SI,AX
    JMP GET_A_DONE
    
GET_EASY_A:
    MOV AL,current_index
    MOV AH,0
    MOV BX,ANSWER_SIZE
    MUL BX
    LEA SI,eAns
    ADD SI,AX
    JMP GET_A_DONE
    
GET_MODERATE_A:
    MOV AL,current_index
    MOV AH,0
    MOV BX,ANSWER_SIZE
    MUL BX
    LEA SI,mAns
    ADD SI,AX
    
GET_A_DONE:
    POP BX
    POP AX
    RET
GET_ANSWER_ADDRESS ENDP

GET_NEXT_AVAILABLE_INDEX PROC
    MOV AL,current_level
    CMP AL,1
    JE GET_EASY_COUNT_CREATE
    CMP AL,2
    JE GET_MODERATE_COUNT_CREATE

    MOV AL,hard_count
    JMP CHECK_AVAILABLE

GET_EASY_COUNT_CREATE:
    MOV AL,easy_count
    JMP CHECK_AVAILABLE

GET_MODERATE_COUNT_CREATE:
    MOV AL,moderate_count

CHECK_AVAILABLE:
    CMP AL,MAX_PER_LEVEL
    JAE INDEX_FULL
    RET              

INDEX_FULL:
    MOV AL,255       
    RET
GET_NEXT_AVAILABLE_INDEX ENDP


INCREMENT_LEVEL_COUNT PROC
    MOV AL,current_level
    CMP AL,1
    JE INC_EASY
    CMP AL,2
    JE INC_MODERATE

    INC hard_count
    RET

INC_EASY:
    INC easy_count
    RET

INC_MODERATE:
    INC moderate_count
    RET
INCREMENT_LEVEL_COUNT ENDP


DECREMENT_LEVEL_COUNT PROC
    MOV AL,current_level
    CMP AL,1
    JE DEC_EASY
    CMP AL,2
    JE DEC_MODERATE

    DEC hard_count
    RET

DEC_EASY:
    DEC easy_count
    RET

DEC_MODERATE:
    DEC moderate_count
    RET
DECREMENT_LEVEL_COUNT ENDP


GET_LEVEL_COUNT PROC
    MOV AL,current_level
    CMP AL,1
    JE GET_EASY_CNT
    CMP AL,2
    JE GET_MODERATE_CNT
    
    MOV BL,hard_count
    RET
    
GET_EASY_CNT:
    MOV BL,easy_count
    RET
    
GET_MODERATE_CNT:
    MOV BL,moderate_count
    RET
GET_LEVEL_COUNT ENDP


DISPLAY_LEVEL_HEADER PROC
    MOV AL,current_level
    CMP AL,1
    JE SHOW_EASY_HEADER
    CMP AL,2
    JE SHOW_MODERATE_HEADER
    
    LEA DX,hardlabelmsg
    JMP SHOW_HEADER
    
SHOW_EASY_HEADER:
    LEA DX,easylabelmsg
    JMP SHOW_HEADER
    
SHOW_MODERATE_HEADER:
    LEA DX,moderatelabelmsg
    
SHOW_HEADER:
    MOV AH,9
    INT 21H
    RET
DISPLAY_LEVEL_HEADER ENDP


INPUT_INDEX PROC
    MOV AH,1
    INT 21H
    SUB AL,'1'       
    MOV current_index,AL

    
    CMP AL,MAX_PER_LEVEL
    JAE INVALID_IDX
    RET

INVALID_IDX:
    MOV AL,255       
    RET
INPUT_INDEX ENDP


INPUT_STRING PROC
    PUSH AX
    PUSH CX
    PUSH DX
    PUSH DI
    
    MOV DI,SI        
    
INPUT_LOOP_NEW:
    MOV AH,1
    INT 21H
    CMP AL,0DH       
    JE INPUT_DONE_NEW
    CMP AL,08H       
    JE HANDLE_BACKSPACE_NEW
    
    
    MOV [SI],AL
    INC SI
    JMP INPUT_LOOP_NEW
    
HANDLE_BACKSPACE_NEW:
    CMP SI,DI        
    JE INPUT_LOOP_NEW
    DEC SI
    MOV BYTE PTR [SI],0
    
    MOV DL,08H
    MOV AH,2
    INT 21H
    MOV DL,' '
    MOV AH,2
    INT 21H
    MOV DL,08H
    MOV AH,2
    INT 21H
    JMP INPUT_LOOP_NEW
    
INPUT_DONE_NEW:
    MOV BYTE PTR [SI],'$'
    
    POP DI
    POP DX
    POP CX
    POP AX
    RET
INPUT_STRING ENDP


COMPARE_STRINGS PROC
    PUSH SI
    PUSH DI
    PUSH AX
    PUSH BX
    
COMP_LOOP:
    MOV AL,[SI]
    MOV BL,[DI]
    
    
    CMP AL,'A'
    JB SKIP_LOWER1
    CMP AL,'Z'
    JA SKIP_LOWER1
    ADD AL,32        
SKIP_LOWER1:
    
    CMP BL,'A'
    JB SKIP_LOWER2
    CMP BL,'Z'
    JA SKIP_LOWER2
    ADD BL,32        
SKIP_LOWER2:
    
    CMP AL,BL
    JNE COMP_NOT_EQUAL
    CMP AL,'$'
    JE COMP_EQUAL
    INC SI
    INC DI
    JMP COMP_LOOP
    
COMP_EQUAL:
    CMP AL,AL        
    JMP COMP_END
    
COMP_NOT_EQUAL:
    CMP AL,BL        
COMP_END:
    POP BX
    POP AX
    POP DI
    POP SI
    RET
COMPARE_STRINGS ENDP


DISPLAY_NUMBER PROC
    PUSH AX
    PUSH DX
    ADD AL,'0'
    MOV DL,AL
    MOV AH,2
    INT 21H
    POP DX
    POP AX
    RET
DISPLAY_NUMBER ENDP


DISPLAY_WORD PROC
    PUSH AX
    PUSH BX
    PUSH CX
    PUSH DX
    
    CMP AX,0
    JNE NOT_ZERO
    MOV DL,'0'
    MOV AH,2
    INT 21H
    JMP DISPLAY_DONE
    
NOT_ZERO:
    MOV CX,0
    MOV BX,10
    
DIVIDE_LOOP:
    MOV DX,0
    DIV BX
    PUSH DX
    INC CX
    CMP AX,0
    JNE DIVIDE_LOOP
    
DISPLAY_LOOP:
    POP DX
    ADD DL,'0'
    MOV AH,2
    INT 21H
    LOOP DISPLAY_LOOP
    
DISPLAY_DONE:
    POP DX
    POP CX
    POP BX
    POP AX
    RET
DISPLAY_WORD ENDP

EXIT:
MOV AX,4C00H
INT 21H
END MAIN


