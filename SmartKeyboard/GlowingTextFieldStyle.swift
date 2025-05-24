import SwiftUI
import UIKit

struct GlowingTextFieldStyle: TextFieldStyle {
    @State private var isAnimating = false
    @State private var particleLayer: CAEmitterLayer?
    
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
                        ParticleEffectView()
                            .frame(width: geometry.size.width, height: geometry.size.height)
                    }
                }
            )
            .onAppear {
                isAnimating = true
            }
    }
}

struct ParticleEffectView: UIViewRepresentable {
    func makeUIView(context: Context) -> UIView {
        let view = UIView()
        view.backgroundColor = .clear
        
        let emitterLayer = CAEmitterLayer()
        emitterLayer.emitterPosition = CGPoint(x: 0, y: 0)
        emitterLayer.emitterSize = CGSize(width: 1, height: 1)
        emitterLayer.emitterShape = .line
        emitterLayer.beginTime = CACurrentMediaTime()
        
        let particle = CAEmitterCell()
        particle.scale = 0.2
        particle.scaleRange = 0.1
        particle.emissionRange = .pi / 4
        particle.lifetime = 1.0
        particle.birthRate = 1
        particle.velocity = 50
        particle.velocityRange = 20
        particle.yAcceleration = 0
        particle.color = UIColor.green.cgColor
        particle.contents = createParticleImage()
        
        emitterLayer.emitterCells = [particle]
        view.layer.addSublayer(emitterLayer)
        
        // Animate the emitter position along the border
        let animation = CAKeyframeAnimation(keyPath: "emitterPosition")
        animation.path = createBorderPath(in: view.bounds).cgPath
        animation.duration = 3.0
        animation.repeatCount = .infinity
        animation.calculationMode = .paced
        emitterLayer.add(animation, forKey: "emitterPosition")
        
        return view
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
        if let emitterLayer = uiView.layer.sublayers?.first as? CAEmitterLayer {
            let newPath = createBorderPath(in: uiView.bounds)
            let animation = CAKeyframeAnimation(keyPath: "emitterPosition")
            animation.path = newPath.cgPath
            animation.duration = 3.0
            animation.repeatCount = .infinity
            animation.calculationMode = .paced
            emitterLayer.add(animation, forKey: "emitterPosition")
        }
    }
    
    private func createParticleImage() -> CGImage? {
        let size = CGSize(width: 4, height: 4)
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        guard let context = UIGraphicsGetCurrentContext() else { return nil }
        
        context.setFillColor(UIColor.green.cgColor)
        context.fillEllipse(in: CGRect(origin: .zero, size: size))
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return image?.cgImage
    }
    
    private func createBorderPath(in rect: CGRect) -> UIBezierPath {
        let path = UIBezierPath(roundedRect: rect.insetBy(dx: 2, dy: 2), cornerRadius: 8)
        return path
    }
}

// Extension to make the TextField style easily accessible
extension View {
    func glowingTextField() -> some View {
        self.textFieldStyle(GlowingTextFieldStyle())
    }
} 