import 'package:event_bus/event_bus.dart';

// 定义一个top-level（全局）变量，页面引入该文件后可以直接使用bus
// 定义一个全局的eventBus
final eventBus = EventBus();

//订阅者回调签名
typedef EventCallback = void Function(dynamic arg);

class EventBusTools {
  //私有构造函数
  EventBusTools._internal();

  //保存单例
  static final EventBusTools _singleton = EventBusTools._internal();

  //工厂构造函数
  factory EventBusTools() => _singleton;

  //保存事件订阅者队列，key:事件名(id)，value: 对应事件的订阅者队列
  final _eMap = <Object, List<EventCallback>>{};

  //添加订阅者
  void on(eventName, EventCallback f) {
    if (eventName == null) return;
    _eMap[eventName] ??= <EventCallback>[];
    _eMap[eventName]!.add(f);
  }

  //移除订阅者
  void off(eventName, EventCallback f) {
    var list = _eMap[eventName];
    if (eventName == null || list == null) return;
    list.remove(f);
    if (_eMap[eventName]!.isEmpty) _eMap.remove(eventName);
  }

  //触发事件，事件触发后该事件所有订阅者会被调用
  void emit(eventName, [arg]) {
    var list = _eMap[eventName];
    if (list == null) return;
    int len = list.length - 1;
    //反向遍历，防止在订阅者在回调中移除自身带来的下标错位
    for (var i = len; i > -1; --i) {
      list[i](arg);
    }
  }
}

class TabbarControllerEvent {
  int index;
  TabbarControllerEvent(this.index);
}
