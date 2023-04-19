## roscpp
```cpp
// Parse node parameters and name the node.
ros::init()
```

```cpp
// A class to control the node.
ros::NodeHandle {
    /** 
    *   Create a publisher for a topic.
    *   queue_size: length of the message queue.
    */
    ros::Publisher advertise(string topic, uint32_t queue_size);
    /** 
    *   Create a subscriber for a topic.
    *   M: callback function to handle the message.
    */
    ros::Subscriber subscribe(string topic, uint32_t queue_size, void(*)(M));
    /** 
    *   Create a server for a service.
    */
    ros::ServiceServer advertiseService(string service, bool(*srv_func)(Mreq &, Mres &));
    /** 
    *   Create a client for a service.
    */
    ros::ServiceClient serviceClient(string service_name, bool presistent=false);
    /** 
    *   Get parameter key value.
    */
    bool getParam(string &key, void &val);
    /** 
    *   Set parameter key value.
    */
    bool setParam(string &key, void &val);
}
```

# rospy

- node
```python
init_node(name)
get_master()
is_shutdown()
on_shutdown(func)       # Call 'func' when node is shutdowned.
get_node_uri()
get_name()
get_namespace()
```

- topic 
```python
get_published_topics() -> [[str, str]]
wait_for_message(topic, topic_type, time_out=None) # Wait for a message from topic.
spin()                  # Call topic/service's handler.
```

- publisher
```python
class Publisher:
    def __init__(self, name, data_class, queue_size=None)
    def publish(self, msg)      # Publish a message
    def unregister(self)        # Stop publishing
```

- subscriber
```python
class Subscriber:
    def __init__(self, name, data_class, call_back=None, queue_size=None)
    def unregister(self)        # Stop subscribe
```

- service
```python
wait_for_service(service, timeout=None)

class Service:
    def __init__(self, name, service_class, handler)
    def shutdown(self)

class ServiceProxy:             # Client
    def __init__(self, name, service_class)
    def call(self, *args, **kwrds)      
    def __call__(self, *args, **kwrds)
```