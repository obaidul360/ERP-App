class Student {
  String name;
  int roll;

  Student(this.name, this.roll);

  // Named Constructor
  Student.guest() : name = "Guest", roll = 0;
}

void main() {
  Student s1 = Student("Rahim", 10);

  Student s2 = Student.guest();

  print(s1.name);
  print(s2.name);
}

abstract class Payment {
  void pay();
}

class BkashPayment extends Payment {
  @override
  void pay() {
    print("Paid with Bkash");
  }
}

class NagadPayment extends Payment {
  @override
  void pay() {
    print("Paid with Nagad");
  }
}
