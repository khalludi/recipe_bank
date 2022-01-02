import 'package:flutter/material.dart';
import 'package:recipe_bank/recipe.dart';

import 'custom_form_field/multiselection_ff.dart';
import 'custom_form_field/reorderable_ff.dart';

class FormWidget extends StatefulWidget {
  final Recipe recipe;
  final GlobalKey<FormState> formKey;
  final Function redraw;

  const FormWidget({Key? key, required this.recipe, required this.formKey, required this.redraw}) : super(key: key);

  @override
  _FormWidgetState createState() => _FormWidgetState();
}

class _FormWidgetState extends State<FormWidget> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
                right: -40.0,
                top: -40.0,
                child: InkResponse(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: const CircleAvatar(
                    child: Icon(Icons.close),
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                  ),
                )
            ),
            Form(
                key: widget.formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("Recipe Form"),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text("Name: "),
                          Flexible(child: TextFormField(
                            initialValue: widget.recipe.title,
                          )),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text("Image URL: "),
                          Flexible(child: TextFormField(
                            initialValue: widget.recipe.imageUrl,
                          )),
                        ],
                      ),
                    ),
                    MyMultiSelectionFormField(
                      decoration: const InputDecoration(
                        labelText: 'Ingredients',
                      ),
                      validator: (ingredients) => (ingredients?.length ?? 0) < 3
                          ? 'Please add at least 3 ingredients'
                          : null,
                      onSaved: (ingredients) {
                        widget.recipe.ingredients = ingredients!.map((e) => e.toString()).toList();
                      },
                      initialValue: widget.recipe.ingredients,
                    ),
                    MyReorderableFormField(
                      decoration: const InputDecoration(
                        labelText: 'Instructions',
                      ),
                      validator: (instructions) => (instructions?.length ?? 0) < 3
                          ? 'Please add at least 3 steps to the recipe'
                          : null,
                      onSaved: (instructions) {
                        widget.recipe.instructions = instructions!.map((e) => e.toString()).toList();
                      },
                      initialValues: widget.recipe.instructions,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        child: Text("Submit"),
                        onPressed: () {
                          if (widget.formKey.currentState!.validate()) {
                            widget.formKey.currentState!.save();
                            Navigator.of(context).pop();
                            widget.redraw();
                          }
                        },
                      ),
                    )
                  ],
                )
            )
          ]
      ),
    );
  }


}