//
//  HomeView.swift
//  Full-ImmersiveSpace App
//
//  Created by Vinoth Vino on 01/03/24.
//


import SwiftUI

enum SkyboxType: String {
    case cayleyLookout = "CayleyLookout"
    case clarensNight = "ClarensNight"
}

struct HomeView: View {
    @EnvironmentObject private var skyboxSetting: SkyboxSettings
    
    var body: some View {
        HStack(spacing: 20) {
            Button {
                changeSkybox(type: .cayleyLookout)
            } label: {
                Image(systemName: "house.and.flag")
            }
            
            Button {
                changeSkybox(type: .clarensNight)
            } label: {
                Image(systemName: "mountain.2")
            }
        }
    }
    
    func changeSkybox(type: SkyboxType) {
        skyboxSetting.selectedSkybox = type
    }
}

#Preview {
    HomeView()
}
