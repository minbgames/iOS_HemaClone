//
//  SceneDelegate.swift
//  Home3LifeCycle
//
//  Created by 김민백 on 2021/03/22.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let _ = (scene as? UIWindowScene) else { return }
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
        print("Scene - 앱의 연결이 끊김")
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
        print("Scene - 활성화")
        hidePrivacyProtectionWindow()
    }

    func sceneWillResignActive(_ scene: UIScene) {
        
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
        print("Scene - 비활성화")
        showPrivacyProtectionWindow()
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
        print("Scene - 포그라운드 진입")
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
        print("Scene - 백그라운드 진입")
    }
    
    private var privacyProtectionWindow: UIWindow?

    private func showPrivacyProtectionWindow() {
         guard let windowScene = self.window?.windowScene else {
             return
         }
         print("showProtectionWindow")
         privacyProtectionWindow = UIWindow(windowScene: windowScene)
         privacyProtectionWindow?.rootViewController = ProtectionViewController() // rootView
         privacyProtectionWindow?.windowLevel = .alert + 1 // 윈도우 z축의 위치를 잡아주는 것. alert window 보다 1 높게 설정
         privacyProtectionWindow?.makeKeyAndVisible() // window를 보여주는 함수
    }

    private func hidePrivacyProtectionWindow() {
         print("hideProtectionWindow")
         privacyProtectionWindow?.isHidden = true // 해당 view controller 숨기기
         privacyProtectionWindow = nil //
    }


}

