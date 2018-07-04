//
//  OptionItemDao.swift
//  Umbrella
//
//  Created by Lucas Correa on 26/06/2018.
//  Copyright © 2018 Security First. All rights reserved.
//

import Foundation

struct OptionItemDao: DaoProtocol {
    
    //
    // MARK: - Properties
    let sqlProtocol: SQLProtocol
    
    //
    // MARK: - Initializer
    
    /// Init
    ///
    /// - Parameter sqlProtocol: SQLProtocol
    init(sqlProtocol: SQLProtocol) {
        self.sqlProtocol = sqlProtocol
    }
    
    //
    // MARK: - DaoProtocol
    
    /// Create the table
    ///
    /// - Returns: boolean if it was created
    func createTable() -> Bool {
        return self.sqlProtocol.create(table: OptionItem())
    }
    
    /// List of object
    ///
    /// - Returns: a list of object
    func list() -> [OptionItem] {
        return self.sqlProtocol.select(withQuery: "SELECT * FROM \(OptionItem.table)")
    }
    
    /// Drop the table
    ///
    /// - Returns: boolean if it was dropped
    func dropTable() -> Bool {
        return self.sqlProtocol.drop(tableName: OptionItem.table)
    }
    
    /// Insert a object in database
    ///
    /// - Parameter object: object
    /// - Returns: rowId of object inserted
    func insert(_ object: OptionItem) -> Int64 {
        let rowId = self.sqlProtocol.insert(withQuery: "INSERT INTO \(OptionItem.table) ('label', 'value', 'item_form_id') VALUES (\"\(object.label)\", \"\(object.value)\", \(object.itemFormId))")
        return rowId
    }
    
    //
    // MARK: - Custom functions
}
