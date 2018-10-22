//
//  String+Extension.swift
//  SEHandler
//
//  Created by Nahuel Zapata on 10/21/18.
//  Copyright © 2018 iNahuelZapata. All rights reserved.
//

import Foundation

extension String {
    public func format(args: [CVarArg]) -> String {
        guard args.isEmpty else {
            return self
        }

        return withVaList(args) { argsListPointer in
            NSString(format: self, arguments: argsListPointer) as String
        }
    }
}
