
import Foundation
import UIKit
extension UIView
{
    public var width:CGFloat{return frame.size.width}
    public var height:CGFloat{return frame.size.height}
    public var top:CGFloat{return frame.origin.y}
    public var bottom:CGFloat{return top + height}
    public var left:CGFloat{return frame.origin.x}
    public var right:CGFloat{return left + width}
}
extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(rgb: Int) {
        self.init(
            red: (rgb >> 16) & 0xFF,
            green: (rgb >> 8) & 0xFF,
            blue: rgb & 0xFF
        )
    }
}
extension UILabel{
    func bold() -> UILabel {
        if let descriptor = self.font.fontDescriptor.withSymbolicTraits(UIFontDescriptor.SymbolicTraits.traitBold){
            self.font = UIFont(descriptor: descriptor, size: 0)
        }
        return self
    }
}
extension UITextField {
    func addBottomBorder(){
        let bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 0, y: self.frame.size.height - 1, width: self.frame.size.width, height: 1)
        bottomLine.backgroundColor = UIColor.black.cgColor
        self.borderStyle = .none
        self.layer.addSublayer(bottomLine)
    }
}
