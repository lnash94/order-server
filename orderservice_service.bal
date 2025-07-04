import ballerina/grpc;
import ballerina/uuid;

listener grpc:Listener ep = new (9090);
map<CreateOrderRequest> orders = {};

@grpc:ServiceConfig {
    auth: [
        {
            fileUserStoreConfig: {},
            scopes: ["admin"]
        }
    ]
}
@grpc:Descriptor {value: ORDER_DESC}
service "OrderService" on ep {

    remote function CreateOrder(CreateOrderRequest value) returns CreateOrderResponse|error {
        string orderId = uuid:createType4AsString();
        orders[orderId] = value;
        CreateOrderResponse res = {
            order_id: orderId,
            status: "processing"
        };
        return res;
    }

    remote function GetOrder(GetOrderRequest value) returns GetOrderResponse|error {
        CreateOrderRequest orderV = orders.get(value.order_id);
        GetOrderResponse res = {
            order_id: value.order_id,
            customer_id: orderV.customer_id,
            product_id: orderV.product_id,
            quantity: orderV.quantity,
            price: orderV.price,
            status: "processing"
    };
    return res;
}

    remote function UpdateOrder(UpdateOrderRequest value) returns UpdateOrderResponse|error {
        UpdateOrderResponse res = {
            order_id: value.order_id,
            status: "updated"
        };
        return res;
    }
}

