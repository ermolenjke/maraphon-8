//
//  ViewController.swift
//  maraphon#8
//
//  Created by Даниил Ермоленко on 22.05.2023.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {

    let scrollView = UIScrollView()
    let largeTitleView = UIView()
    let image = UIImageView(image: UIImage(systemName: "person.crop.circle.fill"))
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        self.navigationItem.title = "Avatar"
        
        
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .automatic
        
        scrollView.contentSize = view.frame.size
        scrollView.frame = CGRect(origin: .zero, size: view.frame.size)

        image.tintColor = .systemMint
        
        view.addSubview(scrollView)
        largeTitleView.addSubview(image)
        largeTitleView.translatesAutoresizingMaskIntoConstraints = false
        image.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            image.trailingAnchor.constraint(equalTo: largeTitleView.trailingAnchor),
            image.heightAnchor.constraint(equalToConstant: 36),
            image.widthAnchor.constraint(equalToConstant: 36),
            image.centerYAnchor.constraint(equalTo: largeTitleView.centerYAnchor)
        ])
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.1) {
                if let largeTitleClass = NSClassFromString("_UINavigationBarLargeTitleView") as? UIView.Type {
                    if let largeTitleView = self.findSubview(parentView: self.navigationController!.view, type: largeTitleClass) {
                        largeTitleView.addSubview(self.largeTitleView)
                        
                        NSLayoutConstraint.activate([
                            self.largeTitleView.bottomAnchor.constraint(equalTo: largeTitleView.safeAreaLayoutGuide.bottomAnchor),
                            self.largeTitleView.heightAnchor.constraint(equalToConstant: 52),
                            self.largeTitleView.widthAnchor.constraint(equalToConstant: 52),
                            self.largeTitleView.trailingAnchor.constraint(equalTo: largeTitleView.trailingAnchor, constant: -8 ),

                        ])
                  }
              }
         }
    }

    func findSubview(parentView: UIView, type: UIView.Type) -> UIView? {
        for subview in parentView.subviews {
            if subview.isKind(of: type) {
                return subview
            } else if let desiredInstance = findSubview(parentView: subview, type: type) {
                return desiredInstance
            }
        }
        return nil
     }
}
