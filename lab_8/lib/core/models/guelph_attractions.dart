import '../models/attraction.dart';

///Contains a list of the attractions in guelph
class GuelphAttractions {
  static List<Attraction> guelphAttractions = [
    Attraction(
      title: 'Riverside Park',
      categories: [
        "Picnic",
        "Playground",
        "Hiking",
      ],
      address: "709 Woolwich St, Guelph.",
      imageURL: "https://guelph.ca/wp-content/uploads/park_riverside_river.jpg",
      description: "Riverside Park is a perfect location to host seasonable events. The Park offers the following: Floral Clock and Rock Gardens; a fully accessible children’s playground; an outdoor concert shell; an antique carousel; miniature train; horseshoe pits; a sand beach area; trails along the river front; 3 baseball diamonds; a scaled model of the first house built in Guelph by John Galt; and a large and small picnic shelter. A leash free zone located on the east side of the Speed River.",
    ),
    Attraction(
      title: 'The Boathouse Tea Room',
      categories: [
        'Boating',
        'Ice-Cream',
        'Tea',
      ],
      address: "116 Gordon St, Guelph",
      imageURL:
          "https://media-cdn.tripadvisor.com/media/photo-s/05/e8/92/37/the-boathouse.jpg",
      isFree: false,
      description: "Tea room and casual restaurant located in Guelph, Ontario. Perfect for breakfast or lunch. Canoe rentals located on the side of the Speed River.",
    ),
    Attraction(
      title: "University of Guelph Arboretum",
      categories: [
        "Hiking",
        "Flowers",
      ],
      address: "200 Arboretum Rd, Guelph",
      imageURL:
          "https://www.uoguelph.ca/arboretum/sites/uoguelph.ca.arboretum/files/public/cearley%20-%20eng%20garden%202008%20-%2032.JPG",
      description: "The Arboretum encompasses 400 acres adjacent to campus featuring plant collections, gardens, walking trails, natural woodlands, wetlands, and meadows. Established in 1970, The Arboretum is home to more than 2000 different taxa of woody plants, in thematic collections such as a synoptic World of Trees, Native Trees of Ontario, and noteworthy collections of Oaks, Beeches, Maples, and Conifers.",
    ),
    Attraction(
      title: "Guelph Lake Conservation Area",
      categories: [
        "Hiking",
        "Swimming",
        "Boating",
        "Camping"
      ],
      address: "7743 Conservation Rd, RR4, Guelph",
      imageURL:
          "https://images.squarespace-cdn.com/content/5a4e9da6d7bdce6edbcf105f/1530233801207-4I7GS1F8ZUW6GYS7VRIX/guelph-conservation-area-wedding-61.jpg?format=1500w&content-type=image%2Fjpeg",
      isFree: false,
      description: "Large conservation & recreation area on a man-made reservoir with beaches & wooded hiking trails.",
    ),
    Attraction(
      title: "University of Guelph",
      address: "50 Stone Rd E, Guelph",
      imageURL: "https://housing.uoguelph.ca/sites/default/files/Johnston-Hall.jpg",
      categories: [
        "Education",
      ],
      isFree: false,
      description: "The University of Guelph is a comprehensive public research university in Guelph, Ontario, Canada. It was established in 1964 after the amalgamation of Ontario Agricultural College (1874), the MacDonald Institute (1903), and the Ontario Veterinary College (1922), and has since grown to an institution of almost 30,000 students (including those at the Humber campus, Ridgetown campus, off-campus degree enrolments, diploma enrolments and part-time students) and employs 830 full-time faculty (academic staff) as of fall 2019.",
    )
  ];
}
