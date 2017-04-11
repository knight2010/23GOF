💾 Memento Pattern

```
Without violation encapsulation, capture and externalize and object's internal state so that the object can be restored to this state later.
```

[Contribution guidelines for 23GoF](../../readme.md)

![Image text](memento-pattern.png)

## Implemention

```
Caretaker.java     //Implemention in java
memento.cpp        //Implemention in cpp
memento.playground //Implemention in swift
```

## Memento Pattern Role Responsibility

在Memento模式中,有如下角色:
Memento (备忘录)
* 存储Originator的内部状态. 根据Originator的需要.可以存储任意的内部状态.
* 保护对状态的访问.除了Originator对象外,其他对象不能访问其存储的内部状态.Memeoto实际上提供了2个接口.
Caretaker只能访问Memento的窄接口(narrow interface) - 它只能够把memento传递给其他对象.
相反,Originator可以访问Memento的宽接口(wide interface). 通过这个接口,可以让Originator获取足够的信息以恢复到之前的状态.理想情况下,只有创建memento的Originator才有权限访问memento的内部状态信息.
Originator (发起人)
* 可以创建一个新的memento, 并把自己的当前状态信息存储到memento里面
* 可以使用memento来恢复其内部状态信息
Caretaker (责任人)
* 负责维护和管理memento对象
* 从不对memento的内容进行操作或者测试
