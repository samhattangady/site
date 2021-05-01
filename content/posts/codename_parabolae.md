---
title: "Introducing - codename: parabolae"
description: "The project I find myself spending exceedingly larger amounts of time working on. Finally."
date: 2021-05-01T20:55:15+05:30
draft: false
tags: [gamedev, devlog]
---

<div class='flex-center'>
<img src='/parabolae/varkala1.png' alt='Sunset in Varkala'/>
</div>

Over the months of February and March of 2021, I had the opportunity to take a vacation. I ended up
spending those couple of months roaming across coastal South India. I had made the decision to not
carry my laptop along with me, and overall I think that was the right call. But over that whole time,
there was just that small voice at the back of my head, gently calling me back to some sort of software
development. So in its own way, the break I took from working on these projects really taught me that
it truly is something I enjoy.

Okay. But wanting to work on something is the easy part. It's the actual doing of the work that's hard.
Especially in my case, where I am the one who has to decide what it is I would like to work on. 


### Picking a project
Over those
same two months though, there was one idea that kept calling out to me. It was a puzzle-type concept which
had to do with shooting arrows, and then recalling them. Some of the arrows would have environmental effects
and such, and that would be the crux of the game. The one standout concept that I had was of shooting an ice
arrow along a curved surface, completely freezing it. And then the next arrow that you shoot toward that
surface would just slide along that curve and would allow you to access a different part of the map.

Considering that the concept revolved around having that curved surface, I inadvertently started off by
creating a level editor before I even had a game for that level to exist within. So more than a level
editor, I guess you could call it a vector design program. In any case, that was the first thing I worked
on. I worked my way through [Pomax's primer on bezier curves](https://pomax.github.io/bezierinfo/) and
ended up with a simple bezier curve editor.

<div class='flex-center'>
<img src='/parabolae/bezier1.gif' alt='A simple bezier curve editor'/>
</div>

### Some technical ramblings

Okay. Well that's all fine I guess. But it doesn't really look like a game does it? So rather than moving
on to making the game, I continued making more changes to the level editor. Things were all working fine,
until suddenly, the program started to crash. At some random moments. Up until this point I had been working
in C, using the [raylib](https://www.raylib.com/) library, but I was facing a bunch of issues getting it
to build using the makefiles, and the way that I was building only resulted in 32-bit versions, which were
not debuggable in [RemedyBG](https://remedybg.handmade.network/), and I wasn't really in the mood to spend
all those many hours figuring out build systems.

So it was clear that I was going to have to start off
again. I was quite sure I was going to use [SDL](https://www.libsdl.org/). I had quite enjoyed working with
it on my [previous project](https://chapliboy.itch.io/this-mouse-will-swim) ([source](https://github.com/samhattangady/blobules))
and was happy with the features it provided. I wasn't so sure about using C again though. I _loved_ learning
C, and it really gave me such a deep understanding of programming, but it also has a lot of quirks that can
be quite grating at times, as well as a serious lack of quality of life features.

I had been just keeping
a ear to the ground, keeping track of a few other programming languages. [Zig](https://ziglang.org/) had been
on the radar for a while, and I decided that it was probably a good time to try it out now. I already had a
small codebase that would need to be ported over, so I could focus all my energies on actually learning the
features of the language and see whether it was something that suited me.

The port to zig took a little longer than it should have. Though that was not due to having to get to grips
with the language, or the inevitable refactorings. It was mostly just laziness. In any case, the codebase
is now a pleasure to work with. Until now atleast, zig has been exactly what I was looking for. It looks
like I am going to continue on with this project in zig.

### Actual game development

<div class='flex-center'>
<img src='/parabolae/lvl1.gif' alt='level prototype'/>
</div>

The _game_ as it exists right now has a very basic scaffolding. You have to get a projectile to the "target".
You can move to a fixed locations, and you have a few fixed aimzones, and a fixed set of velocities. I think
that since we are trying to make a puzzle game, it is better to have a discrete set of actions that can be
taken, so that the player has a clear understanding of what they can and cannot do.

Additionally, the exact trajectory that the projectile will take is clearly shown in the game, so that it's 
less guesswork and more about planning and understanding the relationships between the different actions that
can be taken.

### Moving forward

Of all the disciplines that game development entails, I am the least familiar with game design. Unlike art,
programming, writing and music, the only way you can improve your game designing skills is by actually
designing games. So that's what I'm hoping to do. In my previous game as well, the level design was the
most intimidating part, and though I'm quite happy with the result, I do have to admit that it was quite
a nerve-wracking experience overall. Hopefully this time, I'll be a little better prepared.

I hope to continue along in this project, maintaining a devlog of some sort on this site. Let's hope both
those plans work out.

