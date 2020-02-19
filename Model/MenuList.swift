//
//  MenuList.swift
//  onTheGo
//
//  Created by Norman Buruchara on 11/12/19.
//  Copyright © 2019 Norman B. All rights reserved.
//

import Foundation

class menuList {
    var items = [menuItem]()
    
    
    init () {
                                                    /* * * * Condiments & Extras * * * */
            // Breakfast
        
        let nine_grain_bread = menuItem(mName: "Nine-grain Bread", mPrice: 0.00, mSection: "condim_ext", mCategory: "Breakfast", mCategory_2: "Deli Sandwich", mCategory_3: "None")
        items.append(nine_grain_bread)
        
        let rye_bread = menuItem(mName: "Rye Bread", mPrice: 0.00, mSection: "condim_ext", mCategory: "Breakfast", mCategory_2: "Deli Sandwich", mCategory_3: "None")
        items.append(rye_bread)
        
        let whole_wheat_bread = menuItem(mName: "Whole Wheat Bread", mPrice: 0.00, mSection: "condim_ext", mCategory: "Breakfast", mCategory_2: "Deli Sandwich", mCategory_3: "None")
        items.append(whole_wheat_bread)
        
        let whole_wheat_english_muffin = menuItem(mName: "Whole Wheat English Muffin", mPrice: 0.00, mSection: "condim_ext", mCategory: "Breakfast", mCategory_2: "None", mCategory_3: "None")
        items.append(whole_wheat_english_muffin)
        
        let sourdough_bread = menuItem(mName: "Sourdough Bread", mPrice: 0.00, mSection: "condim_ext", mCategory: "Breakfast", mCategory_2: "Deli Sandwich", mCategory_3: "None")
        items.append(sourdough_bread)
        
        let white_english_muffin = menuItem(mName: "White English Muffin", mPrice: 0.00, mSection: "condim_ext", mCategory: "Breakfast", mCategory_2: "None", mCategory_3: "None")
        items.append(white_english_muffin)
        
        let whole_wheat_bagel = menuItem(mName: "Whole Wheat Bagel", mPrice: 0.00, mSection: "condim_ext", mCategory: "Breakfast", mCategory_2: "None", mCategory_3: "None")
        items.append(whole_wheat_bagel)
        
        let white_bagel = menuItem(mName: "White Bagel", mPrice: 0.00, mSection: "condim_ext", mCategory: "Breakfast", mCategory_2: "None", mCategory_3: "None")
        items.append(white_bagel)
        
        let cinnamon_rainsin_bagel = menuItem(mName: "Cinnamon Raisin Bagel", mPrice: 0.00, mSection: "condim_ext", mCategory: "Breakfast", mCategory_2: "None", mCategory_3: "None")
        items.append(cinnamon_rainsin_bagel)
        
        let peanut_butter = menuItem(mName: "Peanut Butter", mPrice: 0.00, mSection: "condim_ext", mCategory: "Breakfast", mCategory_2: "None", mCategory_3: "None")
        items.append(peanut_butter)
        
        let cream_cheese = menuItem(mName: "Cream Cheese", mPrice: 0.00, mSection: "condim_ext", mCategory: "Breakfast", mCategory_2: "None", mCategory_3: "None")
        items.append(cream_cheese)
        
        let jelly = menuItem(mName: "Jelly", mPrice: 0.00, mSection: "condim_ext", mCategory: "Breakfast", mCategory_2: "None", mCategory_3: "None")
        items.append(jelly)
        
        
        
            // Grab-N-Go Salad
        
        let cucumber_yogurt_dressing = menuItem(mName: "Cucumber Yogurt Dressing", mPrice: 0.00, mSection: "condim_ext", mCategory: "Grab N Go", mCategory_2: "None", mCategory_3: "None")
        items.append(cucumber_yogurt_dressing)
        
        let balsamic_vinaigrette = menuItem(mName: "Balsamic Vinaigrette", mPrice: 0.00, mSection: "condim_ext", mCategory: "Grab N Go", mCategory_2: "Soup & Salad", mCategory_3: "None")
        items.append(balsamic_vinaigrette)
        
        
        
            // Deli Sandwich
        
        let croissant = menuItem(mName: "Croissant", mPrice: 0.00, mSection: "condim_ext", mCategory: "Deli Sandwich", mCategory_2: "None", mCategory_3: "None")
        items.append(croissant)
        
        let kaiser_roll = menuItem(mName: "Kaiser Roll", mPrice: 0.00, mSection: "condim_ext", mCategory: "Deli Sandwich", mCategory_2: "None", mCategory_3: "None")
        items.append(kaiser_roll)
        
        let hoagie_roll = menuItem(mName: "Hoagie Roll", mPrice: 0.00, mSection: "condim_ext", mCategory: "Deli Sandwich", mCategory_2: "None", mCategory_3: "None")
        items.append(hoagie_roll)
        
        let white_pita_6_in = menuItem(mName: "6\" White Pita" , mPrice: 0.00, mSection: "condim_ext", mCategory: "Deli Sandwich", mCategory_2: "None", mCategory_3: "None")
        items.append(white_pita_6_in)
        
        
        
            // Soups & Salads
        
        let champagne_vinaigrette = menuItem(mName: "Champagne Vinaigrette", mPrice: 0.00, mSection: "condim_ext", mCategory: "Soups & Salad", mCategory_2: "None", mCategory_3: "None")
        items.append(champagne_vinaigrette)
        
        let french_dressing = menuItem(mName: "French Dressing", mPrice: 0.00, mSection: "condim_ext", mCategory: "Soups & Salad", mCategory_2: "None", mCategory_3: "None")
        items.append(french_dressing)
        
        let honey_dijon_dressing = menuItem(mName: "Honey Dijon Dressing", mPrice: 0.00, mSection: "condim_ext", mCategory: "Soups & Salad", mCategory_2: "None", mCategory_3: "None")
        items.append(honey_dijon_dressing)
        
        let ceaser_dressing = menuItem(mName: "Ceaser Dressing", mPrice: 0.00, mSection: "condim_ext", mCategory: "Soups & Salad", mCategory_2: "None", mCategory_3: "None")
        items.append(ceaser_dressing)
        
        let ranch_buttermilk_dressing = menuItem(mName: "Ranch Buttermilk Dressing", mPrice: 0.00, mSection: "condim_ext", mCategory: "Soups & Salad", mCategory_2: "None", mCategory_3: "None")
        items.append(ranch_buttermilk_dressing)
        
        let blue_cheesse_dressing = menuItem(mName: "Blue Cheese Dressing", mPrice: 0.00, mSection: "condim_ext", mCategory: "Soups & Salad", mCategory_2: "None", mCategory_3: "None")
        items.append(blue_cheesse_dressing)
        
        let thousand_island_dressing = menuItem(mName: "Thousand Island Dressing", mPrice: 0.00, mSection: "condim_ext", mCategory: "Soups & Salad", mCategory_2: "None", mCategory_3: "None")
        items.append(thousand_island_dressing)
        
        
        
            // Burgers & Sandwiches
        
        let lettuce = menuItem(mName: "Lettuce", mPrice: 0.00, mSection: "condim_ext", mCategory: "Burgers & Sandwiches", mCategory_2: "None", mCategory_3: "None")
        items.append(lettuce)
        
        let tomato = menuItem(mName: "Tomato", mPrice: 0.00, mSection: "condim_ext", mCategory: "Burgers & Sandwiches", mCategory_2: "None", mCategory_3: "None")
        items.append(tomato)
        
        let onion = menuItem(mName: "Onion", mPrice: 0.00, mSection: "condim_ext", mCategory: "Burgers & Sandwiches", mCategory_2: "None", mCategory_3: "None")
        items.append(onion)
        
        let pickle = menuItem(mName: "Pickle", mPrice: 0.00, mSection: "condim_ext", mCategory: "Burgers & Sandwiches", mCategory_2: "None", mCategory_3: "None")
        items.append(pickle)
        
        let chicken_breast_ns = menuItem(mName: "Chicken Breast (no salt)", mPrice: 0.00, mSection: "condim_ext", mCategory: "Burgers & Sandwiches", mCategory_2: "None", mCategory_3: "None")
        items.append(chicken_breast_ns)
        
        let chicken_breast_s = menuItem(mName: "Chicken Breast (salt)", mPrice: 0.00, mSection: "condim_ext", mCategory: "Burgers & Sandwiches", mCategory_2: "None", mCategory_3: "None")
        items.append(chicken_breast_s)
        
        let turkey_breast = menuItem(mName: "Turkey Breast", mPrice: 0.00, mSection: "condim_ext", mCategory: "Burgers & Sandwiches", mCategory_2: "None", mCategory_3: "None")
        items.append(turkey_breast)
        
        let bacon = menuItem(mName: "Bacon", mPrice: 0.00, mSection: "condim_ext", mCategory: "Burgers & Sandwiches", mCategory_2: "None", mCategory_3: "None")
        items.append(bacon)
        
        let roast_beef = menuItem(mName: "Roast Beef", mPrice: 0.00, mSection: "condim_ext", mCategory: "Burgers & Sandwiches", mCategory_2: "None", mCategory_3: "None")
        items.append(roast_beef)
        
        let pit_ham = menuItem(mName: "Pit Ham", mPrice: 0.00, mSection: "condim_ext", mCategory: "Burgers & Sandwiches", mCategory_2: "None", mCategory_3: "None")
        items.append(pit_ham)
        
        
        
            // Drink of the month
        
        let chai_latte_2m_12 = menuItem(mName: "Chai Latte (2%) 12 Fl Oz", mPrice: 0.00, mSection: "condim_ext", mCategory: "Drink of The Month", mCategory_2: "None", mCategory_3: "None")
        items.append(chai_latte_2m_12)
        
        let chai_latte_2m_16 = menuItem(mName: "Chai Latte (2%) 16 Fl Oz", mPrice: 0.00, mSection: "condim_ext", mCategory: "Drink of The Month", mCategory_2: "None", mCategory_3: "None")
        items.append(chai_latte_2m_16)
        
        let chai_latte_1m_12 = menuItem(mName: "Chai Latte (1%) 12 Fl Oz", mPrice: 0.00, mSection: "condim_ext", mCategory: "Drink of The Month", mCategory_2: "None", mCategory_3: "None")
        items.append(chai_latte_1m_12)
        
        let chai_latte_1m_16 = menuItem(mName: "Chai Latte (1%) 16 Fl Oz", mPrice: 0.00, mSection: "condim_ext", mCategory: "Drink of The Month", mCategory_2: "None", mCategory_3: "None")
        items.append(chai_latte_1m_16)
        
        let chai_latte_esp_1m_12 = menuItem(mName: "Chai Latte Espresso (1%) 12 Fl Oz", mPrice: 0.00, mSection: "condim_ext", mCategory: "Drink of The Month", mCategory_2: "None", mCategory_3: "None")
        items.append(chai_latte_esp_1m_12)
        
        let chai_latte_esp_1m_16 = menuItem(mName: "Chai Latte Espresso (1%) 16 Fl Oz", mPrice: 0.00, mSection: "condim_ext", mCategory: "Drink of The Month", mCategory_2: "None", mCategory_3: "None")
        items.append(chai_latte_esp_1m_16)
        
        let chai_latte_esp_2m_12 = menuItem(mName: "Chai Latte Espresso (2%) 12 Fl Oz", mPrice: 0.00, mSection: "condim_ext", mCategory: "Drink of The Month", mCategory_2: "None", mCategory_3: "None")
        items.append(chai_latte_esp_2m_12)
        
        let chai_latte_esp_2m_16 = menuItem(mName: "Chai Latte Espresso (2%) 12 Fl Oz", mPrice: 0.00, mSection: "condim_ext", mCategory: "Drink of The Month", mCategory_2: "None", mCategory_3: "None")
        items.append(chai_latte_esp_2m_16)
        
        let caffe_latte_2m_12 = menuItem(mName: "Caffe Latte (2%) 12 Fl Oz", mPrice: 0.00, mSection: "condim_ext", mCategory: "Drink of The Month", mCategory_2: "None", mCategory_3: "None")
        items.append(caffe_latte_2m_12)
        
        let caffe_latte_2m_16 = menuItem(mName: "Caffe Latte (2%) 16 Fl Oz", mPrice: 0.00, mSection: "condim_ext", mCategory: "Drink of The Month", mCategory_2: "None", mCategory_3: "None")
        items.append(caffe_latte_2m_16)
        
        let caffe_mocha_2m_12 = menuItem(mName: "Caffe Mocha (2%) 12 Fl Oz", mPrice: 0.00, mSection: "condim_ext", mCategory: "Drink of The Month", mCategory_2: "None", mCategory_3: "None")
        items.append(caffe_mocha_2m_12)
        
        let cappucino_2m_12 = menuItem(mName: "Cappucino (2%) 12 Fl Oz", mPrice: 0.00, mSection: "condim_ext", mCategory: "Drink of The Month", mCategory_2: "None", mCategory_3: "None")
        items.append(cappucino_2m_12)
        
        let cappucino_2m_16 = menuItem(mName: "Cappucino (2%) 16 Fl Oz", mPrice: 0.00, mSection: "condim_ext", mCategory: "Drink of The Month", mCategory_2: "None", mCategory_3: "None")
        items.append(cappucino_2m_16)
        
        let cappucino_skim_12 = menuItem(mName: "Cappucino Skim 12 Fl Oz", mPrice: 0.00, mSection: "condim_ext", mCategory: "Drink of The Month", mCategory_2: "None", mCategory_3: "None")
        items.append(cappucino_skim_12)
        
        let cappucino_skim_16 = menuItem(mName: "Cappucino Skim 16 Fl Oz", mPrice: 0.00, mSection: "condim_ext", mCategory: "Drink of The Month", mCategory_2: "None", mCategory_3: "None")
        items.append(cappucino_skim_16)
        
        let caffe_latte_skim_12 = menuItem(mName: "Caffe Latte Skim 12 Fl Oz", mPrice: 0.00, mSection: "condim_ext", mCategory: "Drink of The Month", mCategory_2: "None", mCategory_3: "None")
        items.append(caffe_latte_skim_12)
        
        let caffe_latte_skim_16 = menuItem(mName: "Caffe Latte Skim 16 Fl Oz", mPrice: 0.00, mSection: "condim_ext", mCategory: "Drink of The Month", mCategory_2: "None", mCategory_3: "None")
        items.append(caffe_latte_skim_16)
        
        let frappe_coffee_builder = menuItem(mName: "Frappe/Coffee Builder", mPrice: 0.00, mSection: "condim_ext", mCategory: "Drink of The Month", mCategory_2: "None", mCategory_3: "None")
        items.append(frappe_coffee_builder)
        
        let hot_choc_2m_12 = menuItem(mName: "Hot Chocolate (2%) 12 Fl Oz", mPrice: 0.00, mSection: "condim_ext", mCategory: "Drink of The Month", mCategory_2: "None", mCategory_3: "None")
        items.append(hot_choc_2m_12)
        
        let hot_choc_2m_16 = menuItem(mName: "Hot Chocolate (2%) 16 Fl Oz", mPrice: 0.00, mSection: "condim_ext", mCategory: "Drink of The Month", mCategory_2: "None", mCategory_3: "None")
        items.append(hot_choc_2m_16)
        
        let hot_choc_1m_12 = menuItem(mName: "Hot Chocolate (1%) 12 Fl Oz", mPrice: 0.00, mSection: "condim_ext", mCategory: "Drink of The Month", mCategory_2: "None", mCategory_3: "None")
        items.append(hot_choc_1m_12)
        
        let hot_choc_1m_16 = menuItem(mName: "Hot Chocolate (1%) 16 Fl Oz", mPrice: 0.00, mSection: "condim_ext", mCategory: "Drink of The Month", mCategory_2: "None", mCategory_3: "None")
        items.append(hot_choc_1m_16)
        
        let hot_choc_whole_12 = menuItem(mName: "Hot Chocolate Whole Milk 12 Fl Oz", mPrice: 0.00, mSection: "condim_ext", mCategory: "Drink of The Month", mCategory_2: "None", mCategory_3: "None")
        items.append(hot_choc_whole_12)
        
        let hot_choc_whole_16 = menuItem(mName: "Hot Chocolate Whole Milk 16 Fl Oz", mPrice: 0.00, mSection: "condim_ext", mCategory: "Drink of The Month", mCategory_2: "None", mCategory_3: "None")
        items.append(hot_choc_whole_16)
        
        let espresso_single = menuItem(mName: "Espresso Single", mPrice: 0.00, mSection: "condim_ext", mCategory: "Drink of The Month", mCategory_2: "None", mCategory_3: "None")
        items.append(espresso_single)
        
        let cafe_americano = menuItem(mName: "Cafe Americano", mPrice: 0.00, mSection: "condim_ext", mCategory: "Drink of The Month", mCategory_2: "None", mCategory_3: "None")
        items.append(cafe_americano)
        
        
        
            // Cold Beverages
        
        let iced_caffe_latte_2m_16 = menuItem(mName: "Iced Caffe Latte (2%) 16 Fl Oz", mPrice: 0.00, mSection: "condim_ext", mCategory: "Cold Beverages", mCategory_2: "None", mCategory_3: "None")
        items.append(iced_caffe_latte_2m_16)
        
        let iced_caffe_latte_2m_20 = menuItem(mName: "Iced Caffe Latte (2%) 20 Fl Oz", mPrice: 0.00, mSection: "condim_ext", mCategory: "Cold Beverages", mCategory_2: "None", mCategory_3: "None")
        items.append(iced_caffe_latte_2m_20)
        
        let iced_caffe_mocha_2m_16 = menuItem(mName: "Iced Caffe Mocha 2% 16 Fl Oz", mPrice: 0.00, mSection: "condim_ext", mCategory: "Cold Beverages", mCategory_2: "None", mCategory_3: "None")
        items.append(iced_caffe_mocha_2m_16)
        
        let iced_caffe_mocha_2m_20 = menuItem(mName: "Iced Caffe Mocha (2%) 20 Fl Oz", mPrice: 0.00, mSection: "condim_ext", mCategory: "Cold Beverages", mCategory_2: "None", mCategory_3: "None")
        items.append(iced_caffe_mocha_2m_20)
        
        let iced_caffe_latte_skim_16 = menuItem(mName: "Iced Caffe Latte Skim 16 Fl Oz", mPrice: 0.00, mSection: "condim_ext", mCategory: "Cold Beverages", mCategory_2: "None", mCategory_3: "None")
        items.append(iced_caffe_latte_skim_16)
        
        let iced_caffe_latte_skim_20 = menuItem(mName: "Iced Caffe Latte Skim 20 Fl Oz", mPrice: 0.00, mSection: "condim_ext", mCategory: "Cold Beverages", mCategory_2: "None", mCategory_3: "None")
        items.append(iced_caffe_latte_skim_20)
        
        let iced_chai_latte_esp_2m_16 = menuItem(mName: "Iced Chai Latte Espresso (2%) 16 Fl Oz", mPrice: 0.00, mSection: "condim_ext", mCategory: "Cold Beverages", mCategory_2: "None", mCategory_3: "None")
        items.append(iced_chai_latte_esp_2m_16)
        
        let iced_chai_latte_esp_2m_20 = menuItem(mName: "Iced Chai Latte Espresso (2%) 20 Fl Oz", mPrice: 0.00, mSection: "condim_ext", mCategory: "Cold Beverages", mCategory_2: "None", mCategory_3: "None")
        items.append(iced_chai_latte_esp_2m_20)
        
        let iced_caffe_americano_16 = menuItem(mName: "Iced Caffe Americano 16 Oz", mPrice: 0.00, mSection: "condim_ext", mCategory: "Cold Beverages", mCategory_2: "None", mCategory_3: "None")
        items.append(iced_caffe_americano_16)
        
        let iced_caffe_americano_20 = menuItem(mName: "Iced Caffe Americano 20 Oz", mPrice: 0.00, mSection: "condim_ext", mCategory: "Cold Beverages", mCategory_2: "None", mCategory_3: "None")
        items.append(iced_caffe_americano_20)
        
        let iced_coffee = menuItem(mName: "Iced Coffee", mPrice: 0.00, mSection: "condim_ext", mCategory: "Cold Beverages", mCategory_2: "None", mCategory_3: "None")
        items.append(iced_coffee)
        
        let dr_pepper = menuItem(mName: "Dr. Pepper", mPrice: 0.00, mSection: "condim_ext", mCategory: "Cold Beverages", mCategory_2: "None", mCategory_3: "None")
        items.append(dr_pepper)
        
        let mountain_dew = menuItem(mName: "Mountain Dew", mPrice: 0.00, mSection: "condim_ext", mCategory: "Cold Beverages", mCategory_2: "None", mCategory_3: "None")
        items.append(mountain_dew)
        
        let pepsi = menuItem(mName: "Pepsi", mPrice: 0.00, mSection: "condim_ext", mCategory: "Cold Beverages", mCategory_2: "None", mCategory_3: "None")
        items.append(pepsi)
        
        let mug_root_beer = menuItem(mName: "Mug Root Beer", mPrice: 0.00, mSection: "condim_ext", mCategory: "Cold Beverages", mCategory_2: "None", mCategory_3: "None")
        items.append(mug_root_beer)
        
        let sierra_mist = menuItem(mName: "Sierra Mist", mPrice: 0.00, mSection: "condim_ext", mCategory: "Cold Beverages", mCategory_2: "None", mCategory_3: "None")
        items.append(sierra_mist)
        
        let diet_pepsi = menuItem(mName: "Diet Pepsi", mPrice: 0.00, mSection: "condim_ext", mCategory: "Cold Beverages", mCategory_2: "None", mCategory_3: "None")
        items.append(diet_pepsi)
        
        let lemonade = menuItem(mName: "Lemonade", mPrice: 0.00, mSection: "condim_ext", mCategory: "Cold Beverages", mCategory_2: "None", mCategory_3: "None")
        items.append(lemonade)
        
        
        
            // Smoothies
        
        let pineapple_smoothie = menuItem(mName: "Pineapple Smoothie", mPrice: 0.00, mSection: "condim_ext", mCategory: "Smoothies", mCategory_2: "None", mCategory_3: "None")
        items.append(pineapple_smoothie)
        
        
        
            // Ice Cream & Milkshakes
        
        let vanilla_shake = menuItem(mName: "Vanilla Milkshake", mPrice: 0.00, mSection: "condim_ext", mCategory: "Ice Cream & Shakes", mCategory_2: "None", mCategory_3: "None")
        items.append(vanilla_shake)
        
        let strawberry_shake = menuItem(mName: "Strawberry Milkshake", mPrice: 0.00, mSection: "condim_ext", mCategory: "Ice Cream & Shakes", mCategory_2: "None", mCategory_3: "None")
        items.append(strawberry_shake)
        
        let chocolate_shake = menuItem(mName: "Chocolate Milkshake", mPrice: 0.00, mSection: "condim_ext", mCategory: "Ice Cream & Shakes", mCategory_2: "None", mCategory_3: "None")
        items.append(chocolate_shake)
        
        
        
            //Sides
        
        let housemade_bbq_v1 = menuItem(mName: "House-made Barbeque Sauce (1)", mPrice: 0.00, mSection: "condim_ext", mCategory: "Sides", mCategory_2: "None", mCategory_3: "None")
        items.append(housemade_bbq_v1)
        
        let housemade_bbq_v2 = menuItem(mName: "House-made Barbeque Sauce (2)", mPrice: 0.00, mSection: "condim_ext", mCategory: "Sides", mCategory_2: "None", mCategory_3: "None")
        items.append(housemade_bbq_v2)
        
        let housemade_bbq_v3 = menuItem(mName: "House-made Barbeque Sauce (3)", mPrice: 0.00, mSection: "condim_ext", mCategory: "Sides", mCategory_2: "None", mCategory_3: "None")
        items.append(housemade_bbq_v3)
        
        let citrus_honey_dressing = menuItem(mName: "Citrus Honey Dressing", mPrice: 0.00, mSection: "condim_ext", mCategory: "Sides", mCategory_2: "None", mCategory_3: "None")
        items.append(citrus_honey_dressing)
        
        let sesame_soy_dressing = menuItem(mName: "Sesame Soy Sauce Dressing", mPrice: 0.00, mSection: "condim_ext", mCategory: "Sides", mCategory_2: "None", mCategory_3: "None")
        items.append(sesame_soy_dressing)
        
        
        
                                                    /* * * * Cage favorites * * * */
        
            //Breakfast
        
        let egg_cheese_bagel = menuItem(mName: "Egg & Cheese Bagel", mPrice: 0.00, mSection: "cage_fave", mCategory: "Breakfast", mCategory_2: "None", mCategory_3: "None")
        items.append(egg_cheese_bagel)
        
        let egg_cheese_english_muffin = menuItem(mName: "Egg & Cheese English Muffin", mPrice: 0.00, mSection: "cage_fave", mCategory: "Breakfast", mCategory_2: "None", mCategory_3: "None")
        items.append(egg_cheese_english_muffin)
        
        let egg_cheese_croissant = menuItem(mName: "Egg & Cheese Croissant", mPrice: 0.00, mSection: "cage_fave", mCategory: "Breakfast", mCategory_2: "None", mCategory_3: "None")
        items.append(egg_cheese_croissant)
        
        let scrambled_eggs = menuItem(mName: "Scrambled Eggs", mPrice: 0.00, mSection: "cage_fave", mCategory: "Breakfast", mCategory_2: "None", mCategory_3: "None")
        items.append(scrambled_eggs)
        
        let fried_egg = menuItem(mName: "Fried Egg (Pan Spray)", mPrice: 0.00, mSection: "cage_fave", mCategory: "Breakfast", mCategory_2: "None", mCategory_3: "None")
        items.append(fried_egg)
        
        let scrambled_egg_whites = menuItem(mName: "Scrambled Egg (Whites)", mPrice: 0.00, mSection: "cage_fave", mCategory: "Breakfast", mCategory_2: "None", mCategory_3: "None")
        items.append(scrambled_egg_whites)
        
        let grilled_ham = menuItem(mName: "Grilled Ham", mPrice: 0.00, mSection: "cage_fave", mCategory: "Breakfast", mCategory_2: "None", mCategory_3: "None")
        items.append(grilled_ham)
        
        let pork_breakfast_patties = menuItem(mName: "Pork Breakfast Patties", mPrice: 0.00, mSection: "cage_fave", mCategory: "Breakfast", mCategory_2: "None", mCategory_3: "None")
        items.append(pork_breakfast_patties)
        
        let hash_browns = menuItem(mName: "Hash Browns", mPrice: 0.00, mSection: "cage_fave", mCategory: "Breakfast", mCategory_2: "None", mCategory_3: "None")
        items.append(hash_browns)
        
                // Chef Special
        
        let wellness_tbq_builder = menuItem(mName: "Wellness Taco Burrito Quesedilla Builder", mPrice: 0.00, mSection: "cage_fave", mCategory: "Chef Special", mCategory_2: "None", mCategory_3: "None")
        items.append(wellness_tbq_builder)
        
        let pizza_builder = menuItem(mName: "Pizza Builder", mPrice: 0.00, mSection: "cage_fave", mCategory: "Chef Special", mCategory_2: "None", mCategory_3: "None")
        items.append(pizza_builder)
        
        let cheese_pizza = menuItem(mName: "16 Oz 4-1 Cheese Pizza", mPrice: 0.00, mSection: "cage_fave", mCategory: "Chef Special", mCategory_2: "None", mCategory_3: "None")
        items.append(cheese_pizza)
        
        let cheese_pep_pizza = menuItem(mName: "16 Oz 4-1 Cheese Pepperoni Pizza", mPrice: 0.00, mSection: "cage_fave", mCategory: "Chef Special", mCategory_2: "None", mCategory_3: "None")
        items.append(cheese_pep_pizza)
        
        let hummus_chedd_9g = menuItem(mName: "Hummus with Cheddar on Nine-grain", mPrice: 0.00, mSection: "cage_fave", mCategory: "Chef Special", mCategory_2: "None", mCategory_3: "None")
        items.append(hummus_chedd_9g)
        
        let tuna_salad_chedd_9g = menuItem(mName: "Tuna Salad with Cheddar on Nine-grain", mPrice: 0.00, mSection: "cage_fave", mCategory: "Chef Special", mCategory_2: "None", mCategory_3: "None")
        items.append(tuna_salad_chedd_9g)
        
        let roast_beef_chedd_9g = menuItem(mName: "Roast Beef with Cheddar on Nine-grain", mPrice: 0.00, mSection: "cage_fave", mCategory: "Chef Special", mCategory_2: "None", mCategory_3: "None")
        items.append(roast_beef_chedd_9g)
        
        let ham_swiss_hoagie = menuItem(mName: "Ham with Swiss on a Hoagie", mPrice: 0.00, mSection: "cage_fave", mCategory: "Chef Special", mCategory_2: "None", mCategory_3: "None")
        items.append(ham_swiss_hoagie)
        
            // Soups & Salad
        
        let house_salad = menuItem(mName: "House Salad", mPrice: 0.00, mSection: "cage_fave", mCategory: "Soups & Salads", mCategory_2: "None", mCategory_3: "None")
        items.append(house_salad)
        
        let chef_salad = menuItem(mName: "Chef Salad", mPrice: 0.00, mSection: "cage_fave", mCategory: "Soups & Salads", mCategory_2: "None", mCategory_3: "None")
        items.append(chef_salad)
        
        let ceaser_salad_ch = menuItem(mName: "Ceasar Salad", mPrice: 0.00, mSection: "cage_fave", mCategory: "Soups & Salads", mCategory_2: "None", mCategory_3: "None")
        items.append(ceaser_salad_ch)
        
        let tuna_salad = menuItem(mName: "Tuna Salad", mPrice: 0.00, mSection: "cage_fave", mCategory: "Soups & Salads", mCategory_2: "None", mCategory_3: "None")
        items.append(tuna_salad)
        
            // Burgers & Sandwiches
        
        let grilled_chicken_wgb = menuItem(mName: "House Salad", mPrice: 0.00, mSection: "cage_fave", mCategory: "Burgers & Sandwiches", mCategory_2: "None", mCategory_3: "None")
        items.append(grilled_chicken_wgb)
        
        let quart_beef_burger_wgb = menuItem(mName: "1/4 Lb Beef Burger on Whole Grain Bun", mPrice: 0.00, mSection: "cage_fave", mCategory: "Burgers & Sandwiches", mCategory_2: "None", mCategory_3: "None")
        items.append(quart_beef_burger_wgb)
        
        let third_turkey_burger_wgb = menuItem(mName: "1/3 Lb Turkey Burger Whole Grain Bun", mPrice: 0.00, mSection: "cage_fave", mCategory: "Burgers & Sandwiches", mCategory_2: "None", mCategory_3: "None")
        items.append(third_turkey_burger_wgb)
        
        let grill_cheese_wheat = menuItem(mName: "Grilled Cheese on Wheat", mPrice: 0.00, mSection: "cage_fave", mCategory: "Burgers & Sandwiches", mCategory_2: "None", mCategory_3: "None")
        items.append(grill_cheese_wheat)
        
        let grill_ham_cheese_sd = menuItem(mName: "Grilled Ham & Cheese on Sourdough", mPrice: 0.00, mSection: "cage_fave", mCategory: "Burgers & Sandwiches", mCategory_2: "None", mCategory_3: "None")
        items.append(grill_ham_cheese_sd)
        
        let chicken_tender_melt = menuItem(mName: "Chicken Tender Melt", mPrice: 0.00, mSection: "cage_fave", mCategory: "Burgers & Sandwiches", mCategory_2: "None", mCategory_3: "None")
        items.append(chicken_tender_melt)
        
        let blt_whole_wheat = menuItem(mName: "BLT on Whole Wheat", mPrice: 0.00, mSection: "cage_fave", mCategory: "Burgers & Sandwiches", mCategory_2: "None", mCategory_3: "None")
        items.append(blt_whole_wheat)
        
        let grill_turkey_chedd_ww = menuItem(mName: "Grilled Turkey w/ Cheddar (Whole Wheat)", mPrice: 0.00, mSection: "cage_fave", mCategory: "Burgers & Sandwiches", mCategory_2: "None", mCategory_3: "None")
        items.append(grill_turkey_chedd_ww)
        
        let buffalo_chicken_wrap = menuItem(mName: "Grilled Chicken Wrap", mPrice: 0.00, mSection: "cage_fave", mCategory: "Burgers & Sandwiches", mCategory_2: "None", mCategory_3: "None")
        items.append(buffalo_chicken_wrap)
        
        let chicken_bacon_ranch_wrap = menuItem(mName: "Chicken Bacon Ranch Wrap", mPrice: 0.00, mSection: "cage_fave", mCategory: "Burgers & Sandwiches", mCategory_2: "None", mCategory_3: "None")
        items.append(chicken_bacon_ranch_wrap)
        
        let chicken_ceasar_wrap = menuItem(mName: "Chicken Ceasar Wrap", mPrice: 0.00, mSection: "cage_fave", mCategory: "Burgers & Sandwiches", mCategory_2: "None", mCategory_3: "None")
        items.append(chicken_ceasar_wrap)
        
        let roast_veg_humm_wrap = menuItem(mName: "Roasted Vegetable & Hummus Wrap", mPrice: 0.00, mSection: "cage_fave", mCategory: "Burgers & Sandwiches", mCategory_2: "None", mCategory_3: "None")
        items.append(roast_veg_humm_wrap)
        
        let cage_smkehse_burger = menuItem(mName: "Cage Smokehouse Burger", mPrice: 0.00, mSection: "cage_fave", mCategory: "Burgers & Sandwiches", mCategory_2: "None", mCategory_3: "None")
        items.append(cage_smkehse_burger)
        
        let coleslaw = menuItem(mName: "Coleslaw", mPrice: 0.00, mSection: "cage_fave", mCategory: "Burgers & Sandwiches", mCategory_2: "None", mCategory_3: "None")
        items.append(coleslaw)
        
        let frsh_frt_salad = menuItem(mName: "Grilled Cheese on Wheat", mPrice: 0.00, mSection: "cage_fave", mCategory: "Burgers & Sandwiches", mCategory_2: "None", mCategory_3: "None")
        items.append(frsh_frt_salad)
        
        let hummus = menuItem(mName: "Hummus", mPrice: 0.00, mSection: "cage_fave", mCategory: "Burgers & Sandwiches", mCategory_2: "None", mCategory_3: "None")
        items.append(hummus)
        
        let mix_greens_salad = menuItem(mName: "Mixed Greens Salad", mPrice: 0.00, mSection: "cage_fave", mCategory: "Burgers & Sandwiches", mCategory_2: "None", mCategory_3: "None")
        items.append(mix_greens_salad)
        
        let potato_chips = menuItem(mName: "Potato Chips", mPrice: 0.00, mSection: "cage_fave", mCategory: "Burgers & Sandwiches", mCategory_2: "None", mCategory_3: "None")
        items.append(potato_chips)
        
            // Sides
        
        let french_fries = menuItem(mName: "French Fries", mPrice: 0.00, mSection: "cage_fave", mCategory: "Sides", mCategory_2: "None", mCategory_3: "None")
        items.append(french_fries)
        
        let onion_rings = menuItem(mName: "Onion Rings", mPrice: 0.00, mSection: "cage_fave", mCategory: "Sides", mCategory_2: "None", mCategory_3: "None")
        items.append(onion_rings)
        
        
                                                /* * * * Arranging items based on sections * * * */
        
        var cage_fave_items = [menuItem]()
        var condim_ext_items = [menuItem]()
        
        
        for i in items {
            if i.section == "cage_fave" {
                cage_fave_items.append(i)
            }
        }
        
        for i in items {
            if i.section == "condim_ext" {
                condim_ext_items.append(i)
            }
        }
        
                                                /* * * * Arranging items based on category * * * */
        
        
        var breakfast_items = [menuItem]()
        var grab_n_go_salad_items = [menuItem]()
        var deli_sandwich_items = [menuItem]()
        var soups_n_salads_items = [menuItem]()
        var burger_n_sndwch_items = [menuItem]()
        var drink_of_month_items = [menuItem]()
        var cold_bvrgs_items = [menuItem]()
        var smoothie_items = [menuItem]()
        var ice_cream_mshake_items = [menuItem]()
        var sides_items = [menuItem]()
        var chef_special_items = [menuItem]()
        
        
        
        
            // Breakfast items
        for i in items {
            if i.category == "Breakfast" || i.category_2 == "Breakfast" || i.category_3 == "Breakfast" {
                breakfast_items.append(i)
            }
        }
            // Grab N Go Salads
        for i in items {
            if i.category == "Grab N Go" || i.category_2 == "Grab N Go" || i.category_3 == "Grab N Go" {
                grab_n_go_salad_items.append(i)
            }
        }
            // Deli Sandwiches
        for i in items {
            if i.category == "Deli Sandwich" || i.category_2 == "Deli Sandwich" || i.category_3 == "Deli Sandwich" {
                deli_sandwich_items.append(i)
            }
        }
            // Soups & Salads
        for i in items {
            if i.category == "Soups & Salads" || i.category_2 == "Soups & Salads" || i.category_3 == "Soups & Salads" {
                soups_n_salads_items.append(i)
            }
        }
            // Burgers & Sandwiches
        for i in items {
            if i.category == "Burgers & Sandwiches" || i.category_2 == "Burgers & Sandwiches" || i.category_3 == "Burgers & Sandwiches" {
                burger_n_sndwch_items.append(i)
            }
        }
            // Drink of the Month
        for i in items {
            if i.category == "Drink of The Month" || i.category_2 == "Drink of The Month" || i.category_3 == "Drink of The Month" {
                drink_of_month_items.append(i)
            }
        }
            // Cold Beverages
        for i in items {
            if i.category == "Cold Beverages" || i.category_2 == "Cold Beverages" || i.category_3 == "Cold Beverages" {
                cold_bvrgs_items.append(i)
            }
        }
            // Smoothies
        for i in items {
            if i.category == "Smoothies" || i.category_2 == "Smoothies" || i.category_3 == "Smoothies" {
                smoothie_items.append(i)
            }
        }
            // Ice Cream & Milshakes
        for i in items {
            if i.category == "Ice Cream & Shakes" || i.category_2 == "Ice Cream & Shakes" || i.category_3 == "Ice Cream & Shakes" {
                ice_cream_mshake_items.append(i)
            }
        }
            // Sides
        for i in items {
            if i.category == "Sides" || i.category_2 == "Sides" || i.category_3 == "Sides" {
                sides_items.append(i)
            }
        }
            // Chef Special
        for i in items {
            if i.category == "Chef Special" || i.category_2 == "Chef Special" || i.category_3 == "Chef Special" {
                chef_special_items.append(i)
            }
        }
        
    }

}
