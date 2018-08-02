//
//  Column.swift
//  Umbrella
//
//  Created by Lucas Correa on 25/06/2018.
//  Copyright © 2018 Security First. All rights reserved.
//

import Foundation
import SQLite

enum ColumnType {
    case string
    case int
    case real
    case primaryKey
    case foreignKey
}

struct Column {
    
    //
    // MARK: - Properties
    var name: String?
    var type: ColumnType?
    var foreignKey: ForeignKey?
    var isNotNull: Bool?
    
    //
    // MARK: - Initializers
    init(name: String, type: ColumnType) {
        self.name = name
        self.type = type
        self.foreignKey = nil
        self.isNotNull = true
    }
    
    init(name: String, type: ColumnType, isNotNull: Bool) {
        self.name = name
        self.type = type
        self.foreignKey = nil
        self.isNotNull = isNotNull
    }
    
    init(foreignKey: ForeignKey) {
        self.type = .foreignKey
        self.foreignKey = foreignKey
    }
}
