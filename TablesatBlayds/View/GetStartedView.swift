//
//  GetStartedView.swift
//  TablesatBlayds
//
//  Created by James Woodward on 18/06/2021.
//

import SwiftUI
import Firebase

struct GetStartedView: View {
    @State private var isActive = false
    
    @State var index = 0
    
   

    var body: some View {
        
        GeometryReader{_ in
            
            VStack {
                
                Image("logo")
                    .resizable()
                    .frame(width: 60, height: 60)
                
                ZStack{
                    
                    SignUp(index: self.$index)
                        // changing view order
                        .zIndex(Double(self.index))
                    
                    Login(index: self.$index)
                    
                }
                
                
               
            }
            
        }
        .background(Color("Color").edgesIgnoringSafeArea(.all))
        
        
    }
}

// curve

struct CShape: Shape {
    
    func path(in rect: CGRect)-> Path {
        
        return Path{ path in
            
            // right side curve
            path.move(to: CGPoint(x: rect.width, y: 100))
            path.addLine(to: CGPoint(x: rect.width, y: rect.height))
            path.addLine(to: CGPoint(x: 0, y: rect.height))
            path.addLine(to: CGPoint(x: 0, y: 0))
        }
    }
}
struct CShape1: Shape {
    
    func path(in rect: CGRect)-> Path {
        
        return Path{ path in
            
            // left side curve
            path.move(to: CGPoint(x: 0, y: 100))
            path.addLine(to: CGPoint(x: 0, y: rect.height))
            path.addLine(to: CGPoint(x: rect.width, y: rect.height))
            path.addLine(to: CGPoint(x: rect.width, y: 0))
        }
    }
}


struct Login : View {
    
    @State private var isActive = false
    
    @State var email = ""
    @State var password = ""
    @Binding var index : Int
    
    var body: some View{
        
        ZStack(alignment: .bottom) {
            
            VStack{
                
                HStack{
                    
                    VStack(spacing: 10){
                        
                        Text("Login")
                            .foregroundColor(self.index == 0 ? .white : .gray)
                            .font(.title)
                            .fontWeight(.bold)
                        
                        Capsule()
                            .fill(self.index == 0 ? Color.blue : Color.clear)
                            .frame(width: 100, height: 5)
                        
                    }
                    
                    Spacer(minLength: 0)
                }
                .padding(.top, 30)
                
                VStack{
                    
                    HStack(spacing: 15){
                        
                        Image(systemName: "envelope.fill")
                            .foregroundColor(Color("Color1"))
                        
                        TextField("Email Address", text: self.$email)
                            .foregroundColor(.white)
                        
                    }
                    
                    Divider().background(Color.white.opacity(0.5))
                }
                .padding(.horizontal)
                .padding(.top, 40)
                
                VStack{
                    
                    HStack(spacing: 15){
                        
                        Image(systemName: "eye.slash.fill")
                            .foregroundColor(Color("Color1"))
                        
                        TextField("Password", text: self.$password)
                            .foregroundColor(.white)
                        
                    }
                    
                    Divider().background(Color.white.opacity(0.5))
                }
                .padding(.horizontal)
                .padding(.top, 30)
                
                HStack{
                    
                    Spacer(minLength: 0)
                    
                    Button(action: {
                        
                    }) {
                        
                        Text("Forgot password?")
                            .foregroundColor(Color.white.opacity(0.6))
                    }
                    
                }
                .padding(.horizontal)
                .padding(.top, 30)
                
            }
            .padding()
            //bottom padding
            .padding(.bottom, 65)
            .background(Color("Color2"))
            .clipShape(CShape())
            .contentShape(CShape())
            .shadow(color: Color.black.opacity(0.3), radius: 5, x: 0, y: -5)
            .onTapGesture {
                self.index = 0
            }
            .cornerRadius(35)
            .padding(.horizontal, 20)
            
            // button
            
            NavigationLink(destination: MainView(), isActive: $isActive) {
                Button(action: {
                    isActive = true
                }) {
                    Text("Log in")
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                        .padding(.vertical)
                        .padding(.horizontal, 50)
                        .background(Color("Color1"))
                        .clipShape(Capsule())
                        // shadow
                        .shadow(color: Color.white.opacity(0.1), radius: 5, x: 0, y: 5)
                }
                // moving view down a tad
                .offset(y: 25)
                .opacity(self.index == 0 ? 1 : 0)
            }
        }
    }
}

//sign up
struct SignUp : View {
    
    @State var email = ""
    @State var password = ""
    @State var repass = ""
    @Binding var index : Int
    
    var body: some View{
        
        ZStack(alignment: .bottom) {
            
            VStack{
                
                HStack{
                    
                    Spacer(minLength: 0)
                    
                    VStack(spacing: 10){
                        
                        Text("Sign up")
                            .foregroundColor(self.index == 1 ? .white : .gray)
                            .font(.title)
                            .fontWeight(.bold)
                        
                        Capsule()
                            .fill(self.index == 1 ? Color.blue : Color.clear)
                            .frame(width: 100, height:  5)
                    }
                    
                    
                  
                }
                .padding(.top, 30)
                
                VStack{
                    
                    HStack(spacing: 15){
                        
                        Image(systemName: "envelope.fill")
                            .foregroundColor(Color("Color1"))
                        
                        TextField("Email Address", text: self.$email)
                            .foregroundColor(.white)
                        
                    }
                    
                    Divider().background(Color.white.opacity(0.5))
                }
                .padding(.horizontal)
                .padding(.top, 40)
                
                VStack{
                    
                    HStack(spacing: 15){
                        
                        Image(systemName: "eye.slash.fill")
                            .foregroundColor(Color("Color1"))
                        
                        TextField("Password", text: self.$password)
                            .foregroundColor(.white)
                        
                    }
                    
                    Divider().background(Color.white.opacity(0.5))
                }
                .padding(.horizontal)
                .padding(.top, 30)
                
                //replacing forget password with reenter password
                // so same height will be maintained here
                
                VStack{
                    
                    HStack(spacing: 15){
                        
                        Image(systemName: "eye.slash.fill")
                            .foregroundColor(Color("Color1"))
                        
                        TextField("Password", text: self.$repass)
                            .foregroundColor(.white)
                        
                    }
                    
                    Divider().background(Color.white.opacity(0.5))
                }
                .padding(.horizontal)
                .padding(.top, 30)
                
            }
            .padding()
            //bottom padding
            .padding(.bottom, 65)
            .background(Color("Color2"))
            .clipShape(CShape1())
            // clipping the content shape also for tap getsure
            .contentShape(CShape1())
            // shadow
            .shadow(color: Color.black.opacity(0.3), radius: 5, x: 0, y: -5)
            .onTapGesture {
                self.index = 1
            }
            .cornerRadius(35)
            .padding(.horizontal, 20)
            
            // button
            
            Button(action: {
                
            }) {
                Text("Sign Up")
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .padding(.vertical)
                    .padding(.horizontal, 50)
                    .background(Color("Color1"))
                    .clipShape(Capsule())
                    // shadow
                    .shadow(color: Color.white.opacity(0.1), radius: 5, x: 0, y: 5)
            }
            // moving view down a tad
            .offset(y: 25)
            // hiding view when its in background
            // only button
            .opacity(self.index == 1 ? 1 : 0)
        }
    }
}


struct GetStartedView_Previews: PreviewProvider {
    static var previews: some View {
        GetStartedView()
    }
}
