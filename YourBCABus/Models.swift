//
//  Models.swift
//  YourBCABus
//
//  Created by Anthony Li on 10/19/18.
//  Copyright © 2018 YourBCABus. All rights reserved.
//

import Foundation

struct Bus: Codable, Comparable, CustomStringConvertible {
    static private let formatter = ISO8601DateFormatter()
    static private func formatDate(from: String) -> Date? {
        var temp = from
        if let match = temp.firstIndex(of: ".") {
            temp.removeSubrange(match...temp.index(match, offsetBy: 3))
        }
        return Bus.formatter.date(from: temp)
    }
    
    enum BusKeys: String, CodingKey {
        case _id = "_id"
        case school_id = "school_id"
        case available = "available"
        case name = "name"
        case locations = "locations"
        case boarding_time = "boarding_time"
        case departure_time = "departure_time"
        case invalidate_time = "invalidate_time"
        case boards = "boards"
        case departs = "departs"
        case invalidates = "invalidates"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: BusKeys.self)
        _id = try container.decode(String.self, forKey: ._id)
        school_id = try container.decode(String.self, forKey: .school_id)
        available = try container.decode(Bool.self, forKey: .available)
        name = container.contains(.name) ? try container.decode(String.self, forKey: .name) : nil
        locations = try container.decode([String].self, forKey: .locations)
        
        if container.contains(.boards) {
            boards = try container.decode(Date.self, forKey: .boards)
        } else {
            let boarding_time = container.contains(.boarding_time) ? try container.decode(String?.self, forKey: .boarding_time) : nil
            if let time = boarding_time {
                boards = Bus.formatDate(from: time)
            } else {
                boards = nil
            }
        }
        
        if container.contains(.departs) {
            departs = try container.decode(Date.self, forKey: .departs)
        } else {
            let departure_time = container.contains(.departure_time) ? try container.decode(String?.self, forKey: .departure_time) : nil
            if let time = departure_time {
                departs = Bus.formatDate(from: time)
            } else {
                departs = nil
            }
        }
        
        if container.contains(.invalidates) {
            invalidates = try container.decode(Date.self, forKey: .invalidates)
        } else {
            let invalidate_time = container.contains(.invalidate_time) ? try container.decode(String?.self, forKey: .invalidate_time) : nil
            if let time = invalidate_time {
                invalidates = Bus.formatDate(from: time)
            } else {
                invalidates = nil
            }
        }
    }
    
    let _id: String
    let school_id: String
    let available: Bool
    let name: String?
    let locations: [String]
    var boarding_time: String? {
        get {
            guard let date = boards else {
                return nil
            }
            
            return Bus.formatter.string(from: date)
        }
    }
    var departure_time: String? {
        get {
            guard let date = departs else {
                return nil
            }
            
            return Bus.formatter.string(from: date)
        }
    }
    var invalidate_time: String? {
        get {
            guard let date = invalidates else {
                return nil
            }
            
            return Bus.formatter.string(from: date)
        }
    }
    
    let boards: Date?
    let departs: Date?
    let invalidates: Date?
    
    func isValidated(asOf date: Date = Date()) -> Bool {
        guard let invalidate = invalidates else {
            return true
        }
        
        return date < invalidate
    }
    
    var description: String {
        return name == nil ? "" : name!
    }
    
    var location: String? {
        return isValidated() ? locations.first : nil
    }
    
    static func == (a: Bus, b: Bus) -> Bool {
        return (a.available == b.available) && (a.name == b.name)
    }
    
    static func > (a: Bus, b: Bus) -> Bool {
        if a.available && !b.available {
            return false
        } else if !a.available && b.available {
            return true
        } else {
            if a.name == nil {
                return false
            } else if b.name == nil {
                return true
            } else {
                return a.name! > b.name!
            }
        }
    }
    
    static func < (a: Bus, b: Bus) -> Bool {
        if a.available && !b.available {
            return true
        } else if !a.available && b.available {
            return false
        } else {
            if a.name == nil {
                return true
            } else if b.name == nil {
                return false
            } else {
                return a.name! < b.name!
            }
        }
    }
}

class BusManagerStarListener: Equatable {
    let listener: () -> Void
    init(listener closure: @escaping () -> Void) {
        listener = closure
    }
    
    static func == (a: BusManagerStarListener, b: BusManagerStarListener) -> Bool {
        return a === b
    }
}

class BusManager {
    static var shared = BusManager(defaultsKey: "starredBuses")
    
    init(defaultsKey: String?) {
        if let key = defaultsKey {
            starredDefaultsKey = key
            load()
        }
    }
    
    var starredBuses: [Bus] {
        return _starredBuses
    }
    
    var buses = [Bus]() {
        didSet {
            _starredBuses = buses.filter { bus in
                return self.isStarred(bus: bus._id)
            }
        }
    }
    var starredDefaultsKey: String?
    
    private var isStarred = [String: Bool]()
    private var _starredBuses = [Bus]()
    private var starListeners = [String: [BusManagerStarListener]]()
    private var starredBusesChangeListeners = [BusManagerStarListener]()
    
    private func load() {
        if let key = starredDefaultsKey {
            if let dict = UserDefaults.standard.dictionary(forKey: key) as? [String: Bool] {
                isStarred = dict
            }
        }
    }
    
    private func save() {
        if let key = starredDefaultsKey {
            UserDefaults.standard.set(isStarred, forKey: key)
        }
    }
    
    func toggleStar(for bus: String) {
        isStarred[bus] = isStarred[bus] != true
        starListeners[bus]?.forEach { (listener) in
            listener.listener()
        }
        
        if isStarred[bus] == true {
            if let bus = buses.first(where: {aBus in
                return aBus._id == bus
            }) {
                _starredBuses.append(bus)
                _starredBuses.sort() // TODO: Find a more efficient way to do this
                starredBusesChangeListeners.forEach { listener in
                    listener.listener()
                }
            }
        } else {
            if let index = _starredBuses.firstIndex(where: {aBus in
                return aBus._id == bus
            }) {
                _starredBuses.remove(at: index)
                starredBusesChangeListeners.forEach { listener in
                    listener.listener()
                }
            }
        }
        
        save()
    }
    
    func addStarListener(_ listener: BusManagerStarListener, for bus: String) {
        if starListeners[bus] == nil {
            starListeners[bus] = []
        }
        starListeners[bus]!.append(listener)
    }
    
    func removeStarListener(_ listener: BusManagerStarListener, for bus: String) {
        if let index = starListeners[bus]?.firstIndex(of: listener) {
            starListeners[bus]!.remove(at: index)
        }
    }
    
    func addStarredBusesChangeListener(_ listener: BusManagerStarListener) {
        starredBusesChangeListeners.append(listener)
    }
    
    func removeStarredBusesChangeListener(_ listener: BusManagerStarListener) {
        if let index = starredBusesChangeListeners.firstIndex(of: listener) {
            starredBusesChangeListeners.remove(at: index)
        }
    }
    
    func isStarred(bus: String) -> Bool {
        return isStarred[bus] == true
    }
}
