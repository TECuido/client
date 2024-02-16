//
//  PredictiveLabelView.swift
//  coreML-starter
//

import SwiftUI

struct PredictiveLabelView: View {
    private(set) var labelData: ClassificationObject
    
    var body: some View {
        
        VStack(alignment: .center) {
            Title(text: labelData.label.capitalized)
        }
    }
}

struct PredictiveLabelView_Previews: PreviewProvider {
    static var previews: some View {
        PredictiveLabelView(labelData: ClassificationObject())
    }
}
