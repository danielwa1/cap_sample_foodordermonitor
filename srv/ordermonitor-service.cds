using { my.custom_food_orders as my } from '../db/schema';
service OrderMonitorService {
    entity Orders @readonly as projection on my.Orders;
}