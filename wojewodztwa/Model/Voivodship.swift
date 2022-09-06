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
        Voivodship(_name: "Podlaskie", _imageName: "podlaskie"),
        Voivodship(_name: "Kujawsko-Pomorskie", _imageName: "kujawsko-pomorskie"),
        Voivodship(_name: "Lubuskie", _imageName: "lubuskie"),
        Voivodship(_name: "Małopolska", _imageName: "malopolska"),
        Voivodship(_name: "Opolskie", _imageName: "opolskie"),
        Voivodship(_name: "Podkarpackie", _imageName: "podkarpackie"),
        Voivodship(_name: "Śląskie", _imageName: "slaskie"),
        Voivodship(_name: "Warmińsko-Mazurskie", _imageName: "warminsko-mazurskie"),
        Voivodship(_name: "Wielkopolskie", _imageName: "wielkopolska"),

        
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
