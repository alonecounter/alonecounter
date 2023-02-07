//
//  ContentView.swift
//  AloneCounter
//
//  Created by Ba Kien on 22/11/2022.
//

import SwiftUI
import Firebase
import GoogleSignIn
/**
 Google account  test
 ID : firebase.alonecounter@gmail.com
 PW: Abc13579*
 
 github email : firebase.alonecounter@gmail.com
 pw : Kkcyakrp123
 user : alonecounter
 */

struct LogInView: View {
    @State var isLoading: Bool = false
    @AppStorage("login_status") var login_status = false
    
    var body: some View {
        VStack{
            Image("counterIcon").resizable().aspectRatio(contentMode: .fit)
                .frame( height:getRect().height / 8)
                .cornerRadius(28)
                .padding(50)
           
        
            
            VStack(spacing: 10){
                Text(LocalizedStringKey("welcome"))
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color.black)
                Text(LocalizedStringKey("together")).multilineTextAlignment(.center)
                
                Button{
                    handleLogin()
                }label: {
                    HStack(spacing:15){
                        Image("google")
                            .resizable()
                        //.renderingMode(.template)
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 28, height: 28)
                        Text(LocalizedStringKey("loginbygg"))
                            .font(.title3)
                            .fontWeight(.medium)
                            .kerning(1.1)
                    }.foregroundColor(Color.blue)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(
                            Capsule().stroke(Color.blue)
                        )
                    
                }.padding()
                
                Text(LocalizedStringKey("loginbyemail"))
                
                Spacer()
                
                Text(getAttributedString(string: "Bằng cách đăng nhập , bạn đồng ý với chính sách bảo mật và điều khoản sử dụng của chúng tôi."))
                    .frame( maxHeight: 100, alignment: .bottom)
                    .font(.body.bold())
                    .foregroundColor(.gray)
                    .lineSpacing(8)
                    .multilineTextAlignment(.center)
                    .padding(10)
                
                
                
            }
            
        }.frame(maxWidth: .infinity , maxHeight: .infinity, alignment: .top)
            .overlay(
                ZStack{
                    if isLoading {
                        Color.black.opacity(0.25).ignoresSafeArea()
                        ProgressView()
                            .font(.title2)
                            .frame(width: 60, height: 60)
                            .background(Color.white)
                            .cornerRadius(10)
                    }
                }
            )
        
    }
    func getAttributedString(string: String) -> AttributedString{
        var attributed = AttributedString(string)
        if let range = attributed.range(of: "chính sách bảo mật") {
            attributed[range].foregroundColor = .red
        }
        if let range = attributed.range(of: "điều khoản sử dụng") {
            attributed[range].foregroundColor = .red
        }
        return attributed
    }
    
    func handleLogin(){
        print("login")
        guard let clientID = FirebaseApp.app()?.options.clientID else { return }
        
        // Create Google Sign In configuration object.
        let config = GIDConfiguration(clientID: clientID)
        
        isLoading = true
        
        GIDSignIn.sharedInstance.signIn(with: config, presenting: getRootViewController()){[self]
            user, err in
            
            if let error = err {
                print(error.localizedDescription )
                isLoading = false
                return
            }
            
            guard
                let authentication = user?.authentication,
                let idToken = authentication.idToken
            else {
                isLoading = false
                return
            }
            
            let credential = GoogleAuthProvider.credential(withIDToken: idToken,
                                                           accessToken: authentication.accessToken)
            
            Auth.auth().signIn(with: credential){
                result, err in
                
                isLoading = false
                if let error = err {
                    print(error.localizedDescription)
                    return
                }
                withAnimation{
                    login_status = true
                }
                
            }
            
        }
        
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LogInView()
    }
}

extension View{
    func getRect()->CGRect{
        return UIScreen.main.bounds
    }
    
    func getRootViewController()->UIViewController{
        guard let screen = UIApplication.shared.connectedScenes.first as? UIWindowScene else{
            return .init()
        }
        
        guard let root = screen.windows.first?.rootViewController else{
            return .init()
        }
        
        return root
    }
}
