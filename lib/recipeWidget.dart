import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:recipe_bank/form_widget.dart';
import 'package:recipe_bank/recipe.dart';

class RecipeWidget extends StatefulWidget {
  final Recipe recipe;
  final int index;
  final Function deleteRecipe;

  const RecipeWidget({Key? key, required this.recipe, required this.index,
    required this.deleteRecipe}) : super(key: key);

  @override
  _RecipeWidgetState createState() => _RecipeWidgetState();
}

class _RecipeWidgetState extends State<RecipeWidget> {
  var _isSelected = false;
  final _formKey = GlobalKey<FormState>();

  void redraw() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var sizedBoxWidth = screenSize.width * .8;

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      color: Colors.white,
      elevation: 8.0,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(widget.recipe.title,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                  ),),
                const SizedBox(width: 20,),
                CircleAvatar(
                  radius: 50, //we give the image a radius of 50
                  foregroundImage: NetworkImage(
                      widget.recipe.imageUrl,
                      scale: 1.0
                  ),
                ),
              ],
            ),
            const SizedBox(height: 40,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      // margin: EdgeInsets.symmetric(vertical: 20),
                        padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                        width: sizedBoxWidth/3,
                        color: Colors.grey[200],
                        child: Column(
                          children: [
                            const Text("Ingredients",
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            ListView.builder (
                                shrinkWrap: true,
                                padding: const EdgeInsets.all(8),
                                itemCount: widget.recipe.ingredients.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return CheckboxListTile(
                                      controlAffinity: ListTileControlAffinity.leading,
                                      title: Text(widget.recipe.ingredients[index]),
                                      value: _isSelected,
                                      onChanged: (bool? newValue) {
                                        if (newValue != null) {
                                          setState(() {
                                            _isSelected = newValue;
                                          });
                                        }
                                      });
                                }
                            ),
                          ],
                        )
                    )
                  ],
                ),
                Container(
                    margin: EdgeInsets.only(left: 40),
                    width: sizedBoxWidth*2/3 - 80,
                    child: Column(
                      children: [
                        const Text("Cooking Steps",
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        ListView.builder (
                            shrinkWrap: true,
                            padding: const EdgeInsets.all(8),
                            itemCount: widget.recipe.instructions.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Container(
                                margin: const EdgeInsets.symmetric(vertical: 10),
                                color: Colors.white,
                                child: Text('${index+1}. ${widget.recipe.instructions[index]}'),
                              );
                            }
                        )
                      ],
                    )
                )
              ],
            ),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Respond to button press
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return FormWidget(recipe: widget.recipe, formKey: _formKey, redraw: redraw);
                      });
                  },
                  child: Text('Edit'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Respond to button press
                    widget.deleteRecipe(widget.index);
                  },
                  child: Text('Delete'),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}