//
//  SectionContainer.swift
//  SpaceX
//
//  Created by Jan Provaznik on 16.07.2022.
//

import SwiftUI

struct SectionContainer<Content: View>: View {
    let title: LocalizedStringKey
    let content: () -> Content

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(title)
                .font(.headline)
                .fontWeight(.bold)

            content()
        }
    }
}

struct SectionContainer_Previews: PreviewProvider {
    static var previews: some View {
        SectionContainer(
            title: "Title",
            content: {
                Text("Content")
            }
        )
    }
}
