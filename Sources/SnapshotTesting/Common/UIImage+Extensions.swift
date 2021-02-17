//
//  UIImage+Extensions.swift
//  SnapshotTesting
//
//  Created by Caio Remedio on 17/02/21.
//

import UIKit

extension UIImage {

  public func diff(with image: UIImage?) -> UIImage? {

    guard let image = image else { return nil }

    let imageSize = CGSize(width: max(size.width, image.size.width), height: max(size.height, image.size.height))
    UIGraphicsBeginImageContextWithOptions(imageSize, true, 0)

    let context = UIGraphicsGetCurrentContext()
    draw(in: CGRect(x: 0, y: 0, width: size.width, height: size.height))

    context?.setAlpha(0.5)
    context?.beginTransparencyLayer(auxiliaryInfo: nil)

    image.draw(in: CGRect(x: 0, y: 0, width: image.size.width, height: image.size.height))

    context?.setBlendMode(CGBlendMode.difference)
    context?.setFillColor(UIColor.white.cgColor)
    context?.fill(CGRect(x: 0, y: 0, width: size.width, height: size.height))
    context?.endTransparencyLayer()

    let returnImage = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()

    return returnImage
  }
}
