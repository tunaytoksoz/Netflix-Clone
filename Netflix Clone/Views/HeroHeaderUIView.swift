//
//  HeroHeaderUIView.swift
//  Netflix Clone
//
//  Created by Tunay Toksöz on 29.10.2022.
//

import UIKit

class HeroHeaderUIView: UIView {
    
    private let heroImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(heroImageView)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        heroImageView.frame = bounds
    }
    
    required init(coder: NSCoder) {
        fatalError()
    }
}
