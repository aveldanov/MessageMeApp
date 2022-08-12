//
//  ViewController.swift
//  MessageMeApp
//
//  Created by Anton Veldanov on 8/10/22.
//

import UIKit

class ConversationsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        let isLoggedIn = UserDefaults.standard.bool(forKey: "logged_in")

        if !isLoggedIn {
            let vc = LoginViewController()
            let nav = UINavigationController(rootViewController: vc)
            nav.modalPresentationStyle = .fullScreen
            present(nav, animated: true, completion: nil)
        }

    }


}

