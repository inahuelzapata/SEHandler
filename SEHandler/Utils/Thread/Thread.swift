//
//  Thread.swift
//  SEHandler
//
//  Created by Nahuel Zapata on 10/21/18.
//  Copyright © 2018 iNahuelZapata. All rights reserved.
//

import Foundation

func getThreadName() -> String {
    if Thread.isMainThread {
        return "main"
    } else {
        var name: String = Thread.current.name ?? ""
        if name.isEmpty {
            let queueNameBytes = __dispatch_queue_get_label(nil)
            if let queuName = String(validatingUTF8: queueNameBytes) {
                name = queuName
            }
        }
        if name.isEmpty {
            name = String(format: "%p", Thread.current)
        }

        return name
    }
}

func getThreadId() -> UInt64 {
    var threadId: UInt64 = 0
    if pthread_threadid_np(nil, &threadId) != 0 {
        threadId = UInt64(pthread_mach_thread_np(pthread_self()))
    }
    return threadId
}
