import UIKit

extension UIView {
    public func findViewController() -> UIViewController? {
        if let nextResponder = self.next as? UIViewController {
            return nextResponder
        } else if let nextResponder = self.next as? UIView {
            return nextResponder.findViewController()
        } else {
            return nil
        }
    }
    
    public var isDarkMode: Bool {
        if let darkMode = findViewController()?.isDarkMode {
            return darkMode
        } else {
            return false
        }
    }
    
}
