import Foundation
import SwiftUI

extension UIApplication {
    func hideKeyboard() {
        guard let windowScene = connectedScenes.first as? UIWindowScene,
              let win = windowScene.windows.first else { return }
        let tapRecognizer = UITapGestureRecognizer(target: win, action: #selector(UIView.endEditing))
        tapRecognizer.cancelsTouchesInView = false
        tapRecognizer.delegate = self
        win.addGestureRecognizer(tapRecognizer)
    }
}

extension UIApplication: UIGestureRecognizerDelegate {
    public func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return false
    }
}
