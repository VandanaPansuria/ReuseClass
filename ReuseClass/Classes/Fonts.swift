//
//  Fonts.swift
//  ReuseClass
//
//  Created by MacV on 27/01/21.
//

import Foundation
import CoreText

public class VCustomFonts: NSObject {

  public enum Style: CaseIterable {
    case regular
    case bold
    public var value: String {
      switch self {
      case .regular: return "Gopher-Regular"
      case .bold: return "Gopher-Bold"
      }
    }
    public var font: UIFont {
      return UIFont(name: self.value, size: 14) ?? UIFont.init()
    }
  }
  public static var loadFonts: () -> Void = {
    let fontNames = Style.allCases.map { $0.value }
    for fontName in fontNames {
      loadFont(withName: fontName)
    }
    return {}
  }()
  private static func loadFont(withName fontName: String) {
    guard
      let bundleURL = Bundle(for: self).url(forResource: "ReuseClass", withExtension: "bundle"),
      let bundle = Bundle(url: bundleURL),
      let fontURL = bundle.url(forResource: fontName, withExtension: "otf"),
      let fontData = try? Data(contentsOf: fontURL) as CFData,
      let provider = CGDataProvider(data: fontData),
      let font = CGFont(provider) else {
        return
    }
    CTFontManagerRegisterGraphicsFont(font, nil)
  }
}
