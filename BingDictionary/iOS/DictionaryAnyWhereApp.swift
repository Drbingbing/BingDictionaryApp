//
//  DictionaryAnyWhereApp.swift
//  BingDictionary
//
//  Created by Bing Bing on 2024/8/3.
//
import SwiftUI
import ComposableArchitecture
import DictionaryFeatures

@main
struct DictionaryAnyWhereApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            RootView()
        }
    }
}
