import 'package:flutter/material.dart';

Future<void> bistekDialog(BuildContext context) {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Bistek'),
          ),
          body: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Ingredients'),
                SizedBox(
                  height: 16,
                ),
                Text(
                  """
small pack tarragon
          
2 small packs flat-leaf parsley
          
30g wild garlic (or 2 garlic cloves)
          
3 tsp Dijon mustard
          
40g small capers, drained, rinsed and roughly chopped
          
200ml extra virgin olive oil
          
2 tbsp sherry vinegar
                """,
                ),
                Text('Instructions'),
                SizedBox(
                  height: 16,
                ),
                Text(
                  """
Chop the herbs and garlic with 1 tsp sea salt until very fine. Add the mustard and capers , and combine.
          Transfer the mixture to a bowl and stir in the olive oil. Add the vinegar, little by little, stirring and tasting as you go – trust your palate!
                """,
                ),
              ],
            ),
          ),
          bottomNavigationBar: Container(
            height: 50,
            decoration: const BoxDecoration(color: Colors.blue),
            child: Padding(
              padding: const EdgeInsets.only(right: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.purple),
                      iconColor: MaterialStateProperty.all<Color>(Colors.white),
                    ),
                    child: const Row(
                      children: [
                        Icon(Icons.delete),
                        Text(
                          'EDIT',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.05,
                  ),
                  TextButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.red),
                      iconColor: MaterialStateProperty.all<Color>(Colors.white),
                    ),
                    child: const Row(
                      children: [
                        Icon(Icons.delete),
                        Text(
                          'DELETE',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    },
  );
}
