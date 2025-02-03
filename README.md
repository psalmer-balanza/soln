Sol'n - An Educational Serious Game by Team Hex Offenders

Overview

Welcome to Sol'n, an engaging 2D exploration and puzzle game built using the Godot Engine. This game invites players to explore various levels, complete puzzles, face enemies, and interact with quirky NPCs, all throughout three different levels. 
Each environment provides unique challenges, including a crab-themed boss encounter in a level filled with elevated piping and obstacles. The game places emphasis on learning fractions, NPC interactions, and creative level design.

Features

Dynamic Quest System: Players progress through an adventure with evolving quests and objectives, displayed interactively on-screen.
Badges for Gamification: The game rewards players with badges as they progress through each minigame related to different fraction topics (Currently limited to addition and subtraction).
Dialogue and Interactions: NPCs play a vital role in providing clues, storyline, and quests. The player can engage in dialogue sequences that trigger various actions and events.
Area Exploration and Boss Battles: Explore a variety of environments, including waterlogged industrial rooms, a mystical swamp, and the final boss area, filled with puzzles and interactions.
Animated Player Interactions: Player animations (like picking up items, moving obstacles, or interacting with NPCs) are managed via a state machine, allowing for seamless movement and interaction within the environment.
Pixel Art Visuals: The game has a charming pixel-art style. Carefully designed environments include industrial-themed rooms with pipes, crab-themed areas, blacksmithing areas, and natural elements that give depth to the game's aesthetic.

Story Highlights

Floor1: The swamp area
Floor2: The industrial water processing area
Floor3: The final boss, the lighthouse area
	
Gameplay Mechanics

Navigation and Movement: Players use keyboard controls to navigate the protagonist through levels.
Player State Machine: The player uses a state machine for different actions like moving, idling, and acting. The acting state allows the character to move to a specific target, such as interacting with a quest item.
Quests and Objectives: The quest system maintains multiple concurrent objectives. Current Objectives are updated on-screen with typewriter-style animations to keep players informed about the next goal.
Dialogue and Interaction System: Using a dialogue manager, players interact with NPCs, solve puzzles, and receive new quests. Dialogues can trigger cutscenes, initiate boss fights, or change the game state.
Collision and Areas: NPCs, obstacles, and other interactable entities have dedicated Area2D nodes and CollisionShapes, allowing players to enter and interact without physical collisions blocking the player.
Simple Fraction Addition: The game has a scene featuring simple fraction addition for both addition and subtraction that is fun and intuitive.
Worded Fraction Addition: Similar to simple addition, but the user 

Notable Challenges

Save States: The mechanics for saving player progress within the supported teacher module has not been tested thoroughly, therefore it is recommended to just make a new game every time you play the game.
Dialogue Trigger Issues: During early testing, multiple dialogue instances could be triggered simultaneously. This was resolved by managing state transitions more efficiently through the state machine.
Scene Integration and Cutscenes: Smooth transitions between gameplay scenes and cutscenes, such as Raket the Raccoon's smithing cutscene, were achieved by saving player states and effectively managing animations.

Current Progress

Implemented a roaming NavigationAgent2D-based wandering system for enemies and NPCs.
Completed several quest lines, including movable rock puzzles and Saisai's pie-making quest.
Designed pixel art assets for industrial areas, including the crab boss's lair, rock formations, pipes, valves, and robotic yet natural-themed accessories.

Future Plans

Further develop boss mechanics, specifically focusing on enhancing the giant crab fight with additional attacks and behaviors.
Introduce more interactive items and accessories that complement the industrial aesthetic of the second floor while adding variety to the environment.
Expand dialogue options and add side quests to provide additional lore and character development.

How to Play

Movement: Use arrow keys or WASD to move around.
Interactions: Press the interact key (space bar) when near NPCs or objects to interact.
Objectives: Keep an eye on the Current Objective text at the top of the screen to know what to do next.
Dialogue and Cutscenes: Follow the dialogue sequences to progress through quests. Dialogue is automatically triggered when you reach certain areas or interact with key characters.

Installation

Clone or download this repository (https://github.com/2205867/soln.git).
Open the project in Godot Engine (v4.3).
Press F5 to run the game.
Or compile into an exe using the Godot IDE and run through that.

License
This project is currently open source and available under the MIT License.
