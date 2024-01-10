//
//  ProfileView.swift
//  AbschlussProjekt
//
//  Created by Nouiaskarnian on 16.11.23.


import SwiftUI
import Firebase
import FirebaseStorage

struct ProfileView: View {
    
    @EnvironmentObject var userViewModel: UserViewModel
    
    @State var id = UUID()
    @State var image: UIImage?
    @State var email =  ""
    @State var password = ""
    @State var name = ""
    
    @State var statusMessage = ""
    @State var shouldShowImagePicker = false
    @State var profileImageURL: String?
    
    
    var body: some View {
        NavigationView {
            ZStack {
                //                LinearGradient(colors: [.orange, .green], startPoint: .top, endPoint: .bottom)
                //
                ScrollView {
                    VStack(spacing: 30) {
                        
                        Text("My Profil")
                            .font(.title)
                            .bold()
                            .foregroundStyle(.white)
                        Button {
                            shouldShowImagePicker.toggle()
                        } label: {
                            HStack {
                                if let image = self.image {
                                    Image(uiImage: image)
                                    
                                        .resizable()
                                        .frame(width: 128, height: 128)
                                        .cornerRadius(70)
                                } else {
                                    Image(systemName: "person.fill")
                                        .font(.system(size: 70))
                                        .padding()
                                        .foregroundColor(.white)
                                }
                            }
                            .overlay(RoundedRectangle(cornerRadius: 64)
                                .stroke(Color.white, lineWidth: 3)
                            )
                        }
                        .padding()
                        
                        VStack {
                            Text(userViewModel.name)
                                .font(.headline)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding()
                                .foregroundColor(.black)
                                .background(Color.white)
                                .cornerRadius(12)
                            Text(userViewModel.email)
                                .font(.headline)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding()
                                .foregroundColor(.black)
                                .background(Color.white)
                                .cornerRadius(12)
                            
                            
                            Button {
                                handleAction()
                            } label: {
                                VStack {
                                    
                                    Text("save")
                                        .foregroundColor(.white)
                                        .padding()
                                        .font(.system(size: 14, weight: .semibold))
                                }
                                .background(Color.blue)
                            }
                            .cornerRadius(10)
                            .padding(34)
                            
                            Text(self.statusMessage)
                            
                            Button {
                                userViewModel.logout()
                            } label: {
                                VStack {
                                    Text("log out")
                                        .foregroundColor(.white)
                                        .padding()
                                        .font(.system(size: 14, weight: .semibold))
                                }
                                .background(Color.red)
                            }
                            .cornerRadius(15)
                            .padding(10)
                        }
                        Spacer()
                    }
                }
                .padding(90)
            }
            .background(Color(hue: 0.655, saturation: 0.787, brightness: 0.354))
            .edgesIgnoringSafeArea(.all)
            
            .navigationViewStyle(StackNavigationViewStyle())
            
            .fullScreenCover(isPresented:
                                $shouldShowImagePicker, onDismiss: nil) {
                ImagePicker(image: $image) }
            
                                .toolbar {
                                    Button {
                                        sheet = .settings
                                    } label: {
                                        Image(systemName: "gearshape.fill")
                                            .font(.title3)
                                    }
                                }
                                .sheet(item: $sheet) { sheet in
                                    switch sheet {
                                    case .settings:
                                        SettingsView(sheet: $sheet)
                                    }
                                }
            
        }
        
    }
    
    private func handleAction() {
        
        if let image = self.image {
            persisImageToStorage(uid: Auth.auth().currentUser?.uid ?? "", image: image)
        }
        
    }
    
    private func createNewAccount() {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                print("Failed to create user:", error)
                self.statusMessage = "Failed to create user: \(error.localizedDescription)"
            } else if let result = result {
                print("Successfully created user:", result.user.uid)
                self.statusMessage = "Successfully created user: \(result.user.uid)"
                
                if let image = self.image {
                    persisImageToStorage(uid: result.user.uid, image: image)
                }
            }
        }
    }
    
    private func persisImageToStorage(uid: String, image: UIImage) {
        let storageRef = Storage.storage().reference(withPath: "\(uid).jpg")
        
        guard let imageData = image.jpegData(compressionQuality: 0.5) else {
            self.statusMessage = "Failed to convert image to data"
            return
        }
        
        storageRef.putData(imageData, metadata: nil) { metadata, error in
            if let error = error {
                self.statusMessage = "Failed to upload image to Storage: \(error.localizedDescription)"
                return
            }
            
            // Image uploaded successfully
            storageRef.downloadURL { url, error in
                if let error = error {
                    self.statusMessage = "Failed to get download URL: \(error.localizedDescription)"
                    return
                }
                
                if let downloadURL = url {
                    // Here you can store the download URL to the user's profile or use it as needed
                    print("Download URL:", downloadURL.absoluteString)
                }
            }
        }
    }
    @State private var sheet: Sheet?
}

#Preview {
    ProfileView()
        .environmentObject(UserViewModel())
}
