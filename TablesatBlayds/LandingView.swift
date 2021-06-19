//
//  ContentView.swift
//  TablesatBlayds
//
//  Created by James Woodward on 18/06/2021.
//

import SwiftUI

struct LandingView: View {
    
    @AppStorage("log_status") var status = false
    @StateObject var model = ModelData()
    
    @State private var isActive = false
    var body: some View {
        NavigationView {
            GeometryReader{ proxy in
                VStack {
                    Spacer().frame(height:proxy.size.height * 0.65)
                    Text("Blayds Bar")
                        .font(.system(size: 64, weight: .medium))
                        .foregroundColor(.white)
                    Spacer()
                    HStack {
                        NavigationLink(destination: GetStartedView(), isActive: $isActive) {
                            Button(action: {
                                isActive = true
                            }) {
                                HStack(spacing: 15){
                                    Spacer()
                                    Image(systemName: "person")
                                        .font(.system(size: 24))
                                        .foregroundColor(.white)
                                    Text("Get Started")
                                        .foregroundColor(.white)
                                    Spacer()
                                }
                            }
                            .padding(.horizontal, 5)
                            .buttonStyle(PrimaryButtonStyle())
                        }
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(
                    Image("barpic")
                        .resizable()
                        .aspectRatio(contentMode: .fill).overlay(Color.black.opacity(0.2))
                        .frame(width: proxy.size.width)
                        .edgesIgnoringSafeArea(.all)
                    
                )
            }
        }.accentColor(.primary)
    }
}

struct LandingView_Previews: PreviewProvider {
    static var previews: some View {
        LandingView()
    }
}
