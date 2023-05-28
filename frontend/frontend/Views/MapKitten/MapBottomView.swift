//
//  MapBottomView.swift
//  frontend
//
//  Created by 이정민 on 2023/05/13.
//

import SwiftUI

struct MapBottomView: View {
  
  @State var showSheet: Bool = false
  @StateObject var viewModel = GET()
  @Environment(\.presentationMode) var presentationMode // 추가
   
  
  var body: some View {
    NavigationView{
      Button {
        showSheet.toggle()
      } label: {
        VStack{
          Image(systemName: "chevron.up")
            .foregroundColor(.black)
        }
        .frame(width: 500, height: 50)
        .background(.gray)
        
      }
      .navigationTitle("길냥이 지도")
      .halfSheet(showSheet: $showSheet) {
        //그 반짝 뷰에 들어갈 내용
        ScrollView() {
          VStack{
            
            Text("최근 목격된 길냥이")
              .font(.title3)
              .padding(.top, 20)
              .padding(.trailing, 250)
              .padding(.leading, 30)
              .padding(.bottom,10)
              .bold()
            
           /* ForEach(viewModel.boards, id: \.self) { board in
              MapKittenTabView(boardex: board)
            }
            */
            
            //MapKittenTabView(boardex: boardex1)
            
            
            Text("인기 길냥이")
              .font(.title3)
              .padding(.top, 20)
              .padding(.trailing, 300)
              .padding(.leading, 30)
              .padding(.bottom,10)
              .bold()
            /*
            ForEach(viewModel.boards, id: \.self) { board in
              MapKittenTabView(boardex: board)
            }
            //MapKittenTabView(boardex: boardex1)
            */
            
          }// V
          .frame(maxWidth: .infinity, alignment: .trailing)
          
        }
        .ignoresSafeArea()
      } onEnd: {
        print("Dismissed")
        presentationMode.wrappedValue.dismiss()
      }
    }
    .onAppear{
      viewModel.feedFetch(kind: "map")//수정!!!
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
    /*
    func presentationControllerDidDismiss(_ presentationController: UIPresentationController) {
        parent.showSheet = false
        parent.onEnd()
    }
     */
}

}

class CustomHostingController<Content: View>: UIHostingController<Content> {
    override func viewDidLoad() {
        super.viewDidLoad()

        if let presentationController = presentationController as? UISheetPresentationController {
            presentationController.detents = [
                .medium(),
                .large()
            ]

            presentationController.prefersGrabberVisible = true
        }
    }
}


/*
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
}*/


struct MapBottomView_Previews: PreviewProvider {
    static var previews: some View {
        MapBottomView()
    }
}
