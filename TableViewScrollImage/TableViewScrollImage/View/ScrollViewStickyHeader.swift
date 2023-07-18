//
//  ScrollViewStickyHeader.swift
//  TableViewScrollImage
//
//  Created by Yulya on 17.05.2023.
//

import SwiftUI

struct ScrollViewStickyHeader: View {
    @State var offset: CGFloat = 0
    var body: some View {
        ScrollView{
            LazyVStack(alignment: .leading, spacing: 15, pinnedViews: [.sectionHeaders], content: {
                GeometryReader{reader -> AnyView in
                    let offset = reader.frame(in: .global).minY
                    if -offset >= 0{
                        DispatchQueue.main.async {
                            self.offset = -offset
                        }
                    }
                    return AnyView(
                        Image("Back")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: UIScreen.main.bounds.width, height: 265 + (offset > 0 ? offset : 0))
                            .cornerRadius(2)
                            .offset(y: (offset > 0 ? -offset : 0))
                            .overlay(content: {
                                ZStack(alignment: .bottom) {
                                    LinearGradient(colors: [ .clear, .black.opacity(0.8)], startPoint: .top, endPoint: .bottom)
                                }
                                .zIndex(0)
                            })
                    )
                }
                .frame(height: 250)
                Section(header: HeadView()) {
                    ContentList()
                }
            })
        }
        .scrollIndicators(.never) 
        .overlay(
            Color.black
                .frame(height: UIApplication.shared.windows.first?.safeAreaInsets.top, alignment: .top)
                .ignoresSafeArea(.all, edges: .top)
                .opacity(offset > 250 ? 1 : 0)
            ,alignment: .top
        )
    }
}


@ViewBuilder
func HeadView()->some View{
    VStack(alignment: .leading, spacing: 5) {
        
        Text("MOVIE NAME")
            .font(.title)
            .fontWeight(.bold)
            .foregroundColor(.white)
            
        Text("Description")
            .font(.caption)
            .foregroundColor(.white)

        HStack(spacing: 10) {
            Image(systemName: "star.fill")
                .font(.callout)
                .foregroundColor(.white)
            
            Text("4.8")
                .font(.callout)
                .foregroundColor(.white)
                .padding(5)
            
            Spacer()
            
            Image(systemName: "clock.fill")
                .font(.callout)
                .foregroundColor(.white)
            
            Text("108 min")
                .font(.callout)
                .foregroundColor(.white)
            
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    .zIndex(3)
    .padding(.horizontal)
    .frame(height: 100)
    .background(Color.black)
}


@ViewBuilder
func ContentList()->some View{
    VStack(spacing: 25) {
        
        ForEach(1...100, id: \.self){_ in
            
            HStack(spacing: 12) {
                
                Image("Description")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 55, height: 55)
                    .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                
                VStack(alignment: .leading, spacing: 8) {
                    
                    Text("TITLE")
                        .font(.callout)
                        .fontWeight(.bold)
                        .foregroundColor(.gray)
                    
                    Text("Description text")
                        .fontWeight(.semibold)
                        .font(.caption)
                        .foregroundColor(.gray)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
    }
    .zIndex(2)
}


struct ScrollViewStickyHeader_Previews: PreviewProvider {
    static var previews: some View {
        ScrollViewStickyHeader()
            .preferredColorScheme(.dark)
    }
}
