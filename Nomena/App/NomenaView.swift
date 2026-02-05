//
//  NomenaView.swift
//  Nomena
//
//  Created by MaxTop4ik022 on 18.01.2026.
//

import SwiftUI

struct NomenaView: View {
    @Environment(\.dependencies) private var dependencies
    @State var viewModel: RandomNameViewModel?
    
    var body: some View {
        VStack(spacing: 48) {
            ZStack {
                ForEach(
                    0...(viewModel?.names.count ?? 0),
                    id: \.self
                ) { _ in
                    SwipeCardView(title: viewModel?.randomCardName() ?? "Імʼя відсутнє")
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            .linearGradient(
                colors: [
                    .white,
                    .bottomMainBackground,
                    .bottomMainBackground
                ],
                startPoint: .top,
                endPoint: .bottom
            ),
            ignoresSafeAreaEdges: .all
        )
        .task {
            viewModel = dependencies?.makeViewModel()
            await viewModel?.loadNames()
        }
    }
}

#Preview {
    let dependencies = AppDependencies()
    NomenaView()
        .environment(\.dependencies, dependencies)
}
