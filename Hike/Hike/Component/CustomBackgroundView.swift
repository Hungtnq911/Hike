//
//  CustomBackgroundView.swift
//  Hike
//
//  Created by Hưng Trần on 11/12/2023.
//

import SwiftUI

struct CustomBackgroundView: View {
    var body: some View {
        ZStack {
            //Mark: - 3. Depth
            Color.customGreenDark
                .cornerRadius(40)
                .offset(y:12)
            //Mark: - 2. light
            Color.customGreenLight
                .cornerRadius(40)
                .offset(y:3)
                .opacity(0.85)
            //Mark: - 1. surface
            LinearGradient(colors: [.colorGreenLight,.colorGreenDark] , startPoint: .top, endPoint: .bottom)
                .cornerRadius(40)
        }
    }
}

#Preview {
    CustomBackgroundView()
}
