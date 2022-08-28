//
//  VoivodshipsViewModel.swift
//  wojewodztwa
//
//  Created by Wojciech Babinski on 28/08/2022.
//

import Foundation
import RxSwift
//filtering section. take a filter string, find voivodships matching this criteria and return section

//link to model
let dataFromModel = [SectionOfVoivodships(header: "voivodships", items: Voivodship.data)]

func filteredVoivodships(filter: String)->[SectionOfVoivodships]{
    
    if filter.isEmpty{
        return dataFromModel
    }
    
    return dataFromModel.map(
        {
            SectionOfVoivodships(original: $0, items: $0.items.filter{
                $0.name.range(of: filter, options: .caseInsensitive) != nil
            }
            )
        }
    )
}

