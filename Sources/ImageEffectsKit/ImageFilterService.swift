//
//  ImageFilterService.swift
//
//
//
//

import UIKit
import CoreImage
import CoreImage.CIFilterBuiltins

public class ImageFilterService: ImageFilterServiceProtocol {
    private let context = CIContext()
    
    public init() { }
    
    public func applyEffect(_ effect: ImageEffectType, to image: UIImage) -> UIImage? {
        guard let ciImage = CIImage(image: image) else { return nil }
        
        let filter: CIFilter?
        
        switch effect {
        case .sepia:
            let f = CIFilter.sepiaTone()
            f.inputImage = ciImage
            f.intensity = 1.0
            filter = f
            
        case .grayscale:
            let f = CIFilter.colorControls()
            f.inputImage = ciImage
            f.saturation = 0
            filter = f
            
        case .invert:
            let f = CIFilter.colorInvert()
            f.inputImage = ciImage
            filter = f
            
        case .noir:
            let f = CIFilter.photoEffectNoir()
            f.inputImage = ciImage
            filter = f
            
        case .monochrome:
            let f = CIFilter.colorMonochrome()
            f.inputImage = ciImage
            f.color = CIColor(red: 0.7, green: 0.7, blue: 0.7)
            f.intensity = 1.0
            filter = f
            
        case .bloom:
            let f = CIFilter.bloom()
            f.inputImage = ciImage
            f.intensity = 1.0
            f.radius = 10.0
            filter = f
            
        case .comic:
            let f = CIFilter.comicEffect()
            f.inputImage = ciImage
            filter = f
            
        case .crystallize:
            let f = CIFilter.crystallize()
            f.inputImage = ciImage
            f.radius = 20.0
            filter = f
        }
        
        guard let outputImage = filter?.outputImage,
              let cgImage = context.createCGImage(outputImage, from: outputImage.extent) else {
            return nil
        }
        
        return UIImage(cgImage: cgImage)
    }
}
