//
//  Full_ImmersiveSpace_App.swift
//  Full-ImmersiveSpace App
//
//  Created by Vinoth Vino on 01/03/24.
//

import SwiftUI

@main
struct Full_ImmersiveSpace_App: App {
    @ObservedObject var skyboxSettings = SkyboxSettings()
    
    var body: some Scene {
        ImmersiveSpace(id: "ImmersiveSpace") {
            ImmersiveView()
                .environmentObject(skyboxSettings)
        }.immersionStyle(selection: .constant(.full), in: .full)
        
        WindowGroup(id: "HomeView") {
            HomeView()
                .environmentObject(skyboxSettings)
        }
        .defaultSize(width: 400, height: 100)
    }
}

class SkyboxSettings: ObservableObject {
    @Published var selectedSkybox: SkyboxType = SkyboxType.cayleyLookout
}
