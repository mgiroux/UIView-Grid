//
//  UIView+Extender.m
//  ViewExtender
//
//  Created by Marc Giroux on 2016-04-05.
//  Copyright © 2016 Marc Giroux. All rights reserved.
//

#import "UIView+Grid.h"

static CGFloat squareSize = 0;
static int maxWidthCount  = 12;
static int maxHeightCount = 0;

@implementation UIView (Grid)

+ (void)setupWithGridSize:(int)gridsize;
{
    maxWidthCount  = gridsize;
    squareSize     = [UIScreen mainScreen].bounds.size.width / maxWidthCount;
    maxHeightCount = ceil([UIScreen mainScreen].bounds.size.height / squareSize);
}

- (instancetype)initWithGridSize:(GridSize)size withPosition:(GridPoint)position
{
    self = [self init];

    int num1 = size.width;
    int num2 = size.height;

    int pos1 = position.x;
    int pos2 = position.y;

    if (pos1 <= 0 || pos2 <= 0) {
        [NSException raise:@"Invalid grid value" format:@"You cannot place anything lower than 1x1 use have used %dx%d", pos1, pos2];
    }

    if (num1 <= 0 || num2 <= 0) {
        [NSException raise:@"Invalid grid value" format:@"You cannot size anything lower than 1x1 use have used %dx%d", num1, num2];
    }

    if (num1 > maxWidthCount) {
        [NSException raise:@"Invalid grid value" format:@"You cannot be more than %d columns wide", maxWidthCount];
    }

    if (num2 > maxHeightCount) {
        [NSException raise:@"Invalid grid value" format:@"You cannot be more than %d rows high", maxHeightCount];
    }

    float width  = num1 * squareSize;
    float height = num2 * squareSize;

    pos1 = (pos1 - 1 > 0) ? pos1 - 1 : 0;
    pos2 = (pos2 - 1 > 0) ? pos2 - 1 : 0;

    float x = pos1 * squareSize;
    float y = pos2 * squareSize;

    self.frame = CGRectMake(x, y, width, height);

    return self;
}

- (void)setGridPosition:(GridPoint)position
{
    int pos1 = position.x;
    int pos2 = position.y;

    if (pos1 <= 0 || pos2 <= 0) {
        [NSException raise:@"Invalid grid value" format:@"You cannot place anything lower than 1x1 use have used %dx%d", pos1, pos2];
    }

    pos1 = (pos1 - 1 > 0) ? pos1 - 1 : 0;
    pos2 = (pos2 - 1 > 0) ? pos2 - 1 : 0;

    float x = pos1 * squareSize;
    float y = pos2 * squareSize;

    self.frame = CGRectMake(x, y, self.frame.size.width, self.frame.size.height);
}

- (void)setGridPosition:(GridPoint)position forView:(UIView *)view
{
    int pos1 = position.x;
    int pos2 = position.y;

    if (pos1 <= 0 || pos2 <= 0) {
        [NSException raise:@"Invalid grid value" format:@"You cannot place anything lower than 1x1 use have used %dx%d", pos1, pos2];
    }

    pos1 = (pos1 - 1 > 0) ? pos1 - 1 : 0;
    pos2 = (pos2 - 1 > 0) ? pos2 - 1 : 0;

    float x = pos1 * squareSize;
    float y = pos2 * squareSize;

    view.frame = CGRectMake(x, y, view.frame.size.width, view.frame.size.height);
}

- (GridPoint)getGridPositionOfView:(UIView *)view
{
    CGFloat x  = view.frame.origin.x;
    CGFloat y = view.frame.origin.y;

    int pointX = (int)(x / squareSize);
    int pointY = (int)(y / squareSize);

    if (pointX == 0) { pointX = 1; } else { pointX++; }
    if (pointY == 0) { pointY = 1; } else { pointY++; }


    return GPMake(pointX, pointY);
}

- (int)getLastPossibleRow
{
    return maxHeightCount;
}

- (int)getLastPossibleColumn
{
    return maxWidthCount;
}

- (CGPoint)getPositionForGridPoints:(GridPoint)point
{
    return CGPointMake(point.x * squareSize, point.y * squareSize);
}

- (void)showGridWithColor:(UIColor *)color
{
    CGFloat h = 0;
    CGFloat v = 0;

    while (v <= maxHeightCount) {
        while (h <= maxWidthCount) {
            if (v > 0 && h > 0) {
                CGFloat _v = v;
                UIView *v = [[UIView alloc] initWithGridSize:GSMake(1, 1) withPosition:GPMake(h, _v)];

                v.layer.borderColor = color.CGColor;
                v.layer.borderWidth = 0.5f;

                [self addSubview:v];
                [self bringSubviewToFront:v];
            }
            h++;
        }

        h = 0;
        v++;
    }
}

@end
