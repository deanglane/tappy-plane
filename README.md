## Tappy Bird 1.0

### Summary

Tappy Plane is a Flappy Bird–style arcade game made in Godot with GDScript. I built tap-to-fly controls, parallax scrolling, lasers, scoring, high-score saving, and simple game states to practice 2D physics, collisions, UI, and replayable game loops. Built to explore feel, timing, polish, and flow.!,

### Project Overview

Tappy Plane is a Flappy Bird–style arcade game built in the Godot engine using GDScript. It recreates the classic tap-to-fly mechanics with smooth physics, a scrolling world, and increasingly challenging obstacles.,

While building it, I learned how to use Godot’s 2D node system to set up a character with gravity and jump impulses, create a parallax-scrolling background, and manage collisions between the player, lasers, and the ground. I also implemented score tracking, high-score saving, and simple game states (ready, playing, game over) to make the loop feel polished and replayable.`,

It’s a small but addictive project that let me practice core Godot patterns like scenes, instancing, signals, and lightweight UI — all wrapped in a fun, fast-paced game.,

### Features

- "Built in Godot Engine using GDScript",
- "Player implemented as a 2D body with a CollisionShape2D and custom gravity / jump impulse",
- "click input mapped to a custom acceleration action via the Input Map",
- "Parallax background scrolling using ParallaxBackground and multiple ParallaxLayer nodes",
- "Endless level feel by moving pipes and ground across the screen instead of the camera",
- "Obstacles created as reusable scenes and spawned with instancing on a timer",
- "Randomized pipe positions to vary difficulty between runs",
- "Collision detection using physics layers and signals to trigger game-over state",
- "Score system that increments when the player passes obstacles",
- "High-score saving using Godot’s file API for local persistence",
- "UI overlay for score, high score, and restart prompts",
- "Simple game state management (ready, playing, game over) to control input and resets",

### Tech Stack

- "Godot Engine (GDScript) — core engine used for all gameplay logic",
- "GDScript — scripting language used for physics, collisions, input, and game loop",
- "Aseprite — custom pixel-art assets (ship, meteorites, effects)",
- "Spritesheets & Frame Animation — for meteorite movement and impact visuals",
- "Git & GitHub — version control and project tracking",
- "Godot Script Editor — development environment",
- "HTML5 — structure and elements",
- "CSS3 — styling and responsive layout",
- "JavaScript (ES6+) — functionality and app logic",
