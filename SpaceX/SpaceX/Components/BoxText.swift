//
//  BoxText.swift
//  SpaceX
//
//  Created by Jan Provaznik on 16.07.2022.
//

import SwiftUI

struct BoxText: View {
    let title: String
    let subtitle: String

    var body: some View {
        VStack(spacing: 8) {
            Text(title)
                .font(.headline)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .scaledToFit()
                .minimumScaleFactor(0.5)

            Text(subtitle)
                .font(.body)
                .foregroundColor(.white)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding()
        .background(.pink)
        .cornerRadius(15)
    }
}