# QYKShadowView

![](https://github.com/YotrolZ/QYKShadowView/blob/master/Example/QYKShadowView/example%402x.png )

## Example
- To run the example project, clone the repo, and run `pod install` from the Example directory first.

## How to use QYKShadowView

- Installation with CocoaPods：
    - `pod 'QYKShadowView'`
    -  `#import <QYKShadowView/QYKShadowView.h>` 
- Manual import：
    - Drag the QYKShadowView folder to project
    - `#import "QYKShadowView.h"`

- Use
```Objc
QYKShadowView *view = [[QYKShadowView alloc] initWithFrame:CGRectMake(200, 250, 100, 100)];
view.backgroundColor = [UIColor whiteColor];
[view qyk_shadowRadius:10 shadowColor:[UIColor colorWithWhite:0 alpha:0.5] shadowOffset:CGSizeMake(0, 0) byShadowSide:(QYKShadowSideRight)];
[view qyk_cornerRadius:10 byRoundingCorners:(UIRectCornerBottomLeft)];
```

## Author

YotrolZ, 207213149@qq.com

## License

QYKShadowView is available under the MIT license. See the LICENSE file for more info.
