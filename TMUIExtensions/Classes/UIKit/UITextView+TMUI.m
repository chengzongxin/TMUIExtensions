//
//  UITextView+TMUI.m
//  TMUIKit
//
//  Created by Joe.cheng on 2021/1/23.
//

#import "UITextView+TMUI.h"
#import <TMUICore/TMUICore.h>

@implementation UITextView (TMUI)


- (NSRange)tmui_convertNSRangeFromUITextRange:(UITextRange *)textRange {
    NSInteger location = [self offsetFromPosition:self.beginningOfDocument toPosition:textRange.start];
    NSInteger length = [self offsetFromPosition:textRange.start toPosition:textRange.end];
    return NSMakeRange(location, length);
}

- (UITextRange *)tmui_convertUITextRangeFromNSRange:(NSRange)range {
    if (range.location == NSNotFound || NSMaxRange(range) > self.text.length) {
        return nil;
    }
    UITextPosition *beginning = self.beginningOfDocument;
    UITextPosition *startPosition = [self positionFromPosition:beginning offset:range.location];
    UITextPosition *endPosition = [self positionFromPosition:beginning offset:NSMaxRange(range)];
    return [self textRangeFromPosition:startPosition toPosition:endPosition];
}

- (void)tmui_setTextKeepingSelectedRange:(NSString *)text {
    UITextRange *selectedTextRange = self.selectedTextRange;
    self.text = text;
    self.selectedTextRange = selectedTextRange;
}

- (void)tmui_setAttributedTextKeepingSelectedRange:(NSAttributedString *)attributedText {
    UITextRange *selectedTextRange = self.selectedTextRange;
    self.attributedText = attributedText;
    self.selectedTextRange = selectedTextRange;
}

- (void)tmui_scrollRangeToVisible:(NSRange)range {
    if (CGRectIsEmpty(self.bounds)) return;
    
    UITextRange *textRange = [self tmui_convertUITextRangeFromNSRange:range];
    if (!textRange) return;
    
    NSArray<UITextSelectionRect *> *selectionRects = [self selectionRectsForRange:textRange];
    CGRect rect = CGRectZero;
    for (UITextSelectionRect *selectionRect in selectionRects) {
        if (!CGRectIsEmpty(selectionRect.rect)) {
            if (CGRectIsEmpty(rect)) {
                rect = selectionRect.rect;
            } else {
                rect = CGRectUnion(rect, selectionRect.rect);
            }
        }
    }
    if (!CGRectIsEmpty(rect)) {
        rect = [self convertRect:rect fromView:self.textInputView];
        [self _scrollRectToVisible:rect animated:YES];
    }
}

- (void)tmui_scrollCaretVisibleAnimated:(BOOL)animated {
    if (CGRectIsEmpty(self.bounds)) return;
    
    CGRect caretRect = [self caretRectForPosition:self.selectedTextRange.end];
    [self _scrollRectToVisible:caretRect animated:animated];
}

- (void)_scrollRectToVisible:(CGRect)rect animated:(BOOL)animated {
    // scrollEnabled ??? NO ??????????????????????????? rect ??? https://github.com/Tencent/QMUI_iOS/issues/205
    if (!CGRectIsValidated(rect)) {
        return;
    }
    
    CGFloat contentOffsetY = self.contentOffset.y;
    
    if (CGRectGetMinY(rect) == self.contentOffset.y + self.textContainerInset.top) {
        // ?????????????????????????????????????????????????????? return????????????????????????????????????????????????????????????????????????
        return;
    }
    
    if (CGRectGetMinY(rect) < self.contentOffset.y + self.textContainerInset.top) {
        // ??????????????????????????????????????????
        contentOffsetY = CGRectGetMinY(rect) - self.textContainerInset.top - self.contentInset.top;
    } else if (CGRectGetMaxY(rect) > self.contentOffset.y + CGRectGetHeight(self.bounds) - self.textContainerInset.bottom - self.contentInset.bottom) {
        // ??????????????????????????????????????????
        contentOffsetY = CGRectGetMaxY(rect) - CGRectGetHeight(self.bounds) + self.textContainerInset.bottom + self.contentInset.bottom;
    } else {
        // ???????????????????????????????????????
        return;
    }
    [self setContentOffset:CGPointMake(self.contentOffset.x, contentOffsetY) animated:animated];
}
@end
