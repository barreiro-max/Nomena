//
//  NomenaApp.swift
//  Nomena
//
//  Created by MaxTop4ik022 on 18.01.2026.
//

import SwiftUI

@main
struct NomenaApp: App {
    @State(initialValue: AppDependencies()) private var dependencies
    
    var body: some Scene {
        WindowGroup {
            NomenaView()
                .environment(\.dependencies, dependencies)
        }
    }
}
