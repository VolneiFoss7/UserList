//
//  ShimmerView.swift
//  UsersList
//
//  Created by Volnei Foss on 27/02/26.
//

import SwiftUI


public struct ShimmerView: View {
    enum Constants {
        static let lightGray = UIColor(red: 0.93, green: 0.93, blue: 0.93, alpha: 1)
        static let darkerGray = UIColor(red: 0.8, green: 0.8, blue: 0.8, alpha: 1)
    }
    
    private var startColor: Color = {
        let defaultColor = Constants.lightGray
        return Color(UIColor { (trait) -> UIColor in
            if trait.userInterfaceStyle == .dark {
                return UIColor(white: 0.3, alpha: 1)
            } else {
                return defaultColor
            }
        })
    }()
    
    private var endColor: Color = {
        let defaultColor = Constants.darkerGray
        return Color(UIColor { (trait) -> UIColor in
            if trait.userInterfaceStyle == .dark {
                return UIColor(white: 0.17, alpha: 1)
            } else {
                return defaultColor
            }
        })
    }()
    
    @State private var shimmering = false
    private let width: CGFloat
    private let height: CGFloat
    private let cornerRadius: CGFloat
    private let animationDuration: CGFloat
    public init(width: CGFloat,
         height: CGFloat,
         cornerRadius: CGFloat = 0,
         animationDuration: CGFloat = 2) {
        self.width = width
        self.height = height
        self.cornerRadius = cornerRadius
        self.animationDuration = animationDuration
    }
    
    public var body: some View {
        LinearGradient(gradient: Gradient(colors: [startColor, endColor]),
                       startPoint: .leading,
                       endPoint: shimmering ? .trailing : .leading)
        .animation(.easeOut(duration: animationDuration).repeatForever(autoreverses: false), value: shimmering)
        .frame(width: width, height: height)
        .mask(RoundedRectangle(cornerRadius: cornerRadius))
        .onAppear {
            shimmering.toggle()
        }
    }
}
