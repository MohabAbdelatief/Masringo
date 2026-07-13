//
//  ProfileView.swift
//  Masringo
//
//  Created by Mohab Abdelatief on 04/05/2025.
//

import SwiftUI

struct ProfileView: View {

    var body: some View {
        NavigationStack {
            VStack(spacing: 28) {
                VStack {
                    Image(systemName: "person.circle.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 110, height: 110)
                        .foregroundColor(.blue)
                        .clipShape(Circle())
                        .overlay {
                            Circle().stroke(.white, lineWidth: 4)
                                .shadow(radius: 4)
                        }

                    Text("Mohab Abdelatief")
                        .font(.title2)
                        .bold()
                    
                    Text("Experience Level: Advanced")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                }
                .padding(.top)

                // Stats
                HStack {
                    Stat(value: "4", label: "Lessons", icon: "book")
                    Stat(value: "2", label: "Exercises", icon: "pencil.and.outline")
                    Stat(value: "1", label: "Medals", icon: "rosette")
                }

                // Progress
                VStack(spacing: 6) {
                    ProgressView(value: 0.56)
                        .accentColor(.blue)
                    Text("Level 2 – 56% to 3")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                }
                .padding(.horizontal)

                // Action list
                VStack(spacing: 0) {
                    ProfileRow(icon: "info.circle", text: "About Masringo") { }
                    Divider()
                    ProfileRow(
                        icon: "arrow.uturn.left",
                        text: "Log Out",
                        tint: .red
                    ) { }
                }
                .background(
                    RoundedRectangle(cornerRadius: 16).fill(
                        Color(.systemBackground)
                    ).shadow(radius: 4, y: 2)
                )
                .padding(.horizontal)

                Spacer(minLength: 40)
            }
            .padding(.horizontal)
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

// Subviews
struct Stat: View {
    let value: String
    let label: String
    let icon: String

    var body: some View {
        VStack(spacing: 6) {
            Image(systemName: icon)
                .font(.title2)
            Text(value)
                .font(.title3)
                .bold()
            Text(label)
                .font(.caption)
                .foregroundStyle(.secondary)
        }
        .frame(maxWidth: .infinity)
        .frame(height: 100)
        .background(
            RoundedRectangle(cornerRadius: 16).fill(
                Color(.systemBackground)
            ).shadow(radius: 4, y: 2)
        )
    }
}

struct ProfileRow: View {
    let icon: String
    let text: String
    var tint: Color = .primary
    var action: () -> Void

    var body: some View {
        Button(action: action) {
            HStack {
                Image(systemName: icon)
                    .frame(width: 24)
                Text(text)
                Spacer()
                Image(systemName: "chevron.right")
                    .font(.footnote)
            }
            .foregroundColor(tint)
            .padding()
        }
    }
}

#Preview {
    ProfileView()
}
