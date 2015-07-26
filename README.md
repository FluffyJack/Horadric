# Horadric
Combine your development skills to build something great.

> "Collect both parts of a Horadric Staff and unite them using a Horadric Cube. Then, you may enter Tal Rasha's Burial Chamber."
> - Deckard Cain, Diablo II

## Installation

```
pod 'Horadric'
```

Or if you just want to try it out first...

```console
pod try Horadric
```

## Navigation actions

Inside of a Horadric web view you can use special URL schemes to utilise native navigation like push and modal presentation.

**NOTE** If you are going to use push navigation you should probably make sure your `HoradricViewController` subclass is embedded inside of a `UINavigationController`.

```html
<a href="push://pagetwo">Push pagetwo.html on screen</a>
<a href="openmodal://greatmodal">Present greatmodal.html modally</a>
<a href="closemodal://">Close the modal this screen is in</a>
```
