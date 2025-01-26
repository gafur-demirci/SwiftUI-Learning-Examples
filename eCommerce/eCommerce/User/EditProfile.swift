//
//  EditProfile.swift
//  eCommerce
//
//  Created by Abdulgafur Demirci on 26.01.2025.
//

import SwiftUI

struct EditProfile: View {
    @Environment(\.modelContext) private var context
    @ObservedObject var userManager: UserManager

    @State private var newUsername: String = ""
    @State private var selectedImage: UIImage?
    @State private var showImagePicker = false

    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                // Profil Resmi
                VStack {
                    if let image = selectedImage {
                        Image(uiImage: image)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 100)
                            .clipShape(Circle())
                            .onTapGesture {
                                showImagePicker = true
                            }
                    } else if let profileImage = userManager.user?.profileImage {
                        Image(uiImage: profileImage)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 100)
                            .clipShape(Circle())
                            .onTapGesture {
                                showImagePicker = true
                            }
                    } else {
                        Text(initials(for: userManager.user?.username ?? ""))
                            .font(.largeTitle)
                            .foregroundColor(.white)
                            .frame(width: 100, height: 100)
                            .background(Color.blue)
                            .clipShape(Circle())
                            .onTapGesture {
                                showImagePicker = true
                            }
                    }
                    Text("Profil fotoğrafını değiştir")
                        .font(.caption)
                        .foregroundColor(.blue)
                        .onTapGesture {
                            showImagePicker = true
                        }
                }

                // Kullanıcı Adı Girişi
                VStack(alignment: .leading, spacing: 8) {
                    Text("Ad Soyad")
                        .font(.headline)

                    TextField("Ad Soyad", text: $newUsername)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }

                Spacer()

                // Kaydet Butonu
                Button(action: {
                    saveChanges()
                }) {
                    Text("Kaydet")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.green)
                        .cornerRadius(12)
                }
            }
            .padding()
            .navigationTitle("Profil Düzenle")
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Vazgeç") {
                        dismissView()
                    }
                }
            }
            .sheet(isPresented: $showImagePicker) {
                ImagePicker(image: $selectedImage)
            }
            .onAppear {
                newUsername = userManager.user?.username ?? ""
                selectedImage = userManager.user?.profileImage
            }
        }
    }

    // Kullanıcı adı ve soyadının baş harflerini alma
    private func initials(for name: String) -> String {
        let components = name.split(separator: " ")
        let initials = components.compactMap { $0.first }.prefix(2)
        return initials.map { String($0) }.joined().uppercased()
    }

    // Değişiklikleri kaydet
    private func saveChanges() {
        userManager.updateUser(username: newUsername, profileImage: selectedImage)
        dismissView()
    }

    // Ekranı kapatma
    private func dismissView() {
        UIApplication.shared.windows.first { $0.isKeyWindow }?.rootViewController?.dismiss(animated: true, completion: nil)
    }
}
