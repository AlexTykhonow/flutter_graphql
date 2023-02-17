import 'package:flutter/material.dart';
import 'package:flutter_graphql_demo/const/string_const.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("GraphlQL Example"),
      ),
      body: Query(
        //to make the query to backend

        // In option the configurations of the query is passed to Query widget
        // it exposes properties we use to set options for Query widget
          options: QueryOptions(
              document: gql(
                  StringConst.query), // it is used to set or pass the query to Query widget to get the data from query
              variables: const <String, dynamic>{
                "code": "AF"
              }), //the query variables are sent to the Query widget

          //It is called when the Query widget make the request to server
          //  It is called with the data from the query
          // and is used to fetchmore for pagination and refetch the data
          builder: (result, {fetchMore, refetch}) {
            if (result.isLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (result.data == null) {
              return const Center(
                child: Text("Data Not Found!!!"),
              );
            }
            return ListView.builder(
                itemCount: result.data!['continent']['countries'].length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                      result.data!['continent']['countries'][index]["name"],
                    ),
                    subtitle: Text(
                        result.data!['continent']['countries'][index]["code"]),
                  );
                });
          }),
    );
  }
}