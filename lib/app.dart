import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import 'pages/home_page.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //It is used to set the end point or the url
    final HttpLink httpLink = HttpLink("https://countries.trevorblades.com/");

    // It is a change notifier that holds a single value

    //when a old value is changed with new value it notifies the listeners
    final ValueNotifier<GraphQLClient> client = ValueNotifier<GraphQLClient>(
      GraphQLClient(
        //is used to fetch the query/mutation from a endpoint and also connect to graphql server
        link: httpLink,
        cache: GraphQLCache(
            //This class is used to cache our queries and mutations.
            //  It has options store where we pass to it the type of store in its caching operation
            store:
                HiveStore()), // The default store is the InMemoryStore, which does NOT persist to disk
      ),
    );

    // This widget wraps the whole graphql_flutter widgets so they can make queries/mutations.
    //The GraphQL client to use is passed to this widget.
    //This client is what this provider makes available to all widgets in its tree

    return GraphQLProvider(
      client: client,
      child: MaterialApp(
          title: 'GraphQL Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const HomePage()),
    );
  }
}
