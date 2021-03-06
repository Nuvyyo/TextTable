//
//  PipeFormat.swift
//  TextTable
//
//  Created by Cristian Filipov on 8/13/16.
//
//

import Foundation

public enum Pipe: TextTableStyle {
    public static func prepare(_ s: String, for column: Column) -> String {
        var string = s
        if let width = column.width {
            string = string.truncated(column.truncate, length: width)
            string = string.pad(column.align, length: width)
        }
        return escape(string)
    }
    
    public static func escape(_ s: String) -> String { return s }

    private static func line(_ table: inout String, columns: [Column]) {
        table += "|"
        table += columns.map(column).joined(separator: "|")
        table += "|"
        table += "\n"
    }

    private static func column(_ col: Column) -> String {
        let w = max(col.width ?? 0, 3)
        switch col.align {
        case .left:
            return ":" + String(repeating: "-", count: w+1)
        case .right:
            return String(repeating: "-", count: w+1) + ":"
        case .center:
            return ":" + String(repeating: "-", count: w) + ":"
        }
    }

    public static func begin(_ table: inout String, index: Int, columns: [Column]) { }
    public static func end(_ table: inout String, index: Int, columns: [Column]) { }

    public static func header(_ table: inout String, index: Int, columns: [Column]) {
        table += "| "
        table += columns.map{$0.headerString(for: self)}.joined(separator: " | ")
        table += " |"
        table += "\n"
        line(&table, columns: columns)
    }

    public static func row(_ table: inout String, index: Int, columns: [Column]) {
        table += "| "
        table += columns.map{$0.string(for: self)}.joined(separator: " | ")
        table += " |"
        table += "\n"
    }
}
