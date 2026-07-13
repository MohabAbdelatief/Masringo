//
//  DashboardToolbarTrailingItems.swift
//  Masringo
//
//  Created by Mohab Abdelatief on 02/05/2025.
//

import SwiftUI

struct ToolbarTrailingItems: View {
    var body: some View {
        HStack(spacing: 12) {
            HStack(spacing: 6) {
                Image(systemName: "medal.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                    .foregroundColor(.primary)

                Text("0")
                    .font(.caption)
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
            }
        }
    }
}

#Preview {
    ToolbarTrailingItems()
}
