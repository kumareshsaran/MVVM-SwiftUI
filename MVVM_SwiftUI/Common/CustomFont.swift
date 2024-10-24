//
//  CustomFont.swift
//  MVVM_SwiftUI
//
//  Created by kumersan on 10/24/24.
//

import Foundation
import SwiftUI

struct CustomFontModifier: ViewModifier {
    enum FontType {
        /// "sf-pro-semibold", size: 20
        case heading
        /// "sf-pro-regular", size: 14
        case description
        /// "sf-pro-regular", size: 17
        case textField
        /// "sf-pro-bold", size: 32
        case largeHeading
    }
    let fontType: FontType
    func body(content: Content) -> some View {
        switch fontType {
        case .textField:
            content.font(.custom("sf-pro-regular", size: 17))
        case .heading:
            content.font(.custom("sf-pro-semibold", size: 20))
        case .description:
            content.font(.custom("sf-pro-regular", size: 14))
        case .largeHeading:
            content.font(.custom("sf-pro-bold", size: 32))
        }
    }
}

extension View {
    func setCustomFont(fontType: CustomFontModifier.FontType) -> some View {
        self.modifier(CustomFontModifier(fontType: fontType))
    }
}
