import UIKit

internal extension UIScrollView {
    var _isContetRectContainsBounds: Bool {
        let contentInset: UIEdgeInsets

        if #available(iOS 11.0, *) {
            contentInset = adjustedContentInset
        }
        else {
            contentInset = self.contentInset
        }

        return CGRect(origin: .zero, size: contentSize)
            .inset(by: contentInset.inverted)
            .contains(bounds)
    }

    var _maxContentOffsetX: CGFloat {
        return contentSize.width + contentInset.right - bounds.width
    }

    var _maxContentOffsetY: CGFloat {
        return contentSize.height + contentInset.bottom - bounds.height
    }
}

private extension UIEdgeInsets {
    var inverted: UIEdgeInsets {
        return UIEdgeInsets(top: -top, left: -left, bottom: -bottom, right: -right)
    }
}
