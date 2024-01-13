//
//  PredictiveLabelView.swift
//  coreML-starter
//

import SwiftUI

struct PredictiveLabelView: View {
    private(set) var labelData: ClassificationObject
    
    var body: some View {
        
        VStack(alignment: .center) {
            Text(labelData.label.capitalized)
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(Color(red: 0.1294, green: 0.5882, blue: 0.9529))
            
        }
    }
}

struct PredictiveLabelView_Previews: PreviewProvider {
    static var previews: some View {
        PredictiveLabelView(labelData: ClassificationObject())
    }
}
