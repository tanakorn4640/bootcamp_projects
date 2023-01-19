# homework 01
# chatbot (rule-based)
# ordering pizza


# pizza
pizza_id <- c(0, 1, 2, 3, 4, 5)
pizza_top <- c("No", "Hawaiian", "Cheese lover", 
                "Pepperoni", "Seafood", "Spicy grilled Chicken")
pizza_price <- c(0, 250, 300, 260, 350, 280)
df_pizza <- data.frame(pizza_id, pizza_top, pizza_price)

# appetizer
app_id <- c(0, 1, 2, 3)
app_name <- c("No", "Cheese stick", 
              "Garlic bread", "BBQ chicken wing")
app_price <- c(0, 100, 90, 140)
df_app <- data.frame(app_id, app_name, app_price)

# drink 
drink_id <- c(0, 1, 2)
drink_name <- c("No", "Coke", "Sprite")
drink_price <- c(0, 50, 55)
df_drink <- data.frame(drink_id, drink_name, drink_price)

# dessert
des_id <- c(0, 1, 2)
des_name <- c("No", "Egg tart", "Matcha green tea ice cream")
des_price <- c(0, 40, 120)
df_des <- data.frame(des_id, des_name, des_price)


# start
print("Restaurant is open now")
print("Welcome to Pazzi Pizza !!!")


# question 1
print("What's your name?")
user_name <- readLines("stdin", n = 1)
print(paste("Hi!", user_name))

# question 2 
print("What would you like to order?")
print("--- Let's choose your menu ---")

# question 3
print("1.Pizza")
print(df_pizza)
print("Please select type pizza_id")
choose_pizza <- readLines("stdin", n = 1)
if(choose_pizza == 0) {
  pizza <- "NO"
  pizza_price <- 0
  print(paste("NO choose pizza", "Price :", pizza_price ))
} else if(choose_pizza == 1) {
  pizza <- "Hawaiian"
  pizza_price <- 250
  print(paste("You choose :", pizza, "Pizza", "Price :", pizza_price))
} else if(choose_pizza == 2) {
  pizza <- "Cheese lover"
  pizza_price <- 300
  print(paste("You choose :", pizza, "Pizza", "Price :", pizza_price))
} else if(choose_pizza == 3) {
  pizza <- "Pepperoni"
  pizza_price <- 260
  print(paste("You choose :", pizza, "Pizza", "Price :", pizza_price))
} else if(choose_pizza == 4) {
  pizza <- "Seafood"
  pizza_price <- 350
  print(paste("You choose :", pizza, "Pizza", "Price :", pizza_price))
} else if(choose_pizza == 5) {
  pizza <- "Spicy grilled chicken"
  pizza_price <- 280
  print(paste("You choose :", pizza, "Pizza", "Price :", pizza_price))
}
total_price1 <- sum(pizza_price)
print(paste("Total price :", total_price1))
print("-----------------------------------")


# question 4
print("2.Appetizer")
print(df_app)
print("Please select type app_id")
choose_app <- readLines("stdin", n = 1)
if(choose_app == 0) {
  app <- "NO"
  app_price <- 0
  print(paste("NO choose appetizer", "Price :", app_price ))
} else if(choose_app == 1) {
  app <- "Cheese stick"
  app_price <- 100
  print(paste("You choose :", app, "Price :", app_price))
} else if(choose_app == 2) {
  app <- "Garlic bread"
  app_price <- 90
  print(paste("You choose :", app, "Price :", app_price))
} else if(choose_app == 3) {
  app <- "BBQ chicken wing"
  app_price <- 140
  print(paste("You choose :", app, "Price :", app_price))
} 
total_price2 <- sum(app_price)
print(paste("Total price :", total_price2))
print("-----------------------------------")


# question 5
print("3.Drink")
print(df_drink)
print("Please select type drink_id")
choose_drink <- readLines("stdin", n = 1)
if(choose_drink == 0) {
  drink <- "NO"
  drink_price <- 0
  print(paste("NO choose drink", "Price :", drink_price ))
} else if(choose_drink == 1) {
  drink <- "Coke"
  drink_price <- 50
  print(paste("You choose :", drink, "Price :", drink_price))
} else if(choose_drink == 2) {
  drink <- "Sprite"
  drink_price <- 55
  print(paste("You choose :", drink, "Price :", drink_price))
} 
total_price3 <- sum(drink_price)
print(paste("Total price :", total_price3))
print("-----------------------------------")


# question 6
print("4.Dessert")
print(df_des)
print("Please select type des_id")
choose_des <- readLines("stdin", n = 1)
if(choose_des == 0) {
  des <- "NO"
  des_price <- 0
  print(paste("NO choose dessert", "Price :", des_price ))
} else if(choose_des == 1) {
  des <- "Egg tart"
  des_price <- 40
  print(paste("You choose :", des, "Price :", des_price))
} else if(choose_des == 2) {
  des <- "Matcha green tea ice cream"
  des_price <- 90
  print(paste("You choose :", des, "Price :", des_price))
} 
total_price4 <- sum(des_price)
print(paste("Total price :", total_price4))
print("-----------------------------------")


# Summary
print("Order summary")
print(paste("Customer name :", user_name))
if(choose_pizza == 0) {
  print(paste("No choose pizza", "Price :", pizza_price))
} else {
  print(paste("You choose :", pizza, "Pizza", "Price :", pizza_price))
}

      
if(choose_app == 0) {
  print(paste("No choose appetizer", "Price :", app_price))
} else {
  print(paste("You choose :", app, "Price :", app_price))
}

      
if(choose_drink == 0) {
  print(paste("No choose drink", "Price :", drink_price))
} else {
  print(paste("You choose :", drink, "Price :", drink_price))
}


if(choose_des == 0) {
  print(paste("No choose dessert", "Price :", des_price))
} else {
  print(paste("You choose :", des, "Price :", des_price))
}
total_price5 <- sum(pizza_price, app_price, drink_price, des_price)
print(paste("Total price :", total_price5))
print("-----------------------------------")


# question 7
print("Are you comfirm order?")
print("Please select Y(yes) or N(no)")
result <- (toupper(readLines("stdin", n = 1)))

if(result == "Y") {
  print("Order confirmed!")
  } else {
  print(paste("Cancel order"))
  }
print("-----------------------------------")


# question 8
print("Please select your payment method")
print("1.Credit card, 2.Mobile Banking")
payment <- readLines("stdin", n = 1)
if(payment == 1) {
  print("Please fill your credit card number")
  readLines("stdin", n = 1)
  print("Your order will delivery in 30 mins")
  print("We hope you enjoy your meal")
  print("Thank you for ordering food at Pazzi pizza")
} else if(payment == 2) {
  print("Please pay to Kbank acc.num 5555")
  print("After pay please sent silp (in link below)")
  print("Your order will delivery in 30 mins")
  print("We hope you enjoy your meal")
  print("Thank you for ordering food at Pazzi pizza")
} else if(result == "N") {
    print("Cancel order")
    print("Thank you!")
  }