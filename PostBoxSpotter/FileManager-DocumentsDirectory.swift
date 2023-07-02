//
//  FileManager-DocumentsDirectory.swift
//  PostBoxSpotter
//
//  Created by Jake Maidment on 15/05/2023.
//

import Foundation

extension FileManager {
    static var documentsDirectory: URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
}
