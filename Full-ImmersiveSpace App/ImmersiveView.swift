//
//  ImmersiveView.swift
//  Full-ImmersiveSpace App
//
//  Created by Vinoth Vino on 01/03/24.
//

import SwiftUI
import RealityKit

struct ImmersiveView: View {
    @Environment(\.openWindow) private var openWindow
    @EnvironmentObject private var skyboxSetting: SkyboxSettings
    
    var body: some View {
        RealityView { content in
            // Create a skybox
            guard let skyboxEntity = createSkybox() else { return }
            
            // Add to content
            content.add(skyboxEntity)
        } update: { content in
            updateSkybox(with: skyboxSetting.selectedSkybox, content: content)
        }
        .onAppear {
            openWindow(id: "HomeView")
        }
    }
    
    private func createSkybox() -> Entity? {
        // Mesh (Large Sphere)
        let skyboxMesh = MeshResource.generateSphere(radius: 1000)
        
        // Material (Skybox Image)
        var skyboxMaterial = UnlitMaterial()
        guard let skyboxTexture = try? TextureResource.load(named: SkyboxType.cayleyLookout.rawValue) else { return nil }
        
        skyboxMaterial.color = .init(texture: .init(skyboxTexture))
        
        // Entity
        let skyboxEntity = Entity()
        skyboxEntity.components.set(ModelComponent(mesh: skyboxMesh, materials: [skyboxMaterial]))
        
        skyboxEntity.name = "Skybox"
        
        // Map image to inner surface of sphere
        skyboxEntity.scale = .init(x: -1, y: 1, z: 1)
        
        return skyboxEntity
    }
    
    private func updateSkybox(with skyboxType: SkyboxType, content: RealityViewContent) {
        let skyboxEntity = content.entities.first(where: {$0.name == "Skybox"} )
        
        guard let updatedSkyboxTexture = try? TextureResource.load(named: skyboxType.rawValue) else { return }
        
        var updatedSkyboxMaterial = UnlitMaterial()
        updatedSkyboxMaterial.color = .init(texture: .init(updatedSkyboxTexture))
        
        skyboxEntity?.components.set(ModelComponent(mesh: MeshResource.generateSphere(radius: 1000), materials: [updatedSkyboxMaterial]))
    }
}

#Preview {
    ImmersiveView()
        .previewLayout(.sizeThatFits)
}
