//
//  TabButton.swift
//  TablesatBlayds
//
//  Created by James Woodward on 18/06/2021.
//

import SwiftUI

struct TabButton: View {
    var image: String
    var title: String
    
    // seleced tab
    @Binding var selectedTab : String
    // For hero animation slide
    var animation: Namespace.ID
    
    var body: some View {
        
        Button(action: {
            withAnimation(.spring()){selectedTab = title}
        }, label: {
            
            HStack(spacing: 15) {
                
                Image(systemName: image)
                    .font(.title2)
                    .frame(width: 30)
                
                Text(title)
                    .fontWeight(.semibold)
            }
            .foregroundColor(selectedTab == title ? Color("TabBG") : .white)
            .padding(.vertical, 12)
            .padding(.horizontal, 10)
            //Max  Frame
            .frame(maxWidth: getRect().width - 170, alignment: .leading)
            .background(
                
                // hero animation
                
                ZStack {
                    
                    if selectedTab == title{
                        Color.white
                            .opacity(selectedTab == title ? 1 : 0)
                            .clipShape(CustomCorners(corners: [.topRight, .bottomRight], radius: 12))
                            .matchedGeometryEffect(id: "TAB", in: animation)
                    }
                }
            
            
            )
            
            
        })
        
    }
}

struct TabButton_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
