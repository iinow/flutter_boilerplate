import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class Provider extends StatelessWidget {
  const Provider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: ChangeNotifierProvider<Counter>(
        create: (_) => Counter(),
        child: Center(
          child: Consumer<Counter>(
            builder: (_, counter, __) => Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Counter: ${counter.count}'),
                CupertinoButton(
                  child: const Text('increment'),
                  onPressed: () => counter.increment(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Counter extends ChangeNotifier {
  // ChangeNotifier를 extends한다.
  int _count = 0;

  int get count => _count;

  void increment() {
    _count++;
    notifyListeners(); // 숫자가 증가했다는 것을 ChangeNotifierProvider에 알려주기 위해 notifyListeners()를 호출한다.
  }
}
