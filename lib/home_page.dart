import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:round_one/event_modal.dart';
import 'package:round_one/local_json.dart';

class HomePage extends HookWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ValueNotifier<EventModal?> res = useState(null);

    Future<void> getDataFromLocal() async {
      res.value = EventModal.fromJson(localJson);
      res.value?.data?.trainings?[0].trainingEvents?[0].events;
    }

    useEffect(() {
      getDataFromLocal();
    }, []);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('${res.value?.data?.trainings?[0].month}'),
          SizedBox(height: 10,),
          ListView.builder(
              itemCount: res.value?.data?.trainings?[0].trainingEvents?.length,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, index) {
                return Column(
                  children: [
                    Text(
                        '${res.value?.data?.trainings?[0].trainingEvents?[index].date}'),
                    Text(
                        '${res.value?.data?.trainings?[0].trainingEvents?[index].events?[1].status}'),
                  ],
                );
              }),
          Divider(),
          ListView.builder(
              itemCount: 2,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, index) {
                return Column(
                  children: [
                    Text(
                        '${res.value?.data?.trainings?[0].trainingEvents?[0].events?[index].status}'),
                    // Text(
                    //     '${res.value?.data?.trainings?[0].trainingEvents?[1].events?[index].status}'),
                  ],
                );
              })
        ],
      ),
    );
  }
}
