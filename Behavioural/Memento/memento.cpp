// Desc: 💾 Memento Pattern 
// Without violation encapsulation, capture and externalize and object's internal state so that the object can be restored to this state later.
// clang++ -o memento memento.cpp compile with clang++
// g++ -o memento memento.cpp compile with g++
#include <iostream>
#include <deque>
#include <string>
 
using namespace std;
 
class Memento
{
private:
    string _state;
public:
    Memento(const string &str):_state(str){}
    const string &get(){return _state;}
};
 
class Caretaker
{
private:
    Memento *_memento;
public:
    Caretaker(Memento *pM){_memento = pM;}
    Memento &get(){return *_memento;}
     
};
 
class Originator
{
private:
    string _state;
public:
    void set(const string &str){_state = str;}
    const string &get(){return _state;}
    Memento* createMemento(){return new Memento(_state);}
    void setMemento(Memento &memento){_state = memento.get();}
};
 
int main ()
{
    Originator O;
    O.set("On");
    cout << "Originator get state :" << O.get() << endl;
    // Originator create memento 
    Caretaker C(O.createMemento());
    O.set("open");
    cout << "Originator get state :" << O.get() << endl;
    O.set("Off");
    cout << "Originator get state :" << O.get() << endl;
     
    O.setMemento(C.get());
    cout << "Originator get state :" << O.get() << endl;
}
