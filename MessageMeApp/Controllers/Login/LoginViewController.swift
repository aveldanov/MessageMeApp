//
//  LoginViewController.swift
//  MessageMeApp
//
//  Created by Anton Veldanov on 8/10/22.
//

import UIKit

class LoginViewController: UIViewController {


    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "messageLogo")
        imageView.contentMode = .scaleAspectFit

        return imageView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Log In"

        view.backgroundColor = .red

        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Register",
                                                            style: .done,
                                                            target: self,
                                                            action: #selector(didTapRegister))

        // MARK: - Add Subviews
        view.addSubview(imageView)
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let size = view.frame.size.width/3
        imageView.frame = CGRect(x: (view.frame.size.width - size)/2,
                                 y: 20,
                                 width: size,
                                 height: size)
    }
    

    @objc private func didTapRegister(){

        let vc = RegisterViewController()
        vc.title = "Create Account"
        navigationController?.pushViewController(vc, animated: true)
    }

}
