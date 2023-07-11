import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:suitmedia_km_test/api/reqres_api.dart';
import 'package:suitmedia_km_test/page2.dart';
import 'package:suitmedia_km_test/providers/user_list_provider.dart';
import 'package:suitmedia_km_test/utility/multi_argument.dart';
import 'package:suitmedia_km_test/utility/result_state.dart';

class Page3 extends StatelessWidget {
  static const route = '/page_3';

  final String name;

  const Page3({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
        ),
        title: Text('Third Screen'),
      ),
      body: ChangeNotifierProvider<UserListProvider>(
        create: (context) => UserListProvider(
          reqresAPI: ReqresAPI(),
          page: 1,
        ),
        child: Consumer<UserListProvider>(
          builder: (context, state, _) {
            if (state.state == ResultState.loading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (state.state == ResultState.hasData) {
              return RefreshIndicator(
                onRefresh: () => state.refreshPage(),
                child: ListView.builder(
                  controller: ScrollController(),
                  shrinkWrap: true,
                  itemCount: state.users.data.length,
                  itemBuilder: (context, index) {
                    var userData = state.users.data[index];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            Page2.route,
                            arguments: MultiArgument(name,
                                '${userData.firstName} ${userData.lastName}'),
                          );
                        },
                        leading: ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Image(
                            image: NetworkImage(userData.avatar),
                            fit: BoxFit.cover,
                            loadingBuilder: (context, child, loadingProgress) {
                              if (loadingProgress == null) {
                                return child;
                              } else {
                                return SizedBox(
                                  width: 100,
                                  height: 100,
                                  child: Center(
                                    child: CircularProgressIndicator(),
                                  ),
                                );
                              }
                            },
                          ),
                        ),
                        title: Text(
                          '${userData.firstName} ${userData.lastName}',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          '${userData.email}',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        tileColor: Colors.teal,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16)),
                      ),
                    );
                  },
                ),
              );
            } else if (state.state == ResultState.noData) {
              return Center(
                child: Text(state.message),
              );
            } else if (state.state == ResultState.error) {
              return Center(
                child: Text(state.message),
              );
            } else {
              return Center(
                child: Text('?'),
              );
            }
          },
        ),
      ),
    );
  }
}
