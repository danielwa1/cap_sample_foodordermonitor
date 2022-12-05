using { my.custom_food_orders as my } from '../db/schema';
service OrderMonitorService {

    entity Orders @readonly as projection on my.Orders
    {
        *,
        customer : redirected to Customer,
        orderitems : redirected to OrderItems
    };

    @cds.redirection.target: true
    entity Customer @readonly as projection on my.Customer;

    @cds.redirection.target: true
    entity OrderItems @readonly as projection on my.OrderItems
    {
        *,
        fooditem : redirected to FoodItems,
    };

    @cds.redirection.target: true
    entity FoodItems @readonly as projection on my.FoodItems;
}

annotate OrderMonitorService.Orders with @(
    UI: {
        HeaderInfo: {
            TypeName: 'Order',
            TypeNamePlural: 'Orders',
            Title: { Value: ID },
            Description: { Value: customer_ID }
        },
        SelectionFields: [ ID, customer_ID, createdAt ],
        LineItem: [
            { Value: ID },
            { Value: createdAt },
            { Value: customer.ID },
            { Value: customer.firstname },
            { Value: customer.lastname }
        ]
    }
);