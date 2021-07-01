---
title: "Adding Some Artwork"
description: "As the game mechanics start feeling more coherent, we add some artwork to the game."
date: 2021-07-01T17:28:24+05:30
tags: [gamedev, devlog]
---

This past month, I was mostly working on the ships prototype that was mentioned in the previous post.
It seems to coming along quite well. The more I work on it, the more potential I see in the game,
which is a stark departure from how the previous game was proceeding.

So there comes a point in every prototype where we need to move past the overly simple programmer art
and move to something a little more aesthetically appealing. I feel that at some point in this month
I reached that state, and then was compelled to start working on the artwork.

It started off with making a rough concept art piece.

<div class='flex-center'>
<img src='/pirates/concept1.PNG' alt='A Rough Concept Sketch'/>
</div>

I feel this is an interesting direction to go in. The overall feel that I am going for is to have
simple shapes with contrasting colours. I want to stay away from textures and lines as much as possible.
Something like pixel art, but with vectors instead. I feel that is an art style that I have not
really seen much of, but really has the potential to become something beautiful.

Also, I intend for most of these to be generated in engine, which means that we can do a lot of animation
work on the shapes procedurally. The first thing I worked on was generating the islands and the waves.
These are done completely procedurally, and seem to fit the concept sketch almost perfectly.

<div class='flex-center'>
<img src='/pirates/moreart1.gif' alt='Procedurally generated islands and waves'/>
</div>

After that, I moved on to the ship. Currently, I only have done one ship design, and am using different
colors of sails to differentiate between the ships. Obviously this will change as more time is put into
this aspect. The ship shape is defined completely in code, so this allows for crisp graphics at all sizes
of the game board. Also, since we have all the vertices stored, we can also have some gentle animation of
the ships sails. Here's a blow up view where the effect is magnified.

<div class='flex-center'>
<img src='/pirates/moreart2.gif' alt='Ships sails animation'/>
</div>

When the ships move the also create waves / ripples behind them when they move. I'm not yet happy about
how this all looks, but I think it is a step in the right direction.

<div class='flex-center'>
<img src='/pirates/moreart3.gif' alt='Ships moving animation'/>
</div>

It took a while for me to figure out how best to represent the commands on the map, as well as once
they have been picked up by the ships. Ofcourse, if you look at the concept sketch, this reveal has
already been spoiled for you. If not, you can go back up and look at it now.

So once we put that all together, let's try to recreate the prototype video that we had shown last post.

### Before

<div class='flex-center'>
<img src='/pirates/moreart5.gif' alt='Before new artwork'/>
</div>

### After

<div class='flex-center'>
<img src='/pirates/moreart4.gif' alt='After new artwork'/>
</div>

While there is a long way to go I feel that we have certainly made some really meaningful progress
here. I also think we have reached a point where the gifs seem to be making things look worse (though
that was probably always the case). Hopefully, next time around, we will be able to use videos and
get better results here.

I think overall progress here is good, and we're reaching the end of the prototyping stage, and reaching
the scary part. _Getting Serious._

If we decide that we want to become serious about this project, we would have to start setting up
some goals for a playtest release, and actually put it out there, and see how players feel about
the mechanic. And that means, that we can't just focus on the fun stuff, and would have to also spend
time working on the non-fun things.

But that of course, is a problem for the future. We are here right now. And creating waves. And we're
going to focus on surfing on those beautiful procedurally generated waves. _That's all folks._
