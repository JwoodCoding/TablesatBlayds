//
//  CustomCorners.swift
//  TablesatBlayds
//
//  Created by James Woodward on 18/06/2021.
//

import SwiftUI

// customer corner shapes
struct CustomCorners: Shape {
 
    
    var corners: UIRectCorner
    var radius : CGFloat
    
    func path(in rect: CGRect)-> Path {
        
        
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        
        return Path(path.cgPath)
    }
}

