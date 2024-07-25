# Todo Checker

An informal tool to log "todo" comments in a given code file.

## Concept

There are various extensions and plugins for most text editors that will change the color of the text based on a certain prefix to a comment. For example:

```c
// todo
// ^---- that would turn the line orange.
```
```c
// ? this line would be blue.
```
```c
// ! and this one would be red. 
```
```c
// * light green...
```
etc.

This tool will parse your file, look for commonly used prefixes, and log them to the console in order of their perceived priority. 
