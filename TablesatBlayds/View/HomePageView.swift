//
//  HomePageView.swift
//  TablesatBlayds
//
//  Created by James Woodward on 18/06/2021.
//

import SwiftUI

struct HomePageView: View {
    @Binding var selectedTab: String
    
    // hiding tab bar
    init(selectedTab : Binding<String>) {
        self._selectedTab = selectedTab
        UITabBar.appearance().isHidden = true
    }
    var body: some View {
        
        // tab view with tabs
        TabView(selection: $selectedTab){
            
            // Views
            Home()
                .tag("Home")
            
            MyBookings()
                .tag("My Bookings")
            
            MakeBooking()
                .tag("Make a Booking")
            
            Settings()
                .tag("Settings")
            
            ContactUs()
                .tag("Contact Us")
            
            
        }
        
        
        
    }
}

struct HomePageView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}


// all sub views
struct Home: View {
    
    var body: some View {
        
        NavigationView{
            
            ScrollView {
                VStack(alignment: .leading, spacing: 20){
                    
                    
                    Image("Blaydsext")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: getRect().width - 50, height: 400)
                        .cornerRadius(20)
                    
                    VStack(alignment: .leading, spacing: 6, content: {
                       
                        Text("Welcome to Blayds Bar")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.primary)
                        
                        Text("Book with us soon!")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .foregroundColor(.gray)
                        
                        VStack{
                            Text("Blayds Bar strives to bring a fantastic customer experience, having been an esablished bar on Call Lane for over 15 years")
                            
                            Spacer()
                            Spacer()
                            
                            Text("Find us here:")
                            
                            Image("Blaydsloc")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: getRect().width - 50, height: 400)
                                .cornerRadius(20)
                        }
                        
                        VStack(spacing: 5){
                            
                            Text("Following Covid Guidelines as prescribed by UK Gov, please find below our COVID guidelines for your time at Blayds Bar")
                            
                            
                        }
                        VStack(spacing: 5){
                            
                            Text("Below you will find links to our Terms and Agreements and Privacy Policy")
                            
                            
                        }
                            
                            
                        
                    })
                    
                    
                }
                
                .navigationTitle("Home")
            }
        }
        .padding(.leading)
        
        
    }
    
    
}
struct MyBookings: View {
    
    var body: some View {
        
        NavigationView{
            
            Text("My Bookings")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundColor(.primary)
                .navigationTitle("My Bookings")
        }
    }
    
    
}

struct MakeBooking: View {
    
    var body: some View {
        
        NavigationView{
            
            MakeBookingTemplate()
        }
    }
    
    
}

struct Settings: View {
    
    var body: some View {
        
        NavigationView{
            
            SettingsView()
        }
    }
    
    
}

struct ContactUs: View {
    
    var body: some View {
        
        NavigationView{
            
            Text("Contact Us")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundColor(.primary)
                .navigationTitle("Contact Us")
        }
    }
    
    
}
