import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
        
    let loginViewController = LoginViewController()
    let onboardingContainerViewController = OnboardingContainerViewController()
    let dummyViewController = DummyViewController()

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window : UIWindow = UIWindow(windowScene: windowScene)
        
        loginViewController.delegate = self
        onboardingContainerViewController.delegate = self
        dummyViewController.delegate = self
        
        window.rootViewController = loginViewController
        window.makeKeyAndVisible()
        
        self.window = window
        print("Scene will connect to UIViewController")
    }

}

extension SceneDelegate : LoginViewControllerDelegate {
    func didLogin() {
        if LocalState.hasOnboarded {
            setRootViewController(dummyViewController)
        } else {
            setRootViewController(onboardingContainerViewController)
        }
        
    }
}

extension SceneDelegate : OnboardingContainerViewControllerDelegate {
    func didFinishOnboarding() {
        LocalState.hasOnboarded = true
        setRootViewController(dummyViewController)
    }
}

extension SceneDelegate : LogoutDelegate {
    func didLogout() {
        setRootViewController(loginViewController)
    }
}

// MARK: - Change VC
extension SceneDelegate {
    
    func setRootViewController(_ viewController : UIViewController, animated : Bool = true) {
        guard animated, let window = self.window else {
            self.window?.rootViewController = viewController
            self.window?.makeKeyAndVisible()
            return
        }
        
        window.rootViewController = viewController
        window.makeKeyAndVisible()
        UIView.transition(with: window, duration: 0.5, options: .transitionCrossDissolve, animations: nil)
    }
}

extension SceneDelegate {
    
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
