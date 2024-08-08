//
//  PostboxLogging.swift
//  DictionaryAnyWhere
//
//  Created by Bing Bing on 2024/8/4.
//

import Foundation

private var postboxLogger: (String) -> Void = { _ in }
private var postboxLoggerSync: () -> Void = {}

public func setPostboxLogger(_ f: @escaping (String) -> Void, sync: @escaping () -> Void) {
    postboxLogger = f
    postboxLoggerSync = sync
}

public func postboxLog(_ what: @autoclosure () -> String) {
    postboxLogger(what())
}

public func postboxLogSync() {
    postboxLoggerSync()
}
