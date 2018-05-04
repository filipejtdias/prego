//
//  UIColor+Utils.swift
//  Prego
//
//  Created by Filipe Dias on 04/05/2018.
//

import Foundation

public extension UIColor {
    
    public class var random: UIColor {
        
        let allColors: [UIColor] = [.black, .darkGray,
                                    .lightGray, .gray,
                                    .red, .green,
                                    .blue, .cyan,
                                    .yellow, .magenta,
                                    .orange, .purple, .brown]
        
        let pos = arc4random_uniform(UInt32(allColors.count))
        
        return allColors[Int(pos)]
    }
    
    public convenience init(hex: String) {
        
        let hexString = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int = UInt32()
        
        Scanner(string: hexString).scanHexInt32(&int)
        
        let a, r, g, b: UInt32
        
        switch hexString.count {
            
        case 3: // RGB (12-bit)
            
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
            
        case 6: // RGB (24-bit)
            
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
            
        case 8: // ARGB (32-bit)
            
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
            
        default:
            
            (a, r, g, b) = (1, 1, 1, 0)
        }
        
        self.init(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: CGFloat(a) / 255)
    }
    
    public func rgb() -> (red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat)? {
        
        var fRed: CGFloat   = 0
        var fGreen: CGFloat = 0
        var fBlue: CGFloat  = 0
        var fAlpha: CGFloat = 0
        
        if getRed(&fRed, green: &fGreen, blue: &fBlue, alpha: &fAlpha) {
            
            let iRed    = CGFloat(fRed * 255.0)
            let iGreen  = CGFloat(fGreen * 255.0)
            let iBlue   = CGFloat(fBlue * 255.0)
            let iAlpha  = CGFloat(fAlpha * 255.0)
            
            return (red: iRed, green: iGreen, blue: iBlue, alpha: iAlpha)
            
        } else {
            
            print("Could not extract RGBA components")
            return nil
        }
    }
}
