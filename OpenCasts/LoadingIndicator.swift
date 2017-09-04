//
//  LoadingIndicator.swift
//  OpenCasts
//
//  Fork of NVActivityIndicatorView from https://github.com/ninjaprox/NVActivityIndicatorView
//  Licensed under the MIT license http://www.opensource.org/licenses/mit-license.php
//  Copyright (c) 2016 Vinh Nguyen
//

import UIKit

class LoadingIndicator: UIView {
    
    private let loadingColor = UIColor(
        red: CGFloat(244/255.0),
        green: CGFloat(67/255.0),
        blue: CGFloat(54/255.0),
        alpha: CGFloat(1.0)
    )
    
    private var isAnimating: Bool = false
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        isHidden = true
    }
    
    public func startAnimating() {
        isHidden = false
        isAnimating = true
        setupAnimation()
//        setupAnimation(in: layer, size: frame.size, color: loadingColor)
    }

    public func stopAnimating() {
        isHidden = true
        isAnimating = false
        layer.sublayers?.removeAll()
    }
    
    // draw loading animation
    func setupAnimation(in layer: CALayer, size: CGSize, color: UIColor) {
        let lineSize = size.width / 9
        let x = (layer.bounds.size.width - size.width) / 2
        let y = (layer.bounds.size.height - size.height) / 2
        let duration: CFTimeInterval = 1
        let beginTime = CACurrentMediaTime()
        let beginTimes = [0.1, 0.2, 0.3, 0.4, 0.5]
        let timingFunction = CAMediaTimingFunction(controlPoints: 0.2, 0.68, 0.18, 1.08)
        
        // Animation
        let animation = CAKeyframeAnimation(keyPath: "transform.scale.y")
        
        animation.keyTimes = [0, 0.5, 1]
        animation.timingFunctions = [timingFunction, timingFunction]
        animation.values = [1, 0.4, 1]
        animation.duration = duration
        animation.repeatCount = HUGE
        animation.isRemovedOnCompletion = false
        
        // Draw lines
        for i in 0 ..< 5 {
            let line = self.layerWith(size: CGSize(width: lineSize, height: size.height), color: color)
            let frame = CGRect(x: x + lineSize * 2 * CGFloat(i), y: y, width: lineSize, height: size.height)
            
            animation.beginTime = beginTime + beginTimes[i]
            line.frame = frame
            line.add(animation, forKey: "animation")
            layer.addSublayer(line)
        }
    }
    
    func layerWith(size: CGSize, color: UIColor) -> CALayer {
        let layer: CAShapeLayer = CAShapeLayer()
        var path: UIBezierPath = UIBezierPath()
        let lineWidth: CGFloat = 2
        
        // line
        path = UIBezierPath(roundedRect: CGRect(x: 0, y: 0, width: size.width, height: size.height), cornerRadius: size.width / 2)
        layer.fillColor = color.cgColor
        
        layer.backgroundColor = nil
        layer.path = path.cgPath
        layer.frame = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        
        return layer
    }
    
    private func setupAnimation() {
        self.setupAnimation(in: layer, size: frame.size, color: self.loadingColor)
    }
}
