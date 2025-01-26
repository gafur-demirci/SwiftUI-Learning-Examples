//
//  ProfileView.swift
//  eCommerce
//
//  Created by Abdulgafur Demirci on 26.01.2025.
//

import SwiftUI
import SwiftUI

struct ProfileView: View {
    @State private var username = "Ahmet Yılmaz" // Örnek kullanıcı adı
    @State private var profileImage: UIImage? = nil // Profil resmi, nil ise avatar gösterilecek
    @State private var showEditProfile = false
    @State private var showCallConfirmation = false

    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                // Kullanıcı Bilgisi ve Avatar
                UserProfileHeader(username: username, profileImage: profileImage)
                
                // Siparişlerim Listesi
                OrderListSection()

                // Ayarlarım ve Bize Ulaşın
                SettingsSection(showEditProfile: $showEditProfile, showCallConfirmation: $showCallConfirmation)
                
                Spacer()

                // Çıkış Yap Butonu
                LogoutButton()
            }
            .padding()
            .navigationTitle("Profil")
            .sheet(isPresented: $showEditProfile) {
                EditProfile(username: $username, profileImage: $profileImage)
            }
            .alert(isPresented: $showCallConfirmation) {
                Alert(
                    title: Text("Çağrı Başlat"),
                    message: Text("Müşteri hizmetlerini aramak istediğinizden emin misiniz?"),
                    primaryButton: .default(Text("Evet"), action: {
                        callSupport()
                    }),
                    secondaryButton: .cancel(Text("Hayır"))
                )
            }
        }
    }

    // Çağrı başlatma fonksiyonu
    private func callSupport() {
        if let phoneURL = URL(string: "tel://+900123456789"), UIApplication.shared.canOpenURL(phoneURL) {
            UIApplication.shared.open(phoneURL)
        }
    }
}

struct UserProfileHeader: View {
    let username: String
    let profileImage: UIImage?

    var body: some View {
        VStack {
            if let profileImage = profileImage {
                Image(uiImage: profileImage)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                    .clipShape(Circle())
            } else {
                Text(initials(for: username))
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .frame(width: 100, height: 100)
                    .background(Color.blue)
                    .clipShape(Circle())
            }

            Text(username)
                .font(.title)
                .fontWeight(.semibold)
        }
    }

    // Kullanıcı adı ve soyadının baş harflerini alma
    private func initials(for name: String) -> String {
        let components = name.split(separator: " ")
        let initials = components.compactMap { $0.first }.prefix(2)
        return initials.map { String($0) }.joined().uppercased()
    }
}

struct OrderListSection: View {
    let orders = ["Sipariş #1 - 250 TL", "Sipariş #2 - 300 TL", "Sipariş #3 - 150 TL"] // Örnek siparişler

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Siparişlerim")
                .font(.headline)

            if orders.isEmpty {
                Text("Henüz siparişiniz bulunmamaktadır.")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            } else {
                ForEach(orders, id: \.self) { order in
                    HStack {
                        Image(systemName: "bag.fill")
                            .foregroundColor(.blue)
                        Text(order)
                            .font(.subheadline)
                    }
                }
            }
        }
        .padding()
        .background(Color(UIColor.secondarySystemBackground))
        .cornerRadius(12)
        .shadow(color: .black.opacity(0.1), radius: 4, x: 0, y: 2)
    }
}

struct SettingsSection: View {
    @Binding var showEditProfile: Bool
    @Binding var showCallConfirmation: Bool

    var body: some View {
        VStack(spacing: 16) {
            Button(action: {
                showEditProfile = true
            }) {
                HStack {
                    Image(systemName: "pencil")
                        .foregroundColor(.blue)
                    Text("Ayarlarım")
                        .foregroundColor(.primary)
                }
            }

            Button(action: {
                showCallConfirmation = true
            }) {
                HStack {
                    Image(systemName: "phone.fill")
                        .foregroundColor(.green)
                    Text("Bize Ulaşın")
                        .foregroundColor(.primary)
                }
            }
        }
        .padding()
        .background(Color(UIColor.secondarySystemBackground))
        .cornerRadius(12)
        .shadow(color: .black.opacity(0.1), radius: 4, x: 0, y: 2)
    }
}

struct LogoutButton: View {
    var body: some View {
        Button(action: {
            exit(0) // Uygulamayı kapatır
        }) {
            Text("Çıkış Yap")
                .font(.headline)
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.red)
                .cornerRadius(12)
        }
        .shadow(color: .black.opacity(0.1), radius: 4, x: 0, y: 2)
    }
}



#Preview {
    ProfileView()
}
