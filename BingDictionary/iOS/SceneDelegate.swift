//
//  SceneDelegate.swift
//  BingDictionary
//
//  Created by Bing Bing on 2024/8/3.
//

import UIKit
import BingDictionaryUI

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        window = nativeWindowHostView(from: windowScene)
        window?.makeKeyAndVisible()
        
    }
}

private func nativeWindowHostView(from scene: UIWindowScene) -> UIWindow {
    let window = UIWindow(windowScene: scene)
    
    let rootViewController = ViewController()
    let navigationController = UINavigationController(rootViewController: rootViewController)
    
    window.rootViewController = navigationController
    
    return window
}
