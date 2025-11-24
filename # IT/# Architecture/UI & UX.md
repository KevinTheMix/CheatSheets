# UI & UX

## Quick Tips

* [pixselacademy: 49 UI Design Tips](https://www.linkedin.com/feed/update/urn:li:ugcPost:6954769316294635520)
* [10 Usability Crimes You Really Shouldn't Commit](https://line25.com/articles/10-usability-crimes-you-really-shouldnt-commit)
  1. Form labels that aren't associated to form input fields
  2. A logo that doesn't link to the homepage
  3. Not specifying a visited link state
  4. Not indicating an active form field
  5. An image without an alt description
  6. A background image without a background color
  7. Using long boring passages of content
  8. Underlining stuff that isn't a link
  9. Telling people to click here
  10. Using justified text
* [w3.org: Personal names around the world](https://www.w3.org/International/questions/qa-personal-names)
* [Jakob Nielsen: Response Times: The 3 important Limits](https://www.nngroup.com/articles/response-times-3-important-limits) (Usability) = 0.1, 1 and 10
* [Trending Color palettes](https://coolors.co/palettes/trending)

## Glossary

* **Adaptive** = same code handling different platforms (eg Android, iOS, Web)
* **Breakpoint** = well-defined size at which an app layout adapts/switches (betwen destop/mobile/tablet)
* **Display typeface** = for short but eye-catching/important/large elements (eg titles, headings, pull quotes) rather than extended passages of body text
* [Fitt's Law](https://en.wikipedia.org/wiki/Fitts%27s_law#Implications_for_UI_design) = place buttons at screen edges
* **Flat design** = minimalist design language
* **Fluent Design System** = a design language developed by Microsoft in 2017
* **Graphics Design** = static visual content to communicate messages
* **Hamburger** = 3 horizontal lines icon button that usually opens a menu
* **Hover** = change in color, shadow or animation of a button/link/icon in response to a mouseover
* **Material Design** = design language developed by Google in 2014
* **Motion Design** = broad discipline including motion graphics, animation, cinematography, graphic design
* **Motion Graphics** = animated graphics elements (text, shapes, icons)
* **Mouseover** = mouse is over an element (just a state, no inherent associated animation/visuals)
* **Reactivity** = how UI responds to changes in underlying data (aka `UI = f(state`)
  * Reacting to (input) change in real-time in a very clear, visible fashion, and possibly impacting several parts of an application
* **Responsive** = responding to screen size change
* **Rollover** = icon/image-based swap in response to a mouseover
* **Scrim** = temporary greyed out (Material) area appearing on surface/rest of screen to make its content less prominent when a modal element is shown (eg dialog, drawer)
  * Clicking on it sometimes removes that modal element
* **Staggered animation** = a human-friendly way to introduce new UI elements on screen, one by one
* **Typeface** (aka **font family**) = design for alphanumerics & symbols used in printing/electronic display
* **Viewport** = a box that is bigger on the inside, ie children outside bounds can be scrolled into view

### Graphics

* **Bit Blit** = computer graphics data operation combining several bitmaps into one using a boolean function
* **Direct3D** = Windows 3D graphics rendering API
* **DirectX** = collection of Windows-focused API suite for graphics, audio (**DirectSound**), input devices (**DirectInput** eg kb/m), network communication (**DirectPlay**)
  * [Why do game developers prefer Windows?](https://softwareengineering.stackexchange.com/a/88055)
* **Graphics Pipeline** = whole step-by-step process performed by a GPU to render a 3D scene as a 2D projection
* **GLSL** (OpenGL Shading Language) = high-level OpenGL shading programming language based on C
* **Hardware-accelerated** = runs on dedicated (GPU) hardware rather than solely on general purpose CPU (which is also hardware btw)
* **Khronos Group** = consortium of hardware and software vendors with a vested interest in OpenGL, maintaining it
* **Mesa 3D** = open source imeplementation of OpenGL, Vulkan & other libraries
* **OpenGL** = cross-platform 2D/3D graphics rendering API (ie a standard set of possible instructions without concrete implementation)
  * [OpenGL Book](https://openglbook.com)
* **Shader** = program that runs on a GPU that transforms 3D data into a (three-dimensional-looking) 2D scene, part of Graphics Pipeline
  * _If a GPU is being used, shaders are involved_ (confirmed by ChatGPT, unless old GPUs or using CPU for software rendering)
  * **Fragment/Pixel Shader** = tiny program running once per pixel to compute their color (kinda inefficient because threads don't share calculation but done in parallel+++)
  * **Vertex** = 3D rotate/stretch projections
  * **Geometry** = add details or modify geometry in real-time (eg fur/hair)
  * **Compute** = general-purpose for other non-graphical tasks (physics calculation, AI)
  * [The Book of Shaders](https://thebookofshaders.com)
  * [Shadertoy](https://www.shadertoy.com) = community shaders library (eg [Raymarched Hexagonal Truchet](https://www.shadertoy.com/view/4td3zj))
    * [Cloud tunnel](https://www.shadertoy.com/view/XlSSzV)
    * [Spiral](https://www.shadertoy.com/view/tslcW4)
* **SVG** (Scalable Vector Graphics) = XML-based vector 2D graphics format with support for interactivity/animation (open standard by W3C)
* **Vulkan** (_Khronos Group_) = low-level cross-platform API & open standard for 3D graphics & computing, addressing **OpenGL** sortcomings

* Music Visualization
  * [Interactive Particles Music Visualizer](https://github.com/tgcnzn/Interactive-Particles-Music-Visualizer) = Three.js
  * [projectM](https://github.com/projectM-visualizer/projectm) = cross-platform music visualization library
  * [ShaderFlow](https://github.com/BrokenSource/ShaderFlow) = create & export real-time audio reactive shaders
