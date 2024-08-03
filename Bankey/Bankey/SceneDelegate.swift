//
//  SceneDelegate.swift
//  Bankey
//
//  Created by Raghavendra Mirajkar on 01/08/24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window : UIWindow = UIWindow(windowScene: windowScene)
        window.rootViewController = LoginViewController()
        window.makeKeyAndVisible()
        self.window = window
        print("Scene will connect to UIViewController")
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        print("Scene Did Disconnect")
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        print("Scene Did Become Active")
    }

    func sceneWillResignActive(_ scene: UIScene) {
        print("Scene will resign active")
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        print("Scene will enter Foreground")
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        print("Scene Did enter Background")
    }

}

