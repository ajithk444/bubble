import 'package:angel_orm/angel_orm.dart';
import 'package:angel_test/angel_test.dart';
import 'package:bubble/bubble.dart';
import 'package:test/test.dart';
import '../common.dart';

main() async {
  TestClient client;
  QueryExecutor executor;

  Bubble socksBubble;

  setUp(() async {
    client = await connectToApp();
    executor = client.server.container.make<QueryExecutor>();

    var socksBubbleQuery = BubbleQuery();
    socksBubbleQuery.values
      ..type = BubbleType.general
      ..name = 'Socks'
      ..description = 'All about socks.';
    socksBubble = await socksBubbleQuery.insert(executor);
  });

  tearDown(() => client?.close());

  test('hey', () async {
    print(socksBubble);
  });
}
