---
title: "Adventures in Adding Responsiveness to a Web App"
description: "A web app was created. It was then decided that this web app should also work on mobile. Hijinks ensue."
date: 2020-01-17T21:56:37+05:30
tags: [webdev]
---

The first rule of responsive web design is often shouted off the rooftops.

### Design for mobile first. Always mobile first.

I know this rule. I've heard it several times. I've been rudely awoken from my sleep because of all the rooftop
screaming. So what do you think I did when I was building
my web based crossword app? I didn't even bother _considering for mobile._.

Maybe I am a rebel. Or maybe I just didn't have enough faith in my ability to
actually see a project through, and rather than getting stuck in the quagmire of
figuring what _exactly_ it means to design for mobile first, I decided I'd
rather just dive in, and figure out all those other things along the way.


I ended up actually reaching a place where I can not only consider the application
finished, but a place where I can also be a little proud of it,
and maybe even want to show it off a little. But honestly, I know that if it
doesn't work on mobile, it might as well not work at all...
So now, here I find myself in the unenviable position of trying to have to
figure out how exactly I am going to add responsiveness for an application that
was basically written to be a bespoke desktop based experience. **Fun**.

<details style='background-color: #ffffff09;'>
  <summary style='opacity: 0.6; padding-left: 2rem;'>tldr (spoilers?)</summary>
    <ul>
        <li> Some html boilerplate exists for a reason. </li>
        <li> Css media queries are your friend. </li>
        <ul><li> screen-width based media queries serve one purpose, and input based
media queries serve another. Please consider what that means for your app. </li></ul>
        <li> <code>keydown</code> events don't work as expected on mobile. </li>
        <li> Apple implements features <em>differently</em>. </li>
        <li> Just design for mobile first... Maybe. </li>
    </ul>
    <hr>
</details>

---

# cluegrid

So what is cluegrid? Cluegrid is a way to solve crosswords with a friend. It
allows you to pick a puzzle, share it with a friend, and then solve it together.
There are some cool tech features like web sockets for live updates, but for the
most part, it's a fairly simple focused crossword application.

![cluegrid on desktop](/cluegrid/desktop-1.png)
<br></br>

Hey! The app looks quite good (if I can say so myself), but I am yet to see
how it looks like on a mobile screen. Also, over the course of building the 
application, I had taken several decisions that might come back to bite me
now... More on that later, first, let's get a look at those screenshots.

<br>
<div class='flex-center'>
<img src='/cluegrid/mobile-1.png' alt='mobile1' width='300'/>
</div>

### Bleurgh... 

Okay what exactly is happening here? What's with all the white? What
happened to my beautiful gradient? Why isn't the `container` covering the entire
width of the app? I'm sure I've set some `100vh`s and `100vw`s somewhere or the
other... Why is this all happening? 

Okay, let's take this one step at a time. This is all just a bunch of CSS. I can
handle it right? So let's see. The background is white... Maybe I should just
move the linear-gradient to my `body` element? That ought to work.


<br>
<div class='flex-center'>
<img src='/cluegrid/mobile-2.png' alt='mobile2' width='300'/>
</div>

Umm. That's really not what I was hoping for. I mean, I specifically said
`100vw`. Clearly my definition of `100vw` isn't the same
as my phone's definition of `100vw`. Why could that be?

{{< highlight html>}}
  <meta content="width=device-width, initial-scale=1" name="viewport" />
{{< / highlight >}}

Have you ever seen this bad boy floating around all the HTML boilerplates? I
sure have. I had never bothered to really figure out what it was all about.
Turns out it was exactly what I was looking for. What was happening was that my
phone was setting `100vw` correctly, but then, on noticing that there were
elements outside the width of the screen, it was also zooming out so as to
include all the other elements. Adding the above line to my html atleast let me
maintain my sanity.

<br>
<div class='flex-center'>
<img src='/cluegrid/mobile-2.5.png' alt='yeah... I cheated on this image. I
dont have a screenshot with the width set correctly and everythin else not
working... sue me' width='300'/>
</div>

It's still a mess, but it's a _predictable, scrollable_ mess. Now we're in
business. Now I'm going to have to start making some layout changes. But I don't
that to affect my beautiful desktop layout. 

### CSS `@media` queries to the rescue.

CSS media queries allow you to define different CSS attributes depending on
various media factors. Since we're trying to add support for mobile devices,
there are different media queries that we could use. If I'd really bothered to
do proper research, I would have discovered that there are two approaches
that could work for me, though for quite different reasons.

{{< highlight css>}}
    /* based on screen width */
    @media screen and (max-width: 699px) 

    /* based on input type */
    @media only screen and (hover:none)
    @media only screen and (pointer:coarse)
{{< / highlight >}}

I didn't really do the research required at this stage <sup>(or any stage really...)</sup>
and just went ahead with the `(max-width)` based query because it looked
familiar from some CSS frameworks I had used before. Jumping ahead without
further consideration at this point is again something that will come back to
bite me in the future. But lets move ahead now.

Now that I can set different styles for a narrow screen, I go ahead and edit the
layout. Luckily I was using flexboxes everywhere, so the layout changes aren't
too complicated. Just have to add one `flex-direction: column;`, and the clues
will appear below the grid.

<br>
<div class='flex-center'>
<img src='/cluegrid/mobile-3.png' alt='mobile3' width='300'/>
</div>

Umm. Yeah. I was using `vh` to set the size of each cell in the grid, because in
the landscape layout, height is the limiting factor. Luckily I was using CSS
variables, and I just had to redefine my `--cell-size`, and all my
`var(--cell-size)` elements would automatically update. CSS variables are magic.

<br>
<div class='flex-center'>
<img src='/cluegrid/mobile-5.png' alt='mobile5' width='300'/>
</div>

Great. I'm all done. 
Now I have a perfectly usable crossword app for mobile.
Cool let's give it a whirl. 

### Oh wait. Something is wrong. Oh no. Oh no no no.

---

# the big architectural design sin

As I was working on the application, there were several times I had to make critical
decisions that fundamentally affected the design and architecture of the
application. Ofcourse, every time I made them, I didn't even think about how it
would work on mobile. As you have probably already predicted, this really came
back to bite.

## Handling Inputs...
Since we _"always"_ have a keyboard on hand, let's just listen for `keydown`
events. I'm sure it'll be easier to make that look good than to style input
elements. 

On mobile, I have _no way_ of even making entries into the crossword. The
keyboard doesn't even open. What use is a crossword that you cannot even fill?
So I guess we're not done. We're not nearly done.

Luckily mobile devices still emit `onclick` events. So I can detect when a cell
or a clue is clicked. Now I only have to figure out how to open up the keyboard
when this is clicked. A quick <sup>(and therefore not thorough)</sup> search
revealed that if an application is focused on an input field, the keyboard
should automatically open. So yeah, it's simple. I will create an invisible
input field, and whenever the user clicks on an element, I can then use
javascript to `focus()` on my invisible input and then the keyboard will
automatically open. Then that keyboard will emit the requisite `keydown`
events, and all of my problems will be solved.

<br>
<div class='flex-center'>
<img src='/cluegrid/mobile-4.png' alt='mobile4' width='300'/>
</div>

Okay, the styling is a little off, but atleast the keyboard is present. Okay,
now let's see how this works... No? It still doesn't work? Okay what now? 

So I
don't really know what the issue is even now, but what my "investigation"
revealed is that `keydown` events are fired, but they don't resemble the events
we see on desktop. Instead of nice predictable `KeyC` and `KeyG` `event.code`s, we
get weird `=Unidentified code=`s... 

### `keydown` events are wierd

<div class='flex-around'>
<div><img src='/cluegrid/desktop-keypress.png' alt='desktop-keydown' width='400'/><br>Desktop</div>
<div><img src='/cluegrid/mobile-keypress.png' alt='mobile-keydown'
width='300'/><br>Mobile</div>
</div>


_NOTE: This is the one thing I really didn't follow up on. I
don't know if I'm doing something wrong, but I just found a solution and went
ahead with that. If you know what I can do different so solve it, <a href='https://github.com/chapliboy/cluegrid/issues/1' target='_blank'>please let me know...</a> (<a href='https://javascript.info/keyboard-events'
target='_blank'>Link to online keycode viewer</a>)_

As I always do, rather than necessarily solving the problem itself, I just found
my way around it. I mean, I already created an input field right? The inputs are
surely going into that. Let's just use that. So I write some quick and dirty
code to check the latest character typed. I also realised that I had to support
the user pressing backspace multiple times... Yeah, let's just put in some
placeholder to start off, and then if the length is reduced, we know that it was
backspace, otherwise we can just simulate a `keydown`.

<details style='background-color: #ffffff09;'>
  <summary style='opacity: 0.6; padding-left: 2rem;'>Some code samples and interesting events in
coming up with the same.</summary>
{{< highlight js>}}
  let initialString = '000000000'
  fakeInputElement.value = initialString
  fakeInputElement.focus();
  fakeInputElement.oninput = function () {
    let newString = fakeInputElement.value;
    if (newString.length > initialString.length) {
      // User has typed something
      let character = newString[newString.length-1].toUpperCase();
      // Let's make sure it's not an emoji or something...
      if ((character >= "A" && character <= "Z")) {
        manuallyTriggerKeyDown("Key"+character)
      }
    } else {
      // User has backspaced something
      manuallyTriggerKeyDown("Backspace")
    }
    initialString = newString
  }
{{< / highlight >}}

<div class='flex-center'>
<img src='/cluegrid/mobile-8.png' alt='mobile8' width='300'/>
</div>
<p> When I used spaces for the entry string instead of zeroes, some weird things
happen when trying to use backspace. Does anyone know what this <a href='https://github.com/chapliboy/cluegrid/issues/2' target='_blank'>sfmo thing</a> is? I
couldn't find any references.</p>
<br>
<div class='flex-center'>
<img src='/cluegrid/mobile-9.png' alt='mobile9' width='300'/>
</div>
<p> When I used 'a' for the entry string, android tried to help by
autocompleting... I wonder if anyone at Google was very concerned for my
safety...</p>
</details>

### Okay. Are we done now?

I mean... It works. But is it really responsive? It's really hard to use. It's
kinda ugly too. And I have come this far. Let's just redesign the whole thing to
make it actually nice to use? Alright. Great idea. Let's do it. So we just have
to make a new screen open so that users can easily enter the clues answers.
Maybe add some extra buttons there as well. Yeah could be nice.
<br>
<div class='flex-center'>
<img src='/cluegrid/mobile-13.png' alt='mobile13' width='300'/>
</div>

Maybe we can also clean up the page itself. Why scroll down to view the clues.
We should be able to come up with a slightly cleaner UX.
<br>
<div class='flex-around'>
<img src='/cluegrid/mobile-10.png' alt='mobile10' width='300'/>
<img src='/cluegrid/mobile-11.png' alt='mobile11' width='300'/>
</div>

Well, that certainly looks a lot better than before. Maybe even borderline
usable. I think I'm happy with the way that looks. Our tale hasn't ended yet
though. My office has a couple of iPads, and I thought it would be interesting to see
how my app looks like on them. 

### iPad - where it all comes back to bite.

Remember how we set our media query to check the width of the application? Well,
the ipad certainly isn't narrower than `699px`. So the app renders as the desktop
version on ipad. So again, we can't make any inputs. We can change to css media
queries to the input based ones, but then we lose all the benefits of the large
ipad screen, and cannot simultaneously see the clues and the grid.

Also, remember how we were using the `focus()` on our fake input element? Yeah,
iOs doesn't allow us to do that... So for the most part the application is
completely unusable on iOS devices. Unless you just want the answers to the
clues (for which the `SOLVE CLUES` button still functions.)

At this point, I had two options.

**Option 1**: Break up the CSS into multiple sets of media queries. One for the
screen width, and one for the touch screen support. Additionally, re-architect
the entire app to use an input element for each box in the crossword, and hope
that iOS supports that. Resign yourself to the fact that the experience is
always going to be sub-par on mobile devices.

**Option 2**: 
<div class='flex-center'>
<img src='/cluegrid/mobile-14.png' alt='mobile14' width='600'/>
</div>

# conclusions
So after this whole adventure, I think it's clear what the takeaways *should*
be...
1. Always design for mobile first.
2. Thoroughly research all options before implementation.
3. Keep in mind the intricacies of the different platforms that you are
   targetting.

### Yeah... No thanks.
Honestly, this whole application for me was just an excuse to learn
<a href='https://elm-lang.org' target='_blank'>elm</a>. It was just meant to be
a fun exercise and I sure had fun building it. If you are working on some
professional project, then yeah, sure, do all of the above. But when ypu're
building to learn, or building for fun, that's not the most important thing. Do
the things that give you the best chance for actually completing the project.
Even if these things come back and bite you, atleast you have a great story for
your blog.

<a href='https://cluegrid.chapliboy.com' target='_blank'>Link to the cluegrid
app</a>. <sup>You probably don't want to open it on mobile. ‾\\\_(ツ\)_/‾</sup>

### Build stuff. Break things. Have fun.
