//
//  Extensions.swift
//  SampleAppCognizant
//
//  Created by nous on 23/07/20.
//  Copyright © 2020 yogesh. All rights reserved.
//

import Foundation
import UIKit

var imageCache = NSCache<AnyObject, AnyObject>()

extension UIImageView {
    func load(urlString: String, defaultImage: String) {
        if let image = imageCache.object(forKey: urlString as NSString) as? UIImage {
            self.image = image
            return
        }
        self.image = UIImage(named: defaultImage)
        guard let url = URL(string: urlString) else {
            return
        }

        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        imageCache.setObject(image, forKey: urlString as NSString)
                        self?.image = image
                    }
                }
            }
        }
    }
}
