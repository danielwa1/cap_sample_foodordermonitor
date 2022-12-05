using { my.custom_food_orders as my } from '../db/schema';
service OrderMonitorService {
    entity Orders @readonly as projection on my.Orders;
    entity Customer @readonly as projection on my.Customer;
    entity OrderItems @readonly as projection on my.OrderItems;
    entity FoodItems @readonly as projection on my.FoodItems;
}