//
//  AsyncImageWrapper.swift
//  SpaceX
//
//  Created by Jan Provaznik on 16.07.2022.
//

import SwiftUI

struct AsyncImageWrapper: View {
    let url: URL?

    var body: some View {
        AsyncImage(url: url) { asyncImagePhase in
            switch asyncImagePhase {
            case .empty:
                ProgressView()

            case let .success(image):
                image
                    .resizable()
                    .scaledToFit()

            case .failure:
                imageErrorView

            @unknown default:
                imageErrorView
            }
        }
    }
}

private extension AsyncImageWrapper {

    var imageErrorView: some View {
        Image(systemName: Icons.exclamationCloud.rawValue)
            .resizable()
            .scaledToFit()
            .padding(.horizontal, 80)
            .padding(.vertical, 10)
    }
}

struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        AsyncImageWrapper(url: URL(string: "https://i.kym-cdn.com/photos/images/newsfeed/002/097/290/1f4.jpg")!)
    }
}
