//
//  LoadingView.swift
//  SpaceX
//
//  Created by Jan Provaznik on 16.07.2022.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        ProgressView(.laoding)
            .progressViewStyle(CircularProgressViewStyle(tint: .pink))
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
