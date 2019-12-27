//
//  View.swift
//  Theme
//
//  Created by Алексей Бузов on 27.12.2019.
//  Copyright © 2019 Alexey Buzov. All rights reserved.
//

import UIKit

class SceneView: UIView {
    var textLable: UILabel!
    var button: UIButton!

    init() {
        super.init(frame: .zero)
        layoutContent(in: self)
        applyStyle(with: Theme.components)
        addThemeChangeObserver()
    }

    deinit {
        removeThemeChangeObserver()
    }

    override func themeDidChange() {
        
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func layoutContent(in view: UIView) {
        let marginOffset: CGFloat = UIScreen.small ? 8 : 16
        let screenCentre: CGFloat = UIScreen.main.bounds.height / 2

        textLable = view.layout(UILabel()) { make in
            make.top.leading.equalTo(safeArea).offset(marginOffset)
            make.trailing.equalTo(safeArea).offset(-marginOffset)
            make.height.equalTo(screenCentre)
        }
        textLable.text = "Вы любите розы? A я на них срал! Cтране нужны паровозы, Нам нужен металл! Товарищ! Не охай, не ахай! Не дёргай узду! Коль выполнил план, посылай всех в пизду не выполнил — сам иди на хуй"
        textLable.numberOfLines = 0
        textLable.lineBreakMode = .byCharWrapping

        button = view.layout(UIButton()) { make in
            make.top.equalTo(textLable.bottom).offset(marginOffset)
            make.leading.equalTo(safeArea).offset(marginOffset)
            make.trailing.equalTo(safeArea).offset(-marginOffset)
            make.height.equalTo(screenCentre / 4)
        }

        button.setTitle("AUTO", for: .normal)
    }

    func applyStyle(with component: ThemeComponents) {
        self.backgroundColor = component.backGroundColor
        textLable.backgroundColor = component.lableBackGroundColor
        textLable.textColor = component.textColor
        button.backgroundColor = component.buttonColor
        button.titleLabel?.textColor = component.textColor
    }
}
