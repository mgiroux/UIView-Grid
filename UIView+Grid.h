//
//  UIView+Extender.h
//  ViewExtender
//
//  Created by Marc Giroux on 2016-04-05.
//  Copyright © 2016 Marc Giroux. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef struct {
    int x;
    int y;
} GridPoint;

typedef struct {
    int width;
    int height;
} GridSize;

@interface UIView (Grid)

/** Setup the grid size for all grids in the app */
+ (void)setupWithGridSize:(int)gridsize;

/** Initialize a view with a size in grid points and position in grid points */
- (instancetype)initWithGridSize:(GridSize)size withPosition:(GridPoint)position;

/** Set grid position of this view */
- (void)setGridPosition:(GridPoint)position;

/** Set grid position for a view */
- (void)setGridPosition:(GridPoint)position forView:(UIView *)view;

/** Get grid CGPoint for given GridPoint */
- (CGPoint)getPositionForGridPoints:(GridPoint)point;

/** Get grid positioning of the given view */
- (GridPoint)getGridPositionOfView:(UIView *)view;

/** Get last possible grid row in view */
- (int)getLastPossibleRow;

/** Get last possible column in view */
- (int)getLastPossibleColumn;

/** Show the grid with given color */
- (void)showGridWithColor:(UIColor *)color;

@end

/** Custom GridPoint structure maker */
CG_INLINE GridPoint GPMake(int x, int y)
{
    GridPoint p;

    p.x = x;
    p.y = y;

    return p;
}

/** Custom GridSize structure maker */
CG_INLINE GridSize GSMake(int width, int height)
{
    GridSize p;

    p.width  = width;
    p.height = height;

    return p;
}
