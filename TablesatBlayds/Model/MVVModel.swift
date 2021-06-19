//
//  MVVModel.swift
//  TablesatBlayds
//
//  Created by James Woodward on 18/06/2021.
//

import Foundation
import SwiftUI
import Firebase

class ModelData : ObservableObject {
    
    @Published var email = ""
    @Published var password = ""
    @Published var isSignUp = false
    @Published var email_SignUp = ""
    @Published var password_SignUp = ""
    @Published var reEnterPassword = ""
    @Published var isLinkSend = false
    
    // alert view wiht textfields
    
    // error alerts
    
    @Published var alert = false
    @Published var alertMsg = ""
    
    //User ststaus
    
    @AppStorage("log_Status") var status = false
    
    // loading
    
    @Published var isLoading = false
    
    func resetPassword(){
        
        let alert = UIAlertController(title: "Reset Password", message: "Enter your Email to reset your password", preferredStyle: .alert)
        
        alert.addTextField { (password) in
            password.placeholder = "Email"
        }
        
        let proceed = UIAlertAction(title: "Reset", style: .default) { (_) in
            
            // sending passwor dlink
            
            if alert.textFields![0].text! != ""{
                withAnimation{
                    self.isLoading.toggle()
                }
                Auth.auth().sendPasswordReset(withEmail: alert.textFields![0].text!) { (err) in
                    
                    withAnimation{
                        
                        self.isLoading.toggle()
                    }
                    
                    if err != nil{
                        self.alertMsg = err!.localizedDescription
                        self.alert.toggle()
                        return
                    }
                    
                    // alertig user
                    self.alertMsg = "Password reset link has been sent to your email"
                    self.alert.toggle()
                }
            }
        }
        
        let cancel = UIAlertAction(title: "Cancel", style: .destructive, handler: nil)
        
        alert.addAction(cancel)
        alert.addAction(proceed)
        
        //presenting
        
        UIApplication.shared.windows.first?.rootViewController?.present(alert, animated: true)
    }
    
    // login function
    
    func login(){
        
        // checking all fields are inputted correctly
        
        if email == "" || password == ""{
            self.alertMsg = "Fill the contents properly"
            self.alert.toggle()
            return
        }
        
        withAnimation {
            self.isLoading.toggle()
            
        }
        
        Auth.auth().signIn(withEmail: email, password: password) { (result, err) in
            withAnimation {
                self.isLoading.toggle()
                
            }
            
            if err != nil{
                
                self.alertMsg = err!.localizedDescription
                self.alert.toggle()
                return
            }
            
            // checking if user is verified or not
            // if not verified means logging out
            
            let user = Auth.auth().currentUser
            
            if !user!.isEmailVerified{
                
                self.alertMsg = "please verify email address!!!"
                self.alert.toggle()
                // logging out
                try! Auth.auth().signOut()
                
                return
            }
            
            // setting user status as true
            
            withAnimation{
                self.status = true
            }
        }
    }
    
    // sign up
    
    func signUp() {
        // checking
        
        if email_SignUp == "" || password_SignUp == "" || reEnterPassword == "" {
            
            self.alertMsg = "Fill contents properly"
            self.alert.toggle()
            return
        }
        
        if password_SignUp != reEnterPassword{
            
            self.alertMsg = "password mismatch"
            self.alert.toggle()
            return
        }
        
        withAnimation{
            self.isLoading.toggle()
        }
        
        Auth.auth().createUser(withEmail: email_SignUp, password: password_SignUp) { (result, err) in
            
            withAnimation{
                
                self.isLoading.toggle()
            }
            
            if err != nil{
                self.alertMsg = err!.localizedDescription
                self.alert.toggle()
                return
            }
            
            // sending verificaitno link
            
            result?.user.sendEmailVerification(completion: { (err) in
                if err != nil {
                    self.alertMsg = err!.localizedDescription
                    self.alert.toggle()
                    return
                }
                
                // alerting user to verify email
                
                self.alertMsg = "Email verification has been sent, check your inbox!"
                self.alert.toggle()
            })
            
        }
    }
    
    // logOut
    
    func logOut(){
        try! Auth.auth().signOut()
        
        withAnimation {
            self.status = false
        }
        
        // clearing all data
        
        email = ""
        password = ""
        email_SignUp = ""
        password_SignUp = ""
        reEnterPassword = ""
    }
}

// checking with smaller devices

// loading View

struct LoadingView : View {
    @State var animation = false
    var body: some View {
        VStack {
            
            Circle()
                .trim(from: 0, to: 0.7)
                .stroke(Color("Color2"), lineWidth: 8)
                .frame(width: 75, height: 75)
                .rotationEffect(.init(degrees: animation ? 360 : 0))
                .padding(50)
            
        }
        .background(Color.white)
        .cornerRadius(20)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black.opacity(0.4).ignoresSafeArea(.all, edges: .all))
        .onAppear(perform: {
            withAnimation(Animation.linear(duration: 1)) {
                
                animation.toggle()
            }
        })
    }
}
