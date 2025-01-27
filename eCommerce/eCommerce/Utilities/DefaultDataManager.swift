//
//  DefaultDataManager.swift
//  eCommerce
//
//  Created by Abdulgafur Demirci on 26.01.2025.
//

import Foundation
import SwiftData

class DefaultDataManager {
    private var context: ModelContext
    
    init(context: ModelContext) {
        self.context = context
    }
    
    func addDefaultDataIfNeeded() {
        // Daha önce varsayılan verilerin eklenip eklenmediğini kontrol edin
        if UserDefaults.standard.bool(forKey: "didAddDefaultData") {
            return
        }
        
        // Varsayılan kullanıcıları ekle
        for user in DefaultData.users {
            context.insert(user)
        }
        
        // Varsayılan ürünleri ekle
        for product in DefaultData.products {
            context.insert(product)
        }
        
        // Değişiklikleri kaydet
        do {
            try context.save()
            UserDefaults.standard.set(true, forKey: "didAddDefaultData") // Eklendi olarak işaretle
        } catch {
            print("Varsayılan veriler eklenirken hata oluştu: \(error)")
        }
    }
}
