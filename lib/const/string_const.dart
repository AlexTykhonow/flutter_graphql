abstract class StringConst {
  static const String query = r"""
                                          query GetContinent($code : ID!){
                                            continent(code:$code){
                                              name
                                              countries{
                                                name
                                                code
                                              }
                                            }
                                          }
                                        """;
  static const String appTitle = "GQL App";
}
