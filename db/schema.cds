using { managed, sap } from '@sap/cds/common';
namespace my.custom_food_orders;

entity Orders : managed {
    key ID : Integer;
    customer : Association to one Customer;
    orderitems : Composition of many OrderItems on orderitems.order = $self;
}

entity OrderItems {
    key ID : Integer;
    order : Association to one Orders;
    pos : Integer;
    count : Integer;
    fooditem : Association to one FoodItems;   
}

entity Customer : managed {
    key ID : Integer;
    firstname : String(128);
    lastname : String(128);
    street : String(256);
    street_number : String(10);
    postcode : String(5);
    city : String(128);
    email : String(256);
    orders : Association to many Orders on orders.customer = $self;
}

entity FoodItems {
    key ID : Integer;
    name : String(64);
    orderitems : Association to many OrderItems on orderitems.fooditem = $self;
}

/*
using { managed, sap } from '@sap/cds/common';
namespace my.custom_food_orders;

entity Orders : managed {
    key ID : Integer;
    customer : Association to one Customer;
    orderitems : Composition of many OrderItems on orderitems.order = $self;
}

entity OrderItems : managed {
    key order : Association to one Orders;
    key pos : Integer;
    count : Integer;
    fooditem : Association to one FoodItems;   
}

entity Customer : managed {
    key ID : Integer;
    firstname : String(128);
    lastname : String(128);
    street : String(256);
    street_number : String(10);
    postcode : String(5);
    city : String(128);
    email : String(256);
    orders : Association to many Orders on orders.customer = $self;
}

entity FoodItems : managed {
    key ID : Integer;
    name : String(64);
    orderitems : Association to many OrderItems on orderitems.fooditem = $self;
}


*/