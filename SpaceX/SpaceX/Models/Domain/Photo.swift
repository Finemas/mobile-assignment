//
//  Photo.swift
//  SpaceX
//
//  Created by Jan Provaznik on 16.07.2022.
//

import Foundation

struct Photo {
    let url: URL

    init?(stringURL: String) {
        guard let url = URL(string: stringURL) else {
            return nil
        }

        self.url = url
    }
}

extension Photo: Identifiable {
    var id: String { url.path }
}
