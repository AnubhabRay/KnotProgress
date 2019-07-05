# KnotProgress
It is a progress bar which includes states


This is a sample project showing the use of the KnotProgress view.

To use the progress view. Please follow the following steps:

1. Copy the File : **KnotProgressView.swift** in your project
2. Initialize the view with a frame of your choice.

```swift
let viewKnot = KnotProgressView(frame: CGRect(x: 20, y: 250, width: 300, height: 50))
```

3. Make changes to the default property values

```swift
    viewKnot?.knotCount = 4
    viewKnot?.htKnots = 30
```

To change state of the knots simply mention the state to which it would move to.

```swift
self.viewKnot!.changeKnotState(toState: counter)
```

