//
//  PageItem.swift
//  Onboarding Screen
//
//  Created by Moamen Hassaballah on 23/02/2025.
//

import SwiftUI

struct PageItem: View {
    
    @Binding var selectIndex: Int?
    let boardModel: BoardModel
    let index: Int
    
    @State var scaleEffect: CGFloat = 0.2
    @State var offsetEffect: CGFloat = 200
    @State var opacityEffect: CGFloat = 0.2
    
    var body: some View {
        
        
        VStack{
            Image(boardModel.image)
                .resizable()
                .frame(width: 300, height: 300)
                .scaleEffect(scaleEffect)
                
            
            Spacer()
                .frame(height: 40)
            
            HStack{
                ForEach(0..<3){i in
                    Circle()
                        .fill(Color("app_accent_color"))
                        .frame(width: 10, height: 10)
                        .opacity(selectIndex == i ? 1 : 0.2)
                    
                }
            }
            
            
            Spacer()
                .frame(height: 40)
            
            Text(boardModel.title)
                .multilineTextAlignment(.center)
                .lineLimit(2)
                .font(.title)
                .fontWeight(.bold)
                .frame(maxHeight: 100)
                .offset(y: offsetEffect)
                .opacity(opacityEffect)
            
            Text(boardModel.subtitle)
                .multilineTextAlignment(.center)
                .lineLimit(2)
                .foregroundStyle(.secondary)
                .offset(y: offsetEffect)
                .opacity(opacityEffect)
            
            
            
        }
        .padding()
        .onChange(of: selectIndex!) { oldValue, newValue in
            checkPageSelection(index: newValue)
        }
        .onAppear {
            appearingAnimation()
        }
        
    }
    
    private func checkPageSelection(index: Int){
        if index == self.index {
            appearingAnimation()
        }else {
            resetAnimationValues()
        }
        
    }
    
    private func appearingAnimation(){
        withAnimation(.spring){
            scaleEffect = 1
            offsetEffect = 0
            opacityEffect = 1
        }
    }
    
    private func resetAnimationValues(){
        scaleEffect = 0.2
        offsetEffect = 200
        opacityEffect = 0.2
    }
}

#Preview {
    PageItem(selectIndex: .constant(0), boardModel: BoardModel(title: "Search Food" , subtitle: "Search Food Subtitle", image: "search_food"), index: 0)
}
