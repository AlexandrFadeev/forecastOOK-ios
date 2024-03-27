//
//  LoaderView.swift
//  ForecastOOK
//
//  Created by Alexandr Fadeev on 26.03.2024.
//

import SwiftUI

struct LoaderView: View {
    var body: some View {
        ProgressView()
            .progressViewStyle(CircularProgressViewStyle())
    }
}

#Preview {
    LoaderView()
}
