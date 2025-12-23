//
//  MatchMarkers.swift
//  CodeBreaker
//
//  Created by stnts on 2025/12/18.
//

import  SwiftUI

enum Match {
    case nomatch
    case exact
    case inexact
}

struct MatchMarkers: View {
    
    var matches: [Match]
    
    var body: some View {
        
        HStack {
            VStack{
                matchMarket(peg: 0)
                matchMarket(peg: 1)
            }
            VStack{
                matchMarket(peg: 2)
                matchMarket(peg: 3)
            }
        }
    }
    
    func matchMarket(peg: Int) -> some View {
        let exactCount = matches.count { $0 == .exact }
        let foundCount = matches.count { $0 != .nomatch }
        return Circle()
            .fill(exactCount > peg ? Color.primary : Color.clear)
            .strokeBorder(foundCount > peg ? Color.primary : Color.clear, lineWidth: 2)
            .aspectRatio(1, contentMode: .fit)
    }
    
}

#Preview {
    MatchMarkers(matches: [.exact, .inexact, .nomatch])
}
