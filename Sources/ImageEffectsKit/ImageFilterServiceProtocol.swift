//
//  ImageFilterServiceProtocol.swift
//
//
//
//

import UIKit

public protocol ImageFilterServiceProtocol {
    func applyEffect(_ effect: ImageEffectType, to image: UIImage) -> UIImage?
}
