# AI/ML Quiz Game — 8086 Assembly

A console quiz application written in **x86 (8086) assembly** for DOS. It has a password-gated **admin mode** (full question CRUD, quiz settings) and a **user mode** (just play). Questions are about AI / Machine Learning and are split into three difficulty levels.

**Group 11 · Section 07**

|Student ID|Name|
|-|-|
|22201441|*Shahriar Khan Shirso*|



\---

## Table of Contents

1. [Tech Stack](#tech-stack)
2. [Features](#features)
3. [How It Works](#how-it-works)
4. [Specification](#specification)
5. [Build \& Run](#build--run)
6. [Usage Walkthrough](#usage-walkthrough)
7. [Code Structure](#code-structure)
8. [Memory Layout](#memory-layout)
9. [Default Question Bank](#default-question-bank)
10. [Known Limitations](#known-limitations)
11. [Possible Improvements](#possible-improvements)

\---

## Tech Stack

|Item|Detail|
|-|-|
|Language|x86 16-bit Assembly (8086 instruction set)|
|Syntax|MASM / TASM compatible|
|Memory model|`.MODEL SMALL` (one code segment, one data segment)|
|Stack|`.STACK 100H` (256 bytes)|
|OS interface|DOS interrupts — `INT 21H`|
|I/O services used|`AH=01h` (read char w/ echo), `AH=02h` (print char), `AH=09h` (print `$`-terminated string), `AH=4Ch` (exit)|
|Runs on|emu8086, or DOSBox with MASM/TASM|

\---

## Features

### Access control

* 12-character password prompt on startup.
* Correct password → **Admin mode**; anything else → **User mode** (no error, just reduced access).

### Admin mode

* **CRUD on questions**, per difficulty level:

  * **Create** — add a new question + answer
  * **Read** — view a question and its answer by number
  * **Update** — overwrite an existing question and answer
  * **Delete** — remove a question
  * **List** — show all questions in a level
* **Settings**

  * Set number of lives (1–9)
  * Set points per correct answer for each level (1–9)
* Can also start the quiz.

### Quiz engine

* **3 difficulty levels** played in order: Easy → Moderate → Hard
* Up to **10 questions per level** (5 pre-loaded in each)
* Three question styles:

  * **Easy** — True/False style (`y` / `n`)
  * **Moderate** — Multiple choice (`a` / `b` / `c` / `d`)
  * **Hard** — Typed short answer (e.g. `chain`, `transformer`)
* **Lives system** — each wrong answer costs a life; the quiz ends at 0 lives
* **Level-based scoring** — default 1 / 2 / 3 points for Easy / Moderate / Hard
* **Case-insensitive** answer checking (`Y`, `y`, `ReLU`, `relu` all work)
* Live feedback after each answer: your answer, the correct answer, ✔/✘ message, current score, lives left
* On a wrong answer, the correct answer is revealed

### Results screen

* Final score
* Questions attempted
* Correct answers
* Success rate (%)
* Distinct endings: **GAME OVER** (out of lives) vs **QUIZ COMPLETED**

### Input handling

* Custom string input routine with **backspace support**
* Menus re-prompt on invalid keys

\---

## How It Works

```
Start
  │
  ▼
Enter 12-char password
  │
  ├── == "admin1234567" ──► ADMIN MENU ──┬─ 1 CRUD ──► Create/Read/Update/Delete/List
  │                                      ├─ 2 Start Quiz
  │                                      ├─ 3 Settings ──► Lives / Scoring
  │                                      └─ 4 Exit
  │
  └── otherwise ──────────► USER MENU ───┬─ 1 Start Quiz
                                         └─ 2 Exit

Quiz:  Easy ──► Moderate ──► Hard ──► Results
         (any level: lives == 0 ──► GAME OVER ──► Results)
```

\---

## Specification

### Functional requirements

|ID|Requirement|
|-|-|
|F1|Prompt for a 12-character password; grant admin rights only on exact (case-sensitive) match|
|F2|Provide a user menu (Start Quiz / Exit) for non-admin users|
|F3|Provide an admin menu (CRUD / Start Quiz / Settings / Exit)|
|F4|Support Create, Read, Update, Delete, and List for questions in each level|
|F5|Store up to 10 questions per level, across 3 levels|
|F6|Allow admin to configure lives (1–9) and per-level score values (1–9)|
|F7|Run the quiz level by level, starting with Easy|
|F8|Compare typed answers to stored answers ignoring case|
|F9|Deduct a life on a wrong answer; end the game at 0 lives|
|F10|Add the level's score value to the total on a correct answer|
|F11|Show final score, attempted count, correct count and success percentage|

### Data limits

|Item|Value|
|-|-|
|Password length|12 characters (fixed)|
|Question slot size|101 bytes (`QUESTION\_SIZE`)|
|Answer slot size|21 bytes (`ANSWER\_SIZE`)|
|Max questions / level|10 (`MAX\_PER\_LEVEL`)|
|Levels|3|
|Lives|1–9 (default 3)|
|Score per level|1–9 (default 1 / 2 / 3)|
|Max score (defaults, 15 Qs)|5×1 + 5×2 + 5×3 = **30**|
|Score variable|16-bit word (`DW`)|

### Credentials

|Role|Password|
|-|-|
|Admin|`admin1234567`|
|User|any other 12-character input|

> Change the password in the `password` / comparison block in the source before sharing the program.

\---

## Build \& Run

### Option A — emu8086 (easiest)

1. Open `GroupNo11\_Section07\_22201441\_22301076\_22301055.asm` in emu8086.
2. Click **Compile**, then **Run**.
3. Use the emulator's console window for input/output.

### Option B — DOSBox + TASM

DOS needs 8.3 filenames, so rename first:

```
ren GroupNo11\_Section07\_22201441\_22301076\_22301055.asm quiz.asm
tasm quiz.asm
tlink quiz.obj
quiz.exe
```

### Option C — DOSBox + MASM

```
masm quiz.asm;
link quiz.obj;
quiz.exe
```

\---

## Usage Walkthrough

**1. Login**

```
Enter Password (12 chars): admin1234567
=== Admin Mode Activated ===
```

Exactly 12 characters are read — no Enter needed. The password is echoed on screen (not masked).

**2. Admin menu**

```
Admin Menu: 1-CRUD 2-Start Quiz 3-Settings 4-Exit:
```

**3. Add a question**

```
CRUD: 1-Create 2-Read 3-Update 4-Delete 5-List 6-Back: 1
Select Level: 1-Easy 2-Moderate 3-Hard: 1
Enter Question: Is the sky blue? (y/n)
Enter Answer: y
Operation completed!
```

**4. Change settings**

```
Settings: 1-Lives 2-Scoring 3-Back: 1
Enter number of lives (1-9): 5
```

**5. Play**

```
Question #1
AI stands for Artificial Intelligence? (y/n)
Your answer: y
\*\*\* CORRECT! \*\*\*
Current Score: 1
```

**6. Results**

```
Final Score: 24
Questions Attempted: ...
Correct Answers: ...
Success Rate: ...
```

\---

## Code Structure

### Main program flow (labels)

|Label|Purpose|
|-|-|
|`MAIN`|Init DS, read \& check password|
|`USER\_MODE` / `USER\_MENU\_LOOP`|User menu|
|`ADMIN\_MENU`|Admin menu|
|`SETTINGS\_MENU`, `CHANGE\_LIVES`, `CHANGE\_SCORING`|Settings|
|`CRUD\_OPERATIONS`|CRUD dispatcher|
|`CREATE\_QUESTION`, `READ\_QUESTION`, `UPDATE\_QUESTION`, `DELETE\_QUESTION`, `LIST\_LEVEL`|CRUD actions|
|`START\_QUIZ`, `QUIZ\_LOOP`, `QUIZ\_FIND\_QUESTION`|Quiz loop|
|`CORRECT\_ANSWER`, `WRONG\_ANSWER`|Answer handling|
|`NEXT\_LEVEL`, `GAME\_OVER`, `QUIZ\_COMPLETE`, `DISPLAY\_RESULTS`|Progression \& end screen|
|`EXIT`|Terminate (`INT 21H`, `AH=4Ch`)|

### Procedures

|Procedure|Description|
|-|-|
|`GET\_QUESTION\_ADDRESS`|Returns `SI` → current question (level + index)|
|`GET\_ANSWER\_ADDRESS`|Returns `SI` → current answer (level + index)|
|`GET\_NEXT\_AVAILABLE\_INDEX`|Next free slot for Create; `255` if the level is full|
|`INCREMENT\_LEVEL\_COUNT` / `DECREMENT\_LEVEL\_COUNT`|Update per-level question count|
|`GET\_LEVEL\_COUNT`|Returns count for the current level in `BL`|
|`DISPLAY\_LEVEL\_HEADER`|Prints Easy / Moderate / Hard banner|
|`INPUT\_INDEX`|Reads a question number (1–9) → zero-based index, `255` if invalid|
|`INPUT\_STRING`|Reads a line into `\[SI]` with backspace support; `$`-terminates|
|`COMPARE\_STRINGS`|Case-insensitive string compare (`SI` vs `DI`)|
|`DISPLAY\_NUMBER`|Prints a single digit from `AL`|
|`DISPLAY\_WORD`|Prints a 16-bit unsigned number from `AX`|

\---

## Memory Layout

Questions and answers are stored in **fixed-width slots** so an item's address is `base + index × slot\_size`.

|Array|Slot size|Slots|Content|
|-|-|-|-|
|`eQues` / `mQues` / `hQues`|101 bytes|10|Easy / Moderate / Hard questions|
|`eAns` / `mAns` / `hAns`|21 bytes|10|Easy / Moderate / Hard answers|

* Every string ends with `$` (DOS function 09h convention).
* Empty slots begin with `$`, which is how the program detects "no question here".
* Per-level counters: `easy\_count`, `moderate\_count`, `hard\_count`.
* Game state: `lives`, `max\_lives`, `score` (word), `questions\_answered`, `correct\_answers`, `current\_level`, `current\_index`.
* Scoring values: `easy\_score`, `moderate\_score`, `hard\_score`.

\---

## Default Question Bank

**Easy (y/n)**

1. AI stands for Artificial Intelligence? → `y`
2. Machine Learning is a subset of AI? → `y`
3. Python is commonly used in AI development? → `y`
4. Neural networks mimic human brain structure? → `y`
5. Deep learning uses multiple hidden layers? → `y`

**Moderate (a/b/c/d)**

1. Which algorithm is used for optimization? → `a` (Gradient)
2. What is the derivative of x^2? → `a` (2x)
3. Which learning uses labeled data? → `a` (Supervised)
4. K-means is what type of algorithm? → `b` (Clustering)
5. What activation function is common? → `a` (Sigmoid)

**Hard (typed answer)**

1. Rule used in backpropagation for derivatives → `chain`
2. Architecture that revolutionized NLP with attention → `transformer`
3. Activation function max(0,x) → `relu`
4. Network with memory cells for sequences → `lstm`
5. Technique to prevent overfitting by zeroing neurons → `dropout`

\---

## Known Limitations

Worth knowing before a demo or viva:

* **Single-digit number display.** `DISPLAY\_NUMBER` prints one character (`AL + '0'`). So question numbers, lives, and the success rate print incorrectly once a value reaches 10 or more (e.g. a 100% score, or question #10+).
* **Deleting a middle question leaves a gap.** The count drops but later questions don't shift up, so the quiz (which loops up to the count) can skip the last question(s), and the next Create may overwrite an existing one.
* **Only question numbers 1–9 can be entered** for Read / Update / Delete, since `INPUT\_INDEX` reads a single key. The 10th slot is reachable only via Create/List.
* **No input validation on settings.** Lives and score values are not range-checked (e.g. `0` lives ends the quiz immediately).
* **No length limit in `INPUT\_STRING`.** Typing more than 100 characters (question) or 20 (answer) overflows into the next slot.
* **Answers can't contain `$`**, since it is the string terminator.
* **Password is echoed** and compared with hard-coded characters.
* **Not persistent.** All changes are in memory and are lost when the program exits.
* **Admin returns to the user menu after a quiz** started from the admin menu (the `choice` check at the end of the quiz compares against `'1'`, but Start Quiz is option `2`).

\---

## Possible Improvements

* Multi-digit number printing (fix the 100% / question #10+ display)
* Compact the arrays on delete, or track slots with a used-flag
* Mask the password with `\*`
* Range-check lives and score inputs; bound `INPUT\_STRING`
* Save/load the question bank to a file via DOS file services (`INT 21H`, `AH=3Ch/3Dh/3Fh/40h`)
* Randomized question order and a high-score table

\---


```

