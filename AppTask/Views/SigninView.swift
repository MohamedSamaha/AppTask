//
//  SigninView.swift
//  AppTask
//
//  Created by Mohamed Samaha on 08/03/2023.
//

import SwiftUI

struct SigninView: View {
    @State private var isPresented = false
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var buttonTitle: String = "Sign in"
    @State private var hide: Bool = false
    @State private var postModel: [PostModel] = [PostModel(id: 1, firstName: "", lastName: "", title: "", body: "")]
    @State var value: CGFloat = 0
    
    var posterManager = PosterManager()
    
    var body: some View {
        VStack {
            //: SIGN IN IMAGE
            Image("Image 1")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            
            //: WELCOME TEXT
            Text("Welcome")
                .font(.title2)
                .foregroundColor(Color("SigninColor"))
                .fontWeight(.bold)
                .padding(.bottom, 40)
            
            
            VStack(alignment: .center, spacing: 0) {
                Spacer()
                //: USERNAME LABEL AND TEXTFIELD
                Group {
                    Text("User Name")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.bottom, 10)
                    TextField(
                        "Enter your user name",
                        text: $username
                    )
                    
                    
                    .textFieldStyle(.roundedBorder)
                } //: GROUP
                
                Group {
                    VStack {
                        Text("Password").frame(maxWidth: .infinity, alignment: .leading).padding(.top)
                        ZStack{
                            // CONDITION TO SHOW OR HIDE USER PASSWORD BASED ON EYE BTN.
                            if self.hide {
                                TextField(
                                    "Enter your password",
                                    text: $password
                                )
                                .textFieldStyle(.roundedBorder)
                            } else {
                                
                                SecureField(
                                    "Enter your password",
                                    text: $password
                                )
                                .textFieldStyle(.roundedBorder)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                
                            }
                            Button(action: {
                                // TOGGOLE FROM TRUE OR FALSE TO HIDE OR SHOW PASSWORD.
                                self.hide.toggle()
                            }) {
                                Image(systemName: self.hide ? "eye.fill" : "eye.slash.fill")
                                    .foregroundColor((self.hide == true) ? Color("SigninColor") : Color.secondary)
                            } //: BUTTON
                            .offset(x: 170, y:0)
                        } //: ZSTACK
                        .padding(.bottom)
                    } //: VSTACK
                    
                    Button(action: {
                        
                        // MARK: ALL SIGIN IN NETWORK FUNCTIONALITY.
                        signUpFunctionality()
                        
                    }) {
                        Spacer()
                        Text("\(buttonTitle)").font(.title3).fontWeight(.bold).padding(.bottom)
                        Spacer()
                    } // : BUTTON
                    .frame(maxWidth: .infinity, maxHeight: 30,alignment: .leading).padding(.top).foregroundColor(.white)
                    .background(Color("SigninColor"))
                    .cornerRadius(30).padding(.top)
                } //: GROUP
                Spacer()
            } //: VSTACK
            .padding(.horizontal, 20)
            
        } //: VSTACK
        .offset(y: -self.value)
        .animation(.spring())
        .onAppear {
            NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification, object: nil, queue: .main) { (noti) in
                let value = noti.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as! CGRect
                let height = value.height
                
                self.value = height
            }
            NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillHideNotification, object: nil, queue: .main) { (noti) in
                
                self.value = 0
            }
        } //:  ONAPPEAR
        .fullScreenCover(isPresented: $isPresented) {
            HomeView(postModel: $postModel)
        }
    }
    
}
// MARK: - PREVIEW
struct SigninView_Previews: PreviewProvider {
    static var previews: some View {
        SigninView()
    }
}

// MARK: - SIGNIN VIEW NETWORK FUNCTIONALITY.
extension SigninView {
    /// Function that fetching the two get request api (posts, users).
    /// the function concatinaties the two returning data from posts url and users url.
    ///  it customise the two apis and returning a custom model that has all the the post data model.
    func signUpFunctionality() {
        buttonTitle = "Loading..."
        posterManager.postRequest(username: username, password: password) { response in
            switch response {
                
            case .success(response: let response):
                if response == 200 {
                    // move to home screen.
                    print(response)
                    
                    
                    
                    posterManager.fetchPosts(with: "https://dummyjson.com/posts") { results in
                        switch results {
                            
                        case .success(data: let dataz):
                            posterManager.fetchPosts(with: "https://dummyjson.com/users") { result in
                                switch result {
                                    
                                case .success(data: let data):
                                    do {
                                        let decoder = JSONDecoder()
                                        let decodedData = try decoder.decode(PostsDataModel.self, from: dataz)
                                        let decodedUserData = try decoder.decode(UserData.self, from: data)
                                        for i in 0...29 {
                                            postModel.append(
                                                PostModel(
                                                    id: decodedData.posts[i].id,
                                                    firstName: decodedUserData.users[i].firstName,
                                                    lastName: decodedUserData.users[i].lastName,
                                                    title: decodedData.posts[i].title,
                                                    body: decodedData.posts[i].body
                                                ))
                                            
                                        }
                                        print(postModel.count)
                                        if postModel.count > 29 {
                                            isPresented.toggle()
                                        }
                                        
                                    } catch {
                                        print(error.localizedDescription)
                                    }
                                    
                                case .error(error: let error):
                                    print(error.localizedDescription)
                                }
                            }
                        case .error(error: let error):
                            print(error.localizedDescription)
                        }
                    }
                    
                    //                    buttonTitle = "SignUp"
                }
            case .error(error: let error):
                print(error)
            }
        }
        
        
    }
}
