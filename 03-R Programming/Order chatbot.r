## bot food order

my_manu <- data.frame(
    id = 1:6,
    manu_name = c("chick pasta", "creamy pasta", "spicy chick pasta", "mozzarella", "cheese garlic", "plain garlic"),
    price = c(280, 300, 450, 250, 455, 345)
)

print("Welcome to our restuarant🙏🏻")
print("Let see our manu here :")
print(my_manu)
order_summarize <- 0

while(TRUE) {
    flush.console()
    cus_order <- readline("Please order by id manu or type (order) to confirm : ")

    if (cus_order == "order") {
        break
    } else if (cus_order == 1) {
        print("You order is chick pasta")
        order_summarize <- order_summarize + 280
    } else if (cus_order == 2) {
        print("You order is creamy pasta")
        order_summarize <- order_summarize + 300
    } else if (cus_order == 3) {
        print("You order is spicy chick pasta")
        order_summarize <- order_summarize + 450
    } else if (cus_order == 4) {
        print("You order is spicy mozzarella")
        order_summarize <- order_summarize + 250
    } else if (cus_order == 5) {
        print("You order is spicy cheese garlic")
        order_summarize <- order_summarize + 455
    } else if (cus_order == 6) {
        print("You order is spicy plain garlic")
        order_summarize <- order_summarize + 345
    } else {
        print("Thanks")
    }
} 

print("You order have already comfirmed")
print(paste("Your order total is", order_summarize))
print("You can pay by scan QR code below")
