//

//  EventApp
//
//  Created by Abdussalam Abdurakhimov on 07.05.2024.
//

import SwiftUI

struct EventDetailView: View {
    let event: Event
    @State private var isBookmarked = false
    @State private var myEvents: [Event] = []
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                Image("event_placeholder") // Замените "event_placeholder" на имя вашей фотографии мероприятия
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: 50)
                    .padding(.bottom, 20)
                
                Text(event.title)
                    .font(.title)
                
                Text("Дата: \(event.date)")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                
                Text("Время: 20:00")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                
                Text("Локация: Центральный стадион")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                
                Text("Доступные места: \(100)")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                
                Text("Описание:")
                    .font(.headline)
                
                Text("Крупный концерт группы Imagine Dragons. Вас ждут незабываемые эмоции и уникальное звуковое шоу!")
                    .font(.body)
                    .foregroundColor(.black)
                
                Spacer()
                
                Button(action: {
                    if !isBookmarked {
                        myEvents.append(event)
                        isBookmarked = true
                    }
                }) {
                    Text("Забронировать место")
                        .fontWeight(.bold)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .foregroundColor(.white)
                        .background(Color.blue)
                        .cornerRadius(10)
                }

                Button(action: {
                    // Действие по добавлению напоминания в календарь
                }) {
                    Text("Добавить напоминание в календарь")
                        .fontWeight(.bold)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .foregroundColor(.white)
                        .background(Color.green)
                        .cornerRadius(10)
                }
                
                Spacer()
            }
            .padding()
        }
        .navigationBarTitle("Детали мероприятия", displayMode: .inline)
    }
}


//struct EventDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        EventDetailView(event: Event(
//            
//            title: "Концерт Imagine Dragons",
//            date: "20 мая 2024"
////                        time: "19:00",
////                        location: "Московский стадион",
////                        availableSeats: 1000,
////                        description: "Крупный концерт группы Imagine Dragons. Вас ждут незабываемые эмоции и уникальное звуковое шоу!"
//        ))
//    }
//}

