//
//  ContentView.swift
//  SmartKeyboard
//
//  Created by Olibo moni on 24/11/2023.
//

import SwiftUI
import UIKit
#if DEBUG
import Inject
#endif

// MARK: - Glowing TextField Style
struct GlowingTextFieldStyle: TextFieldStyle {
    @State private var isAnimating = false
    
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding()
            .background(
                GeometryReader { geometry in
                    ZStack {
                        // Base border
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.green.opacity(0.3), lineWidth: 2)
                        
                        // Glowing border
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(
                                LinearGradient(
                                    colors: [.green.opacity(0.5), .green.opacity(0.8), .green.opacity(0.5)],
                                    startPoint: .leading,
                                    endPoint: .trailing
                                ),
                                lineWidth: 2
                            )
                            .blur(radius: 4)
                            .opacity(isAnimating ? 1 : 0.5)
                            .animation(.easeInOut(duration: 1.5).repeatForever(autoreverses: true), value: isAnimating)
                        
                        // Particle effect layer
                        if geometry.size.width > 0 && geometry.size.height > 0 {
                            ParticleEffectView()
                                .frame(width: geometry.size.width, height: geometry.size.height)
                        }
                    }
                }
            )
            .onAppear {
                isAnimating = true
            }
    }
}

struct ParticleEffectView: UIViewRepresentable {
    @State private var viewSize: CGSize = .zero
    
    func makeUIView(context: Context) -> UIView {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
        // Only update if size has changed
        guard uiView.bounds.size != viewSize else { return }
        viewSize = uiView.bounds.size
        
        // Remove existing emitter layer if any
        uiView.layer.sublayers?.forEach { $0.removeFromSuperlayer() }
        
        // Only proceed if we have valid dimensions
        guard uiView.bounds.width > 10, uiView.bounds.height > 10 else { return }
        
        let emitterLayer = CAEmitterLayer()
        emitterLayer.frame = uiView.bounds
        emitterLayer.emitterPosition = CGPoint(x: uiView.bounds.midX, y: uiView.bounds.minY)
        emitterLayer.emitterSize = CGSize(width: 1, height: 1)
        emitterLayer.emitterShape = .line
        
        let particle = CAEmitterCell()
        particle.scale = 0.15
        particle.scaleRange = 0.05
        particle.emissionRange = .pi / 8
        particle.lifetime = 0.8
        particle.birthRate = 1
        particle.velocity = 40
        particle.velocityRange = 10
        particle.yAcceleration = 0
        particle.color = UIColor.green.cgColor
        particle.contents = createParticleImage()
        
        emitterLayer.emitterCells = [particle]
        uiView.layer.addSublayer(emitterLayer)
        
        // Create a simple rectangular path
        let path = createSimplePath(in: uiView.bounds)
        let animation = CAKeyframeAnimation(keyPath: "emitterPosition")
        animation.path = path.cgPath
        animation.duration = 2.0
        animation.repeatCount = .infinity
        animation.calculationMode = .paced
        animation.isRemovedOnCompletion = false
        
        emitterLayer.add(animation, forKey: "emitterPosition")
    }
    
    private func createParticleImage() -> CGImage? {
        let size = CGSize(width: 3, height: 3)
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        guard let context = UIGraphicsGetCurrentContext() else { return nil }
        
        context.setFillColor(UIColor.green.cgColor)
        context.fillEllipse(in: CGRect(origin: .zero, size: size))
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return image?.cgImage
    }
    
    private func createSimplePath(in rect: CGRect) -> UIBezierPath {
        let path = UIBezierPath()
        let inset: CGFloat = 4
        let safeRect = rect.insetBy(dx: inset, dy: inset)
        
        // Start from top-left
        path.move(to: CGPoint(x: safeRect.minX, y: safeRect.minY))
        // Move to top-right
        path.addLine(to: CGPoint(x: safeRect.maxX, y: safeRect.minY))
        // Move to bottom-right
        path.addLine(to: CGPoint(x: safeRect.maxX, y: safeRect.maxY))
        // Move to bottom-left
        path.addLine(to: CGPoint(x: safeRect.minX, y: safeRect.maxY))
        // Close the path
        path.close()
        
        return path
    }
}

// MARK: - Content View
struct ContentView: View {
    @ObserveInjection var inject
    @State var text = ""
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
            Image(systemName: "globe.desk")
                .imageScale(.large)
                .foregroundStyle(.tint)
                Text("Smart Keyboard")
            }
            TextField("", text: $text)
                .textFieldStyle(GlowingTextFieldStyle())
                .frame(height: 44)
        }
        .padding()
        .enableInjection()
    }
}

#Preview {
    ContentView()
}
