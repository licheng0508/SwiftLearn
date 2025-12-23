//
//  CodeView.swift
//  CodeBreaker
//
//  Created by stnts on 2025/12/23.
//

import SwiftUI

struct CodeView<AncillaryView>: View where AncillaryView: View {
    
    let code: Code
    
    @Binding var selection: Int
    
    @ViewBuilder let ancillaryView: () -> AncillaryView
    
    init(code: Code,
         selection: Binding<Int> = .constant(-1),
        @ViewBuilder ancillaryView: @escaping () -> AncillaryView = { EmptyView() }
    ){
        self.code = code
        self._selection = selection
        self.ancillaryView = ancillaryView
    }
    
    var body: some View {
        
        HStack {
            ForEach(code.pegs.indices, id: \.self) { index in
                
                PegView(peg: code.pegs[index])
                    .padding(Selection.border)
                    .background{
                        if selection == index, code.kind == .guess {
                            Selection.shape
                                .foregroundStyle(Selection.color)
                        }
                    }
                    .overlay {
                        Selection.shape
                            .foregroundStyle(code.isHidden ? Color.gray : .clear)
                    }
                    .onTapGesture {
                        if code.kind == .guess {
                            selection = index
                        }
                    }
            }
            Color.clear.aspectRatio(1, contentMode: .fit)
                .overlay {
                    ancillaryView()
                }
        }
    }
}

fileprivate struct Selection {
    static let border: CGFloat = 5
    static let cornerRadius: CGFloat = 10
    static let color: Color = Color.gray(0.85)
    static let shape = RoundedRectangle(cornerRadius: cornerRadius)
}
