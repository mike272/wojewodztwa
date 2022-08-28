//
//  Voivodship.swift
//  wojewodztwa
//
//  Created by Wojciech Babinski on 28/08/2022.
//

import Foundation
import RxSwift
import RxDataSources

struct Voivodship{
    var name:String
    var imageName:String
    
    init(_name:String, _imageName:String ) {
        self.name = _name
        self.imageName = _imageName
    }
    static let data = [
        Voivodship(_name: "Mazowieckie", _imageName: "mazowieckie"),
        Voivodship(_name: "Podlaskie", _imageName: "podlaskie")
    ]
}

//for RxDataSources integration
struct SectionOfVoivodships{
    var header:String
    var items:[Item]
}

extension SectionOfVoivodships:SectionModelType{
    typealias Item = Voivodship
    init(original: SectionOfVoivodships, items: [Item]) {
        self = original
        self.items = items
    }
}
