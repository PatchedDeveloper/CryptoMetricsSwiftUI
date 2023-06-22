//
//  LaunchController.swift
//  CryptoMetricsSwiftUI
//
//  Created by Danila Kardashevkii on 22.06.2023.
//

import UIKit

class LaunchScreenViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        animateImage()
    }
    
    private func animateImage() {
        UIView.animate(withDuration: 0.5, delay: 0.0, options: [.autoreverse, .repeat], animations: {
            self.imageView.alpha = 0.0
        }, completion: nil)
    }
}

