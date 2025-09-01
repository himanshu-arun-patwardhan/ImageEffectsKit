//
//  ImageFilterViewModel.swift
//
//
//
//

import UIKit
import SwiftUI

public final class ImageFilterViewModel: ObservableObject {
    @Published public var filteredImage: UIImage?
    
    private let filterService: ImageFilterServiceProtocol
    
    public init(service: ImageFilterServiceProtocol = ImageFilterService()) {
        self.filterService = service
    }
    
    public func apply(effect: ImageEffectType, to image: UIImage) {
        filteredImage = filterService.applyEffect(effect, to: image)
    }
}
