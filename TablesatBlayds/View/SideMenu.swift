//
//  SideMenu.swift
//  TablesatBlayds
//
//  Created by James Woodward on 18/06/2021.
//

import SwiftUI

struct SideMenu: View {
    
    @Binding var selectedTab: String
    @Namespace var animation
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15){
            
            // bar picture
            Image("barpic")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 70, height: 70)
                .cornerRadius(10)
            // padding top for top close button
                .padding(.top, 50)
            
            VStack(alignment: .leading, spacing: 6, content: {
                
                Text("Blayds Bar")
                    .font(.title)
                    .fontWeight(.heavy)
                    .foregroundColor(.white)
                
                
            })
            
                // tab buttons
            VStack(alignment: .leading, spacing: 0){
                
                TabButton(image: "house", title: "Home", selectedTab: $selectedTab, animation: animation)
                
                TabButton(image: "book", title: "My Bookings", selectedTab: $selectedTab, animation: animation)
                
                TabButton(image: "plus.circle", title: "Make a Booking", selectedTab: $selectedTab, animation: animation)
                
                TabButton(image: "gear", title: "Settings", selectedTab: $selectedTab, animation: animation)
                
                TabButton(image: "phone", title: "Contact Us", selectedTab: $selectedTab, animation: animation)
                
            }
            .padding(.leading, -15)
            .padding(.top, 50)
            
            Spacer()
            
           // Sign Out Button
            VStack(alignment: .leading, spacing: 6){
                
                TabButton(image: "rectangle.righthalf.inset.fill.arrow.right", title: "Log Out", selectedTab: .constant(""), animation: animation)
                    .padding(.leading, -15)
                
                Text("App Version 1.0.0")
                    .font(.caption)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .opacity(0.6)
                
            }
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        
    }
}

struct SideMenu_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
