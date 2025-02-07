//
//  ListCurrency.swift
//  learningSwiftUI
//
//  Created by Abdulgafur Demirci on 7.02.2025.
//

import SwiftUI

struct ListCurrency: View {
    
    var listOfCurrencies: [String] = ["USD", "GBP", "TRY"]
    @State var listOfCurrenciesRates: [String: Any] = [:]
    
    var body: some View {
        VStack {
            Text("Current Currencies")
            List(listOfCurrencies, id: \.self) { currency in
                CurrencyView(selectedCurrency: currency, rates: $listOfCurrenciesRates)
            }
            Button(action: {
                getCurrencies { rates in
                    if let rates = rates {
                        listOfCurrenciesRates = rates
                    }
                }
            }, label: { Text("Get Rates") })
        }
    }
}

func getCurrencies(completion: @escaping ([String: Any]?) -> Void) {
    let url = URL(string: "https://data.fixer.io/api/latest?access_key=4a990ae1cc0ef5a920e4c7e9eeb1123c")!
    let session = URLSession.shared
    let task = session.dataTask(with: url) { data, response, error in
        if let error = error {
            print("Error: \(error)")
        }
        
        if let data = data  {
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: [.mutableContainers]) as! [String: Any]
                let rates = json["rates"] as! [String: Any]
                print(json)
                
                completion(rates)
            } catch {
                print(error)
            }
        }
    }
    
    task.resume()
}

struct CurrencyView : View {
    
    @State var selectedCurrency: String
    @Binding var rates: [String: Any]
    
    var body: some View {
        HStack {
            Text("1 EUR Equals: ")
            Spacer()
            Text("\(rates[selectedCurrency] ?? "") \(selectedCurrency)")
        }
    }
    
}

#Preview {
    ListCurrency()
}
