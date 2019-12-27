//
//  SnapKit+UIView.swift
//  Theme
//
//  Created by Алексей Бузов on 27.12.2019.
//  Copyright © 2019 Alexey Buzov. All rights reserved.
//

import UIKit
import SnapKit


extension UIView {
    func layout<T: UIView>(
        _ subview: T,
        _ closure: (ConstraintMaker) -> Void) -> T
    {
        self.addSubview(subview)
        subview.snp.makeConstraints(closure)
        return subview
    }
    
    var top: SnapKit.ConstraintItem {
        return snp.top
    }
    
    var bottom: SnapKit.ConstraintItem {
        return snp.bottom
    }
    
    var leading: SnapKit.ConstraintItem {
        return snp.leading
    }
    
    var trailing: SnapKit.ConstraintItem {
        return snp.trailing
    }
    
    var topMargin: SnapKit.ConstraintItem {
        return snp.topMargin
    }
    
    var bottomMargin: SnapKit.ConstraintItem {
        return snp.bottomMargin
    }
    
    var leadingMargin: SnapKit.ConstraintItem {
        return snp.leadingMargin
    }
    
    var trailingMargin: SnapKit.ConstraintItem {
        return snp.trailingMargin
    }
    
    var safeArea: UILayoutGuide {
        return self.safeAreaLayoutGuide
    }
}

extension UIScreen {
    static var small: Bool {
        return UIScreen.main.bounds.height <= 568
    }
}
