//
//  Full_ImmersiveSpace_AppApp.swift
//  Full-ImmersiveSpace App
//
//  Created by Vinoth Vino on 01/03/24.
//

import SwiftUI

@main
struct Full_ImmersiveSpace_AppApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }

        ImmersiveSpace(id: "ImmersiveSpace") {
            ImmersiveView()
        }.immersionStyle(selection: .constant(.full), in: .full)
    }
}
