//
//  CSVFormat.swift
//  TextTable
//
//  Created by Steve Brambilla on 2016-12-14.
//
//

import Foundation

public enum CSV: TextTableStyle {
	// Note: Ignores column alignment
	public static func prepare(_ s: String, for column: Column) -> String {
		var string = s
		if let width = column.width {
			string = string.truncated(column.truncate, length: width)
		}
		return escape(string)
	}

	public static func escape(_ s: String) -> String {
		// Only need to escape if the string contains a comma, double-quote, or new-line.
		if s.rangeOfCharacter(from: CharacterSet(charactersIn: ",\"\n")) == nil {
			return s
		}

		// Wrap string with double-quotes, and escape any double-quotes in the string using a double-quote.
		var string = "\""
		string += s.replacingOccurrences(of: "\"", with: "\"\"")
		string += "\""
		return string
	}

	public static func begin(_ table: inout String, index: Int, columns: [Column]) { }
	public static func end(_ table: inout String, index: Int, columns: [Column]) { }

	public static func header(_ table: inout String, index: Int, columns: [Column]) {
		table += columns.map{$0.headerString(for: self)}.joined(separator: ",")
		table += "\n"
	}

	public static func row(_ table: inout String, index: Int, columns: [Column]) {
		table += columns.map{$0.string(for: self)}.joined(separator: ",")
		table += "\n"
	}
}
