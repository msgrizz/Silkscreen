//
//  DividableViewController.swift
//  Silkscreen
//
//  Created by James Campbell on 18/01/2016.
//  Copyright © 2016 SK. All rights reserved.
//

import UIKit

class DividableViewController: UIViewController {
    
    private let stackView = UIStackView(arrangedSubviews: [])
    private let arrangedSubviewControllers: [UIViewController]
    
    var axis: UILayoutConstraintAxis = .Vertical {
        didSet {
            updateStackViewProperties()
        }
    }

    init(arrangedSubviewControllers: [UIViewController] = []) {
        
        self.arrangedSubviewControllers = arrangedSubviewControllers
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        arrangedSubviewControllers.forEach(addArrangedChildViewController)
        updateStackViewProperties()
        view = stackView
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        view.setNeedsLayout()
    }
    
    func addArrangedChildViewController(viewController: UIViewController) {
        
        viewController.beginAppearanceTransition(true, animated: false)
        viewController.willMoveToParentViewController(self)
        addChildViewController(viewController)
        stackView.addArrangedSubview(viewController.view)
        viewController.endAppearanceTransition()
    }
    
    private func updateStackViewProperties() {
        
        stackView.axis = axis
        stackView.distribution = .Fill
        stackView.alignment = .Fill
    }
}