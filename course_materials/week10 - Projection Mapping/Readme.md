# A few initial thoughts

* [http://www.gabrielshalom.com/theory/](http://www.gabrielshalom.com/theory/)

* [http://www.artandeducation.net/paper/breaking-the-frame-olafur-eliassons-art-merleau-pontys-phenomenology-and-the-rhetoric-of-eco-activism/](http://www.artandeducation.net/paper/breaking-the-frame-olafur-eliassons-art-merleau-pontys-phenomenology-and-the-rhetoric-of-eco-activism/)

* * *


Day 1

# What is projection mapping?

* [http://en.wikipedia.org/wiki/Projection_mapping](http://en.wikipedia.org/wiki/Projection_mapping)

# Welcome to projection mapping

5/26/2015

* [https://vimeo.com/43385747](https://vimeo.com/43385747) (Dane Luttik - Projection Mapping short documentary)

* [https://vimeo.com/85212054](https://vimeo.com/85212054) (AntiVJ - The Ark)

    * Intricacies of broken surfaces

    * Audio/visual show

    * Pure aesthetic

    * (shape fitting)

* [https://www.youtube.com/watch?v=KToDmJbEE7Y](https://www.youtube.com/watch?v=KToDmJbEE7Y) (Masaru Ozaki - Chair)

    * (shape fitting)

    * Exploring form, gracefully

    * Positions the form as a landscape - as a panned shot in a film moving across rolling hills

* [http://www.bioluminescent-forest.com/film/](http://www.bioluminescent-forest.com/film/) (3hund - Bioluminescent Forest)

    * "Natural" augmentation - they are exploring a relationship between the natural and the digital, or computational

    * Lives as a video

    * (tracing)

    * [http://www.bioluminescent-forest.com/](http://www.bioluminescent-forest.com/) (documentation)

    * inspiration, preparation, production

    * [http://www.bioluminescent-forest.com/behind-the-scenes/](http://www.bioluminescent-forest.com/behind-the-scenes/)

* [https://vimeo.com/18888136](https://vimeo.com/18888136) (1024 Architecture - Perspective Lyrique)

    * Explore shadows

    * Interactivity

    * Spectacle

    * (digital overlay)

* [http://obscuradigital.com/work/sf-city-hall-centennial-projections/](http://obscuradigital.com/work/sf-city-hall-centennial-projections/) (Obscura Digital - San Francisco City Hall Centennial Celebration)

* [https://vimeo.com/113000956](https://vimeo.com/113000956) (Emmy Curl - Come Closer)

    * Illusory

    * Layering

    * (digital overlay)

# Try it yourself

* Find an object, spatial detail, or other

    * Write down 5 qualities about it

        * Examples

            * Material

            * Shape

            * Context, how it relates to a whole

            * Texture

            * …

* Now shine a projector onto it

    * Explore what it means to shine concentrated light onto the object

    * Make solid background colors and explore how different colors work with the surface and material

    * Look at the 5 qualities you wrote down and think about how they are affected by the light

# The basic process

[http://www.instructables.com/id/Projection-Mapping-with-3D-Tracing/](http://www.instructables.com/id/Projection-Mapping-with-3D-Tracing/)

* Identify content / concept

    * What is the content?

        * Videos

        * Images

        * Vector animations

    * What is/are the object(s) you’ll map to?

        * How many surfaces will cover all objects?

        * Is it planar?

        * Is it made up of straight lines?

    * What is the concept?

        * Why are you mapping this object with this content?

* Decide on a technique (or multiple) based on the object(s) to be mapped

    * Quad mapping

    * Masking layers

    * Mesh mapping

# Quad mapping

* What you’ll need

    * Drawing surface: the surface that you’ll draw things on

    * CornerPinSurface: the projected surface, mapped onto an object *with* the "drawing surface"

* What you’ll want

    * An image, video, or custom animation

* Basic idea

    * The corners of a rectangle act as anchor points for rendering a texture onto it properly.  TopLeft (0,0) of one graphic *always* relates to TopLeft (0,0) of another graphic

**( Processing tutorial: "quad_map_simple" )**

# Try it yourself

* Go back to the object you chose earlier

* Break it down into quads, as best you can

* Draw the proper quads in Processing and fit them onto the object

* Explore different colors, images, animations

# Quad mapping with multiple quads

**( Processing tutorial: "quad_map_multiple_surface" )**

# Try it yourself

* * *


Day 2

# Quads and Masks

5/28/2015

# Recap of what quad mapping is

**( Diagram: "texture_mapping_diagram" )**

# Understanding PGraphics

**(Processing tutorial: "simple_animate")**

* Take the example and hit run

* How can we render this to PGraphics?

# Interactive coding exercise

* How can we put the "simple_animate" example into a Keystone CornerPinSurface?

# Mouse interaction on quad maps

* Load the simple quad mapping example, with only 1 quad

* Add a few lines of code

* What we’ll do is change the tint of your video based on where the mouse is on the screen

* Notice how we are drawing an ellipse onto the quad

    * This is something you can explore much further.  PGraphics can handle everything you would do inside of draw() but keeping it contained to a window.

**( Processing tutorial: "texture_map_mouse" )**

# Try it yourself

* Take 15 minutes to explore mouse interactions, and drawing other shapes/animations to the PGraphics object

* Test it out on a projector and some objects around the theatre if you’d like

# Shape clipping masks

* What is a clipping mask?

* What is a convex hull?

* Grab the example from github called "shape_clipping_mask"

* You will need at least 4 points before it works

    * "c" will calibrate

    * "s" will save

    * "l" will load

* I wrote this tool, so it’s not super robust

**( Processing tutorial: "shape_clipping_mask" )**

# Try it yourself

* Take 30 minutes exploring more complex shapes that can be projection mapped now that you are not bound to quads

* Try quads and complex shapes

# Multiple clipping masks

* Multiple masks on 1 video

**( Processing tutorial: "shape_clipping_mask_multiple" )**

* Multiple masked video

* * *


Day 3

# Work session!

