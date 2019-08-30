//
//  ViewController.swift
//  backgrounder
//
//  Created by Kent Walters on 2019-03-15.
//  Copyright © 2019 kw. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let r = UISlider()
    let g = UISlider()
    let b = UISlider()
    
    var showing: Bool = true
    
    override var prefersStatusBarHidden: Bool {
        return true
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .black
        
        setUpSliders()
        setUpTapGesture()
    }
    
    func setUpTapGesture() {
        let tapGes = UITapGestureRecognizer(target: self, action: #selector(screenTapped))
        self.view.addGestureRecognizer(tapGes)
    }
    
    @objc func screenTapped() {
        
        r.isHidden = showing
        g.isHidden = showing
        b.isHidden = showing
        
        showing = !showing
 
    }
    
    func setUpSliders() {
        self.view.addSubview(r)
        self.view.addSubview(g)
        self.view.addSubview(b)
        
        r.anchor(top: nil, paddingTop: 0, bottom: self.view.safeAreaLayoutGuide.bottomAnchor, paddingBottom: 10, left: self.view.leftAnchor, paddingLeft: 10, right: self.view.rightAnchor, paddingRight: 10, width: 0, height: 0)
        g.anchor(top: nil, paddingTop: 0, bottom: r.topAnchor, paddingBottom: 10, left: self.view.leftAnchor, paddingLeft: 10, right: self.view.rightAnchor, paddingRight: 10, width: 0, height: 0)
        b.anchor(top: nil, paddingTop: 0, bottom: g.topAnchor, paddingBottom: 10, left: self.view.leftAnchor, paddingLeft: 10, right: self.view.rightAnchor, paddingRight: 10, width: 0, height: 0)
        
        r.tintColor = .white
        g.tintColor = .white
        b.tintColor = .white
        
        r.addTarget(self, action: #selector(setBackgrounColor), for: .valueChanged)
        g.addTarget(self, action: #selector(setBackgrounColor), for: .valueChanged)
        b.addTarget(self, action: #selector(setBackgrounColor), for: .valueChanged)
        
    }
    
    @objc func setBackgrounColor() {
        let r255 = CGFloat(r.value * 1)
        let g255 = CGFloat(g.value * 1)
        let b255 = CGFloat(b.value * 1)
        
        print("\(r255) \(g255) \(b255)")
        
        let color = UIColor(displayP3Red: r255, green: g255, blue: b255, alpha: 1)
        
        
        self.view.backgroundColor = color
    }


}

extension UIView {
    func anchor(
        top: NSLayoutYAxisAnchor?,
        paddingTop: CGFloat,
        bottom: NSLayoutYAxisAnchor?,
        paddingBottom: CGFloat,
        left: NSLayoutXAxisAnchor?, paddingLeft: CGFloat, right: NSLayoutXAxisAnchor?, paddingRight: CGFloat, width: CGFloat, height: CGFloat) {
        translatesAutoresizingMaskIntoConstraints = false
        if let top = top {
            topAnchor.constraint(equalTo: top, constant: paddingTop).isActive = true
        }
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: -paddingBottom).isActive = true
        }
        if let right = right {
            rightAnchor.constraint(equalTo: right, constant: -paddingRight).isActive = true
        }
        if let left = left {
            leftAnchor.constraint(equalTo: left, constant: paddingLeft).isActive = true
        }
        if width != 0 {
            widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        if height != 0 {
            heightAnchor.constraint(equalToConstant: height).isActive = true
        }
    }
}
