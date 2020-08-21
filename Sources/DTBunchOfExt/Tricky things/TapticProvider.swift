import UIKit

public enum TapticProviderState {
    case notificationSuccess
    case notificationWarning
    case notoficationError
    case touchLight
    case touchMedium
    case touchHeavy
    case seletionChanged
    
}

public class TapticProvider {
    static public let entry = TapticProvider()
    
    public func provide(_ state: TapticProviderState) {
        if #available(iOS 10.0, *) {
            switch state {
            case .notificationSuccess:
                let generator = UINotificationFeedbackGenerator()
                generator.notificationOccurred(.success)
            case .notificationWarning:
                let generator = UINotificationFeedbackGenerator()
                generator.notificationOccurred(.warning)
            case .notoficationError:
                let generator = UINotificationFeedbackGenerator()
                generator.notificationOccurred(.error)
            case .touchLight:
                let generator = UIImpactFeedbackGenerator(style: .light)
                generator.impactOccurred()
            case .touchMedium:
                let generator = UIImpactFeedbackGenerator(style: .medium)
                generator.impactOccurred()
            case .touchHeavy:
                let generator = UIImpactFeedbackGenerator(style: .heavy)
                generator.impactOccurred()
            case .seletionChanged:
                let generator = UISelectionFeedbackGenerator()
                generator.selectionChanged()
            }
        }  else {
            // Fallback on earlier versions
        }
    }
}
