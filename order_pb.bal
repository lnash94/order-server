import ballerina/grpc;
import ballerina/protobuf;

public const string ORDER_DESC = "0A0B6F726465722E70726F746F120F6F726465726D616E6167656D656E742286010A124372656174654F7264657252657175657374121F0A0B637573746F6D65725F6964180120012809520A637573746F6D65724964121D0A0A70726F647563745F6964180220012809520970726F647563744964121A0A087175616E7469747918032001280552087175616E7469747912140A0570726963651804200128025205707269636522480A134372656174654F72646572526573706F6E736512190A086F726465725F696418012001280952076F72646572496412160A067374617475731802200128095206737461747573222C0A0F4765744F726465725265717565737412190A086F726465725F696418012001280952076F72646572496422B7010A104765744F72646572526573706F6E736512190A086F726465725F696418012001280952076F726465724964121F0A0B637573746F6D65725F6964180220012809520A637573746F6D65724964121D0A0A70726F647563745F6964180320012809520970726F647563744964121A0A087175616E7469747918042001280552087175616E7469747912140A0570726963651805200128025205707269636512160A06737461747573180620012809520673746174757322A1010A125570646174654F726465725265717565737412190A086F726465725F696418012001280952076F726465724964121F0A0B637573746F6D65725F6964180220012809520A637573746F6D65724964121D0A0A70726F647563745F6964180320012809520970726F647563744964121A0A087175616E7469747918042001280552087175616E7469747912140A0570726963651805200128025205707269636522480A135570646174654F72646572526573706F6E736512190A086F726465725F696418012001280952076F72646572496412160A0673746174757318022001280952067374617475733293020A0C4F726465725365727669636512580A0B4372656174654F7264657212232E6F726465726D616E6167656D656E742E4372656174654F72646572526571756573741A242E6F726465726D616E6167656D656E742E4372656174654F72646572526573706F6E7365124F0A084765744F7264657212202E6F726465726D616E6167656D656E742E4765744F72646572526571756573741A212E6F726465726D616E6167656D656E742E4765744F72646572526573706F6E736512580A0B5570646174654F7264657212232E6F726465726D616E6167656D656E742E5570646174654F72646572526571756573741A242E6F726465726D616E6167656D656E742E5570646174654F72646572526573706F6E7365620670726F746F33";

public isolated client class OrderServiceClient {
    *grpc:AbstractClientEndpoint;

    private final grpc:Client grpcClient;

    public isolated function init(string url, *grpc:ClientConfiguration config) returns grpc:Error? {
        self.grpcClient = check new (url, config);
        check self.grpcClient.initStub(self, ORDER_DESC);
    }

    isolated remote function CreateOrder(CreateOrderRequest|ContextCreateOrderRequest req) returns CreateOrderResponse|grpc:Error {
        map<string|string[]> headers = {};
        CreateOrderRequest message;
        if req is ContextCreateOrderRequest {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("ordermanagement.OrderService/CreateOrder", message, headers);
        [anydata, map<string|string[]>] [result, _] = payload;
        return <CreateOrderResponse>result;
    }

    isolated remote function CreateOrderContext(CreateOrderRequest|ContextCreateOrderRequest req) returns ContextCreateOrderResponse|grpc:Error {
        map<string|string[]> headers = {};
        CreateOrderRequest message;
        if req is ContextCreateOrderRequest {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("ordermanagement.OrderService/CreateOrder", message, headers);
        [anydata, map<string|string[]>] [result, respHeaders] = payload;
        return {content: <CreateOrderResponse>result, headers: respHeaders};
    }

    isolated remote function GetOrder(GetOrderRequest|ContextGetOrderRequest req) returns GetOrderResponse|grpc:Error {
        map<string|string[]> headers = {};
        GetOrderRequest message;
        if req is ContextGetOrderRequest {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("ordermanagement.OrderService/GetOrder", message, headers);
        [anydata, map<string|string[]>] [result, _] = payload;
        return <GetOrderResponse>result;
    }

    isolated remote function GetOrderContext(GetOrderRequest|ContextGetOrderRequest req) returns ContextGetOrderResponse|grpc:Error {
        map<string|string[]> headers = {};
        GetOrderRequest message;
        if req is ContextGetOrderRequest {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("ordermanagement.OrderService/GetOrder", message, headers);
        [anydata, map<string|string[]>] [result, respHeaders] = payload;
        return {content: <GetOrderResponse>result, headers: respHeaders};
    }

    isolated remote function UpdateOrder(UpdateOrderRequest|ContextUpdateOrderRequest req) returns UpdateOrderResponse|grpc:Error {
        map<string|string[]> headers = {};
        UpdateOrderRequest message;
        if req is ContextUpdateOrderRequest {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("ordermanagement.OrderService/UpdateOrder", message, headers);
        [anydata, map<string|string[]>] [result, _] = payload;
        return <UpdateOrderResponse>result;
    }

    isolated remote function UpdateOrderContext(UpdateOrderRequest|ContextUpdateOrderRequest req) returns ContextUpdateOrderResponse|grpc:Error {
        map<string|string[]> headers = {};
        UpdateOrderRequest message;
        if req is ContextUpdateOrderRequest {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("ordermanagement.OrderService/UpdateOrder", message, headers);
        [anydata, map<string|string[]>] [result, respHeaders] = payload;
        return {content: <UpdateOrderResponse>result, headers: respHeaders};
    }
}

public isolated client class OrderServiceCreateOrderResponseCaller {
    private final grpc:Caller caller;

    public isolated function init(grpc:Caller caller) {
        self.caller = caller;
    }

    public isolated function getId() returns int {
        return self.caller.getId();
    }

    isolated remote function sendCreateOrderResponse(CreateOrderResponse response) returns grpc:Error? {
        return self.caller->send(response);
    }

    isolated remote function sendContextCreateOrderResponse(ContextCreateOrderResponse response) returns grpc:Error? {
        return self.caller->send(response);
    }

    isolated remote function sendError(grpc:Error response) returns grpc:Error? {
        return self.caller->sendError(response);
    }

    isolated remote function complete() returns grpc:Error? {
        return self.caller->complete();
    }

    public isolated function isCancelled() returns boolean {
        return self.caller.isCancelled();
    }
}

public isolated client class OrderServiceGetOrderResponseCaller {
    private final grpc:Caller caller;

    public isolated function init(grpc:Caller caller) {
        self.caller = caller;
    }

    public isolated function getId() returns int {
        return self.caller.getId();
    }

    isolated remote function sendGetOrderResponse(GetOrderResponse response) returns grpc:Error? {
        return self.caller->send(response);
    }

    isolated remote function sendContextGetOrderResponse(ContextGetOrderResponse response) returns grpc:Error? {
        return self.caller->send(response);
    }

    isolated remote function sendError(grpc:Error response) returns grpc:Error? {
        return self.caller->sendError(response);
    }

    isolated remote function complete() returns grpc:Error? {
        return self.caller->complete();
    }

    public isolated function isCancelled() returns boolean {
        return self.caller.isCancelled();
    }
}

public isolated client class OrderServiceUpdateOrderResponseCaller {
    private final grpc:Caller caller;

    public isolated function init(grpc:Caller caller) {
        self.caller = caller;
    }

    public isolated function getId() returns int {
        return self.caller.getId();
    }

    isolated remote function sendUpdateOrderResponse(UpdateOrderResponse response) returns grpc:Error? {
        return self.caller->send(response);
    }

    isolated remote function sendContextUpdateOrderResponse(ContextUpdateOrderResponse response) returns grpc:Error? {
        return self.caller->send(response);
    }

    isolated remote function sendError(grpc:Error response) returns grpc:Error? {
        return self.caller->sendError(response);
    }

    isolated remote function complete() returns grpc:Error? {
        return self.caller->complete();
    }

    public isolated function isCancelled() returns boolean {
        return self.caller.isCancelled();
    }
}

public type ContextGetOrderResponse record {|
    GetOrderResponse content;
    map<string|string[]> headers;
|};

public type ContextUpdateOrderResponse record {|
    UpdateOrderResponse content;
    map<string|string[]> headers;
|};

public type ContextGetOrderRequest record {|
    GetOrderRequest content;
    map<string|string[]> headers;
|};

public type ContextCreateOrderRequest record {|
    CreateOrderRequest content;
    map<string|string[]> headers;
|};

public type ContextCreateOrderResponse record {|
    CreateOrderResponse content;
    map<string|string[]> headers;
|};

public type ContextUpdateOrderRequest record {|
    UpdateOrderRequest content;
    map<string|string[]> headers;
|};

@protobuf:Descriptor {value: ORDER_DESC}
public type GetOrderResponse record {|
    string order_id = "";
    string customer_id = "";
    string product_id = "";
    int quantity = 0;
    float price = 0.0;
    string status = "";
|};

@protobuf:Descriptor {value: ORDER_DESC}
public type UpdateOrderResponse record {|
    string order_id = "";
    string status = "";
|};

@protobuf:Descriptor {value: ORDER_DESC}
public type GetOrderRequest record {|
    string order_id = "";
|};

@protobuf:Descriptor {value: ORDER_DESC}
public type CreateOrderRequest record {|
    string customer_id = "";
    string product_id = "";
    int quantity = 0;
    float price = 0.0;
|};

@protobuf:Descriptor {value: ORDER_DESC}
public type CreateOrderResponse record {|
    string order_id = "";
    string status = "";
|};

@protobuf:Descriptor {value: ORDER_DESC}
public type UpdateOrderRequest record {|
    string order_id = "";
    string customer_id = "";
    string product_id = "";
    int quantity = 0;
    float price = 0.0;
|};

