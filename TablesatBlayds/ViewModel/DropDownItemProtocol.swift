//
//  DropDownItemProtocol.swift
//  TablesatBlayds
//
//  Created by James Woodward on 18/06/2021.
//

import Foundation

protocol DropdownItemProtocol {
    var options: [DropdownOption] { get }
    var headerTitle: String { get }
    var dropdownTitle: String { get }
    var isSelected: Bool { get set }
    var selectedOption: DropdownOption {get set}
}

protocol DropdownOptionProtocol {
    var toDropdownOption : DropdownOption {get}
}

struct DropdownOption {
    enum DropdownOptionType {
        case text(String)
        case number(Int)
        case date(Date)
    }
    let type: DropdownOptionType
    let formatted: String
}
