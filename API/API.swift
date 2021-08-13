// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public final class GetSchoolsQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query GetSchools {
      schools {
        __typename
        id
        name
        readable
      }
    }
    """

  public let operationName: String = "GetSchools"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("schools", type: .nonNull(.list(.nonNull(.object(School.selections))))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(schools: [School]) {
      self.init(unsafeResultMap: ["__typename": "Query", "schools": schools.map { (value: School) -> ResultMap in value.resultMap }])
    }

    public var schools: [School] {
      get {
        return (resultMap["schools"] as! [ResultMap]).map { (value: ResultMap) -> School in School(unsafeResultMap: value) }
      }
      set {
        resultMap.updateValue(newValue.map { (value: School) -> ResultMap in value.resultMap }, forKey: "schools")
      }
    }

    public struct School: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["RedactedSchool"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("name", type: .scalar(String.self)),
          GraphQLField("readable", type: .nonNull(.scalar(Bool.self))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID, name: String? = nil, readable: Bool) {
        self.init(unsafeResultMap: ["__typename": "RedactedSchool", "id": id, "name": name, "readable": readable])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return resultMap["id"]! as! GraphQLID
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      public var name: String? {
        get {
          return resultMap["name"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "name")
        }
      }

      public var readable: Bool {
        get {
          return resultMap["readable"]! as! Bool
        }
        set {
          resultMap.updateValue(newValue, forKey: "readable")
        }
      }
    }
  }
}

public final class GetBusesQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query GetBuses($schoolID: ID!) {
      school(id: $schoolID) {
        __typename
        name
        buses {
          __typename
          id
          name
          available
          boardingArea
          invalidateTime
        }
        alerts {
          __typename
          id
          start
          end
          title
          type {
            __typename
            name
            color {
              __typename
              r
              g
              b
            }
          }
          dismissable
        }
        mappingData {
          __typename
          boundingBoxA {
            __typename
            lat
            long
          }
          boundingBoxB {
            __typename
            lat
            long
          }
          boardingAreas {
            __typename
            name
            location {
              __typename
              lat
              long
            }
          }
        }
      }
    }
    """

  public let operationName: String = "GetBuses"

  public var schoolID: GraphQLID

  public init(schoolID: GraphQLID) {
    self.schoolID = schoolID
  }

  public var variables: GraphQLMap? {
    return ["schoolID": schoolID]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("school", arguments: ["id": GraphQLVariable("schoolID")], type: .object(School.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(school: School? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "school": school.flatMap { (value: School) -> ResultMap in value.resultMap }])
    }

    public var school: School? {
      get {
        return (resultMap["school"] as? ResultMap).flatMap { School(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "school")
      }
    }

    public struct School: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["School"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("name", type: .scalar(String.self)),
          GraphQLField("buses", type: .nonNull(.list(.nonNull(.object(Bus.selections))))),
          GraphQLField("alerts", type: .nonNull(.list(.nonNull(.object(Alert.selections))))),
          GraphQLField("mappingData", type: .object(MappingDatum.selections)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(name: String? = nil, buses: [Bus], alerts: [Alert], mappingData: MappingDatum? = nil) {
        self.init(unsafeResultMap: ["__typename": "School", "name": name, "buses": buses.map { (value: Bus) -> ResultMap in value.resultMap }, "alerts": alerts.map { (value: Alert) -> ResultMap in value.resultMap }, "mappingData": mappingData.flatMap { (value: MappingDatum) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var name: String? {
        get {
          return resultMap["name"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "name")
        }
      }

      public var buses: [Bus] {
        get {
          return (resultMap["buses"] as! [ResultMap]).map { (value: ResultMap) -> Bus in Bus(unsafeResultMap: value) }
        }
        set {
          resultMap.updateValue(newValue.map { (value: Bus) -> ResultMap in value.resultMap }, forKey: "buses")
        }
      }

      public var alerts: [Alert] {
        get {
          return (resultMap["alerts"] as! [ResultMap]).map { (value: ResultMap) -> Alert in Alert(unsafeResultMap: value) }
        }
        set {
          resultMap.updateValue(newValue.map { (value: Alert) -> ResultMap in value.resultMap }, forKey: "alerts")
        }
      }

      public var mappingData: MappingDatum? {
        get {
          return (resultMap["mappingData"] as? ResultMap).flatMap { MappingDatum(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "mappingData")
        }
      }

      public struct Bus: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Bus"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
            GraphQLField("name", type: .scalar(String.self)),
            GraphQLField("available", type: .nonNull(.scalar(Bool.self))),
            GraphQLField("boardingArea", type: .scalar(String.self)),
            GraphQLField("invalidateTime", type: .scalar(String.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID, name: String? = nil, available: Bool, boardingArea: String? = nil, invalidateTime: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "Bus", "id": id, "name": name, "available": available, "boardingArea": boardingArea, "invalidateTime": invalidateTime])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: GraphQLID {
          get {
            return resultMap["id"]! as! GraphQLID
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }

        public var name: String? {
          get {
            return resultMap["name"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "name")
          }
        }

        public var available: Bool {
          get {
            return resultMap["available"]! as! Bool
          }
          set {
            resultMap.updateValue(newValue, forKey: "available")
          }
        }

        public var boardingArea: String? {
          get {
            return resultMap["boardingArea"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "boardingArea")
          }
        }

        public var invalidateTime: String? {
          get {
            return resultMap["invalidateTime"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "invalidateTime")
          }
        }
      }

      public struct Alert: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Alert"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
            GraphQLField("start", type: .nonNull(.scalar(String.self))),
            GraphQLField("end", type: .nonNull(.scalar(String.self))),
            GraphQLField("title", type: .nonNull(.scalar(String.self))),
            GraphQLField("type", type: .object(`Type`.selections)),
            GraphQLField("dismissable", type: .nonNull(.scalar(Bool.self))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID, start: String, end: String, title: String, type: `Type`? = nil, dismissable: Bool) {
          self.init(unsafeResultMap: ["__typename": "Alert", "id": id, "start": start, "end": end, "title": title, "type": type.flatMap { (value: `Type`) -> ResultMap in value.resultMap }, "dismissable": dismissable])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: GraphQLID {
          get {
            return resultMap["id"]! as! GraphQLID
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }

        public var start: String {
          get {
            return resultMap["start"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "start")
          }
        }

        public var end: String {
          get {
            return resultMap["end"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "end")
          }
        }

        public var title: String {
          get {
            return resultMap["title"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "title")
          }
        }

        public var type: `Type`? {
          get {
            return (resultMap["type"] as? ResultMap).flatMap { `Type`(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "type")
          }
        }

        public var dismissable: Bool {
          get {
            return resultMap["dismissable"]! as! Bool
          }
          set {
            resultMap.updateValue(newValue, forKey: "dismissable")
          }
        }

        public struct `Type`: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["AlertType"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("name", type: .scalar(String.self)),
              GraphQLField("color", type: .object(Color.selections)),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(name: String? = nil, color: Color? = nil) {
            self.init(unsafeResultMap: ["__typename": "AlertType", "name": name, "color": color.flatMap { (value: Color) -> ResultMap in value.resultMap }])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var name: String? {
            get {
              return resultMap["name"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "name")
            }
          }

          public var color: Color? {
            get {
              return (resultMap["color"] as? ResultMap).flatMap { Color(unsafeResultMap: $0) }
            }
            set {
              resultMap.updateValue(newValue?.resultMap, forKey: "color")
            }
          }

          public struct Color: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["AlertColor"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("r", type: .nonNull(.scalar(Int.self))),
                GraphQLField("g", type: .nonNull(.scalar(Int.self))),
                GraphQLField("b", type: .nonNull(.scalar(Int.self))),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(r: Int, g: Int, b: Int) {
              self.init(unsafeResultMap: ["__typename": "AlertColor", "r": r, "g": g, "b": b])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            public var r: Int {
              get {
                return resultMap["r"]! as! Int
              }
              set {
                resultMap.updateValue(newValue, forKey: "r")
              }
            }

            public var g: Int {
              get {
                return resultMap["g"]! as! Int
              }
              set {
                resultMap.updateValue(newValue, forKey: "g")
              }
            }

            public var b: Int {
              get {
                return resultMap["b"]! as! Int
              }
              set {
                resultMap.updateValue(newValue, forKey: "b")
              }
            }
          }
        }
      }

      public struct MappingDatum: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["MappingData"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("boundingBoxA", type: .nonNull(.object(BoundingBoxA.selections))),
            GraphQLField("boundingBoxB", type: .nonNull(.object(BoundingBoxB.selections))),
            GraphQLField("boardingAreas", type: .nonNull(.list(.nonNull(.object(BoardingArea.selections))))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(boundingBoxA: BoundingBoxA, boundingBoxB: BoundingBoxB, boardingAreas: [BoardingArea]) {
          self.init(unsafeResultMap: ["__typename": "MappingData", "boundingBoxA": boundingBoxA.resultMap, "boundingBoxB": boundingBoxB.resultMap, "boardingAreas": boardingAreas.map { (value: BoardingArea) -> ResultMap in value.resultMap }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var boundingBoxA: BoundingBoxA {
          get {
            return BoundingBoxA(unsafeResultMap: resultMap["boundingBoxA"]! as! ResultMap)
          }
          set {
            resultMap.updateValue(newValue.resultMap, forKey: "boundingBoxA")
          }
        }

        public var boundingBoxB: BoundingBoxB {
          get {
            return BoundingBoxB(unsafeResultMap: resultMap["boundingBoxB"]! as! ResultMap)
          }
          set {
            resultMap.updateValue(newValue.resultMap, forKey: "boundingBoxB")
          }
        }

        public var boardingAreas: [BoardingArea] {
          get {
            return (resultMap["boardingAreas"] as! [ResultMap]).map { (value: ResultMap) -> BoardingArea in BoardingArea(unsafeResultMap: value) }
          }
          set {
            resultMap.updateValue(newValue.map { (value: BoardingArea) -> ResultMap in value.resultMap }, forKey: "boardingAreas")
          }
        }

        public struct BoundingBoxA: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["Location"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("lat", type: .nonNull(.scalar(Double.self))),
              GraphQLField("long", type: .nonNull(.scalar(Double.self))),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(lat: Double, long: Double) {
            self.init(unsafeResultMap: ["__typename": "Location", "lat": lat, "long": long])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var lat: Double {
            get {
              return resultMap["lat"]! as! Double
            }
            set {
              resultMap.updateValue(newValue, forKey: "lat")
            }
          }

          public var long: Double {
            get {
              return resultMap["long"]! as! Double
            }
            set {
              resultMap.updateValue(newValue, forKey: "long")
            }
          }
        }

        public struct BoundingBoxB: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["Location"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("lat", type: .nonNull(.scalar(Double.self))),
              GraphQLField("long", type: .nonNull(.scalar(Double.self))),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(lat: Double, long: Double) {
            self.init(unsafeResultMap: ["__typename": "Location", "lat": lat, "long": long])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var lat: Double {
            get {
              return resultMap["lat"]! as! Double
            }
            set {
              resultMap.updateValue(newValue, forKey: "lat")
            }
          }

          public var long: Double {
            get {
              return resultMap["long"]! as! Double
            }
            set {
              resultMap.updateValue(newValue, forKey: "long")
            }
          }
        }

        public struct BoardingArea: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["BoardingArea"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("name", type: .nonNull(.scalar(String.self))),
              GraphQLField("location", type: .nonNull(.object(Location.selections))),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(name: String, location: Location) {
            self.init(unsafeResultMap: ["__typename": "BoardingArea", "name": name, "location": location.resultMap])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var name: String {
            get {
              return resultMap["name"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "name")
            }
          }

          public var location: Location {
            get {
              return Location(unsafeResultMap: resultMap["location"]! as! ResultMap)
            }
            set {
              resultMap.updateValue(newValue.resultMap, forKey: "location")
            }
          }

          public struct Location: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["Location"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("lat", type: .nonNull(.scalar(Double.self))),
                GraphQLField("long", type: .nonNull(.scalar(Double.self))),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(lat: Double, long: Double) {
              self.init(unsafeResultMap: ["__typename": "Location", "lat": lat, "long": long])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            public var lat: Double {
              get {
                return resultMap["lat"]! as! Double
              }
              set {
                resultMap.updateValue(newValue, forKey: "lat")
              }
            }

            public var long: Double {
              get {
                return resultMap["long"]! as! Double
              }
              set {
                resultMap.updateValue(newValue, forKey: "long")
              }
            }
          }
        }
      }
    }
  }
}
