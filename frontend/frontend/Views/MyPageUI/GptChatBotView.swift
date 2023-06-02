//
//  GptChatBotView.swift
//  frontend
//
//  Created by 전지웅 on 2023/06/02.
//

import SwiftUI
import OpenAISwift

final class ViewModel: ObservableObject {
  init(){}
  private var client: OpenAISwift?
  
  func setup(){
    client = OpenAISwift(authToken:"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")
  }
  
  func send(text: String, completion: @escaping (String) -> Void){
    client?.sendCompletion(with: text,
                           maxTokens: 500,
                           completionHandler: { result in
      switch result{
      case.success(let model):
        let output = model.choices?.first?.text ?? ""
        completion(output)
      case.failure:
        break
      }
    })
  }
}

struct GptChatBotView: View {
  @ObservedObject var viewModel = ViewModel()
  @State var text = ""
  @State var models = [String]()
  
  var body: some View {
    VStack{
      HStack{
        Text("Chat GPT")
          .font(.largeTitle)
          .bold()
        Image(systemName: "bubble.left.fill")
          .font(.system(size: 26))
          .foregroundColor(Color.blue)
      }
      
      ScrollView{
        ForEach(models, id: \.self) { string in
          if string.contains("Me:"){
            let newMessage = string.replacingOccurrences(of: "Me:", with: "")
            HStack{
              Spacer()
              Text(newMessage)
                .padding()
                .foregroundColor(.white)
                .background(.blue.opacity(0.8))
                .cornerRadius(10)
                .padding(.horizontal, 16)
                .padding(.bottom, 10)
            }
          }else{
            let newMessage = string.replacingOccurrences(of: "Chat gpt:", with: "")
            HStack{
              Spacer()
              Text(newMessage)
                .padding()
                .background(.gray.opacity(0.15))
                .cornerRadius(10)
                .padding(.horizontal, 16)
                .padding(.bottom, 10)
              Spacer()
              Spacer()
            }
          }
          
        }.rotationEffect(.degrees(180))
      }.rotationEffect(.degrees(180))
      
      HStack{
        TextField("여러분의 궁금증을 물어보세요!", text: $text)
          .padding()
          .background(Color.gray.opacity(0.1))
          .cornerRadius(10)
        Button{
          send()
        }label: {
          Image(systemName: "paperplane.fill")
        }
        .font(.system(size: 26))
        .padding(.horizontal, 10)
      }
      .padding()
    }
    .onAppear{
      viewModel.setup()
    }
  }
  
  func send(){
    guard !text.trimmingCharacters(in: .whitespaces).isEmpty else {return}
    models.append("Me: \(text)")
    viewModel.send(text: "너는 고양이 챗봇이야. " + text + " 무조건 모든 답변은 100자내로 한다."){ response in
      DispatchQueue.main.async {
        self.text = ""
        self.models.append("Chat gpt: " + response.trimmingCharacters(in: .whitespacesAndNewlines))
      }
    }
  }
}

struct GptChatBotView_Previews: PreviewProvider {
  static var previews: some View {
    GptChatBotView()
  }
}

