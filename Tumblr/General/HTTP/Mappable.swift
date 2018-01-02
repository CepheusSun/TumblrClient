//
//  Mapple.swift
//  Tumblr
//
//  Created by sunny on 2018/1/2.
//  Copyright © 2018年 CepheusSun. All rights reserved.
//

import Foundation
import SwiftyJSON

final class Mappable {
    static func mapResponseToModel<T: Codable>(_ res: [AnyHashable: Any], to modelType: T.Type, with path: String?) throws -> T {
        do {
            var json = try Mappable.mapJSON(res)
            path?.components(separatedBy: ".").forEach { json = json[$0] }
            let decoder = JSONDecoder()
            let data = try json.rawData()
            let object = try decoder.decode(T.self, from: data)
            return object
        } catch {
            throw NSError(domain: "数据解析错误", code: -0001, userInfo: nil)
        }
    }
    
    static func mapResponseToArray<T: Codable>(_ res: [AnyHashable: Any], to modelType: T.Type, with path: String?) throws -> [T] {
        
        do {
            var json = try Mappable.mapJSON(res)
            path?.components(separatedBy: ".").forEach { json = json[$0] }
            let decoder = JSONDecoder()
            let data = try json.rawData()
            let object = try decoder.decode([T].self, from: data)
            return object
        } catch {
            throw NSError(domain: "数据解析错误", code: -0001, userInfo: nil)
        }
    }
    
    
    fileprivate static func mapJSON(_ res: [AnyHashable: Any]) throws -> JSON {
        
        guard let data = try? JSONSerialization.data(withJSONObject: res, options: []) else {
            throw NSError(domain: "数据解析错误", code: -0001, userInfo: nil)
        }
        
        do {
            let json = try JSON(data: data,
                                options:[
                                    JSONSerialization.ReadingOptions.allowFragments,
                                    JSONSerialization.ReadingOptions.mutableLeaves]
            )
            return json
        } catch {
            throw NSError(domain: "数据解析错误", code: -0001, userInfo: nil)
        }
    }
    
}
