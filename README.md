# UIView-Grid
Add a grid positioning system to UIView

---

# Install

Copy the .h and .m files to your project. Once this is done, you can use it on anything that resolves to a UIView. Here is how you set it up

### In AppDelegate.m

in AppDelegate.m in the `didFinishLaunchingWithOptions` method

```objective-c
[UIView setupWithGridSize:12];
```

This creates a grid that's 12 units wide. The number of units in the Y axis is determined by the size of the device's screen.

To add a view in the grid

```objective-c
UIView *myView = [[UIView alloc] initWithGridSize:GSMake(3, 1) withPosition:GPMake(2, 2)];
```

This would create a UIView that is 3 cell wide by 1 cell high placed a x:2 and y:2 cell like so:

	12 cell wide grid
	
	| _ | _ | _ | _ | _ | _ | _ | _ | _ | _ | _ | _ |
	| _ | A | A | A | _ | _ | _ | _ | _ | _ | _ | _ |
	| _ | A | A | A | _ | _ | _ | _ | _ | _ | _ | _ |
	| _ | _ | _ | _ | _ | _ | _ | _ | _ | _ | _ | _ |
	
`A` represents the space the view would be using

Get grid position of a view

```objective-c
GridPoint point = [self.view getGridPositionOfView:myView];
NSLog(@"%d x %d", point.x, point.y);
```

Get CGPoint for animation purposes based on grid coordinates

```objective-c
CGPoint pos = [self.view getPositionForGridPoints:GPMake(0, 2)];
```

Get what is the last possible column/row that can be used

```objective-c
NSLog(@"%d", [self.view getLastPossibleColumn]);
NSLog(@"%d", [self.view getLastPossibleRow]);
```

GPMake - GSMake

GPMake is a function that generates a GridPoint structure (x, y) for the grid system to understand<br/>
GSMake is a function that generates a GridSize structure (width, height) for the grid system to understand

```objective-c
GridPoint position = GPMake(2, 1);
GridSize size      = GSMake(5, 2);
```

## Notes
Please note that this library is meant to be used in an app that does not use Storyboards or xibs. It also does not support orientation change, this is up to you to change your UI.

## TODO
Eventually i woud like to add support for the device orientation. But it is not a priority.
