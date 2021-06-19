//
//  SettingsView.swift
//  TablesatBlayds
//
//  Created by James Woodward on 18/06/2021.
//

import SwiftUI

struct SettingsView: View {
    
    @State var selectedTab = "Settings"
    var body: some View {
        
        ScrollView {
            VStack(alignment: .center){
                
                
                Image("blaydssupport")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: getRect().width - 50, height: 400)
                    .cornerRadius(20)
                
                VStack(alignment: .center, spacing: 10, content: {
                   
                    Text("Settings")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.primary)
                    
                    Spacer()
                    
                    
                    VStack(alignment: .center, spacing: 5){
                        
                    Button(action: {}, label: {
                        Text("Covid Guidelines")
                    })
                        
                        
                    }
                    VStack(alignment: .center, spacing: 5){
                        
                    Button(action: {
                        // display T&A
                    }, label: {
                        Text("Terms and Agreements")
                    })
                        
                        Spacer()
                        Spacer()
                        
                    Button(action: {
                        // display priv pol
                    }, label: {
                        Text(" Pivacy Policy")
                    })
                        
                        
                    }
                    .padding()
                        
                        
                    
                })
                .padding(.horizontal, 80)
                
                
            }
            
            
            .navigationTitle("Settings")
        }

        
        
    }
    
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
