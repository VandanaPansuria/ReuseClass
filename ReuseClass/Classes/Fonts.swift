//
//  Fonts.swift
//  Vcustomclass
//
//  Created by MacV on 27/01/21.
//

import Foundation
public final class Fonts {
  static func podFont(name: String, size: CGFloat) -> UIFont {
    if let font = UIFont(name: name, size: size) {return font}
    let bundle = Bundle(for: Fonts.self)
    let url = bundle.url(forResource: name, withExtension: "otf")!
    let data = NSData(contentsOf: url)!
    let provider = CGDataProvider(data: data)!
    let cgFont = CGFont(provider)!
    let fontName = cgFont.postScriptName! as String
    CTFontManagerRegisterGraphicsFont(cgFont, nil)
    return UIFont(name: fontName, size: size)!
  }
}
