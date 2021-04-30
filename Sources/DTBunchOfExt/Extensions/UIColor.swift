import UIKit

public extension UIColor {
    public var rgba: (red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) {
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0
        getRed(&red, green: &green, blue: &blue, alpha: &alpha)

        return (red, green, blue, alpha)
    }
    
    open func getGradientColor(at percent: CGFloat, with color: UIColor) -> UIColor {
        let red = self.rgba.red + percent * (color.rgba.red - self.rgba.red)
        let green = self.rgba.green + percent * (color.rgba.green - self.rgba.green)
        let blue = self.rgba.blue + percent * (color.rgba.blue - self.rgba.blue)
        let alpha = self.rgba.alpha + percent * (color.rgba.alpha - self.rgba.alpha)
        
        return UIColor(red: red, green: green, blue: blue, alpha: alpha)
    }
    
    public convenience init(hex: String) {
        let r, g, b, a: CGFloat

        if hex.hasPrefix("#") {
            let start = hex.index(hex.startIndex, offsetBy: 1)
            let hexColor = String(hex[start...])

            if hexColor.count == 8 {
                let scanner = Scanner(string: hexColor)
                var hexNumber: UInt64 = 0

                if scanner.scanHexInt64(&hexNumber) {
                    r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
                    g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
                    b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
                    a = CGFloat(hexNumber & 0x000000ff) / 255

                    self.init(red: r, green: g, blue: b, alpha: a)
                    return
                }
            }
        }

        self.init(red: 1, green: 1, blue: 1, alpha: 1)
        return
    }
}


