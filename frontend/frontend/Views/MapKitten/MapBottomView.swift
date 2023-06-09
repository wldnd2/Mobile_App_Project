//
//  MapBottomView.swift
//  frontend
//
//  Created by 이정민 on 2023/05/13.
//

import SwiftUI

struct MapBottomView: View {
  
  @Binding var viewModel: GET
  var completion: () -> Void
  @State var showSheet: Bool = false
  @Environment(\.presentationMode) var presentationMode // 추가
  
  var body: some View {
    ZStack{
      CommunityMapView()
      
      VStack(alignment: .leading) {
        Text("길냥이 지도")
          .font(.title)
          .foregroundColor(.black)
          .bold()
          .padding(.leading, 10)
          .padding(.trailing, 220)
      }
      .frame(width: 500, height: 70)
      .background(Color.white)
      .padding(.bottom, 700)
      
      Button {
        showSheet.toggle()
      } label: {
        VStack(){
          Image(systemName: "chevron.up")
            .foregroundColor(.black)
            .bold()
            .padding(.bottom, 120)
        }
        .frame(width: 500, height: 150)
        .background(.white)
        .padding(.top, 720)
        
        
      }
      .navigationTitle("길냥이 지도")
      .halfSheet(showSheet: $showSheet) {
        
        ScrollView() {
          VStack{
            Text("최근 목격된 길냥이")
              .font(.title3)
              .padding(.top, 20)
              .padding(.trailing, 250)
              .padding(.leading, 30)
              .padding(.bottom,10)
              .bold()
            
            ForEach((0..<viewModel.communities.count).reversed(), id: \.self) { index in
                let community = viewModel.communities[index]
                
              MapKittenTabView(myIndex: .constant(index), community: community){
                completion()
              }
                
            }
            
            Text("인기 길냥이")
              .font(.title3)
              .padding(.top, 20)
              .padding(.trailing, 300)
              .padding(.leading, 30)
              .padding(.bottom,10)
              .bold()
            
            ForEach((0..<viewModel.communities.count).reversed(), id: \.self) { index in
                let community = viewModel.communities[index]
                
              MapKittenTabView(myIndex: .constant(index), community: community){
                completion()
              }
               
            }
          }
          .frame(maxWidth: .infinity, alignment: .trailing)
        }
        
      }onEnd: {}
      .onAppear {
        completion()
      }
    }
   
  }
}
  

extension View {
  func halfSheet<SheetView: View>(showSheet: Binding<Bool>, @ViewBuilder sheetView: @escaping ()-> SheetView, onEnd: @escaping()->())->some View{
    
      return self
        .background{
          HalfSheetHelper(sheetView: sheetView(), showSheet: showSheet, onEnd: onEnd)
        }
  }
}


struct HalfSheetHelper<SheetView: View>: UIViewControllerRepresentable{
  
  var sheetView: SheetView
  @Binding var showSheet: Bool
  var onEnd: ()->()
  
  let controller = UIViewController()
  
  func makeCoordinator() -> Coordinator {
    return Coordinator(parent: self)
  }
  
  func makeUIViewController(context: Context) -> UIViewController {
    
    
    controller.view.backgroundColor = .clear
    
    return controller
  
  }
  
  func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
    
    if showSheet{
      
      let sheetController = CustomHostingController(rootView: sheetView)
      sheetController.presentationController?.delegate = context.coordinator
      uiViewController.present(sheetController, animated: true) {
        
        DispatchQueue.main.async {
          self.showSheet.toggle()
        }
        
      }
    }
    
  }
  class Coordinator: NSObject, UISheetPresentationControllerDelegate {
    var parent: HalfSheetHelper
    
    init(parent: HalfSheetHelper) {
        self.parent = parent
    }
    
    func presentationControllerDidDismiss(_ presentationController: UIPresentationController) {
        parent.showSheet = false
        parent.onEnd()
    }
     
}

}



class CustomHostingController<Content: View>: UIHostingController<Content>{
  override func viewDidLoad() {
    if let presentationController = presentationController as?
        UISheetPresentationController{
      presentationController.detents = [
        .medium(),
        .large()
      ]
      
      presentationController.prefersGrabberVisible = true
    }
  }
}


struct MapBottomView_Previews: PreviewProvider {
    static var previews: some View {
      MapBottomView(viewModel: .constant(GET()), completion: {})
    }
}
