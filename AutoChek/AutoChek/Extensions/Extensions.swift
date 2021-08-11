//
//  Extensions.swift
//  AutoChek
//
//  Created by mac on 11/08/2021.
//

import UIKit
import JGProgressHUD

extension UIViewController {
    static let hud = JGProgressHUD()
    
    func showLoader(_ show: Bool) {
        view.endEditing(true)
        if show {
            UIViewController.hud.show(in: view)
        } else {
            UIViewController.hud.dismiss()
        }
    }
    
    func configureNavBar() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = #colorLiteral(red: 0.9664005637, green: 0.7419896722, blue: 0.05126001686, alpha: 1)
        
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        navigationItem.backButtonTitle = ""
        let backImage = UIImage(named: "chevron.backward")?.withRenderingMode(.alwaysOriginal)
        UINavigationBar.appearance().backIndicatorImage = backImage
        UINavigationBar.appearance().backIndicatorTransitionMaskImage = backImage
        UIBarButtonItem.appearance().setBackButtonTitlePositionAdjustment(UIOffset(horizontal: 0, vertical: -80.0), for: .default)
        UIBarButtonItem.appearance().tintColor = #colorLiteral(red: 0.09543609155, green: 0.1214046094, blue: 0.2188794313, alpha: 1)
    }
}
