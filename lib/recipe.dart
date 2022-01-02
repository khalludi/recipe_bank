class Recipe {
  String title;
  String imageUrl;
  List<String> instructions;
  List<String> ingredients;

  Recipe(this.title, this.imageUrl, this.instructions, this.ingredients);

  static List<Recipe> exampleRet = [
    Recipe(
        'Barbacoa',
        'https://www.thechunkychef.com/wp-content/uploads/2020/01/Ultimate-Instant-Pot-Beef-Barbacoa-fork-320x320.jpg',
        [
          'Trim visible large sections of fat from roast, then cut roast into 6-8 large pieces. Season beef with 1/2 tsp each salt and pepper.',
          'Add vegetable oil to Instant Pot and select "Saute". When hot, add beef and cook for a minute or so on each side, until browned. Depending on the size of your beef, you may need to do this in batches.',
          'Remove browned beef to a plate and add onion. Saute for 2-3 minutes, until soft.',
          'Add in 1 cup beef broth and scrape the bottom of the pot with a wooden spoon to remove any browned bits. Add in tomato paste, green chiles and bay leaves.',
          'Press "Cancel - or Keep Warm/Cancel". Return browned beef to the pot and pour pureed chipotle sauce over the top. Top with both halves of the lime.',
          'Close lid securely and make sure the valve is set to "sealing". Select "Manual" or "Pressure Cook" and adjust the +/- button until it reads 60 minutes.',
          'When finished cooking, carefully turn the valve to "venting" for a quick pressure release. When the steam has all escaped, and the pin has dropped, remove the lid and discard bay leaves.',
          'Remove beef pieces to a large bowl and shred, discarding any purely fat parts.',
          "Toss shredded beef with as much of the cooking liquid as you'd like.",
        ], [
      '4 lb. beef chuck roast',
      '1/2 tsp kosher salt',
      '1/2 tsp black pepper',
      '2 Tbsp vegetable oil',
      '1 yellow onion diced',
      '4 oz can diced green chiles drained',
      '3 Tbsp tomato paste',
      '1 cup beef broth (reduced sodium is preferred)',
      '2 bay leaves',
    ]
    ),
    Recipe(
        'Butter Chicken',
        'https://www.recipetineats.com/wp-content/uploads/2019/01/Butter-Chicken_5-SQ.jpg?resize=323,323',
        [
          "Marinade: Combine the Marinade ingredients with the chicken in a bowl. Cover and refrigerate overnight, or up to 24 hours (minimum 3 hrs).",
          "Cook chicken: Heat the ghee (butter or oil) over high heat in a large fry pan. Take the chicken out of the Marinade but do not wipe or shake off the marinade from the chicken (but don't pour the Marinade left in the bowl into the fry pan).",
          "Place chicken in the fry pan and cook for around 3 minutes, or until the chicken is white all over (it doesn't really brown because of the Marinade).",
          "Sauce: Add the tomato passata, cream, sugar and salt. Also add any remaining marinade left in the bowl. Turn down to low and simmer for 20 minutes. Do a taste test to see if it needs more salt.",
          "Garnish with coriander/cilantro leaves if using. Serve with basmati rice.",
          "The Butter Chicken is pictured with my very easy No Yeast Flatbread and no-fry papadums.",
        ], [
      "1/2 cup plain yoghurt , full fat",
      "1 tbsp lemon juice",
      "1 tsp tumeric powder",
      "2 tsp garam masala",
      "1/2 tsp chilli powder or cayenne pepper powder",
      "1 tsp ground cumin",
      "1 tbsp ginger, freshly grated",
      "2 cloves garlic, crushed",
      "1.5 lb / 750 g chicken thigh fillets, cut into bite size pieces"
    ]
    ),
    Recipe(
        'Masoor Dal',
        'https://www.cookwithmanali.com/wp-content/uploads/2019/06/Whole-Masoor-Dal-Instant-Pot-500x500.jpg',
        [
          "Press the saute button on the Instant Pot. Once it's hot, add the cumin seeds and let them sizzle for few seconds.",
          'Then add the chopped ginger, onion, green chili and mix. Cook for 4 to 5 minutes until onions are light golden brown in color. Stir often.',
          "Add in the tomatoes and de-glaze the pot by scrapping the bottom with a spatula. There shouldn't be anything stuck at the bottom.",
          'Add the spices- coriander powder, turmeric and garam masala. Also add the salt and mix. Cook for 1 minute.',
          'Add the rinsed whole masoor dal to the pot and toss with the masala.',
          'Then add in the water and stir. Close the pot with the lid.',
          'Press the manual or pressure cook button and cook on high pressure for 13 to 14 minutes, with the pressure valve in sealing position. Let the pressure release naturally.',
          'Open the pot and add chopped cilantro and mix. At this point, you can also add a teaspoon of ghee for extra flavor. You can also add crushed kasuri methi or squeeze in some lemon juice.',
          'Serve whole masoor dal with rice or roti or paratha.',
        ],
        [
          '1 tablespoon oil 15 ml, I used avocado oil',
          '3/4 teaspoon cumin seeds',
          '1 inch ginger chopped',
          '1 medium onion chopped',
          '1 green chili chopped',
          '2 medium tomatoes chopped',
          '1/2 teaspoon coriander powder',
          '1/2 teaspoon turmeric powder',
          '1/4 teaspoon garam masala',
          '3/4 teaspoon salt or to taste',
          '1 cup whole masoor dal brown lentils',
          '2.5 cups water',
          '1 tablespoon chopped cilantro',
          'lemon wedges to serve',
        ]
    )
  ];

  static add(Recipe recipe) {
    exampleRet.add(recipe);
  }

  static fetchAll() {
    return exampleRet;
  }

  static delete(int index) {
    exampleRet.removeAt(index);
  }
}