Bank
====

A Bank implementation in Haskell.

## Proofs
All Lemmas proven using PVS in my [Lab5](https://github.com/skylerto/Software-Engineering-Requirements/tree/master/Lab5).

## Lessons Learned

### A Lesson in equality (= vs <-)
There's a very big difference between the following two lines.

``` haskell
b1 <- deposit b1 10
b1 = deposit b1 10
```

One executes the function then stores it, the other scores the function definition. A similar example in javascript is as follows:
``` javascript
var action = function() { ... }
var equals = action
var monad = action()
```

### The one where you output (return)
To use the `<-` you need to return a monad. I just so happens that using either the `return` function or the `pure` function will allow this to happen. So when defining a function which we'd like to reassign to a value, make sure to use the `return` function!

## License

Copyright © 2016 Skyler Layne
