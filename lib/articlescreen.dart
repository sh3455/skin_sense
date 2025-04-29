import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:skinsense1/articledetailscreen.dart';
import 'article.dart';

class ArticlesScreen extends StatelessWidget {
  final List<Article> articles = [
    Article(
      title: "Daily Skincare Routine Essentials",
      content: "Starting an appropriate skincare routine isn’t as easy as some might think, especially with the growing number of products developed daily by skincare companies, which can be confusing. With the increase in available products, it can be difficult to choose between them and know which is best suited for specific skin issues. To eliminate this confusion, dermatologists have outlined the essential steps for a daily skincare routine.\n\nWhat is a daily skincare routine?\nAchieving great skin isn't solely about genetics; daily habits significantly affect the appearance and health of the skin. Following a consistent and suitable skincare routine is the first step in avoiding skin problems and maintaining its youthfulness.\nThere are many ways to care for the skin, depending on its type and concerns. However, dermatologists have established three basic steps for skincare:\n- Cleansing\n- Exfoliating\n- Moisturizing\n\nThe goal of any skincare routine is to maintain the skin in its best condition and to treat any arising issues. It's important to understand that a routine should be tailored to suit skin type, age, and other factors. Nonetheless, the three steps above form the foundation of any skincare regimen.\n\nHere are the ideal skincare routine steps according to dermatologists:\n- Washing the face: Doctors recommend washing the face in the morning and evening with a suitable cleanser to prevent clogged pores and acne. The cleaning method is crucial: first rinse the face with water, then apply a coin-sized amount of cleanser to your hand, lather it, and gently massage it onto the face, followed by rinsing with lukewarm water. If removing makeup, washing the face twice is advised.\n- Drying the face: The best way to dry the face is by gently patting it with a paper towel.\n- Using toner: After drying the skin, it’s recommended to apply toner twice daily. Toner has many benefits: it cleanses the skin of any remaining dirt, moisturizes it, tightens pores, and balances its pH levels. It can be used either by spraying it on the skin and letting it dry naturally or by wiping the skin with a cotton pad soaked in toner.\n- Applying serum: The best time to use a serum containing antioxidants, like Vitamin C serum, is in the morning, as it protects the skin from free radicals encountered throughout the day. Hydrating serums like hyaluronic acid are better used at night to prevent dryness and keep the skin moisturized. You can choose a serum based on your needs, whether it's anti-aging, exfoliating, or acne-fighting. Dermatologists recommend applying water-based serums before moisturizing and oil-based ones after.\n- Applying eye cream: Many people neglect applying eye moisturizer regularly, even though the eye area is one of the most sensitive and prone to wrinkles. Regular face moisturizers should not be used around the eyes; instead, special eye creams should be used as they are lighter. It's preferable to use creams with a massage applicator like a roller ball to stimulate circulation, and keeping the eye cream refrigerated helps reduce puffiness.\n- Moisturizing the skin: A moisturizer locks in hydration. It is recommended to apply it to slightly damp skin. A lightweight moisturizer with SPF 30 or higher is ideal for the morning, and a thicker moisturizer is preferable at night.\n\nIt’s also crucial to use sunscreen before going out during the day (if the moisturizer does not contain SPF). Sunscreen should be applied after moisturizer, about 20 minutes before exposure, and reapplied as needed. Sunscreen not only protects against UV damage and skin darkening but also helps prevent skin cancer and signs of aging.\n\nIn addition to the daily routine, exfoliating the skin is an essential weekly step, which we will discuss as part of the weekly skincare routine.",
      imageUrl: "https://i.pinimg.com/736x/96/8f/0b/968f0b07acd926f7e3c3eb7e782c6126.jpg",
      category: "Skincare Tips",
    ),
    Article(
      title: "How to Protect Your Skin from Sun Damage in Summer",
      content: "Sunlight offers many benefits, as it provides the body with essential Vitamin D necessary for proper body function. However, without taking the correct protective measures, sun exposure can cause several damages. So, how can we protect ourselves from sun damage?\n\nHow to Protect Yourself from Sun Damage?\nTo answer the question of how to protect yourself from sun damage, it is important to know some tips that help shield our body from harmful sun rays, including:\n\nUsing Sunscreen\nIt is crucial to apply sunscreen daily, even on cloudy days. You should choose a sunscreen that offers protection against both UVA and UVB rays, with an SPF of at least 30.\nSunscreen should be applied correctly by covering all exposed areas of the skin about 15–30 minutes before going outside.\nProtect the lips using a lip balm with an SPF of at least 15.\nAdditionally, sunscreen should be reapplied every two hours, or every hour if swimming or sweating heavily.\n\nChoosing the Right Time for Sun Exposure\nIt’s best to avoid sun exposure during peak hours between 10 a.m. and 4 p.m., when the sun’s rays are the strongest.\nAs a general rule, if your shadow is shorter than your height, seek shade.\n\nWearing Appropriate Clothing\nWear clothing that covers as much skin as possible, such as long-sleeved shirts.\nChoose tightly woven, dark-colored fabrics with a high Ultraviolet Protection Factor (UPF).\n\nChoosing the Right Accessories\nWear a wide-brimmed hat that shades the face, ears, and neck, made of tightly woven material.\nWear sunglasses that wrap around the eyes and block 99%–100% of UVA and UVB rays.\n\nWhat Are the Signs of Sun-Damaged Skin?\nDry skin\nAge spots\nWrinkles\nMelasma (skin discoloration)\nActinic keratosis (precancerous skin lesions)\nSunburn\n\nWhen Should You See a Doctor?\nSeek medical attention if you notice:\nPainful spots on the skin\nItching in skin spots\nAppearance of new spots on the skin\nNoticeable changes in the color or shape of existing spots or moles.",
      imageUrl: "https://i.pinimg.com/736x/81/44/b4/8144b42922f928b93977a8a249aa6403.jpg",
      category: "Protection",
    ),
    Article(
      title: "The Importance of Moisturizing: Why Your Skin Needs It",
      content: "Everyone knows that caring for skin hydration, freshness, and vitality is of great importance, as it significantly affects both our appearance and health. Moisturizing the skin should be an essential part of everyone's daily routine. The importance of moisturizing increases with age; for instance, a child’s skin requires less moisturizing compared to that of adults or the elderly.\n\nWhy is Skin Moisturization Important?\n\nMoisturizing helps the skin maintain a soft texture and a healthy, smooth appearance, free from cracks and dryness. Regular use of moisturizers protects the skin from further dryness and prevents the appearance of aging signs, such as dark spots and deep wrinkles. It also helps reduce acne issues, which are especially common among people with oily skin.\n\nAdditionally, the movement of the hand while applying moisturizer boosts blood circulation and accelerates skin regeneration. It is also recommended to stay hydrated by drinking plenty of water and to avoid soaps and cleansers containing alcohol to maintain the skin’s moisture and softness.\n\nWhat About Winter?\n\nSome people believe that moisturizing the skin is unnecessary during the winter, but the opposite is true. The warm indoor air generated by heaters and air conditioners draws moisture from the skin, leaving it dry and cracked. Therefore, skin moisturizing is essential at all times and in all seasons.\n\nHow to Apply Skin Moisturizer\n\nFirst, wash your skin with a good cleanser, preferably one that is soap-free and contains ceramides, which promote the renewal of the skin’s outer layer.\nSecond, rinse the skin with lukewarm or cold water and avoid using hot water as much as possible, as hot water can strip the skin of its natural moisture.\nThird, dry the skin properly by gently patting it with a towel instead of rubbing it.\nFinally, apply an appropriate layer of moisturizer to the skin to lock in moisture. It is preferable to use upward hand movements when applying the moisturizer.\nAfter applying moisturizer, the skin becomes ready for the application of creams or makeup.\n\nHow Often Should You Moisturize Your Skin?\n\nYou should moisturize your face at least twice daily, such as after waking up (before applying makeup) and before sleeping. It is also important to moisturize your body after every shower or shaving session to prevent dryness and flakiness.\n\nDoes Moisturizing Brighten the Skin?\n\nMany people wonder whether consistent use of moisturizers can lighten their skin tone. Is moisturizing the secret to skin whitening?\n\nAs previously mentioned, moisturizers help reduce signs of aging, removing imperfections and blemishes such as dark spots and wrinkles, which in turn can make the skin appear brighter and more radiant.\n\nSome moisturizers are enriched with vitamins such as Vitamin A, Vitamin B, Vitamin C, and Vitamin E, which nourish the skin and enhance its vitality. Moreover, many moisturizers also contain sun protection, shielding the skin from sunburn and aging signs.",
      imageUrl: "https://i.pinimg.com/736x/bd/44/0e/bd440e477fcae661a2582219fac9e8e7.jpg",
      category: "Moisturizing",
    ),
    Article(
      title: "Common Skin Problems and Their Treatments",
      content: "🌿 Common Skin Problems and Their Treatments\n\n1. Acne \n   - Symptoms: Blackheads, red pimples, cysts.  \n   - Causes: Excess oil production, clogged pores, bacteria, hormonal changes.  \n   - Treatment: Use products containing salicylic acid or benzoyl peroxide, and maintain proper skin hygiene.  \n\n2. Dry Skin \n   - Symptoms: Flakiness, itching, cracks.  \n   - Causes: Lack of moisture, use of harsh soaps, exposure to dry air.  \n   - Treatment: Apply moisturizers with glycerin, ceramides, or hyaluronic acid, and avoid hot water. [MedlinePlus]  \n\n3. Oily Skin \n   - Symptoms: Excess shine, enlarged pores, acne breakouts.  \n   - Treatment: Wash face twice daily, use oil-free products, and avoid frequent face touching.  \n\n4. Rosacea  \n   - Symptoms: Persistent facial redness, visible blood vessels, pimples.  \n   - Treatment: Avoid triggers like spicy foods and sun exposure, use prescribed topical/oral medications.  \n\n5. Eczema \n   - Symptoms: Intense itching, redness, flakiness.  \n   - Treatment: Use strong moisturizers, apply corticosteroid creams under medical supervision.  \n\n6. Psoriasis \n   - Symptoms: Red patches with silvery scales, itching.  \n   - Treatment: Topical treatments, phototherapy, or systemic medications based on severity. [WebMD, blogs.bcm.edu]  \n\n7. Hyperpigmentation  \n   - Symptoms: Dark spots or uneven skin tone.  \n   - Causes: Sun exposure, acne scars, hormonal changes.  \n   - Treatment: Use products with vitamin C or niacinamide to brighten skin.  \n\n💡 General Skincare Tips \n - Regular Cleansing: Wash your face twice daily with a cleanser suited to your skin type.  \n - Moisturizing: Use a moisturizer to maintain skin balance.  \n - Sun Protection: Apply sunscreen with appropriate SPF daily.  \n - Healthy Diet: Eat a balanced diet rich in vitamins and minerals.  \n - Hydration: Drink adequate water to keep your body hydrated.",
      imageUrl: "https://i.pinimg.com/736x/28/8e/4f/288e4fdd74917867116c364b49ebf596.jpg",
      category: "Skin Problems",
    ),
    Article(
      title: "Harmful Skincare Habits and Ingredients to Avoid",
      content: "🧴 Harmful Skincare Habits\n\n1. Skipping Sunscreen \n   Neglecting to apply sunscreen daily exposes your skin to harmful UV rays, increasing the risk of premature aging and skin cancer. Always use a broad-spectrum sunscreen with SPF 30 or higher.\n\n2. Sleeping with Makeup On  \n   Leaving makeup on overnight can clog pores and lead to breakouts and skin irritation. Always cleanse your face thoroughly before bed.\n\n3. Over-Exfoliating  \n   Excessive exfoliation can strip the skin of its natural oils, causing dryness and sensitivity. Limit exfoliation to 1–2 times per week and use gentle products.\n\n4. Using Harsh Cleansers  \n   Cleansers with strong chemicals can disrupt the skin's natural barrier, leading to dryness and irritation. Opt for mild, pH-balanced cleansers suitable for your skin type.\n\n5. Touching Your Face Frequently \n   Touching your face transfers dirt and bacteria, which can cause breakouts and irritation. Avoid touching your face unnecessarily and keep your hands clean.\n\n🧪 Harmful Skincare Ingredients to Avoid\n\n1. Parabens\n   Used as preservatives, parabens can disrupt hormone function and are linked to breast cancer. Look for products labeled \"paraben-free.\"\n\n2. Phthalates \n   Common in fragrances, phthalates can affect reproductive health and hormone levels. Choose fragrance-free or naturally scented products.\n\n3. Sodium Lauryl Sulfate (SLS) \n   A detergent that can strip the skin of moisture, leading to dryness and irritation. Opt for SLS-free cleansers.\n\n4. Formaldehyde  \n   A known carcinogen used in some hair and nail products. Avoid products containing formaldehyde or its releasers.\n\n5. Synthetic Fragrances  \n   Often contain allergens and irritants that can cause skin reactions. Choose products with natural or no added fragrances.\n\n✅ Tips for Healthier Skin\n\n- Choose Products Wisely: Select skincare products that match your skin type and are free from harmful chemicals.\n- Maintain a Consistent Routine: Cleanse, moisturize, and protect your skin daily.\n- Stay Hydrated: Drink plenty of water to keep your skin hydrated from within.\n- Eat a Balanced Diet: Consume foods rich in vitamins and antioxidants to support skin health.\n- Get Adequate Sleep: Ensure 7–9 hours of sleep per night to allow your skin to repair and regenerate.\n\nBy avoiding harmful habits and ingredients, you can protect your skin and maintain its health and appearance.",
      imageUrl: "https://i.pinimg.com/736x/68/5e/2f/685e2feceed3c5800b2d02754003c1ca.jpg",
      category: "Harmful Habits",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Articles",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.pink[100],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        itemCount: articles.length,
        itemBuilder: (context, index) {
          final article = articles[index];
          // Extract a preview of the content (first 100 characters)
          String contentPreview = article.content.length > 100
              ? '${article.content.substring(0, 100)}...'
              : article.content;

          return Card(
            elevation: 6,
            margin: const EdgeInsets.only(bottom: 12),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            child: ListTile(
              contentPadding: const EdgeInsets.all(12),
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: CachedNetworkImage(
                  imageUrl: article.imageUrl,
                  width: 80,
                  height: 80,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => const CircularProgressIndicator(),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
              title: Text(
                article.title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: Text(
                      article.category,
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: Text(
                      contentPreview,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.black54,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ArticleDetailScreen(article: article),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}