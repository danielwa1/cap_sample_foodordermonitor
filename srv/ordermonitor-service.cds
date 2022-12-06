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

annotate OrderMonitorService.OrderItems with @(
    UI: {
        LineItem: [ 
            { Label: 'Order-Pos.', Value: pos },
            { Label: 'Count Items ordered', Value: count },
            { Label: 'Item-Name', Value: fooditem.name }
            ]
        }
);

annotate OrderMonitorService.Orders with @(
    UI: {
        HeaderInfo: {
            TypeName: 'Order',
            TypeNamePlural: 'Orders',
        },
        SelectionFields: [ ID, customer_ID, createdAt ],

        LineItem:
        [
            { Label: 'Order-ID:', Value: ID },
            { Value: createdAt },
            { Label: 'Customer-ID:', Value: customer.ID },
            { Value: customer.firstname },
            { Value: customer.lastname },
        ],
        Facets:
        [
            {
            $Type: 'UI.CollectionFacet',
            Label: 'Order Details',
            Facets :
            [
                {
                    $Type: 'UI.ReferenceFacet',
                    Target: '@UI.FieldGroup#Main',
                    Label: 'Main Facet',
                },
                {
                    $Type: 'UI.ReferenceFacet',
                    Target : 'orderitems/@UI.LineItem',
                    Label: 'Order Items',
                },
            ],
            }
        ],

        FieldGroup#Main: {
            Data: [
            { Label: 'Order-ID', Value: ID },
            { Label: 'Order Date', Value: createdAt },
            { Label: 'Customer ID', Value: customer.ID },
            { Label: 'First Name', Value: customer.firstname },
            { Label: 'Last Name', Value: customer.lastname },
            { Label: 'Postcode', Value: customer.postcode },
            { Label: 'City', Value: customer.city },
            { Label: 'Street', Value: customer.street },
            { Label: 'Street-No.', Value: customer.street_number },
            ]
        },            

    }

);